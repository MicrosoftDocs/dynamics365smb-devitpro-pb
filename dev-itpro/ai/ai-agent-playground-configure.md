---
title: Configure Instructions and Tasks for a Playground Agent (preview)
description: Learn how to configure instructions and tasks for a playground agent in Business Central. Optimize agent behavior with structured guidelines and clear steps.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 12/05/2025
ms.update-cycle: 180-days
---

# Configure instructions and tasks for a playground agent (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

To get a playground agent up and running effectively, you need to configure its instructions, tasks, and permissions appropriately. To create a new agent, learn more in [Create and activate a playground agent (preview)](agent-playground-create.md). Fine tune and improve your agent's behavior by following guidance in [Iterate and manage a playground agent (preview)](agent-playground-iterate.md).

## Getting started with agent instructions

### The AI-assisted approach

Rather than trying to write perfect instructions from the start, we recommend an iterative, AI-assisted workflow:

1. **Start with your ideas** - Write down what you want your agent to do in natural language, without worrying about format or structure
2. **Use AI to refine** - Use Copilot or other AI tools to transform your initial thoughts into well-structured instructions following best practices
3. **Test and iterate** - Deploy your agent, observe its behavior, and refine the instructions based on real-world results
4. **Leverage community examples** - Reference proven patterns and examples from the community

This approach allows you to focus on the business logic and desired outcomes, while AI helps with the technical formatting and best practices.

### Draft your initial instructions

Start by describing your agent's purpose and workflow in plain language. Don't worry about perfect formatting at this stage—just capture the core requirements and workflow.

#### Example initial draft

```text
I want an agent that helps with customer credit checks. When a sales order comes in, 
it should check if the customer has exceeded their credit limit. If they have, it should 
notify the sales team and suggest alternative payment terms. It needs to look at their 
payment history too.
```

Once you have your initial draft, you can use AI tools to refine it according to best practices and proven patterns.

## Refining instructions with AI assistance

### Instruction framework

Effective agent instructions follow a structured approach with three key components:

- **Responsibilities** Define what the agent is accountable for. For example, handling customer reminders, processing credit memos, or managing sales quotes.
- **Guidelines** Set rules that apply across all tasks. For example, always request user review before posting documents or sending external communications.
- **Instructions** Provide step-by-step, ordered lists for each specific task, including substeps for clarity.

This framework ensures that agents act consistently, handle exceptions gracefully, and involve users when necessary.

### Using AI to structure your instructions

Provide your draft instructions to AI tools like Copilot, which can help you:

- Structure your instructions into clear sections (responsibilities, guidelines, and instructions)
- Add appropriate emphasis and formatting
- Incorporate proven navigation patterns and tool usage
- Ensure alignment with your agent's profile and permissions
- Add validation rules and error handling guidance

### Example transformation

#### Before - initial draft

```text
Check customer credit for the given sales order. Document the result.
```

#### After - AI-refined with best practices

```text
**RESPONSIBILITY**: Monitor customer credit limits during sales order creation

**GUIDELINES**:
- Always request user review before blocking an order
- Provide clear explanations of credit status
- Suggest alternative payment terms when applicable

**INSTRUCTIONS**:
1. For the given sales order, retrieve the customer's current balance and credit limit
2. Calculate available credit: Credit Limit - Current Balance
3. If available credit is less than the order amount:
   a. **DO NOT** proceed with order creation
   b. Request user intervention with details: current balance, credit limit, order amount
   c. Suggest alternative payment terms (for example; Cash, Prepayment)
4. Document the credit check result for audit purposes
   a. Add a new comment line with the credit check details to the **Comments** section of the sales order
   b. Example format: "Credit Check - [Date/Time] | Available Credit: [Amount] | Order Amount: [Amount] | Status: [APPROVED/BLOCKED]"
```

### Community-driven best practices

The [!INCLUDE [prod_short](../includes/prod_short.md)] community maintains repositories of agent instruction patterns, examples, and best practices. These resources can be used to ground AI-generated instruction improvements:

