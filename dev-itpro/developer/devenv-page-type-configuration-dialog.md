---
title: The ConfigurationDialog Page Type (preview)
description: Learn how to use the `ConfigurationDialog` page type to create focused configuration dialogs for managing agent settings in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection: bap-ai-copilot
ms.date: 01/12/2026
ms.update-cycle: 180-days
ms.reviewer: solsen
---

# The ConfigurationDialog page type (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-designer-preview](../includes/ai-designer-preview.md)]

The `ConfigurationDialog` page type is a specialized page type that enables developers to create focused configuration dialogs for setting up and managing application settings, preferences, and configurations for agents. This page type provides a streamlined user experience with a modal dialog interface, system actions for saving or canceling changes, and support for temporary data sources.

> [!IMPORTANT]
> The `ConfigurationDialog` page type is intended specifically for agent development scenarios. Use this page type when building configuration interfaces for agents and AI-powered capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. Learn more in [Integrate with the Tasks AL API (preview)](../ai/ai-development-toolkit-tasks-api.md).

## Snippet support

Type the shortcut `tpage` and then choose the **Page of type Configuration Dialog**, which creates the basic layout for a `ConfigurationDialog` page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Properties of the ConfigurationDialog page type

The `ConfigurationDialog` page type has some specific properties that characterize the dialog.

|Property|Description|
|--------|-----------|
|`PageType` | Must be set to `ConfigurationDialog` for this specific page type. Learn more in [PageType property](properties/devenv-pagetype-property.md).|
|`SourceTableTemporary` | Must be set to `true` to use a temporary table as the data source, allowing you to collect settings before committing them to the database. Learn more in [SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)|
|`Extensible` | Must be set to `false` for this page type. Learn more in [Extensible property](properties/devenv-extensible-property.md)|
|`InstructionalText` | Provides guidance to users about what the configuration dialog is for and what they need to do. Learn more in [InstructionalText property](properties/devenv-instructionaltext-property.md)|
|`RefreshOnActivate` | When set to `true`, the page refreshes its data when it becomes active again after a user navigates away. Learn more in [RefreshOnActivate property](properties/devenv-refreshonactivate-property.md)|

## Layout areas of the ConfigurationDialog page type

The `ConfigurationDialog` page type uses the `Content` area, which provides space for fields, groups, and parts that organize configuration options.

### The AgentSetupPart

Within the `Content` area, you can use the page part `AgentSetupPart` that encapsulates specific configuration functionality.

```al
part(AgentSetupPart; "Agent Setup Part")
{
    ApplicationArea = All;
    UpdatePropagation = Both;
}
```

> [!IMPORTANT]
> The `AgentSetupPart` must be used as the first element in the layout. And no other parts are accepted in this layout.

### Groups and fields

You can organize fields into groups to structure related settings:

- **Groups** - Organize related fields together with captions and instructional text
- **Fields** - Individual configuration options with validation and assist-edit capabilities
- **Nested groups** - Create hierarchical organization of related settings

### Cards that have toggle controls

Each root-level group in the `Content` area represents a card in the configuration dialog. Cards can have a toggle control at the top by using a specific pattern:

#### Add a toggle to a card

1. Place a boolean field as the first field in the group.
2. Set `ShowCaption = false` on that field.
3. The group's caption appears at the top of the card with a toggle on the right side.

```al
group(MonitorIncomingCard)
{
    Caption = 'Monitor incoming information';
    InstructionalText = 'The agent will read messages in these channels:';

    // Boolean field as first child creates a toggle for the card
    field("Monitor incoming inquiries"; Rec."Incoming Monitoring")
    {
        ShowCaption = false;
        ToolTip = 'Specifies if the agent should monitor incoming inquiries.';
    }
    
    // Other fields in the card...
}
```

**Sub-groups can also have toggles** using the same pattern. Place a boolean field with `ShowCaption = false` as the first child of a nested group:

```al
group(MonitorIncomingCard)
{
    Caption = 'Monitor incoming information';
    
    field("Monitor incoming inquiries"; Rec."Incoming Monitoring")
    {
        ShowCaption = false;
    }
    
    // Nested group with its own toggle
    group(MailboxGroup)
    {
        Caption = 'Mailbox';
        
        field(MailEnabled; Rec."Email Monitoring")
        {
            ShowCaption = false;
            ToolTip = 'Specifies if the agent should monitor incoming mail.';
        }
        
        field(Mailbox; MailboxName)
        {
            Caption = 'Account';
            ToolTip = 'Specifies the email account that the agent monitors.';
            Editable = false;
            ShowMandatory = true;
        }
    }
}
```

