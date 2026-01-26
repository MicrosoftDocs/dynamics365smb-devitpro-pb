---
title: Agent SDK (preview)
description: Learn about the Agent SDK for building AI agents in Dynamics 365 Business Central.
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

# Agent SDK (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

## Quick-start

To quickly get started with a template agent that you can customize to your needs, you can use the `AL: New Project` command in Visual Studio Code to choose the `Agent` template. This provides you with a skeleton of an implementation, which covers most of the topics discussed in this article. 

## Define an agent

To define an agent in AL, you need to extend the enum that defines the available types of agents and to implement several interfaces that configure how the agent is created, how it presents itself in the UI, and how it runs tasks.

### Register the agent type

Register your agent by extending the `Agent Metadata Provider` enum. This creates a unique identifier for your agent type and specifies which codeunits implement the required interfaces.

```al
enumextension 50101 "My Agent Metadata Provider" extends "Agent Metadata Provider"
{
    value(50101; "My Agent")
    {
        Caption = 'My Agent';
        Implementation = IAgentFactory = MyAgentFactory, 
                         IAgentMetadata = MyAgentMetadata, 
                         IAgentTaskExecution = MyAgentTaskExecution;
    }
}
```

### IAgentFactory interface

The `IAgentFactory` interface defines how agent instances are created and configured. Implement this interface to specify:

- **Default initials**: The display initials shown for the agent in the UI
- **First-time setup page**: The page displayed when configuring a new agent instance
- **Creation rules**: Whether new agent instances can be created (useful for singleton agents)
- **Copilot capability**: The capability enum value that identifies this agent type
- **Default profile**: The user profile assigned to new agent instances
- **Default access controls**: The permission sets and access rights for new agents

### IAgentMetadata interface

The `IAgentMetadata` interface provides runtime metadata for individual agent instances. Implement this interface to define:

- **Agent initials**: The initials displayed for a specific agent instance
- **Setup page**: The configuration page for the agent
- **Summary page**: The overview page showing agent status and activity
- **Task message page**: The page used to display individual task messages
- **Agent annotations**: Runtime errors or warnings associated with the agent

### IAgentTaskExecution interface

The `IAgentTaskExecution` interface controls how agents process and execute tasks. Implement this interface to customize:

- **Message analysis**: Validate incoming messages and post-process outgoing messages, adding annotations for errors or warnings that should stop processing or trigger user intervention
- **User intervention suggestions**: Provide contextual guidance when the agent requests assistance, helping users understand what actions are available to take
- **Page context**: Supply extra contextual data when the agent navigates to specific pages or records during task execution

### Creating agent instances

There can be one or multiple instances of an agent in [!INCLUDE [prod_short](../includes/prod_short.md)]. Each agent instance can have its own instructions, permissions, user settings, and agent access controls defined separately. Each agent instance is uniquely identified by its **User Security ID** which is passed as a parameter to all the methods of the SDK.

Use the `Agent` codeunit to create and manage agent instances programmatically:

```al
procedure CreateMyAgent(AgentInstructions: SecretText)
var
    TempAgentAccessControl: Record "Agent Access Control" temporary;
    Agent: Codeunit Agent;
    AgentUserSecurityID: Guid;
    UserName: Code[50];
begin
    UserName := 'MYAGENT';
    
    // Create an agent instance with the specified metadata provider
    AgentUserSecurityID := Agent.Create(
        Enum::"Agent Metadata Provider"::"My Agent",
        UserName,
        'My Agent Display Name',
        TempAgentAccessControl);
    
    // Set the agent's instructions
    Agent.SetInstructions(AgentUserSecurityID, AgentInstructions);
    
    // Activate the agent so it can start processing tasks
    Agent.Activate(AgentUserSecurityID);
end;
```

> [!NOTE]
> Agent instances are persisted in the database. If their configuration needs to remain in sync with changes to your application, changes have to be applied in an upgrade codeunit.

### Creating a setup page for the agent

To provide a user interface for configuring agent instances, create a setup page using the `ConfigurationDialog` page type. This page allows users to configure agent-specific settings while using the built-in `Agent Setup Part` for common agent configuration.

The setup page typically includes:

- **Agent Setup Part**: A standard part that handles common agent configuration including name, display name, state, and access control settings.
- **Custom configuration fields**: Agent-specific settings stored in a dedicated setup table

