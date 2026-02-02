---
title: Managing agent tasks (preview)
description: Learn how to create and manage agent tasks, work with agent sessions, and handle cross-agent operations in Dynamics 365 Business Central.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: concept-article
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/21/2026
ms.update-cycle: 180-days
---

# Managing agent tasks (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

You can trigger agent tasks programmatically from AL code. This enables integration with UI actions, business events, and custom workflows. You can also simulate email-based triggers for testing scenarios from the UI. Learn more in [Run an agent (preview)](ai-agent-designer-run-agent.md).

## Creating agent tasks

The `Agent Task Builder` codeunit provides the primary interface for creating agent tasks. In the next sections, you can see some common integration patterns.

### Create tasks from page actions

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
            .AddTaskMessage('Sales Team', 'Please review sales order ' + Rec."No." + ' for customer ' + Rec."Sell-to Customer Name")
            .Create();
    end;
}
```

### Create tasks from business events

Respond to system events like document posting:

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvHeaderInsert', '', false, false)]
local procedure OnAfterSalesInvoicePost(var SalesInvHeader: Record "Sales Invoice Header")
var
    AgentTask: Record "Agent Task";
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
begin
    AgentTaskMessageBuilder
        .Initialize('System', 'New invoice posted: ' + SalesInvHeader."No." + ' for customer ' + SalesInvHeader."Sell-to Customer Name" + '. Amount: ' + Format(SalesInvHeader.Amount));

    AgentTask := AgentTaskBuilder
        .Initialize(AgentUserSecurityId, 'Review invoice')
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

### Simulating email-based triggers

For testing email integration scenarios, format the task message to include email metadata:

```al
local procedure CreateEmailSimulationTask(FromAddress: Text; Subject: Text; Body: Text; EmailThreadId: Text)
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    MessageText: Text;
begin
    MessageText := StrSubstNo('EMAIL FROM: %1\nSUBJECT: %2\n\n%3', FromAddress, Subject, Body);
    
    AgentTaskMessageBuilder
        .Initialize(FromAddress, MessageText);

    AgentTaskBuilder
        .Initialize(AgentUserSecurityId, Subject)
        .SetExternalId(EmailThreadId)
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

Notice how the external ID is used to track the thread ID.

### Adding attachments to tasks

When your task needs to include files for the agent to process, use the `AddAttachment` method:

```al
local procedure CreateTaskWithAttachment(AttachmentStream: InStream; FileName: Text; Sender: Text)
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
    TempBlob: Codeunit "Temp Blob";

begin
    // Prepare your file content in AttachmentStream
    TempBlob.CreateInStream(AttachmentStream);
    
    AgentTaskMessageBuilder
        .Initialize(Sender, 'Please process this document')
        .AddAttachment(FileName, 'application/pdf', AttachmentStream);

    AgentTaskBuilder
        .Initialize(AgentUserSecurityId, 'Process Document')
        .AddTaskMessage(AgentTaskMessageBuilder)
        .Create();
end;
```

Attachments enable agents to process documents like invoices, purchase orders, receipts, contracts, and other business documents. The agent can extract data from these files and use the information to complete tasks.

Learn more in [Attachment capabilities and limitations](ai-agent-designer-attachments.md).

## Adding messages to existing tasks

Continue conversations by adding new messages to existing agent tasks:

```al
local procedure AddMessageToExistingTask(ExternalId: Text; MessageText: Text; Sender: Text)
var
    AgentTaskRecord: Record "Agent Task";
    AgentTask: Codeunit "Agent Task";
    AgentTaskMessageBuilder: Codeunit "Agent Task Message Builder";
begin
    // Get the existing task by its external ID
    AgentTaskRecord := AgentTask.GetTaskByExternalId(AgentUserSecurityId, ExternalId);
    
    // Add a new message to the task
    AgentTaskMessageBuilder
        .Initialize(Sender, MessageText)
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

## Tracking tasks

There are two strategies for correlating agent tasks with business entities. The **external ID** field provides a simple way to store an identifier from an external system (like an email thread ID), useful for one-to-one relationships with external events. For more complex scenarios, **track the task ID in a table** alongside your business entity records. This approach is recommended when you need to track multiple related entities per task, store additional metadata about the relationship, handle many-to-many relationships, or efficiently query tasks by business entity. By storing task IDs in your tables, you can find all agent tasks related to a specific record, track when multiple agents work on related tasks, and maintain audit trails. Choose external IDs for simple integrations and table-based tracking when you need robust tracking and querying capabilities.

## Managing the task lifecycle

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

## Detecting and customizing agent sessions

In some use cases, agent-specific AL code needs to be written. Examples of these are:

- Adding specific filtering on a page based on the agent task running, for example filter the sales orders only to the customer mentioned in the task message
- Hiding or showing parts of the UI dynamically to agents
- Showing dialogs with guidance for the agent
- Running validation events after agent actions

### Detecting if running in an agent session

The `Agent Session` codeunit can be used to detect if the current session is an agent session and which metadata provider is running:

```al
local procedure DoAgentWork()
var
    AgentSession: Codeunit "Agent Session";
    AgentMetadataProvider: Enum "Agent Metadata Provider";
begin
    // Check if running in any agent session and get the metadata provider
    if not AgentSession.IsAgentSession(AgentMetadataProvider) then
        exit;

    // AgentMetadataProvider now contains the type of agent running
    Message('Running in an agent session with provider: %1', AgentMetadataProvider);
end;
```

If the code needs to run only for a specific agent instance, the `UserID()` function can be used to retrieve the currently running agent.

### Binding events for agent task duration

A more performant pattern to subscribe multiple events only during a specific agent's tasks is to use the `Agent Session` codeunit to bind events during the sign in process of agent sessions.

```al
codeunit 50102 "Agent Session Events"
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
        AgentSession: Codeunit "Agent Session";
        AgentMetadataProvider: Enum "Agent Metadata Provider";
        AgentTaskID: BigInteger;
    begin
        if not AgentSession.IsAgentSession(AgentMetadataProvider) then
            exit;

        AgentTaskID := AgentSession.GetCurrentSessionAgentTaskId();
        SetupCustomEvents(AgentTaskID);
    end;

    local procedure SetupCustomEvents(AgentTaskID: BigInteger)
    begin
        GlobalAgentEvents.SetAgentTaskID(AgentTaskID);
        if BindSubscription(GlobalAgentEvents) then;
    end;

    var
        GlobalAgentEvents: Codeunit "Agent Events";
}
```

Then, a subscriber can be defined like the following to run code only for that specific agent task:

```al
codeunit 50101 "Agent Events"
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

Learn more about detecting if the current session is specifically an agent session in [Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md).

## Related information

[Coding agents in AL (preview)](ai-agent-sdk-overview.md)  
[Define and register an agent (preview)](ai-agent-sdk-define-register.md)  
[Agent setup and configuration (preview)](ai-agent-sdk-configuration.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Overview (preview)](ai-agent-designer-landing-page.yml)  
[AI development toolkit (preview)](ai-agent-designer.md)   
[Run an agent (preview)](ai-agent-designer-run-agent.md)
