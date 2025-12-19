---
title: The ConfigurationDialog Page Type (preview)
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

# The ConfigurationDialog page type (preview)

[This article is prerelease documentation and is subject to change.]

[!INCLUDE [ai-playground-preview](../includes/ai-playground-preview.md)]

The `ConfigurationDialog` page type is a specialized page type that enables developers to create focused configuration dialogs for setting up and managing application settings, preferences, and configurations for agents. This page type provides a streamlined user experience with a modal dialog interface, system actions for saving or canceling changes, and support for temporary data sources.

> [!IMPORTANT]
> The `ConfigurationDialog` page type is intended specifically for agent development scenarios. Use this page type when building configuration interfaces for agents and AI-powered capabilities in [!INCLUDE [prod_short](includes/prod_short.md)]. Learn more about the agent playground capabilities in [Agent playground (preview)](../ai/ai-agent-playground.md).


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

The `ConfigurationDialog` page type does not have a dedicated start card area. Instead, you can use `group` inside the `Content` area to create sections that guide users through the configuration process and omit the caption for the group to create a clean look, as shown in the following example.

```al
group(FieldName; BooleanSource)
{
    ApplicationArea = All;
    ShowCaption = false;

    trigger OnValidate();
    begin
    end;
}
```

The example in the **Example** section demonstrates how to create a configuration dialog using groups and fields effectively.

## Actions in the ConfigurationDialog page

The `ConfigurationDialog` page type primarily uses system actions to provide a consistent user experience.

### System actions

System actions in a `ConfigurationDialog` provide the primary interaction points:

- **OK** - Saves the configuration and closes the dialog
- **Cancel** - Discards changes and closes the dialog

These actions can have their captions and tooltips customized to match the specific configuration scenario.

## Example

The following example shows the `CustomAgentSetup` page that contains a configuration dialog for setting up an agent. It demonstrates how to use the `group(StartCard)` control with `ShowCaption = false` to create individual card sections within the dialog.

namespace System.Agents.Playground.CustomAgent;

using System.Agents;
using System.Agents.Playground;
using System.AI;
using System.Environment.Configuration;
using System.Reflection;
using System.Security.AccessControl;

