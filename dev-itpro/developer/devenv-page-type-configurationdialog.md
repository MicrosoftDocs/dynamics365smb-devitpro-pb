---
title: The ConfigurationDialog Page Type
description: Describes the ConfigurationDialog page type used to create configuration dialogs for setting up and managing agent application settings in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 12/11/2025
ms.update-cycle: 180-days
ms.reviewer: solsen
---

# The ConfigurationDialog page type

The `ConfigurationDialog` page type is a specialized page type that enables developers to create focused configuration dialogs for setting up and managing application settings, preferences, and configurations. This page type provides a streamlined user experience with a modal dialog interface, system actions for saving or canceling changes, and support for temporary data sources.

> [!IMPORTANT]
> The `ConfigurationDialog` page type is intended specifically for agent development scenarios. Use this page type when building configuration interfaces for agents and AI-powered capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. Learn more about the agent playground capabilities in [Agent playground (preview)](ai-agent-playground.md).

<!-->
## Snippet support

Type the shortcut `tpage` and then choose the **Page of type Configuration Dialog**, which creates the basic layout for a `ConfigurationDialog` page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code. -->

## Properties of the ConfigurationDialog page type

The `ConfigurationDialog` page type has some specific properties that characterize the dialog.

|Property|Description|
|--------|-----------|
|`PageType` | The `PageType` property must be set to `ConfigurationDialog` for this specific page type. Learn more in [properties/devenv-pagetype-property.md](properties/devenv-pagetype-property.md).|
|`SourceTableTemporary` | Often set to `true` to use a temporary table as the data source, allowing you to collect settings before committing them to the database. Learn more in [SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)|
|`Extensible` | Typically set to `false` to ensure the configuration experience remains consistent and controlled. Learn more in [Extensible property](properties/devenv-extensible-property.md)|
|`InstructionalText` | Provides guidance to users about what the configuration dialog is for and what they need to do. Learn more in [InstructionalText property](properties/devenv-instructionaltext-property.md)|
|`RefreshOnActivate` | When set to `true`, the page refreshes its data when it becomes active again after a user navigates away. Learn more in [RefreshOnActivate property](properties/devenv-refreshonactivate-property.md)|

## Layout areas of the ConfigurationDialog page type

The `ConfigurationDialog` page type uses standard layout areas to organize configuration options:

|Area |Description|
|-----|-----------|
|`Content` | The main area containing fields, groups, and parts for configuration options.|
|`FactBoxes` | Optional area for displaying related information or context.|

### Groups and fields

Within the `Content` area, you can organize fields into groups to structure related settings:

- **Groups** - Organize related fields together with captions and instructional text
- **Fields** - Individual configuration options with validation and assist-edit capabilities
- **Parts** - Embed subpages for complex configuration scenarios

## Actions in the ConfigurationDialog page

The `ConfigurationDialog` page type primarily uses system actions to provide a consistent user experience.

|Action area|Description|
|-----------|-----------|
|`SystemActions` | Contains predefined system actions for the dialog, such as `OK` and `Cancel`.|
|`Promoted` | Standard actions that can be promoted for better visibility.|
|`Processing` | Custom actions for specific configuration tasks.|

### System actions

System actions in a `ConfigurationDialog` provide the primary interaction points:

- **OK** - Saves the configuration and closes the dialog
- **Cancel** - Discards changes and closes the dialog

These actions can have their captions and tooltips customized to match the specific configuration scenario.

## Example

The following example shows a configuration dialog for setting up an agent. The dialog collects agent settings including name, instructions, profile, and permissions before creating or updating the agent configuration.