- Navigation patterns for common [!INCLUDE [prod_short](../includes/prod_short.md)] pages
- Tool usage examples for standard operations
- Error handling and validation patterns
- User intervention scenarios

By referencing these community patterns when refining your instructions, you ensure your agent follows proven approaches and handles edge cases effectively. Learn more in [alguidelines](https://github.com/microsoft/alguidelines/blob/d2cdf97e0c4ba8fa3a618169339d2d6655d63493/content/docs/agentic-coding/vibe-coding-rules/al-code-style.md).

### Key principles for agent instructions

At the core of defining agents is expressing goals and instructions in natural language. Writing instructions for playground agents is similar to crafting prompts for large language models (LLMs), so you can apply general prompt-writing guidelines to improve instruction quality.

#### Start simple, iterate based on results

- Begin with core functionality and essential workflows
- Deploy and test with real scenarios
- Add complexity and refinements based on observed behavior
- Use AI to help incorporate lessons learned from testing

#### Use AI and community knowledge

- Use AI tools to transform drafts into structured instructions
- Reference community patterns for common scenarios
- Ground AI refinements with proven examples
- Contribute your own successful patterns back to the community

#### Focus on outcomes

- Describe what the agent should accomplish
- Concentrate on business logic, edge cases, and user experience

#### Agent-specific considerations

- Include **specific keywords or phrasing** to help the agent utilize available tools in the agent runtime effectively
- Review the UI that the agent has access to based on its profile before writing instructions
- Tailor instructions to match what the agent can see and do
- Reference specific field names, page titles, and actions that align with the agent's profile

### Advanced instruction concepts

As you refine your agent instructions, consider incorporating these advanced patterns. AI tools can help you apply these concepts effectively when you provide your draft instructions and indicate which patterns are relevant.

#### User intervention and review

##### When to request user intervention

- The agent should request user intervention when it can't proceed due to missing data, ambiguous situations, or validation errors
- Examples could be:  
  - incomplete customer information  
  - items aren't found in inventory  
  - unexpected error messages

##### User review requirements

- Agents should always request user review before proceeding with critical steps or sending outgoing messages
- All outgoing communications require user review by default
- After completing significant actions, request user review before moving forward

##### Response handling

- Agents draft messages based on instructions but they must confirm before sending
- Provide clear summaries of actions taken

#### Memory and state management

Agents retain a history of their actions and searches but don't store the full state of every page. Include explicit instructions to memorize specific key-value pairs when needed, which can be referenced in later steps.

An example of giving such instructions could be: "Memorize the external document reference from the newly created sales quote for use in follow-up communications."
Consider providing an example of what the memorized information should look like to improve accuracy, eg. "external document reference: ABCD1234 Document Number: 1234"

#### Error handling and validation

- **Validate inputs**: Ensure all required fields are filled before proceeding with critical actions
- **Use emphasis**: Highlight critical validation points with bold text or UPPERCASE
- Examples could be:  
  "**DO NOT** proceed until the requested date is entered"  
  "**ALWAYS** confirm customer details are complete before creating quotes"

### Defining tasks

#### How to trigger your agent

There are two ways to trigger a task for your agent:
1. Manually via the **Agent tasks** page in [!INCLUDE [prod_short](../includes/prod_short.md)] through the **Create task** action
2. Through the **Tasks AL API** which allows for integrating both with UI elements such as actions and with events such as receiving an email or a sales order posting

When creating a task, you can specify an extra message that gets passed to the agent to complement the general instructions with specific details for that particular task. Each task you create appears in the agent's task queue, where the agent picks it up and process it according to its instructions. Tasks can be stopped and restarted as needed.

#### Integrating agents with common scenarios

The Tasks AL API allows you to trigger agent tasks programmatically from AL code. This enables integration with UI actions, business events, and custom workflows.

##### Using the Agent Task Builder API

The `Agent Task Builder` codeunit provides the primary interface for creating agent tasks. Here are common integration patterns:

###### Trigger from a page action

Add a page action that creates an agent task when clicked:

```al
action(CreateAgentTask)
{
    Caption = 'Send to Agent';
    Image = Robot;

    trigger OnAction()
    var
        AgentTaskBuilder: Codeunit "Agent Task Builder";
        AgentTask: Record "Agent Task";
    begin
        AgentTask := AgentTaskBuilder
            .Initialize(AgentUserSecurityId, 'Review Sales Order')
            .SetExternalId('SO-' + Rec."No.")
            .AddTaskMessage('Sales Team', 'Please review sales order ' + Rec."No." + ' for customer ' + Rec."Sell-to Customer Name")
            .Create();
    end;
}
```

###### Trigger from business events

Respond to system events like document posting:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', false, false)]
local procedure OnAfterSalesInvoicePost(var SalesInvHeader: Record "Sales Invoice Header")
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    AgentTask: Record "Agent Task";
begin
    // Only create task for high-value invoices
    if SalesInvHeader.Amount > 10000 then begin
        AgentTaskMessageBuilder
            .Initialize('System', 'New high-value invoice posted: ' + SalesInvHeader."No." + ' for customer ' + SalesInvHeader."Sell-to Customer Name" + '. Amount: ' + Format(SalesInvHeader.Amount))
            .SetSkipMessageSanitization(true);

        AgentTask := AgentTaskBuilder
            .Initialize(AgentUserSecurityId, 'Review High-Value Invoice')
            .SetExternalId('INV-' + SalesInvHeader."No.")
            .AddTaskMessage(AgentTaskMessageBuilder)
            .Create();
    end;
end;
```

###### Simulate email-based triggers

For testing email integration scenarios, format the task message to include email metadata:

```al
local procedure CreateEmailSimulationTask(FromAddress: Text; Subject: Text; Body: Text)
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    MessageText: Text;
begin
    MessageText := StrSubstNo('EMAIL FROM: %1\nSUBJECT: %2\n\n%3', FromAddress, Subject, Body);
    
    AgentTaskMessageBuilder
        .Initialize(FromAddress, MessageText)
        .SetSkipMessageSanitization(true);

    AgentTaskBuilder
        .Initialize(AgentUserSecurityId, Subject)
        .SetExternalId('EMAIL-' + Format(CurrentDateTime))
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

###### Add attachments to tasks

When your task needs to include files for the agent to process:

```al
local procedure CreateTaskWithAttachment()
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    TempBlob: Codeunit "Temp Blob";
    InStr: InStream;
begin
    // Prepare your file content in InStr
    TempBlob.CreateInStream(InStr);
    
    AgentTaskMessageBuilder
        .Initialize('User', 'Please process this document')
        .AddAttachment('document.pdf', 'application/pdf', InStr);

    AgentTaskBuilder
        .Initialize(AgentUserSecurityId, 'Process Document')
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

###### Add messages to existing tasks

Continue conversations by adding new messages to existing agent tasks:

```al
local procedure AddMessageToExistingTask(ExternalId: Text; MessageText: Text)
var
    AgentTask: Codeunit "Agent Task";
    AgentTaskRecord: Record "Agent Task";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
begin
    // Get the existing task by its external ID
    AgentTaskRecord := AgentTask.GetTaskByExternalId(AgentUserSecurityId, ExternalId);
    
    // Add a new message to the task
    AgentTaskMessageBuilder
        .Initialize('User', MessageText)
        .SetRequiresReview(true)
        .AddToTask(AgentTaskRecord);
    
    // Restart the task if it's completed or stopped
    if AgentTask.CanSetStatusToReady(AgentTaskRecord) then
        AgentTask.SetStatusToReady(AgentTaskRecord);
end;
```

This pattern is useful for:
- Providing additional information after the initial task creation
- Continuing multi-turn conversations with your agent
- Simulating email thread continuations

###### Manage task lifecycle

Monitor and control running tasks:

```al
local procedure ManageAgentTask(var AgentTask: Record "Agent Task")
var
    AgentTaskCU: Codeunit "Agent Task";
begin
    // Check task status
    if AgentTaskCU.IsTaskRunning(AgentTask) then
        Message('Task is still running');
    
    if AgentTaskCU.IsTaskCompleted(AgentTask) then
        Message('Task completed successfully');
    
    // Restart a stopped task
    if AgentTaskCU.CanSetStatusToReady(AgentTask) then
        AgentTaskCU.SetStatusToReady(AgentTask);
    
    // Stop a running task
    AgentTaskCU.StopTask(AgentTask, true);
end;
```

##### Best practices for API integration

- **Use meaningful External IDs**: Set unique external IDs that connect tasks to your business records (for example email thread IDs)
- **Include context in messages**: Provide all the specific details the agent needs to complete the task
- **Handle task creation errors**: Wrap task creation in error handling to manage exceptions gracefully
- **Test with realistic data**: Use actual business scenarios to validate your integration
- **Monitor task completion**: Implement follow-up logic based on task status changes

This API-based approach allows you to build automated workflows during the prototyping phase, which can later be refined when migrating to production features.

## Testing and continuous improvement

### When instructions aren't enough

If you're having difficulty achieving accuracy with your agent:

- **Consider changing or adding new functionality** to better support the agent's tasks
- **Optimize the UI** that the agent interacts with
- **Improve error messages and tooltips** to provide clearer guidance
- **Enhance page instructions** to help the agent be more successful

Test your instructions thoroughly to ensure they lead to the desired behavior, and iterate based on the agent's actual performance.

### Instruction management best practices

- **Test for accuracy regularly** Instruction effectiveness can change over time as systems and processes evolve
- **Use AI optimization** Leverage AI tools like Copilot to help refine and update instructions
- **Dynamic updates** Instructions can be updated through setup pages without requiring agent reconfiguration
- **Less is more** Shift from verbose to concise instructions—simpler instructions often perform better than complex ones

### Advanced capabilities

**Page-specific instructions** You can provide dynamic prompts based on the specific page that the agent encounters. Use conditional logic for instructions tied to particular scenarios.

```
Consider the following fields:
{% if page.id == 42 %}
Field "The answer" - An important answer to questions about the universe
{% else %}
Field "Business data" - Relevant business information
{% endif %}
```

**Additional tools** Agents can use tools like field setting, lookups, and action invocation. Include specific keywords in your instructions that help the agent utilize these tools effectively within the agent runtime. You can find a list of these tools in the log entry details for individual log entries.

## Frequently asked questions

### How detailed should my initial draft be?

Start with enough detail to convey the business logic and key decision points. You don't need perfect formatting or complete edge case coverage—focus on the core workflow. AI can help fill in the structure and best practices.

### Can I update instructions after the agent is deployed?

Yes, agent instructions can be updated dynamically. Remember that agents must be deactivated to modify certain settings.

### How do I know if my instructions are working?

Monitor the agent's behavior through the timeline view in the playground. Look for:

- Successful task completions
- Appropriate use of tools and navigation
- Correct handling of edge cases
- Reasonable user intervention requests

### Where can I find example instructions and patterns?

The [!INCLUDE [prod_short](../includes/prod_short.md)] community maintains repositories with agent instruction patterns, navigation examples, and tool usage guidance. These resources provide proven approaches that you can reference when refining your instructions with AI assistance. <!--link-->

### Should I write different instructions for different environments?

Your core instructions should be environment-agnostic. Use the agent's profile and permissions to control what it can access in different environments, rather than having environment-specific instructions.

## Related information

[Configure Copilot and agent capabilities](/dynamics365/business-central/enable-ai)  
[Transparency Note: Agent playground (preview)](transparency-note-agent-playground.md)  
[Agent playground overview (preview)](agent-playground.md)  
[Create and activate a playground agent (preview)](agent-playground-create.md)  
[Set up playground agent permissions and profiles (preview)](agent-playground-permissions-profiles.md)  
[Best practices for prototyping with the Agent playground (preview)](agent-playground-best-practices.md)
