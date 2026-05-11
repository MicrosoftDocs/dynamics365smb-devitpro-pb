---
title: Write agent tests
description: Learn how to write AL tests for Business Central agents using the Library - Agent helpers to verify end-to-end agent behavior.
author: qutreson
ms.author: solsen
ms.topic: concept-article
ms.update-cycle: 180-days
ms.date: 05/11/2026
ms.collection:
  - get-started
  - bap-ai-copilot
ms.reviewer: solsen
---

# Write agent tests

An **agent test** evaluates the end-to-end behavior of a Business Central agent by sending it natural-language input and then asserting that it took the correct actions in the system. Unlike AI tests that evaluate prompt outputs, agent tests verify the full task execution loop: the agent receives input, decides what to do, interacts with Business Central, and completes — or pauses to ask the user for input — before continuing.

The **AI Test Suite** is the main driver of an agent test. It iterates the dataset, dispatches each turn to your test codeunit, and collects evaluation results. The `Library - Agent` codeunit is a reusable helper for interacting with the agent during a test. It reads the defined YAML structure and streamlines the agent interactions, so individual tests don't have to handle that wiring directly.

> [!NOTE]
> Agent tests run against a live agent service and consume Copilot credits. Run them in sandbox environments with prepaid credits. See [Evaluation](ai-test-copilot-testtool.md#copilot-credit-limits-for-agent-evaluation-suites) for credit limits.

> [!TIP]
> A complete working sample is available at [`SalesValidationAgent3P`](https://github.com/microsoft/BCTech/tree/master/samples/BCAgents/SalesValidationAgent/test) on the BCTech repository.

## Step-by-step: write an agent test

The recommended pattern is data-driven: the dataset describes the input to the agent and the expected outcome, and your test code runs a small turn loop that delegates the agent interaction to `Library - Agent`.

### Step 1 - define the test codeunit and run the turn loop

An agent test is a standard AL test codeunit with `TestType = AITest`. It uses `Library - Agent` to run each turn and `AIT Test Context` to read dataset values. The codeunit follows a small pattern: an `Initialize` procedure that resolves and activates the agent, and a `[Test]` procedure that drives a `repeat ... until` loop over the dataset turns.

```al
codeunit 50200 "My Agent Accuracy Test"
{
    Subtype = Test;
    TestType = AITest;
    TestPermissions = Disabled;
    RequiredTestIsolation = Disabled;

    var
        AITTestContext: Codeunit "AIT Test Context";
        LibraryAgent: Codeunit "Library - Agent";
        Assert: Codeunit "Library Assert";
        AgentUserSecurityId: Guid;
        Initialized: Boolean;
}
```

`RequiredTestIsolation = Disabled` is needed because agent tasks span transactions in a different session.

> [!NOTE]
> Agent tests depend on datasets that describe the input sent to the agent and the expected outcome. Learn how to create one in [Datasets](ai-test-copilot-datasets.md#agent-test-datasets).

#### Initialize the agent

`Initialize` runs before the first turn. It resolves the agent under test, cleans up any tasks left from prior runs, and activates the agent. The agent identity can come from the evaluation suite (when set) or from your own setup — fall back to creating the agent programmatically if neither is available.

```al
local procedure Initialize()
begin
    if Initialized then
        exit;

    // Optionally read the agent under test from the evaluation suite.
    // This enables A/B testing — you can point a suite at a different agent
    // without changing test code. Skip the call if your test always targets
    // a specific agent.
    LibraryAgent.GetAgentUnderTest(AgentUserSecurityId);

    // GetAgentUnderTest returns a null GUID when no agent is configured
    // on the suite. Fall back to your own lookup or to creating the agent
    // programmatically.
    if IsNullGuid(AgentUserSecurityId) then
        AgentUserSecurityId := GetOrCreateAgent();

    // Clean up any tasks left from prior runs before activating the agent.
    // Running cleanup at the start of Initialize replaces a separate
    // [TearDown] step and makes the test resilient to previous failures
    // that didn't shut down cleanly.
    LibraryAgent.StopTasks(AgentUserSecurityId);

    LibraryAgent.EnsureAgentIsActive(AgentUserSecurityId);

    Initialized := true;
end;
```

`GetOrCreateAgent` is application-specific. A common pattern is to look up the agent identity in a setup record and create it on first run by using the Agent SDK:

```al
local procedure GetOrCreateAgent(): Guid
var
    MyAgentSetup: Record "My Agent Setup";
begin
    if MyAgentSetup.FindFirst() then
        exit(MyAgentSetup."Agent User Security ID");

    // First run — create the agent and persist its identity.
    // See "Define and register an agent programmatically" for the APIs.
    exit(CreateMyAgent());
end;
```

> [!TIP]
> Calling `GetAgentUnderTest` is optional. Use it when you want the evaluation suite to control which agent the test targets — for example, to A/B test two agent versions against the same dataset. Tests that always run against a specific agent can skip the call and assign `AgentUserSecurityId` directly. For details on creating an agent in code, see [Define and register an agent programmatically](../ai/ai-agent-sdk-define-register.md).

#### Run the turn loop

With `Initialize` in place, write the `[Test]` procedure. It runs a `repeat ... until` loop that delegates each turn to `Library - Agent.RunTurnAndWait` and then to `Library - Agent.FinalizeTurn`. `RunTurnAndWait` reads the current turn's `query:`, dispatches it to the agent, and waits for completion. `FinalizeTurn` writes the turn output, validates intervention expectations declared in the dataset, and advances to the next turn.

```al
[Test]
procedure TestAgentReleasesOrders()
var
    AgentTask: Record "Agent Task";
    TurnSuccessful, ContinueWithNextTurn : Boolean;
    ErrorReason: Text;
    AgentStatusErr: Label 'The agent task did not complete successfully. Status: %1.', Comment = '%1 = task status';
begin
    Initialize();

    repeat
        Clear(ErrorReason);

        // [GIVEN] Prepare Business Central state for this turn
        ApplyTurnSetup();

        // [WHEN] Send the turn input to the agent and wait
        TurnSuccessful := LibraryAgent.RunTurnAndWait(AgentUserSecurityId, AgentTask);

        if TurnSuccessful then
            TurnSuccessful := ValidateTurnCompletedSuccessfully(ErrorReason)
        else
            ErrorReason := StrSubstNo(AgentStatusErr, AgentTask.Status);

        // [THEN] Record turn outcome and decide whether to continue
        ContinueWithNextTurn := LibraryAgent.FinalizeTurn(AgentTask, TurnSuccessful, ErrorReason);
    until not ContinueWithNextTurn;

    Assert.IsTrue(TurnSuccessful, ErrorReason);
end;
```

Validation reads the turn's `expected_data` from `AIT Test Context` and checks Business Central state. Return `false` with a populated `ErrorReason` on mismatch rather than calling `Error()` — that lets `FinalizeTurn` log the failure on the turn and (optionally) continue with the next turn.

```al
local procedure ValidateTurnCompletedSuccessfully(var ErrorReason: Text): Boolean
var
    ExpectedData: Codeunit "Test Input Json";
    ExpectedReleased: Integer;
    ActualReleased: Integer;
begin
    ExpectedData := AITTestContext.GetExpectedData();
    ExpectedReleased := ExpectedData.Element('expected_released_count').ValueAsInteger();

    ActualReleased := CountReleasedSalesOrders();
    if ActualReleased <> ExpectedReleased then begin
        ErrorReason := StrSubstNo('Expected %1 released orders, found %2.', ExpectedReleased, ActualReleased);
        exit(false);
    end;

    exit(true);
end;
```

### Step 2 - author the dataset

Agent test datasets use the `query:` element to describe what the agent receives. A task-input query has at minimum a `title` (used as the task subject) and typically a `from` (sender display name) and a `message` (the natural-language instruction).

```yaml
suite_setup: MY-AGENT-SETUP
tests:
  - name: AGENT_TEST_01
    description: Process sales orders with a future shipment date
    turns:
      - query:
          from: Jane Doe
          title: "Release all sales orders for $DateFormula-<CW+1M>$"
          message: "Release all sales orders for $DateFormula-<CW+1M>$"
        expected_data:
          expected_released_count: 2
```

A few things to call out:

- **Always use the `turns:` array**, even for single-turn tests. Multi-turn syntax is the supported format for both single-turn and multi-turn tests.
- **Dates are expressed through placeholders** — `$DateFormula-<formula>$` is calculated relative to `WorkDate` so the test doesn't drift over time. See [Placeholders for dates](ai-test-copilot-datasets.md#placeholders-for-dates) for the full reference.
- **`expected_data` is your validation contract.** Most keys you put there are read by your own validator. One sub-key, `intervention_request`, is recognized by the framework — see Step 3.

> [!NOTE]
> Older datasets use the legacy `question:` element instead of `query:`. Both are accepted by the framework; new datasets should use `query:`. See [Datasets — backwards compatibility](ai-test-copilot-datasets.md#backwards-compatibility-question) for migration details.

### Step 3 - handle interventions declaratively

Some agents pause to ask the user for input before continuing. The framework validates these interventions for you based on what the dataset declares.

**Declare an expected intervention** in `expected_data.intervention_request`. The `type` value must be one of `Assistance`, `Review`, or `Message` (the English names of the `Agent User Int Request Type` enum). `suggestions` is optional — when present, every code listed must appear in the agent's actual request.

```yaml
turns:
  - query:
      from: Jane Doe
      title: "Release all open sales orders"
      message: "Release all open sales orders"
    expected_data:
      intervention_request:
        type: Assistance
        suggestions:
          - PROVIDE_DATE
      expected_released_count: 0

  - query:
      intervention:
        instruction: "Use shipment date $DateFormula-<CW+1M>$"
    expected_data:
      expected_released_count: 1
```

The second turn uses a continuation `query` instead of a task input. You can respond either with an `instruction:` (free-text reply) or a `suggestion:` (one of the codes offered by the agent — mutually exclusive with `instruction`).

`FinalizeTurn` enforces the contract automatically:

- If a turn declares `intervention_request`, the agent must have paused for an intervention with the matching type. If `suggestions` is listed, all expected codes must be present.
- If a turn does **not** declare `intervention_request`, the agent must not have paused for one. An unexpected intervention fails the turn.

So declare `intervention_request` on every turn where you expect the agent to pause; otherwise omit it.

### Step 4 - prepare per-turn data

A turn's `turn_setup:` block contains data to materialize in Business Central before the agent runs. The shape is application-defined — the framework hands the YAML sub-tree to your test code, which dispatches to record-creation handlers.

A common convention is to use `setup_actions` with `action_type` and `action_data`:

```yaml
turn_setup:
  setup_actions:
    - action_type: create_sales_order
      action_data:
        - "Sell-to Customer No.": CUST001
          "Shipment Date": "$DateFormula-<CW+1M>$"
```

In AL, read the block via `AITTestContext.GetTurnSetup` and walk the JSON with `Test Input Json`:

```al
local procedure ApplyTurnSetup()
var
    TurnSetup: Codeunit "Test Input Json";
    Found: Boolean;
begin
    TurnSetup := AITTestContext.GetTurnSetup(Found);
    if not Found then
        exit;

    // Dispatch each action_type entry to a handler that creates records.
    // Resolve $DateFormula-... values via Test Input Data Tools — values
    // read through Test Input Json's typed accessors are resolved
    // automatically.
end;
```

For a complete dispatcher implementation, see the [`SalesValidationAgent3P`](https://github.com/microsoft/BCTech/tree/master/samples/BCAgents/SalesValidationAgent/test) sample.

### Step 5 - configure suite-level setup (optional)

Suite-level setup holds data that needs to be created only once across all tests in a suite — typical examples are master records every test relies on (locations, customers, posting groups). Define it in a separate YAML file under `.resources/suite_setup/` and reference it by name from the test dataset:

```yaml
# .resources/suite_setup/MY-AGENT-SETUP.yaml
name: MY-AGENT-SETUP
description: Shared master data for the My Agent suite.
suite_setup:
  setup_actions:
    - action_type: create_customers
      action_data:
        - "No.": CUST001
          Name: Validation Customer 01
```

Apply it once per suite in your test codeunit, gated by `IsSuiteSetupDone`:

```al
local procedure SetupPerSuiteTestData()
var
    SuiteSetup: Codeunit "Test Input Json";
begin
    if AITTestContext.IsSuiteSetupDone() then
        exit;

    SuiteSetup := AITTestContext.GetEvalSuiteSetupDataInput();
    ApplySuiteSetup(SuiteSetup);

    AITTestContext.SetEvalSuiteSetupCompleted();
end;
```

Call `SetupPerSuiteTestData` from `Initialize`. The `IsSuiteSetupDone` flag is sticky across runs — use the **Reset Suite Setup** action on the AI Eval Suite page after editing the `suite_setup:` content.

## Configure the evaluation suite

Set `TestType="Agent"` and `TestRunnerId="130451"` (`Test Runner - Isol. Disabled`) on the suite XML to mark it as an agent evaluation. Each `<Line>` points at a dataset and your test codeunit.

```xml
<Root>
    <AITSuite Code="MY-AGENT" Description="My Agent Accuracy Tests" Dataset="MY-DATASET.YAML"
              Capability="My Agent Capability" Frequency="Daily" TestRunnerId="130451" TestType="Agent">
        <Line CodeunitID="50200" Description="My Agent - Accuracy" Dataset="MY-DATASET.YAML" />
    </AITSuite>
</Root>
```

## Advanced - manual task management

`RunTurnAndWait` and `FinalizeTurn` cover the data-driven flow used by most agent tests. For scenarios that need finer control — for example, starting a task from product code, constructing custom messages, or polling intervention state — `Library - Agent` exposes lower-level helpers. The descriptions below summarize what each method does; see the codeunit symbols for full parameter lists.

### Task lifecycle

- **`CreateTaskAndWait(var AgentTaskBuilder)`** — Create a task from a manually configured `Agent Task Builder` and wait for completion.
- **`CreateMessageAndWait(var AgentTaskMessageBuilder)`** — Append a message to an existing task and wait.
- **`ContinueTaskAndWait(var AgentTask)`** / `(var AgentTask, UserInput)` — Continue a paused task with default or custom free-text input.
- **`WaitForTaskToComplete(var AgentTask)`** — Block until a task finishes. Use this in end-to-end scenarios that start the task from product code (for example, by invoking an action) rather than from the library.
- **`StopTasks(AgentUserSecurityId)`** / **`StopAllTasks()`** — Cleanup helpers. The recommended flow calls `StopTasks` from `Initialize`; use these directly only when you need ad-hoc cleanup outside the standard turn loop.
- **`SetAgentTaskTimeout(NewTimeout)`** — Override the 30-minute default wait for all `…AndWait` methods.

Example: building and starting a task manually.

```al
[Test]
procedure TestAgentReleasesOrders_Manual()
var
    AgentTask: Record "Agent Task";
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    TaskSuccessful: Boolean;
begin
    Initialize();

    AgentTaskMessageBuilder.Initialize('Jane Doe', 'Release all open sales orders');
    AgentTaskBuilder.Initialize(AgentUserSecurityId, 'Release all open sales orders');
    AgentTaskBuilder.AddTaskMessage(AgentTaskMessageBuilder);

    TaskSuccessful := LibraryAgent.CreateTaskAndWait(AgentTaskBuilder, AgentTask);

    Assert.IsTrue(TaskSuccessful, StrSubstNo('Agent task did not complete. Status: %1', AgentTask.Status));
end;
```

### Manual intervention handling

- **`RequiresUserIntervention(AgentTask)`** — Returns `true` when the task is paused waiting for user input.
- **`GetLastUserInterventionRequestDetails(...)`** — Read the most recent intervention request, its annotations, and any offered suggestions.
- **`GetUserInterventionRequestDetails(LogEntry, ...)`** — Read the intervention request attached to a specific log entry.
- **`CreateUserInterventionAndWait(var AgentTask, UserInput)`** — Reply with free-text input and wait.
- **`CreateUserInterventionFromSuggestionAndWait(var AgentTask, SuggestionCode)`** — Reply with a suggestion code and wait.
- **`ParseUserInterventionRequestType(Text)`** — Convert a dataset string (`Assistance`, `Review`, `Message`) to the corresponding `Agent User Int Request Type` enum value.

Example: detect an intervention and respond.

```al
if LibraryAgent.RequiresUserIntervention(AgentTask) then
    TaskSuccessful := LibraryAgent.CreateUserInterventionFromSuggestionAndWait(AgentTask, 'CONFIRM');
```

The valid suggestion codes are defined by the agent developer in the agent's `IAgentTaskExecution` implementation, specifically in `GetAgentTaskUserInterventionSuggestions`. Check the agent's implementation to find the available codes before writing assertions against them.

### Manual output

- **`WriteTaskToOutput(var AgentTask, var Output)`** — Serialize task details and log entries to JSON.
- **`WriteTaskToOutput(var AgentTask, var Output, FromDateTime)`** — Same, filtered to entries from a specific point in time. Useful in multi-turn scenarios where you want only the current turn's activity.
- **`WriteTurnToOutput(var AgentTask, TurnSuccessful, ErrorReason)`** — Sets the answer used by evaluators. `FinalizeTurn` calls this automatically; use it directly only when you bypass `FinalizeTurn`.

## Backwards compatibility: `question:` and `GetQuestion`

Earlier agent test datasets used a `question:` element instead of `query:`, and the matching API on `AIT Test Context` was `GetQuestion()`. Both forms are still accepted by the framework, so existing tests don't have to be rewritten. New tests should use `query:` and `GetQuery()` because:

- `query:` supports the task-input/intervention split (`title` / `from` / `message` / `attachments` vs. `intervention.suggestion` / `intervention.instruction`).
- `RunTurnAndWait` dispatches based on the `query:` shape — it doesn't recognize `question:` as input.
- The validation and continuation features (`expected_data.intervention_request`, multi-turn continuation queries) are layered on the `query:` form.

When migrating, keep this mapping in mind:

| Legacy | Current |
|---|---|
| `question:` (scalar text) | `query:` with `title` (and optional `from` / `message`) |
| `AITTestContext.GetQuestion()` | `AITTestContext.GetQuery()` |

## Related information

[Business Central Copilot Evaluation](https://github.com/microsoft/BCApps/blob/main/src/Tools/AI%20Test%20Toolkit/README.md)  
[SalesValidationAgent3P sample on BCTech](https://github.com/microsoft/BCTech/tree/master/samples/BCAgents/SalesValidationAgent/test)  
[Test the Copilot capability in AL](ai-test-copilot.md)  
[Write AI tests](ai-test-copilot-ai-tests.md)  
[Datasets](ai-test-copilot-datasets.md)  
[Evaluation](ai-test-copilot-testtool.md)  
[Permissions in Evaluation](../ai/ai-development-toolkit-permissions.md)  
[Best practices for testing the Copilot capability](ai-test-copilot-bestpractices.md)  
