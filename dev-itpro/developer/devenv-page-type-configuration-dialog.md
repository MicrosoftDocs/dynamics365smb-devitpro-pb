---
title: The ConfigurationDialog Page Type (preview)
description: Describes the ConfigurationDialog page type used to create configuration dialogs for setting up and managing agent application settings in Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.author: solsen
ms.topic: overview
ms.collection:
  - bap-ai-copilot
ms.date: 12/22/2025
ms.update-cycle: 180-days
ms.reviewer: solsen
---

# The ConfigurationDialog page type (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The `ConfigurationDialog` page type is a specialized page type that enables developers to create focused configuration dialogs for setting up and managing application settings, preferences, and configurations for agents. This page type provides a streamlined user experience with a modal dialog interface, system actions for saving or canceling changes, and support for temporary data sources.

> [!IMPORTANT]
> The `ConfigurationDialog` page type is intended specifically for agent development scenarios. Use this page type when building configuration interfaces for agents and AI-powered capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. Learn more about the Tasks AL API in [Integrate with the Tasks AL API (preview)](../ai/ai-agent-playground-tasks-api.md).


## Snippet support

Type the shortcut `tpage` and then choose the **Page of type Configuration Dialog**, which creates the basic layout for a `ConfigurationDialog` page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Properties of the ConfigurationDialog page type

The `ConfigurationDialog` page type has some specific properties that characterize the dialog.

|Property|Description|
|--------|-----------|
|`PageType` | The `PageType` property must be set to `ConfigurationDialog` for this specific page type. Learn more in [properties/devenv-pagetype-property.md](properties/devenv-pagetype-property.md).|
|`SourceTableTemporary` | Must be set to `true` to use a temporary table as the data source, allowing you to collect settings before committing them to the database. Learn more in [SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)|
|`Extensible` | Must be set to `false` for this page type. Learn more in [Extensible property](properties/devenv-extensible-property.md)|
|`InstructionalText` | Provides guidance to users about what the configuration dialog is for and what they need to do. Learn more in [InstructionalText property](properties/devenv-instructionaltext-property.md)|
|`RefreshOnActivate` | When set to `true`, the page refreshes its data when it becomes active again after a user navigates away. Learn more in [RefreshOnActivate property](properties/devenv-refreshonactivate-property.md)|

## Layout areas of the ConfigurationDialog page type

The `ConfigurationDialog` page type uses the `Content`, which gives a main area that contains fields, groups, and parts for configuration options.

### Groups and fields

Within the `Content` area, you can organize fields into groups to structure related settings:

- **Groups** - Organize related fields together with captions and instructional text
- **Fields** - Individual configuration options with validation and assist-edit capabilities
- **Parts** - Embed subpages for complex configuration scenarios

#### Defining the start card