```al
page 50100 "My Agent Setup"
{
    PageType = ConfigurationDialog;
    Caption = 'Set up my agent';
    SourceTable = "My Agent Setup";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            // Standard agent configuration UI
            part(AgentSetupPart; "Agent Setup Part")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
            }

            // Custom agent-specific settings
            group(AdditionalConfiguration)
            {
                Caption = 'Additional Configuration';
                
                field(CustomProperty; Rec."Custom Property")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a custom property for agent-specific configuration.';
                }
            }
        }
    }
}
```

Create a corresponding table to store agent-specific configuration. The table uses the agent's User Security ID as the primary key to link configuration to each agent instance:

```al
table 50100 "My Agent Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
        }
        field(10; "Custom Property"; Text[100])
        {
            Caption = 'Custom Property';
        }
    }
    keys
    {
        key(Key1; "User Security ID")
        {
            Clustered = true;
        }
    }
}
```

Learn more about configuration dialogs in [The ConfigurationDialog page type (preview)](../developer/devenv-page-type-configuration-dialog.md).

### Using the Agent Setup codeunit

The `Agent Setup` codeunit is designed to work with custom setup pages, providing helper methods for UI-based agent configuration. It uses the `Agent Setup Buffer` record to track configuration changes and persist them when saved.

**Setup record management**

- Initialize a setup record for new agents or retrieve existing configuration
- Save changes made through the UI, automatically creating new agents or updating existing ones
- Track whether changes have been made that need to be saved

**UI helpers for configuration pages**

- Open the language and region settings page for the agent
- Open the agent access control page to manage which users can interact with the agent
- Open a profile lookup to let users select from available profiles
- Open an agent lookup to let users select from available agents

```al
trigger OnQueryClosePage(CloseAction: Action): Boolean
var
    AgentSetup: Codeunit "Agent Setup";
begin
    if CloseAction = CloseAction::Cancel then
        exit(true);

    // Check if changes were made and save them
    if AgentSetup.GetChangesMade(AgentSetupBuffer) then
        AgentSetup.SaveChanges(AgentSetupBuffer);
    
    exit(true);
end;
```

### Setup page design considerations

The following design principles are recommended when creating a setup page for your agent.

- As a source table, you must use a table with the user security ID of your agents as the primary key. The table should contain other relevant settings for your agent.
- The source table should be used as a temporary table, so that any changes aren't applied until the user decides to update their configuration by clicking the update button.
- Always use the setup part as it ensures a common visual identity for agents and also comes with relevant disclaimers around the use of AI in your feature.

### Configuring an agent instance

The `Agent` codeunit provides methods to configure various aspects of an agent instance after creation. All configuration methods require the agent's User Security ID.

**Lifecycle management**

- Activate or deactivate agent instances to control whether they can process tasks
- Check the current activation state of an agent

**Identity and display settings**

- Get or set the agent's display name
- Retrieve the agent's user name
- Set the agent's instructions that guide how it completes tasks
- Assign a profile to control which Role Center and UI elements the agent uses

**Localization settings**

- Update the agent's language, regional settings (locale), and time zone
- Retrieve current user settings including profile, language, and regional preferences

**Permissions and access control**

- Assign permission sets to control what data and operations the agent can access
- Retrieve the current permission sets assigned to the agent
- Configure which users can manage the agent or assign tasks to it through agent access controls

Learn more in [Agent permissions](ai-agent-permissions.md).

```al
procedure ConfigureAgent(AgentUserSecurityID: Guid; AgentInstructions: SecretText)
var
    TempAccessControlBuffer: Record "Access Control Buffer" temporary;
    TempAgentAccessControl: Record "Agent Access Control" temporary;
    Agent: Codeunit Agent;
begin
    // Set agent instructions
    Agent.SetInstructions(AgentUserSecurityID, AgentInstructions);
    
    // Set display name
    Agent.SetDisplayName(AgentUserSecurityID, 'Updated Agent Name');
    
    // Assign a profile
    Agent.SetProfile(AgentUserSecurityID, 'ACCOUNTANT', SystemApplicationAppId);
    
    // Update localization settings (language, locale, timezone)
    Agent.UpdateLocalizationSettings(AgentUserSecurityID, 1033, 1033, 'UTC');
    
    // Update permission sets
    TempAccessControlBuffer."Role ID" := 'D365 BASIC';
    TempAccessControlBuffer.Scope := TempAccessControlBuffer.Scope::System;
    TempAccessControlBuffer.Insert();
    Agent.UpdateAccessControl(AgentUserSecurityID, TempAccessControlBuffer);
    
    // Update which users can interact with the agent
    Agent.UpdateAgentAccessControl(AgentUserSecurityID, TempAgentAccessControl);
    
    // Activate the agent
    Agent.Activate(AgentUserSecurityID);
end;
```

