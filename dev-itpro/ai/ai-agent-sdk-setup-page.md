---
title: Create agent setup pages (preview)
description: Learn how to create setup pages for agents in Dynamics 365 Business Central using the ConfigurationDialog page type.
author: solsen
ms.author: solsen
ms.reviewer: solsen
ms.topic: how-to
ms.collection:
  - get-started
  - bap-ai-copilot
ms.date: 01/21/2026
ms.update-cycle: 180-days
---

# Create agent setup pages (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

This article explains how to create setup pages for your agents using the `ConfigurationDialog` page type. Setup pages provide a user interface for configuring agent instances, allowing users to customize agent-specific settings while using the built-in `Agent Setup Part` for common agent configuration.

## Creating a setup page

To provide a user interface for configuring agent instances, create a setup page using the `ConfigurationDialog` page type. This page allows users to configure agent-specific settings while using the built-in `Agent Setup Part` for common agent configuration.

The setup page typically includes:

- **Agent Setup Part**: A standard part that handles common agent configuration including name, display name, state, and access control settings.
- **Custom configuration fields**: Agent-specific settings stored in a dedicated setup table
- **System actions**: An Update button to save changes and a Cancel button to discard them
- **Initialization logic**: Code to initialize the setup record and handle saving on close

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

                    trigger OnValidate()
                    begin
                        IsUpdated := true;
                    end;
                }
            }
        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(OK)
            {
                Caption = 'Update';
                Enabled = IsUpdated;
                ToolTip = 'Apply the changes to the agent setup.';
            }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
                ToolTip = 'Discards the changes and closes the setup page.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        InitializePage();
    end;

    trigger OnAfterGetRecord()
    begin
        InitializePage();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = CloseAction::Cancel then
            exit(true);

        // Get the updated buffer from the setup part
        CurrPage.AgentSetupPart.Page.GetAgentSetupBuffer(AgentSetupBuffer);
        
        // Save the agent configuration and custom properties
        SaveSetupRecord(Rec, AgentSetupBuffer);
        SaveCustomProperties(Rec);
        
        exit(true);
    end;

    local procedure InitializePage()
    begin
        // Get the current buffer from the setup part
        CurrPage.AgentSetupPart.Page.GetAgentSetupBuffer(AgentSetupBuffer);
        
        // Initialize the setup record and buffer
        InitializeSetupRecord(Rec, AgentSetupBuffer);
        
        // Pass the initialized buffer back to the setup part
        CurrPage.AgentSetupPart.Page.SetAgentSetupBuffer(AgentSetupBuffer);
        
        // Sync the update state
        IsUpdated := CurrPage.AgentSetupPart.Page.GetChangesMade();
    end;

    // See the 'Implement the setup logic' section for the implementation
    // of InitializeSetupRecord, SaveSetupRecord, and SaveCustomProperties procedures.

    var
        AgentSetupBuffer: Record "Agent Setup Buffer";
        IsUpdated: Boolean;
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

## Enabling revertable changes

The setup page is designed to allow users to make changes and preview them without committing to the database. This provides a safe editing experience where users can cancel at any time without persisting unwanted modifications.

### How it works

1. **Draft-like editing**: The page uses a temporary source table (`SourceTableTemporary = true`), meaning all edits are made to an in-memory record that isn't automatically saved to the database.

2. **Change tracking with IsUpdated**: A boolean variable `IsUpdated` tracks whether any modifications have been made. This variable:
   - Enables the **Update** button only when changes exist
   - Gets set to `true` when fields are modified
   - Signals that the user has made edits that need to be confirmed or discarded

3. **Explicit commit on Update**: When the user clicks **Update**:
   - The `OnQueryClosePage` trigger saves the changes to the actual database
   - Agent configuration is persisted through the `Agent Setup` codeunit
   - Custom properties are written to your setup table

4. **Automatic revert on Cancel**: When the user clicks **Cancel**:
   - All changes are automatically discarded
   - No database writes occur
   - The user's session ends without any modifications being saved

Custom setup pages should be designed with this pattern in mind. It is important to ensure that errors in the setup page do not commit partial data as that would circumvent the users' expectations.

## Modifying Agent Setup Part properties

You can programmatically update properties in the Agent Setup Part from your custom fields or logic. This is useful when you want to synchronize custom fields with standard agent properties like display name or state.

To update properties in the Agent Setup Part:

1. Get the current buffer from the part
2. Modify the buffer fields
3. Set the updated buffer back to the part
4. Mark that changes have been made

The following example shows how to update the display name when a custom field changes:

```al
field(DisplayName; AgentDisplayName)
{
    Caption = 'Display Name';
    ApplicationArea = All;
    ToolTip = 'Specifies the display name of the agent.';

    trigger OnValidate()
    begin
        // Get the current buffer from the setup part
        CurrPage.AgentSetupPart.Page.GetAgentSetupBuffer(AgentSetupBuffer);
        
        // Update the display name in the buffer
        AgentSetupBuffer."Display Name" := AgentDisplayName;
        AgentSetupBuffer.Modify(true);
        
        // Pass the updated buffer back to the setup part
        CurrPage.AgentSetupPart.Page.SetAgentSetupBuffer(AgentSetupBuffer);
        CurrPage.AgentSetupPart.Page.Update(false);
        
        // Mark that changes have been made to enable the Update button
        IsUpdated := true;
    end;
}
```

