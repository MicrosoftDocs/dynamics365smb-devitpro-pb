---
title: Write agent tests
description: Learn how to write AL tests for Business Central agents using the Agent test library to verify end-to-end agent behavior.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 04/11/2026
ms.collection:
  - get-started
  - bap-ai-copilot
ms.reviewer: solsen
---

# Write agent tests

An **agent test** evaluates the end-to-end behavior of a Business Central agent by sending it natural-language messages and then asserting that it took the correct actions in the system. Unlike AI tests that evaluate prompt outputs, agent tests verify the full task execution loop: the agent receives a message, decides what to do, interacts with Business Central, and completes (or escalates) the task.

Agent tests use the `Library - Agent` codeunit alongside the standard `AIT Test Context` codeunit from the AI Test Toolkit.

> [!NOTE]
> Agent tests run against a live agent service and consume Copilot credits. Run them in sandbox environments with prepaid credits. See [Evaluation](ai-test-copilot-testtool.md#copilot-credit-limits-for-agent-evaluation-suites) for credit limits.

## Step-by-step: write an agent test

Follow these steps to create an agent test.

### Step 1 - define the test

An agent test is a standard AL test codeunit with `TestType = AITest`. It uses the `Library - Agent` codeunit to orchestrate task execution.

```al
codeunit 50200 "My Agent Accuracy Test"
{
    Subtype = Test;
    TestType = AITest;
    TestPermissions = Disabled;

    var
        LibraryAgent: Codeunit "Library - Agent";
        AgentUserSecurityId: Guid;
        Initialized: Boolean;
}
```

> [!NOTE]
> Agent tests depend on datasets that supply the message sent to the agent and any test-specific inputs. Learn how to create one in [Create datasets](ai-test-copilot-datasets.md).

### Step 2 - design the dataset

Agent test datasets use a `question` element that contains at minimum a `from` (sender name) and a `message` (the natural-language instruction sent to the agent). You can add additional fields to carry test inputs and assertion data.

```yaml
tests:
- name: AGENT_TEST_01
  description: Process sales orders with shipment date January 2027
  question:
    from: Jane Doe
    message: Release all sales orders with shipment date 01 January 2027
    shipment_date: '01-01-2027'
    expected_released_count: 2
```

In your test, read these values using `AIT Test Context`:

```al
var
    AITTestContext: Codeunit "AIT Test Context";
    From, Message : Text;
    ShipmentDate: Date;
begin
    From := AITTestContext.GetQuestion().Element('from').ToText().Trim();
    Message := AITTestContext.GetQuestion().Element('message').ToText();
    Evaluate(ShipmentDate, AITTestContext.GetQuestion().Element('shipment_date').ToText());
end;
```

### Step 3 - enable the agent

Before running a task, the agent to test must be active. Use an `Initialize` pattern to activate the agent once per test run and store its user security ID for use in all test methods.

```al
local procedure Initialize()
var
    Agent: Codeunit Agent;
begin
    if Initialized then
        exit;

    // Get or create the agent, then activate it
    if IsNullGuid(AgentUserSecurityId) then
        AgentUserSecurityId := GetOrCreateAgent();

    Agent.Activate(AgentUserSecurityId);
    Initialized := true;
end;
```

How you obtain the agent security ID depends on your setup. A common pattern is to check whether the agent already exists (for example, by looking up a stored record) and create or import it if not:

```al
local procedure GetOrCreateAgent(): Guid
var
    MyAgentSetup: Record "My Agent Setup";
    Agent: Codeunit Agent;
begin
    if MyAgentSetup.FindFirst() then
        exit(MyAgentSetup."Agent User Security ID");

    // Import or create the agent for the first time
    exit(Agent.Create('My Agent'));
end;
```

> [!TIP]
> Use `Library - Agent.GetAgentUnderTest(AgentUserSecurityID)` to retrieve the agent identity configured in the evaluation suite. This enables A/B testing by letting you swap which agent the suite targets without changing test code.

```al
local procedure Initialize()
begin
    if Initialized then
        exit;

    LibraryAgent.GetAgentUnderTest(AgentUserSecurityId);
    Initialized := true;
end;
```

### Step 4 - build and start the agent task

Use `Agent Task Builder` and `Agent Task Message Builder` to compose a task, then call `CreateTaskAndWait` to start it and wait for completion.

```al
[Test]
procedure TestAgentReleasesOrders()
var
    AgentTask: Record "Agent Task";
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    AITTestContext: Codeunit "AIT Test Context";
    TaskSuccessful: Boolean;
    From, Message : Text;
begin
    Initialize();

    // Read message from dataset
    From := AITTestContext.GetQuestion().Element('from').ToText().Trim();
    Message := AITTestContext.GetQuestion().Element('message').ToText();

    // [GIVEN] Prepare test data in Business Central
    CreateTestData();

    // [WHEN] Send the message to the agent and wait for it to complete
    AgentTaskMessageBuilder.Initialize(From, Message);
    AgentTaskBuilder.Initialize(AgentUserSecurityId, Message);
    AgentTaskBuilder.AddTaskMessage(AgentTaskMessageBuilder);
    TaskSuccessful := LibraryAgent.CreateTaskAndWait(AgentTaskBuilder, AgentTask);

    // [THEN] Assert and finalize
    AssertResults(AgentTask, TaskSuccessful);
end;
```

> [!TIP]
> Pass the `AgentTask` record to `CreateTaskAndWait` to get the full task record back for later inspection and output writing.

Use `SetAgentTaskTimeout` to increase the wait time for agents that run long tasks:

```al
LibraryAgent.SetAgentTaskTimeout(10 * 60 * 1000); // 10 minutes in milliseconds
```

### Step 5a - handle single-turn tasks

For simple agents that complete their task without asking for confirmation, check the task status and assert directly:

```al
if not TaskSuccessful then
    Error('The agent task did not complete successfully. Status: %1', AgentTask.Status);

// Assert that Business Central data reflects the expected outcome
ValidateResults();
```

### Step 5b - handle user interventions

Some agents pause to request human confirmation before taking actions. Use `RequiresUserIntervention` to detect this state, inspect what the agent is asking, and respond.

#### Detect and inspect an intervention

```al
var
    TempRequest: Record "Agent User Int Request Details" temporary;
    TempAnnotation: Record "Agent Annotation" temporary;
    TempSuggestion: Record "Agent Task User Int Suggestion" temporary;
begin
    if LibraryAgent.RequiresUserIntervention(AgentTask) then begin
        LibraryAgent.GetLastUserInterventionRequestDetails(
            AgentTask, TempRequest, TempAnnotation, TempSuggestion);

        // Assert the type of intervention is what you expect
        Assert.AreEqual(
            Enum::"Agent User Int Request Type"::ReviewRecord,
            TempRequest.Type,
            'Expected agent to request confirmation before releasing orders');
    end;
end;
```

> [!TIP]
> In data-driven tests where the expected intervention type comes from the dataset, use `ParseUserInterventionRequestType` to convert the text value to the enum:
>
> ```al
> ExpectedType := LibraryAgent.ParseUserInterventionRequestType(
>     AITTestContext.GetQuestion().Element('expected_intervention_type').ToText());
> ```

#### Respond to an intervention

To continue the task with free-text input:

```al
TaskSuccessful := LibraryAgent.CreateUserInterventionAndWait(AgentTask, 'Yes, please proceed');
```

To respond by selecting one of the agent's suggested user interventions:

```al
TaskSuccessful := LibraryAgent.CreateUserInterventionFromSuggestionAndWait(AgentTask, 'CONFIRM');
```

The valid suggestion codes are defined by the agent developer in the agent's `IAgentTaskExecution` interface implementation, specifically in the `GetAgentTaskUserInterventionSuggestions` method. Check the agent's implementation to find the available codes before writing assertions against them.

For tests where the exact intervention content doesn't need verification — for example, when testing that an agent eventually completes when given approval — use `ContinueTaskAndWait` as a shorthand that sends a generic continuation signal:

```al
if (AgentTask.Status = AgentTask.Status::Paused) and AgentTask."Needs Attention" then
    TaskSuccessful := LibraryAgent.ContinueTaskAndWait(AgentTask);
```

### Step 5c - handle multi-turn tasks

For agents that may require multiple rounds of user input, use a loop that continues until the task is no longer paused:

```al
// Auto-continue: keep responding until the agent finishes
while (AgentTask.Status = AgentTask.Status::Paused) and AgentTask."Needs Attention" do
    TaskSuccessful := LibraryAgent.ContinueTaskAndWait(AgentTask);
```

When your dataset contains multiple turns (conversation scenarios), use `AIT Test Context` to iterate through them:

```al
[Test]
procedure TestAgentMultiTurn()
var
    AgentTask: Record "Agent Task";
    TaskSuccessful: Boolean;
    NextTurnExist: Boolean;
begin
    Initialize();
    NextTurnExist := true;

    while NextTurnExist do begin
        // Read message for this turn from the dataset
        SendTurnAndAssert(AgentTask, TaskSuccessful);

        // Move to the next dataset turn
        NextTurnExist := AITTestContext.NextTurn();
    end;
end;
```

> [!NOTE]
> Use `AIT Test Context.GetCurrentTurn()` to include the turn number in error messages, which makes it easier to identify which dataset entry caused a failure.

### Step 6 - assert results

Assert the outcome using standard AL assertions. Verify that the expected records in Business Central reflect the actions the agent was asked to take.

```al
local procedure AssertResults(var AgentTask: Record "Agent Task"; TaskSuccessful: Boolean)
var
    ErrorReason: Text;
    AgentErr: Label '%1 - Task ID: %2', Comment = '%1 = Agent error, %2 = Agent Task ID';
begin
    if not TaskSuccessful then
        ErrorReason := StrSubstNo('Agent task did not complete. Status: %1', AgentTask.Status);

    if TaskSuccessful then
        if not ValidateBusinessCentralData(ErrorReason) then
            TaskSuccessful := false;

    if not TaskSuccessful then
        Error(AgentErr, ErrorReason, AgentTask.ID);
end;
```

### Step 7 - capture test output

Use `WriteTaskToOutput` to include the full agent task log in the test output. This lets you inspect what the agent did step-by-step after the run, and is essential for external evaluation of agent behavior.

```al
local procedure FinalizeTest(var AgentTask: Record "Agent Task"; TaskSuccessful: Boolean; ErrorReason: Text)
var
    AgentOutputJson: Codeunit "Test Output Json";
    OutputJson: JsonObject;
    OutputText: Text;
begin
    // Write the agent task log to the output
    AgentOutputJson.Initialize();
    LibraryAgent.WriteTaskToOutput(AgentTask, AgentOutputJson);

    // Combine with pass/fail metadata
    OutputJson.Add('success', TaskSuccessful);
    OutputJson.Add('error_reason', ErrorReason);
    OutputJson.Add('taskDetails', AgentOutputJson.AsJsonToken());
    OutputJson.WriteTo(OutputText);

    AITTestContext.SetTestOutput(
        AITTestContext.GetContext().ToText(),
        AITTestContext.GetQuestion().ToText(),
        OutputText);

    Commit();
    Assert.IsTrue(TaskSuccessful, ErrorReason);
end;
```

> [!TIP]
> Use `WriteTaskToOutput` with a `FromDateTime` parameter to filter the log to only entries from a specific point in time — useful in multi-turn tests where you want to capture only the current turn's activity.

### Teardown - stop agent tasks

Always stop agent tasks during test teardown to avoid leftover tasks interfering with other tests or consuming credits.

```al
[TearDown]
procedure TearDown()
begin
    LibraryAgent.StopTasks(AgentUserSecurityId);
end;
```

To stop all tasks across all agents, for example in a global teardown:

```al
LibraryAgent.StopAllTasks();
```

## Configure the evaluation suite

Set `TestType="Agent"` in your suite XML to mark it as an agent evaluation:

```xml
<Root>
    <AITSuite Code="MY-AGENT" Description="My Agent Accuracy Tests" Dataset="MY-DATASET"
              Capability="My Agent Capability" Frequency="Manual" TestRunnerId="130451" TestType="Agent">
        <Line CodeunitID="50200" Description="My Agent - Accuracy" Dataset="MY-DATASET.YAML" />
    </AITSuite>
</Root>
```

## Related information

[Business Central Copilot Evaluation](https://github.com/microsoft/BCApps/blob/main/src/Tools/AI%20Test%20Toolkit/README.md)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[Write AI tests](ai-test-copilot-ai-tests.md)  
[Create datasets](ai-test-copilot-datasets.md)  
[Evaluation](ai-test-copilot-testtool.md)  
[Permissions in Evaluation](ai-development-toolkit-permissions.md)  
[Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  