```al
page 50100 "Agent Configuration Dialog"
{
    PageType = ConfigurationDialog;
    Extensible = false;
    ApplicationArea = All;
    Caption = 'Configure agent';
    InstructionalText = 'Configure which instructions the agent follows, its permissions, and how it appears to users.';
    SourceTable = "Agent Setup";
    SourceTableTemporary = true;
    RefreshOnActivate = true;

    layout
    {
        area(Content)
        {
            group(AgentDetails)
            {
                Caption = 'About the agent';

                field(AgentName; Rec."Display Name")
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                    ToolTip = 'Specifies the display name of the agent.';

                    trigger OnValidate()
                    begin
                        IsUpdated := true;
                        UpdateControls();
                    end;
                }
                field(AgentDescription; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    MultiLine = true;
                    ToolTip = 'Specifies the description of the agent.';

                    trigger OnValidate()
                    begin
                        IsUpdated := true;
                    end;
                }
                field(State; Rec.State)
                {
                    ApplicationArea = All;
                    Caption = 'Active';
                    ToolTip = 'Specifies whether the agent is active or not.';

                    trigger OnValidate()
                    begin
                        IsUpdated := true;
                    end;
                }
                group(InstructionGroup)
                {
                    Caption = 'Instructions for the agent';
                    InstructionalText = 'Use everyday words to describe what the agent should do.';

                    field(EditInstructions; EditInstructionsLbl)
                    {
                        ApplicationArea = All;
                        Caption = 'Edit instructions';
                        ShowCaption = false;
                        ToolTip = 'Opens a dialog to edit the agent instructions.';
                        Editable = false;

                        trigger OnDrillDown()
                        var
                            InstructionsDialog: Page "Agent Instructions Dialog";
                        begin
                            if InstructionsDialog.RunModal() = Action::OK then begin
                                InstructionText := InstructionsDialog.GetInstructions();
                                IsUpdated := true;
                            end;
                        end;
                    }
                }
            }
            group(AgentConfiguration)
            {
                Caption = 'Agent''s visibility and access';

                group(ProfileGroup)
                {
                    Caption = 'Profile (role)';
                    InstructionalText = 'Choose the user profile that the agent uses when it completes tasks.';

                    field(Profile; ProfileName)
                    {
                        ApplicationArea = All;
                        Caption = 'Profile';
                        ToolTip = 'Specifies the profile assigned to the agent.';
                        Editable = false;

                        trigger OnAssistEdit()
                        begin
                            if SelectProfile() then
                                IsUpdated := true;
                        end;
                    }
                }
                group(PermissionsGroup)
                {
                    Caption = 'Permissions';
                    InstructionalText = 'Define access rights to control what the agent can work with.';

                    field(ManagePermissions; ManagePermissionsLbl)
                    {
                        ApplicationArea = All;
                        Caption = 'Manage permissions';
                        ShowCaption = false;
                        ToolTip = 'Opens a dialog to manage agent permissions.';
                        Editable = false;

                        trigger OnDrillDown()
                        var
                            PermissionsPage: Page "Agent Permissions";
                        begin
                            if PermissionsPage.RunModal() = Action::OK then
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
                Enabled = IsValid and IsUpdated;
            }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
                ToolTip = 'Discard the changes and close the setup page.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then begin
            Rec.Init();
            Rec.Insert();
        end;
        
        IsValid := false;
        IsUpdated := false;
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        UpdateControls();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        AgentMgt: Codeunit "Agent Management";
    begin
        if CloseAction = CloseAction::Cancel then
            exit(true);

        // Validate required configuration
        if not ValidateConfiguration() then
            exit(false);

        // Apply the agent configuration
        AgentMgt.UpdateAgentFromSetup(Rec, InstructionText, ProfileName);
        exit(true);
    end;

    local procedure SelectProfile(): Boolean
    var
        AllProfile: Record "All Profile";
    begin
        if Page.RunModal(Page::"Available Profiles", AllProfile) = Action::LookupOK then begin
            ProfileName := AllProfile."Profile ID";
            exit(true);
        end;
        exit(false);
    end;

    local procedure ValidateConfiguration(): Boolean
    begin
        if Rec."Display Name" = '' then
            Error('You must specify an agent name.');
            
        if InstructionText = '' then
            Error('The agent must have instructions assigned.');
            
        if ProfileName = '' then
            Error('The agent must have a profile assigned.');

        exit(true);
    end;

    local procedure UpdateControls()
    begin
        IsValid := (Rec."Display Name" <> '') and 
                   (InstructionText <> '') and 
                   (ProfileName <> '');
    end;

    var
        InstructionText: Text;
        ProfileName: Text;
        IsValid: Boolean;
        IsUpdated: Boolean;
        EditInstructionsLbl: Label 'Edit instructions';
        ManagePermissionsLbl: Label 'Manage permissions';
}
```

## Key features and best practices

### Temporary tables

Using `SourceTableTemporary = true` is common with `ConfigurationDialog` pages because it allows you to:

- Collect configuration settings without immediately affecting the database
- Validate all settings together before applying changes
- Cancel the configuration without leaving partial data
- Provide a better user experience with immediate feedback

### Validation

Configuration dialogs should validate user input at multiple points:

- **Field-level validation** - In `OnValidate` triggers for immediate feedback
- **Page-level validation** - In `OnQueryClosePage` before applying changes
- **Cross-field validation** - In dedicated procedures that check relationships between fields

### System action enablement

You can control when system actions are enabled:

```al
systemaction(OK)
{
    Caption = 'Apply';
    ToolTip = 'Apply the configuration changes.';
    Enabled = AllRequiredFieldsFilled;
}
```

### Instructional text

Use `InstructionalText` at both page and group levels to guide users:

- Page-level instructional text explains the overall purpose
- Group-level instructional text provides context for related fields

## Related information

[Agent playground (preview)](ai-agent-playground.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  
[PageType property](properties/devenv-pagetype-property.md)  
[SourceTable property](properties/devenv-sourcetable-property.md)  
[SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)  
[Extensible property](properties/devenv-extensible-property.md)  
[InstructionalText property](properties/devenv-instructionaltext-property.md)