You can update other properties in the `Agent Setup Buffer` such as:

- **State**: Set `AgentSetupBuffer.State` to activate or deactivate the agent
- **Display Name**: Set `AgentSetupBuffer."Display Name"` to change the visible name

## Implement the setup logic

The setup page shown above calls helper procedures to manage initialization and saving. These procedures work with the `Agent Setup` codeunit from the system to manage agent configuration.

These procedures should ideally be implemented in a separate codeunit, but they are shown inline here for ease of understanding.

### Initializing the setup record

Initialize the setup record to prepare the page for display. For new agents, set default values. For existing agents, load the current configuration from the database.

```al
local procedure InitializeSetupRecord(var TempMyAgentSetup: Record "My Agent Setup" temporary; var AgentSetupBuffer: Record "Agent Setup Buffer")
var
    MyAgentSetupRecord: Record "My Agent Setup";
    AgentSetup: Codeunit "Agent Setup";
begin
    // For new agents, set default values for custom properties
    // For existing agents, load current configuration
    if IsNullGuid(TempMyAgentSetup."User Security ID") then
        TempMyAgentSetup."Custom Property" := 'Default Value'
    else
        if MyAgentSetupRecord.Get(TempMyAgentSetup."User Security ID") then
            TempMyAgentSetup.TransferFields(MyAgentSetupRecord, false);

    if TempMyAgentSetup.IsEmpty() then
        TempMyAgentSetup.Insert();

    // Initialize the Agent Setup Buffer with agent metadata
    if AgentSetupBuffer.IsEmpty() then
        AgentSetup.GetSetupRecord(
            AgentSetupBuffer,
            TempMyAgentSetup."User Security ID",
            Enum::"Agent Metadata Provider"::"My Agent",
            'My Agent - ' + CompanyName(),  // Agent name
            'My Agent',                      // Display name
            'Description of what this agent does.');  // Summary
end;
```

### Saving the setup record

Save the agent configuration when the user clicks Update. Use the `Agent Setup` codeunit to persist the agent settings and set instructions for new agents.

```al
local procedure SaveSetupRecord(var TempMyAgentSetup: Record "My Agent Setup" temporary; var AgentSetupBuffer: Record "Agent Setup Buffer")
var
    AgentSetup: Codeunit "Agent Setup";
    Agent: Codeunit Agent;
    IsNewAgent: Boolean;
begin
    IsNewAgent := IsNullGuid(AgentSetupBuffer."User Security ID");

    // Save the agent configuration using the Agent Setup codeunit
    if AgentSetup.GetChangesMade(AgentSetupBuffer) then begin
        TempMyAgentSetup."User Security ID" := AgentSetup.SaveChanges(AgentSetupBuffer);

        // For new agents, set the instructions
        if IsNewAgent then
            Agent.SetInstructions(TempMyAgentSetup."User Security ID", GetInstructions());
    end;
end;
```

### Saving custom properties

Save any agent-specific custom properties to your setup table.

```al
local procedure SaveCustomProperties(var TempMyAgentSetup: Record "My Agent Setup" temporary)
var
    MyAgentSetupRecord: Record "My Agent Setup";
begin
    if not MyAgentSetupRecord.Get(TempMyAgentSetup."User Security ID") then begin
        MyAgentSetupRecord.Init();
        MyAgentSetupRecord."User Security ID" := TempMyAgentSetup."User Security ID";
    end;

    MyAgentSetupRecord."Custom Property" := TempMyAgentSetup."Custom Property";

    if not MyAgentSetupRecord.Modify() then
        MyAgentSetupRecord.Insert();
end;
```

## Using the Agent Setup codeunit

The `Agent Setup` codeunit from the System Application is designed to work with custom setup pages, providing helper methods for UI-based agent configuration. It uses the `Agent Setup Buffer` record to track configuration changes and persist them when saved.

### Key methods

| Method | Description |
|--------|-------------|
| `GetSetupRecord` | Initializes the `Agent Setup Buffer` with agent metadata for new or existing agents. |
| `GetChangesMade` | Returns whether any changes have been made to the agent configuration. |
| `SaveChanges` | Persists the agent configuration, creating a new agent or updating an existing one. Returns the agent's User Security ID. |

### UI helpers for configuration pages

The `Agent Setup` codeunit also provides helper methods to open common configuration pages:

- Open the language and region settings page for the agent
- Open the agent access control page to manage which users can interact with the agent
- Open a profile lookup to let users select from available profiles
- Open an agent lookup to let users select from available agents

## Setup page design considerations

The following design principles are recommended when creating a setup page for your agent.

- As a source table, you must use a table with the user security ID of your agents as the primary key. The table should contain other relevant settings for your agent.
- The source table should be used as a temporary table, so that any changes aren't applied until the user decides to update their configuration by clicking the update button.
- Always use the setup part as it ensures a common visual identity for agents and also comes with relevant disclaimers around the use of AI in your feature.

## Related information

[Configure agents programmatically  (preview)](ai-agent-sdk-configuration.md)  
[Coding agents in AL (preview)](ai-agent-sdk-overview.md)  
[Define and register an agent programmatically  (preview)](ai-agent-sdk-define-register.md)  
[Managing agent tasks programmatically  (preview)](ai-agent-sdk-tasks.md)  
[The ConfigurationDialog page type (preview)](../developer/devenv-page-type-configuration-dialog.md)