This pattern creates a visual hierarchy:

- The **outer card** has a toggle controlling the entire "Monitor incoming information" feature
- The **nested Mailbox group** has its own toggle for email-specific monitoring
- Other fields within each group provide detailed configuration

> [!TIP]
> Use `InstructionalText` on groups to provide helpful guidance. While it's not specific to `ConfigurationDialog`, it's useful for guiding users through card-based configuration.

## Actions in the ConfigurationDialog page

The `ConfigurationDialog` page type primarily uses system actions to provide a consistent user experience.

### System actions

System actions in a `ConfigurationDialog` provide the primary interaction points for users to complete or cancel the configuration process. They are:

- **OK** - Saves the configuration and closes the dialog
- **Cancel** - Discards changes and closes the dialog

The triggers for these actions can't be defined as they're defined by the platform.

## Example

The following example demonstrates a simplified configuration dialog for setting up an agent. It shows the key patterns of the `ConfigurationDialog` page type, including embedded parts, cards with toggles, drill-down fields for complex settings, and managing multiple buffer records.

```al
page 50100 "Agent Configuration"
{
    PageType = ConfigurationDialog;
    Extensible = false;
    ApplicationArea = All;
    Caption = 'Configure agent';
    InstructionalText = 'Configure which instructions the agent follows, its permissions, and how it appears to users.';
    SourceTable = "Agent Setup Record";
    SourceTableTemporary = true;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            // Reusable part for agent preview/settings
            part(AgentSetupPart; "Agent Setup Part")
            {
                ApplicationArea = All;
                UpdatePropagation = Both;
            }
            
            // Basic agent information card
            group(AgentDetails)
            {
                Caption = 'About the agent';
                
                field(AgentName; AgentNameVar)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the unique name of the agent.';

                    trigger OnValidate()
                    begin
                        IsUpdated := true;
                        // Update the buffer and refresh the part
                        AgentSetupBuffer.Validate("User Name", AgentNameVar);
                        AgentSetupBuffer.Modify(true);
                        UpdateAgentSetupPart();
                    end;
                }
                
                field(AgentDescription; Rec.Description)
                {
                    Caption = 'Description';
                    MultiLine = true;
                    ToolTip = 'Specifies the description of the agent.';

                    trigger OnValidate()
                    begin
                        IsUpdated := true;
                        // Notify the part about the change
                        CurrPage.AgentSetupPart.Page.SetAgentSummary(Rec.Description);
                        CurrPage.AgentSetupPart.Page.Update(false);
                    end;
                }
                
                // Complex settings accessed via drill-down
                field(Profile; ProfileDisplayName)
                {
                    Caption = 'Profile';
                    ToolTip = 'Specifies the profile that is associated with the agent.';
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        AllProfile: Record "All Profile";
                    begin
                        if Page.RunModal(Page::"Available Profiles", AllProfile) = Action::LookupOK then begin
                            TempUserSettings."Profile ID" := AllProfile."Profile ID";
                            ProfileDisplayName := AllProfile."Profile ID";
                            IsUpdated := true;
                        end;
                    end;
                }
            }
            
            // Card with toggle control
            group(MonitorIncomingCard)
            {
                Caption = 'Monitor incoming information';
                InstructionalText = 'The agent will read messages in these channels:';

                // Boolean field as first child creates a toggle for the card
                field(MonitorIncoming; Rec."Incoming Monitoring")
                {
                    ShowCaption = false;
                    ToolTip = 'Specifies if the agent should monitor incoming inquiries.';

                    trigger OnValidate()
                    begin
                        IsUpdated := true;
                    end;
                }

                // Nested group with its own toggle
                group(MailboxGroup)
                {
                    Caption = 'Mailbox';
                    
                    field(MailEnabled; Rec."Email Monitoring")
                    {
                        ShowCaption = false;
                        ToolTip = 'Specifies if the agent should monitor incoming mail.';

                        trigger OnValidate()
                        begin
                            IsUpdated := true;
                        end;
                    }
                    
                    field(Mailbox; MailboxName)
                    {
                        Caption = 'Account';
                        ToolTip = 'Specifies the email account that the agent monitors.';
                        Editable = false;
                        ShowMandatory = true;

                        trigger OnAssistEdit()
                        begin
                            // Open mailbox selection dialog
                            if SelectMailbox(MailboxName) then
                                IsUpdated := true;
                        end;
                    }
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
                ToolTip = 'Apply the changes to the agent setup.';
                Enabled = IsUpdated;
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
        if Rec.IsEmpty() then begin
            Rec.Init();
            Rec.Insert();
        end;
        
        // Initialize buffer records
        AgentSetupBuffer.Init();
        AgentSetupBuffer.Insert();
        
        UpdateControls();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = CloseAction::Cancel then
            exit(true);

        // Validate required fields
        if AgentNameVar = '' then
            Error('You must specify an agent name.');
            
        if ProfileDisplayName = '' then
            Error('You must select a profile.');

        // Apply all settings
        ApplySettings();
        exit(true);
    end;

    local procedure UpdateControls()
    begin
        // Refresh the part with current buffer data
        CurrPage.AgentSetupPart.Page.SetAgentSetupBuffer(AgentSetupBuffer);
        CurrPage.AgentSetupPart.Page.Update(false);
    end;
    
    local procedure UpdateAgentSetupPart()
    begin
        CurrPage.AgentSetupPart.Page.SetAgentSetupBuffer(AgentSetupBuffer);
        CurrPage.AgentSetupPart.Page.SetAgentSummary(Rec.Description);
        CurrPage.Update(false);
    end;
    
    local procedure ApplySettings()
    var
        AgentSetup: Codeunit "Agent Setup";
    begin
        // Apply all collected settings to the database
        AgentSetup.UpdateAgent(AgentSetupBuffer);
        AgentSetup.SetProfile(AgentSetupBuffer."User Security ID", TempUserSettings);
    end;

    var
        AgentSetupBuffer: Record "Agent Setup Buffer" temporary;
        TempUserSettings: Record "User Settings" temporary;
        AgentNameVar: Text[50];
        ProfileDisplayName: Text;
        MailboxName: Text;
        IsUpdated: Boolean;
}
```