### Agent instructions

Agent instructions are defined on **each agent instance separately**. This allows for customizing instructions based on custom settings per agent and for dynamically updating them during the agent's lifetime. There are a few different strategies that can be followed to assign instructions to your agent.

#### Static agent instructions

If an agent has instructions that won't change based on per-instance settings or other parameters, the easiest way to define them is in the resources of the agent's AL application. The instructions can then be set every time an agent instance is created by accessing the resource file.

First, add the instruction file to your `app.json` resources:

```json
{
    ...,
    "resourceFolders": ["Resources"]
}
```

Then, load and apply the instructions when creating the agent:

```al
procedure AssignStaticInstructions(AgentUserSecurityID: Guid)
var
    Agent: Codeunit Agent;
    Instructions: SecretText;
    InstructionsLbl: Label 'Instructions.txt', Locked = true;
begin
    // Load instructions from resource file
    Instructions := NavApp.GetResourceAsText(InstructionsLbl);

    // Apply to the agent instance
    Agent.SetInstructions(AgentUserSecurityID, Instructions);
end;
```

> [!NOTE]
> Upgrade code is needed for older instances if instructions are only applied during creation.

### Dynamic instructions on task startup

For agents that need to dynamically generate or update their instructions based on the current configuration or other runtime factors, you can set the instructions when the agent session starts. This approach allows the instructions to reflect the latest settings each time a task begins.

```al
[EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", OnAfterLogin, '', false, false)]
local procedure OnAfterMyAgentLogin()
var
    MyAgentSetup: Record "My Agent Setup";
    MyAgentInstructions: Codeunit "My Agent Instructions";
    AgentSession: Codeunit "Agent Session";
    Agent: Codeunit Agent;
    AgentMetadataProvider: Enum "Agent Metadata Provider";
begin
    // Only run for this agent type
    if not AgentSession.IsAgentSession(AgentMetadataProvider) then
        exit;
    
    if AgentMetadataProvider <> Enum::"Agent Metadata Provider"::"My Agent" then
        exit;

    // Load setup for this agent instance
    if not MyAgentSetup.Get(UserSecurityId()) then
        exit;

    // Set instructions dynamically based on current configuration
    Agent.SetInstructions(UserSecurityId(), MyAgentInstructions.BuildInstructions(MyAgentSetup));
end;
```

This pattern is useful when:

- Instructions should be regenerated based on changes to the agent's setup table
- Different agent instances require different instruction variations based on their configuration
- Instructions must be fetched from some external service, for example, a keyvault

### Advanced topics

#### Allow the creation of one or many agent instances via the UI

The `IAgentFactory` interface mandates the implementation of the `ShowCanCreate` method. This method allows for fine-grained control of when an agent instance should be creatable via the UI. Some examples of how it can be used:

**Single-instance** - Return true only if no instances of the agent exist
**Conditional creation** - Return true only if specific conditions are met
**Agent instances can always be created via the UI** - Always return true
**Creation not allowed via the UI, only via code** - Always return false

#### Adding annotations

The `GetAgentAnnotations` method on the `IAgentMetadata` interface allows for defining agent-level annotations for your agent. This allows for writing validations on when the agent should display errors or warnings based on different conditions. For example, if the agent must be made available only if the user owns a specific license, the validation can be added here and then it will presented in a user friendly manner on the task timeline.

### Summary page

It's possible to define a summary page for the agent, which is shown when the user hovers over the agent icons in the role center. This page has the purpose of showing a few important KPIs that are relevant to the agent. This page only supports displaying numeric values.

## Managing agent tasks

The Agent SDK allows you to trigger agent tasks programmatically from AL code. This enables integration with UI actions, business events, and custom workflows. You can also simulate email-based triggers for testing scenarios from the UI. Learn more in [Run an Agent (preview)](ai-agent-designer-run-agent.md).