page 4377 "Custom Agent Setup"
{
    PageType = ConfigurationDialog;
    Extensible = false;
    ApplicationArea = All;
    RefreshOnActivate = true;
    IsPreview = true;
    Caption = 'Configure agent';
    InstructionalText = 'Configure which instructions the agent follows, its permissions, and how it appears to users.';
    AdditionalSearchTerms = 'Playground agent, Custom Agent, Agent';
    SourceTable = "Custom Agent Setup";
    SourceTableTemporary = true;
    InherentEntitlements = X;
    HelpLink = 'https://go.microsoft.com/fwlink/?linkid=2344702';

    layout
    {
        area(Content)
        {
            part(AgentSetupPart; "Agent Setup Part")
            {
                ApplicationArea = All;
                Visible = AgentSetupPartVisible;
                UpdatePropagation = Both;
            }
            group(StartCard)
            {
                Visible = not AgentSetupPartVisible;

                group(Header)
                {
                    field(Badge; AgentSetupBuffer.Initials)
                    {
                        ShowCaption = false;
                        Editable = false;
                        ToolTip = 'The badge of the agent.';
                    }
                    field(Type; AgentSetupBuffer."Agent Metadata Provider")
                    {
                        ShowCaption = false;
                        Editable = false;
                        ToolTip = 'Specifies the type of the agent.';
                    }
                    field(Name; AgentSetupBuffer."Display Name")
                    {
                        ShowCaption = false;
                        Editable = false;
                        ToolTip = 'The name of the agent.';
                    }
                    field(State; AgentSetupBuffer.State)
                    {
                        Caption = 'Active';
                        ToolTip = 'Specifies the state of the agent, such as enabled or disabled.';

                        trigger OnValidate()
                        begin
                            AgentSetupBuffer."State Updated" := true;
                            AgentSetupBuffer.Modify();
                            IsUpdated := true;
                        end;
                    }
                    field(UserSettingsLink; ManageUserAccessLbl)
                    {
                        Caption = 'Coworkers can use this agent.';
                        ApplicationArea = All;
                        ToolTip = 'Specifies the user access control settings for the agent.';

                        trigger OnDrillDown()
                        var
                            AgentSetup: Codeunit "Agent Setup";
                        begin
                            if AgentSetup.UpdateUserAccessControl(AgentSetupBuffer) then
                                IsUpdated := true;
                        end;
                    }
                }

                field(Summary; SummaryTxt)
                {
                    Caption = 'Summary';
                    MultiLine = true;
                    Editable = false;
                    ToolTip = 'Specifies a brief description of the agent.';
                }
            }
            group(AgentDetails)
            {
                Caption = 'About the agent';
                field(AgentUserName; AgentName)
                {
                    Caption = 'Name';
                    ToolTip = 'Specifies the unique user name of the agent.';
                    Editable = IsFirstTimeSetup;

                    trigger OnValidate()
                    var
                        CustomAgentSetup: Codeunit "Custom Agent Setup";
                    begin
                        IsUpdated := true;

                        if AgentSetupBuffer."Display Name" = '' then
                            AgentSetupBuffer.Validate("Display Name", AgentName);

                        if Rec.Initials = '' then begin
                            Rec.Validate(Initials, CustomAgentSetup.GenerateInitialsFromName(AgentName));
                            Rec.Modify(true);
                            AgentSetupBuffer.Validate(Initials, Rec.Initials);
                            AgentSetupBuffer.Modify(true);
                        end;

                        // The User Name is a Code[50], but we want to preserve the casing for the display name.
                        AgentName := AgentName.ToUpper();
                        AgentSetupBuffer.Validate("User Name", AgentName);
                        AgentSetupBuffer.Modify(true);
                    end;
                }
                field(AgentDisplayName; AgentSetupBuffer."Display Name")
                {
                    Caption = 'Display name';
                    ToolTip = 'Specifies the display name of the agent.';

                    trigger OnValidate()
                    begin
                        AgentSetupBuffer.Validate("Display Name", AgentSetupBuffer."Display Name");
                        IsUpdated := true;
                    end;
                }
                field(InitialsText; Rec.Initials)
                {
                    Caption = 'Initials';
                    ToolTip = 'Specifies the initials of the agent.';

                    trigger OnValidate()
                    begin
                        AgentSetupBuffer.Validate(Initials, Rec.Initials);
                        AgentSetupBuffer.Modify(true);
                        IsUpdated := true;
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
                        SummaryTxt := GetSummaryText();
                    end;
                }
                group(InstructionGroup)
                {
                    Caption = 'Instructions for the agent';
                    InstructionalText = 'Use everyday words to describe what the agent should do.';

                    field(EditInstructions; EditInstructionsLbl)
                    {
                        Caption = 'Edit instructions';
                        ShowCaption = false;
                        ApplicationArea = All;
                        ToolTip = 'Specifies the instructions for the agent.';
                        Editable = false;

                        trigger OnDrillDown()
                        var
                            TempCustomAgentSetup: Record "Custom Agent Setup" temporary;
                            CustomAgentInstructionsDialog: Page "Custom Ag. Instructions Dialog";
                        begin
                            CustomAgentInstructionsDialog.SetReadOnlyMode(false);
                            CustomAgentInstructionsDialog.SetIsTemporary(true);
                            CustomAgentInstructionsDialog.SetUserSecurityId(Rec."User Security ID");
                            if (NewInstructionsTxt <> '') then
                                CustomAgentInstructionsDialog.SetInstructions(NewInstructionsTxt)
                            else begin
                                TempCustomAgentSetup."User Security ID" := Rec."User Security ID";
                                TempCustomAgentSetup.Insert();
                            end;

                            if CustomAgentInstructionsDialog.RunModal() = Action::OK then begin
                                IsUpdated := true;
                                NewInstructionsTxt := CustomAgentInstructionsDialog.GetInstructions();
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
                    InstructionalText = 'Choose the user profile that the agent uses when it completes tasks. The agent can only see the fields and actions that the profile makes visible.';

                    field(Profile; ProfileDisplayName)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Setup profile';
                        ToolTip = 'Specifies the profile that is associated with the agent.';
                        Editable = false;

                        trigger OnAssistEdit()
                        var
                            Agent: Codeunit Agent;
                            UserSettings: Codeunit "User Settings";
                        begin
                            TempUserSettingsRecord."User Security ID" := AgentSetupBuffer."User Security ID";
                            if Agent.ProfileLookup(TempUserSettingsRecord) then begin
                                ProfileDisplayName := UserSettings.GetProfileName(TempUserSettingsRecord);
                                IsUpdated := true;
                            end;
                        end;
                    }
                }
                group(PermissionsGroup)
                {
                    Caption = 'Permissions';
                    InstructionalText = 'Define access rights to control what the agent can work with.';

                    field(Permissions; ManagePermissionsLbl)
                    {
                        Caption = 'Manage permissions';
                        ShowCaption = false;
                        ApplicationArea = All;
                        ToolTip = 'Defines the permissions for the agent.';
                        Editable = false;

                        trigger OnDrillDown()
                        begin
                            if Page.RunModal(Page::"Custom Ag. Select Acc Control", TempAccessControlBuffer) = Action::LookupOK then
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

    local procedure GetIsUpdated()
    var
        AgentSetup: Codeunit "Agent Setup";
    begin
        if not AgentSetupPartVisible then
            exit;

        IsUpdated := IsUpdated or AgentSetup.GetChangesMade(AgentSetupBuffer);
    end;

    trigger OnOpenPage()
    var
        AgentPlaygroundPermissions: Codeunit "Agent Playground Permissions";
        UserIdFilter: Text;
    begin
        AgentPlaygroundPermissions.VerifyCurrentUserCanCreateCustomAgent();
        if not AzureOpenAI.IsEnabled(Enum::"Copilot Capability"::"Custom Agent") then
            Error(CustomAgentIsNotEnabledInCopilotCapabilitiesErr);

        UserIdFilter := Rec.GetFilter("User Security ID");
        if not Evaluate(Rec."User Security ID", UserIdFilter) then
            Clear(Rec."User Security ID");

        if not IsNullGuid(Rec."User Security ID") then
            CurrPage.Caption(ConfigureAgentCaptionLbl)
        else
            CurrPage.Caption(CreateAgentCaptionLbl);

        IsUpdated := false;
        UpdateControls();
    end;

    trigger OnAfterGetRecord()
    begin
        UpdateControls();
    end;

    trigger OnAfterGetCurrRecord()
    begin
        GetIsUpdated();
    end;

    trigger OnModifyRecord(): Boolean
    begin
        IsUpdated := true;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
        CustomAgentSetup: Codeunit "Custom Agent Setup";
    begin
        if CloseAction = CloseAction::Cancel then
            exit(true);

        if AgentName = '' then
            Error(AgentMustHaveNameErr);

        GetIsUpdated();
        IsAgentConfiguredCheck();
        IsAgentEnabledCheck();

        CustomAgentSetup.UpdateAgent(AgentSetupBuffer, TempAccessControlBuffer);
        Rec."User Security ID" := AgentSetupBuffer."User Security ID";
        ApplyCustomAgentSetupValues();
        ApplyUserSettingsValues();

        exit(true);
    end;

    local procedure ApplyCustomAgentSetupValues()
    var
        NewCustomAgentSetupRecord: Record "Custom Agent Setup";
    begin
        if not NewCustomAgentSetupRecord.Get(Rec."User Security ID") then begin
            NewCustomAgentSetupRecord."User Security ID" := Rec."User Security ID";
            NewCustomAgentSetupRecord.Insert(true);
        end;

        NewCustomAgentSetupRecord.Initials := Rec.Initials;
        NewCustomAgentSetupRecord.Description := Rec.Description;
        NewCustomAgentSetupRecord."User Security ID" := Rec."User Security ID";
        NewCustomAgentSetupRecord.Modify(true);
        if NewInstructionsTxt <> '' then
            NewCustomAgentSetupRecord.SetInstructions(NewInstructionsTxt);
    end;

    local procedure ApplyUserSettingsValues()
    var
        Agent: Codeunit "Agent";
    begin
        if TempUserSettingsRecord."Profile ID" <> '' then
            Agent.SetProfile(AgentSetupBuffer."User Security ID", TempUserSettingsRecord."Profile ID", TempUserSettingsRecord."App ID");
    end;

    local procedure GetSummaryText(): Text
    begin
        exit(StrSubstNo(AgentSummaryWithAIWarningLbl, Rec.Description));
    end;

    local procedure UpdateControls()
    var
        CustomAgentSetup: Codeunit "Custom Agent Setup";
        AgentSetup: Codeunit "Agent Setup";
        UserSettings: Codeunit "User Settings";
    begin
        IsFirstTimeSetup := IsNullGuid(Rec."User Security ID");

        if Rec.IsEmpty() then begin
            if not IsFirstTimeSetup then begin
                CustomAgentSetupRecord.Get(Rec."User Security ID");
                Rec.TransferFields(CustomAgentSetupRecord, true);
            end;
            Rec.Insert();

            AgentSetup.GetSetupRecord(AgentSetupBuffer, Rec."User Security ID", Enum::"Agent Metadata Provider"::"Custom Agent", '', '', SummaryTxt);
            AgentName := AgentSetupBuffer."User Name";

            if IsNullGuid(Rec."User Security ID") then
                Rec.Initials := '';
        end;

        SummaryTxt := GetSummaryText();

        if AgentSetupPartVisible then begin
            CurrPage.AgentSetupPart.Page.Initialize(Rec."User Security ID", Enum::"Agent Metadata Provider"::"Custom Agent", '', '', SummaryTxt);
            CurrPage.AgentSetupPart.Page.GetAgentSetupBuffer(AgentSetupBuffer);
        end;

        if TempAccessControlBuffer.IsEmpty() then
            CustomAgentSetup.GetAccessControl(Rec."User Security ID", TempAccessControlBuffer);

        AgentType := CustomAgentSetup.GetAgentType();

        if (TempUserSettingsRecord."Profile ID" = '') and (not IsNullGuid(AgentSetupBuffer."User Security ID")) then begin
            UserSettings.GetUserSettings(AgentSetupBuffer."User Security ID", TempUserSettingsRecord);
            ProfileDisplayName := UserSettings.GetProfileName(TempUserSettingsRecord);
        end;
    end;

    local procedure IsAgentConfiguredCheck()
    var
        TempAllProfile: Record "All Profile" temporary;
        CustomAgentSetup: Codeunit "Custom Agent Setup";
        InstructionsTxt: Text;
    begin
        if (NewInstructionsTxt = '') then
            if (not CustomAgentSetupRecord.TryGetInstructions(Rec."User Security ID", InstructionsTxt)) or (InstructionsTxt = '') then
                Error(AgentMustHaveInstructionsErr);

        if (TempAccessControlBuffer.IsEmpty()) then
            Error(PermissionSetMustBeSetErr);

        if ProfileDisplayName = '' then
            Error(ProfileMustBeSetErr);

        CustomAgentSetup.GetDefaultProfile(TempAllProfile);
        if ProfileDisplayName = TempAllProfile."Profile ID" then
            Error(ProfileMustBeSetErr);
    end;

    local procedure IsAgentEnabledCheck()
    var
        ReadyToActivateLbl: Label 'Ready to activate the agent?';
    begin
        if (AgentSetupBuffer.State = AgentSetupBuffer.State::Disabled)
                and IsNullGuid(Rec."User Security ID") then // Only show the confirmation dialog for the first time
            if Confirm(ReadyToActivateLbl) then
                AgentSetupBuffer.State := AgentSetupBuffer.State::Enabled;
    end;

    var
        CustomAgentSetupRecord: Record "Custom Agent Setup";
        AgentSetupBuffer: Record "Agent Setup Buffer";
        TempAccessControlBuffer: Record "Access Control Buffer" temporary;
        TempUserSettingsRecord: Record "User Settings" temporary;
        AzureOpenAI: Codeunit "Azure OpenAI";
        AgentSetupPartVisible: Boolean;
        AgentType: Text;
        AgentName: Text[50];
        ProfileDisplayName: Text;
        IsUpdated: Boolean;
        IsFirstTimeSetup: Boolean;
        CustomAgentIsNotEnabledInCopilotCapabilitiesErr: Label 'The custom agent capability is not enabled in Copilot capabilities.\\Please enable the capability before setting up the agent.';
        AgentMustHaveInstructionsErr: Label 'The agent must have instructions assigned.';
        ProfileMustBeSetErr: Label 'The agent must have a profile assigned which is not the default profile.';
        PermissionSetMustBeSetErr: Label 'The agent must have a permission set assigned.';
        ManageUserAccessLbl: Label 'Manage user access';
        ManagePermissionsLbl: Label 'Manage permissions';
        EditInstructionsLbl: Label 'Edit instructions';
        CreateAgentCaptionLbl: Label 'Create agent';
        ConfigureAgentCaptionLbl: Label 'Configure agent';
        AgentSummaryWithAIWarningLbl: Label '%1 This agent uses AI - review its actions for accuracy.', Comment = '%1 = User-entered description of the agent';
        AgentMustHaveNameErr: Label 'The agent must have a name.';
        NewInstructionsTxt: Text;
        SummaryTxt: Text;
}


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

[Agent playground (preview)](../ai/ai-agent-playground.md)  
[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  
[PageType property](properties/devenv-pagetype-property.md)  
[SourceTable property](properties/devenv-sourcetable-property.md)  
[SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md)  
[Extensible property](properties/devenv-extensible-property.md)  
[InstructionalText property](properties/devenv-instructionaltext-property.md)