### Understanding the example

This example demonstrates the essential patterns of `ConfigurationDialog` for agent setup:

#### Embedded parts

```al
part(AgentSetupPart; "Agent Setup Part")
{
    ApplicationArea = All;
    UpdatePropagation = Both;
}
```

The page embeds a reusable part that provides consistent agent preview and configuration UI. The part is updated using:

```al
CurrPage.AgentSetupPart.Page.SetAgentSetupBuffer(AgentSetupBuffer);
CurrPage.AgentSetupPart.Page.Update(false);
```

#### Cards with toggle controls

Start typing `group` in the context of a ConfigurationDialog page, which creates the basic layout for a `GroupToogle` layout.

The example demonstrates how to create cards with toggle controls using a boolean field with `ShowCaption = false` as the first field:

```al
group(MonitorIncomingCard)
{
    Caption = 'Monitor incoming information';
    InstructionalText = 'The agent will read messages in these channels:';

    // Boolean field as first child creates a toggle
    field(MonitorIncoming; Rec."Incoming Monitoring")
    {
        ShowCaption = false;
    }
    // ... other fields
}
```

This pattern creates a card with:

- The group's caption displayed at the top ("Monitor incoming information")
- A toggle control on the right side of the card
- Instructional text below the caption
- The card's fields shown beneath

**Nested groups can also have toggles:**

```al
group(MailboxGroup)
{
    Caption = 'Mailbox';
    
    field(MailEnabled; Rec."Email Monitoring")
    {
        ShowCaption = false;  // Creates a toggle for this nested group
    }
    
    field(Mailbox; MailboxName)
    {
        Caption = 'Account';
        // ... field configuration
    }
}
```

This creates a visual hierarchy where users can enable/disable features at different levels, providing granular control over configuration options.

#### Assist-edit pattern for complex settings

Instead of crowding the main page with many fields, complex settings like profile selection use noneditable fields with `OnAssistEdit` triggers:

```al
field(Profile; ProfileDisplayName)
{
    Editable = false;
    
    trigger OnAssistEdit()
    var
        AllProfile: Record "All Profile";
    begin
        if Page.RunModal(Page::"Available Profiles", AllProfile) = Action::LookupOK then begin
            TempUserSettings."Profile ID" := AllProfile."Profile ID";
            ProfileDisplayName := AllProfile."Profile ID";
            IsUpdated := true;
        end;
    end;
}
```