### Using the Agent Task Builder API

The `Agent Task Builder` codeunit provides the primary interface for creating agent tasks. Here are common integration patterns:

#### Trigger from a page action

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

#### Trigger from business events

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

#### Simulate email-based triggers

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

#### Add attachments to tasks

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

Attachments enable agents to process documents like invoices, purchase orders, receipts, contracts, and other business documents. The agent can extract data from these files and use the information to complete tasks.

Learn more in [Attachment capabilities and limitations](ai-agent-designer-attachments.md).

#### Create configuration dialogs for agents

When building AL extensions that integrate with agents, you can create dedicated configuration interfaces using the `ConfigurationDialog` page type. This specialized page type is designed specifically for agent setup scenarios and provides features like temporary data sources, system actions, and structured layouts. Learn more in [The ConfigurationDialog page type (preview)](../developer/devenv-page-type-configuration-dialog.md).

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

## Agent sessions

In some use cases, agent-specific AL code needs to be written. Examples of these are:

- Adding specific filtering on a page based on the agent task running, for example filter the sales orders only to the customer mentioned in the task message
- Hiding or showing parts of the UI dynamically to agents
- Showing dialogs with guidance for the agent
- Running validation events after agent actions

### Detect if running in an agent session

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

### Bind events for agent task duration

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

For detecting if the current session is specifically a custom agent session, see [Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md).

## Cross-agent operations

For security reasons, it's only possible to use the agent SDK to interact with agents defined in your own application. Creating instances, tasks, messages and any configuration changes targeting an agent defined in a different application is blocked with an error.

The following example fails if `"Other Agent"` is defined in a different application:

```al
procedure CreateTaskForOtherAgent()
var
    AgentTaskBuilder: Codeunit "Agent Task Builder";
    OtherAgentUserSecurityID: Guid;
begin
    // This will fail with an error if "Other Agent" is defined in a different app
    AgentTaskBuilder
        .Initialize(OtherAgentUserSecurityID, 'Task for Other Agent')
        .AddTaskMessage('User', 'Please process this request')
        .Create();
end;
```

It's possible however to allow access to your agent for other apps by creating your own API for interacting with it. To do this, public procedures, which implement the functionality must be exposed.

```al
codeunit 50110 "My Agent API"
{
    Access = Public;

    /// <summary>
    /// Creates a task for the My Agent instance.
    /// </summary>
    /// <param name="AgentUserSecurityID">The User Security ID of the agent instance.</param>
    /// <param name="TaskTitle">The title of the task.</param>
    /// <param name="TaskMessage">The message content for the task.</param>
    /// <returns>The created Agent Task record.</returns>
    procedure CreateTask(AgentUserSecurityID: Guid; TaskTitle: Text[150]; TaskMessage: Text): Record "Agent Task"
    var
        AgentTaskBuilder: Codeunit "Agent Task Builder";
    begin
        exit(AgentTaskBuilder
            .Initialize(AgentUserSecurityID, TaskTitle)
            .AddTaskMessage('External App', TaskMessage)
            .Create());
    end;
}
```

Other applications can then call these public procedures to interact with your agent without directly using the SDK.


## Related information

[Overview (preview)](ai-agent-designer-landing-page.yml)  
[Agent designer (preview)](ai-agent-designer.md)  
[Integrate with the Tasks AL API (preview)](ai-agent-designer-tasks-api.md)  
[Create and activate (preview)](ai-agent-designer-create.md)  
[Write effective instructions (preview)](ai-agent-designer-effective-instructions.md)  
[Instruction keywords (preview)](ai-agent-designer-instruction-keywords.md)  
[Set up permissions and profiles (preview)](ai-agent-designer-permissions-profiles.md)  
[Run an Agent (preview)](ai-agent-designer-run-agent.md)  
[Iterate and manage (preview)](ai-agent-designer-iterate.md)  
[Agent designer frequently asked questions (preview)](ai-agent-designer-faq.md)  
[Best practices (preview)](ai-agent-designer-best-practices.md)  
[Create a Sales Validation Agent (preview)](ai-agent-designer-sales-validation.md)  
[Transparency note: Business Central Agent designer (preview)](transparency-note-agent-designer.md)