The `ConfigurationDialog` page type uses `group` inside the `Content` area, which is referred to as the `StartCard` in the [Example](#example). With the `StartCard`, you can create sections that guide users through the configuration process and omit the caption for the group to create a clean look. The following example shows how to define a `StartCard` group without a caption:

```al
group(StartCard)
{
    ApplicationArea = All;
    ShowCaption = false;

    trigger OnValidate();
    begin
    end;
}
```

## Actions in the ConfigurationDialog page

The `ConfigurationDialog` page type primarily uses system actions to provide a consistent user experience.

### System actions

System actions in a `ConfigurationDialog` provide the primary interaction points:

- **OK** - Saves the configuration and closes the dialog
- **Cancel** - Discards changes and closes the dialog

These actions can have their captions and tooltips customized to match the specific configuration scenario.

## Example

The following example demonstrates a simplified configuration dialog for setting up an agent. It shows the key patterns of the `ConfigurationDialog` page type, including the `StartCard` group structure and validation flow.

```al
page 50100 "Agent Configuration"
{
    PageType = ConfigurationDialog;
    Extensible = false;
    ApplicationArea = All;
    Caption = 'Configure agent';
    InstructionalText = 'Set up your agent with a name, instructions, and profile.';
    SourceTable = "Agent Setup Buffer";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            // StartCard: Initial fields without a visible caption
            group(StartCard)
            {
                ShowCaption = false;

                field(AgentName; Rec."Display Name")
                {
                    ApplicationArea = All;
                    Caption = 'Agent name';
                    ToolTip = 'Specifies the name of the agent.';

                    trigger OnValidate()
                    begin
                        UpdateControls();
                    end;
                }
                field(AgentDescription; Rec.Description)
                {
                    ApplicationArea = All;
                    Caption = 'Description';
                    MultiLine = true;
                    ToolTip = 'Specifies what the agent does.';

                    trigger OnValidate()
                    begin
                        UpdateControls();
                    end;
                }
            }
            
            // Instructions card with visible caption
            group(InstructionsCard)
            {
                Caption = 'Instructions';
                InstructionalText = 'Describe what the agent should do.';

                field(Instructions; InstructionText)
                {
                    ApplicationArea = All;
                    Caption = 'Agent instructions';
                    MultiLine = true;
                    ToolTip = 'Specifies the instructions for the agent.';

                    trigger OnValidate()
                    begin
                        UpdateControls();
                    end;
                }
            }
            
            // Profile card with assist-edit
            group(ProfileCard)
            {
                Caption = 'Profile';
                InstructionalText = 'Select the profile that determines what the agent can see.';

                field(Profile; ProfileName)
                {
                    ApplicationArea = All;
                    Caption = 'Profile';
                    ToolTip = 'Specifies the profile for the agent.';
                    Editable = false;

                    trigger OnAssistEdit()
                    var
                        AllProfile: Record "All Profile";
                    begin
                        if Page.RunModal(Page::"Available Profiles", AllProfile) = Action::LookupOK then begin
                            ProfileName := AllProfile."Profile ID";
                            UpdateControls();
                        end;
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
                Caption = 'Create';
                ToolTip = 'Create the agent with the specified settings.';
                Enabled = IsValid;
            }
            systemaction(Cancel)
            {
                Caption = 'Cancel';
                ToolTip = 'Cancel and close the dialog.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        if Rec.IsEmpty() then begin
            Rec.Init();
            Rec.Insert();
        end;
        UpdateControls();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction = CloseAction::Cancel then
            exit(true);

        // Validate required fields
        if Rec."Display Name" = '' then
            Error('You must specify an agent name.');
            
        if InstructionText = '' then
            Error('You must provide instructions.');
            
        if ProfileName = '' then
            Error('You must select a profile.');

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
}
```

### Understanding the example

This example demonstrates the essential patterns of `ConfigurationDialog`:

#### StartCard pattern

```al
group(StartCard)
{
    ShowCaption = false;
    // Fields without a visible group caption
}
```

The `StartCard` group has `ShowCaption = false`, creating a clean entry point with just the fields visible.

#### Card structure

Each subsequent `group` creates a separate card section:

- **InstructionsCard** - Shows caption "Instructions" with guidance
- **ProfileCard** - Shows caption "Profile" with assist-edit field

#### Temporary table

```al
SourceTable = "Agent Setup Buffer";
SourceTableTemporary = true;
```

Settings are collected in a temporary table before being applied in `OnQueryClosePage`.

#### Validation flow

- **Field validation** - `OnValidate` triggers update the `IsValid` state
- **Page validation** - `OnQueryClosePage` performs final validation before applying changes
- **System action enablement** - OK button is enabled only when `IsValid = true`

#### System actions

```al
systemaction(OK)
{
    Caption = 'Create';
    Enabled = IsValid;
}
```

The **OK** button is customized with a meaningful caption and conditional enablement.

## Key features and best practices

### Temporary tables

Using `SourceTableTemporary = true` is mandatory with `ConfigurationDialog` pages and allows you to:

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

[Agent playground (preview)](../ai/ai-agent-playground.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  
[PageType property](properties/devenv-pagetype-property.md)  
[SourceTable property](properties/devenv-sourcetable-property.md)  
[SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)  
[Extensible property](properties/devenv-extensible-property.md)  
[InstructionalText property](properties/devenv-instructionaltext-property.md)
