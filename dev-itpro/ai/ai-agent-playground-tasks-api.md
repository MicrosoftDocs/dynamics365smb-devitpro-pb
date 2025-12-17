---
title: Integrate with the Tasks AL API (preview)
description: Learn how to integrate AI agents with common scenarios using the Tasks AL API in Dynamics 365 Business Central.
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

# Integrate with the Tasks AL API

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The Tasks AL API allows you to trigger agent tasks programmatically from AL code. This enables integration with UI actions, business events, and custom workflows. You can also simulate email-based triggers for testing scenarios from the UI. Learn more in [Run a playground agent (preview)](ai-agent-playground-run-agent.md).

## Get information about the available playground agents

The first step to configure agents is to retrieve their user ID. The agent playground provides an API to retrieve all available agents.

```al
local procedure GetAllAgents()
var
    CustomAgent: Codeunit "Custom Agent";
    TempAgentInfo: Record "Custom Agent Info" temporary;
begin
    // Retrieve all custom agents
    CustomAgent.GetCustomAgents(TempAgentInfo);
    
    // Iterate through the agents
    if TempAgentInfo.FindSet() then
        repeat
            // Use the agent information
            // TempAgentInfo."User Security ID" contains the agent's user ID
            // TempAgentInfo."User Name" contains the agent's user name
            Message('Agent: %1 (ID: %2)', TempAgentInfo."User Name", TempAgentInfo."User Security ID");
        until TempAgentInfo.Next() = 0;
end;
```

## Using the Agent Task Builder API

The `Agent Task Builder` codeunit provides the primary interface for creating agent tasks. Here are common integration patterns:

### Trigger from a page action

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

### Trigger from business events

Respond to system events like document posting:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', false, false)]
local procedure OnAfterSalesInvoicePost(var SalesInvHeader: Record "Sales Invoice Header")
var
    AgentTask: Record "Agent Task";
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
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

### Simulate email-based triggers

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

### Add attachments to tasks

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

### Add messages to existing tasks

Continue conversations by adding new messages to existing agent tasks:

```al
local procedure AddMessageToExistingTask(ExternalId: Text; MessageText: Text)
var
    AgentTaskRecord: Record "Agent Task";
    AgentTask: Codeunit "Agent Task";
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

### Manage task lifecycle

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

## Writing AL code specific to agent sessions

In some use cases, agent-specific AL code needs to be written. Examples of these are:

- Adding specific filtering on a page based on the agent task running, for example filter the sales orders only to the customer mentioned in the task message
- Hiding or showing parts of the UI dynamically to agents
- Showing dialogs with guidance for the agent
- Running validation events after agent actions
 
The `Agent Session` codeunit can be used for this purpose.

```al
local procedure DoAgentWork()
var
    AgentSession: Codeunit "Agent Session";
    AgentMetadataProvider: Enum "Agent Metadata Provider";
begin
    if not AgentSession.IsAgentSession(AgentMetadataProvider::"Custom Agent") then
        exit;

    // Agent-specific code goes here...
    Message('Running in an Agent session!');
end;
```

If the code needs to run only for a specific agent instance, the `UserID()` function can be used to retrieve the currently running agent.

A more performant pattern to subscribe multiple events only for the duration of a specific agent's tasks is to use the `Agent Session` codeunit to bind events during the login process of agent sessions.

```al
namespace CustomAgentEvents;

using System.Agents;
using System.Agents.Playground.CustomAgent;
using System.Environment.Configuration;
using System.Security.AccessControl;

codeunit 50102 "Custom Agent Session Events"
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;
    SingleInstance = true;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", OnAfterInitialization, '', false, false)]
    local procedure RegisterSubscribersOnAfterInitialization()
    begin
        RegisterAgentEvents();
    end;

    local procedure RegisterAgentEvents()
    var
        AgentTaskID: BigInteger;
        CustomAgent: Codeunit "Custom Agent";
        AgentSession: Codeunit "Agent Session";
        AgentMetadataProvider: Enum "Agent Metadata Provider";
    begin
        if not AgentSession.IsAgentSession(AgentMetadataProvider) then
            exit;

        SetupCustomEvents(AgentTaskID);
    end;

    local procedure SetupCustomEvents(AgentTaskID: BigInteger)
    begin
        GlobalCustomAgentEvents.SetAgentTaskID(AgentTaskID);
        if BindSubscription(GlobalCustomAgentEvents) then;
    end;

    var
        GlobalCustomAgentEvents: Codeunit "Custom Agent Events";
}
```

Then a subscriber can be defined like the following to run code only for that specific agent task:

```al
codeunit 50101 "Custom Agent Events"
{
    Access = Internal;
    InherentEntitlements = X;
    InherentPermissions = X;
    SingleInstance = true;

    internal procedure SetAgentTaskID(NewAgentTaskID: BigInteger)
    begin
        AgentTaskID := NewAgentTaskID;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterInsertEvent, '', false, false)]
    local procedure OnAfterInsertSalesHeader(var Rec: Record "Sales Header")
    begin
        EncourageAgent();
    end;

    procedure EncourageAgent()
    begin
        Message('Keep up the great work, Agent!');
    end;

    var
        AgentTaskID: BigInteger;
}
```


## Best practices for API integration

- **Use meaningful external IDs**: Set unique external IDs that connect tasks to your business records (for example email thread IDs)
- **Include context in messages**: Provide all the specific details the agent needs to complete the task
- **Handle task creation errors**: Wrap task creation in error handling to manage exceptions gracefully
- **Test with realistic data**: Use actual business scenarios to validate your integration
- **Monitor task completion**: Implement follow-up logic based on task status changes

This API-based approach allows you to build automated workflows during the prototyping phase, which can later be refined when migrating to production features.

## Related information

[Overview (preview)](ai-agent-playground-landing-page.yml)  
[Agent playground (preview)](ai-agent-playground.md)  
[Create and activate (preview)](ai-agent-playground-create.md)  
[Write effective instructions (preview)](ai-agent-playground-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-playground-instruction-keywords.md)  
[Set up permissions and profiles (preview)](ai-agent-playground-permissions-profiles.md)  
[Run a playground agent (preview)](ai-agent-playground-run-agent.md)  
[Iterate and manage (preview)](ai-agent-playground-iterate.md)  
[Best practices (preview)](ai-agent-playground-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-playground-sales-validation.md)  
[Transparency note: Business Central agent playground](transparency-note-agent-playground.md)  