This pattern:

- Keeps the main configuration page focused and uncluttered
- Opens specialized lookup pages for selection
- Returns to the main page after the user makes a selection

#### Temporary buffer records

The page manages temporary records to collect settings before applying them:

```al
var
    AgentSetupBuffer: Record "Agent Setup Buffer" temporary;
    TempUserSettings: Record "User Settings" temporary;
```

This allows validation across all settings before committing changes to the database.

#### Change tracking and conditional enablement

The `IsUpdated` variable tracks whether the user made any changes:

```al
trigger OnValidate()
begin
    IsUpdated := true;
    // ... update logic
end;
```

System actions can be conditionally enabled based on this state:

```al
systemaction(OK)
{
    Caption = 'Update';
    Enabled = IsUpdated;
}
```

#### Validation and applying settings

The `OnQueryClosePage` trigger validates all required fields and applies settings only when the user confirms:

```al
trigger OnQueryClosePage(CloseAction: Action): Boolean
begin
    if CloseAction = CloseAction::Cancel then
        exit(true);

    // Validate required fields
    if AgentNameVar = '' then
        Error('You must specify an agent name.');
        
    if ProfileDisplayName = '' then
        Error('You must select a profile.');
    
    // Apply all settings
    ApplySettings();
    exit(true);
end;
```

## Key features and best practices

### Assist-edit for complex settings

Use noneditable fields with `OnAssistEdit` triggers to handle complex settings:

```al
field(ComplexSetting; SettingLabel)
{
    Editable = false;
    
    trigger OnAssistEdit()
    begin
        // Open specialized lookup or dialog
    end;
}
```

This pattern keeps the main configuration page focused while providing access to detailed settings through lookups or specialized dialogs.

#### Validation flow

- **Field validation** - `OnValidate` triggers update the `IsValid` state
- **Page validation** - `OnQueryClosePage` performs final validation before applying changes
- **System action enablement** - The **OK** button is enabled only when `IsValid = true`

#### System actions

```al
systemaction(OK)
{
    Caption = 'Create';
    Enabled = IsValid;
}
```

The **OK** button is customized with a meaningful caption and conditional enablement.

### Temporary tables

Using `SourceTableTemporary = true` is mandatory with `ConfigurationDialog` pages. You can manage temporary buffer records to organize settings:

```al
var
    AgentSetupBuffer: Record "Agent Setup Buffer" temporary;
    TempUserSettings: Record "User Settings" temporary;
```

This allows you to:

- Collect configuration settings without immediately affecting the database
- Validate all settings together before applying changes
- Manage related settings across multiple temporary tables
- Cancel the configuration without leaving partial data
- Provide a better user experience with immediate feedback

### Validation

Configuration dialogs should validate user input at multiple points:

- **Field-level validation** - In `OnValidate` triggers for immediate feedback
- **Page-level validation** - In `OnQueryClosePage` before applying changes
- **Cross-field and cross-buffer validation** - In dedicated procedures that check relationships between fields and buffer records

### System action enablement

You can control when system actions are enabled based on change tracking:

```al
var
    IsUpdated: Boolean;

trigger OnValidate()
begin
    IsUpdated := true;
end;

systemaction(OK)
{
    Caption = 'Update';
    ToolTip = 'Apply the configuration changes.';
    Enabled = IsUpdated;
}
```

This provides clear feedback to users about whether changes are made.

### Instructional text

Use `InstructionalText` at both page and group levels to guide users:

- Page-level instructional text explains the overall purpose
- Group-level instructional text provides context for related fields

Writing clear and concise instructions improves usability. To guide users well, you can learn best practices for crafting effective instructional text. Learn more in [Write effective instructions for an agent (preview)](../ai/ai-development-toolkit-instructions.md).

## Related information

[Integrate with the Tasks AL API (preview)](../ai/ai-development-toolkit-tasks-api.md)  
[Agent designer (preview)](../ai/ai-development-toolkit-overview.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  
[PageType property](properties/devenv-pagetype-property.md)  
[SourceTable property](properties/devenv-sourcetable-property.md)  
[SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)  
[Extensible property](properties/devenv-extensible-property.md)  
[InstructionalText property](properties/devenv-instructionaltext-property.md)  
