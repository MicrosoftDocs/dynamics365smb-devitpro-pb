---
title: Designing Assisted Setup Guides
description: Learn how to build and register assisted setup guides in Business Central with NavigatePage steps, footer actions, and temporary source records.
ms.custom: bap-template
ms.date: 10/14/2025
ms.topic: how-to
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer

---
# Designing assisted setup guides

In [!INCLUDE[prod_short](includes/prod_short.md)], use the `NavigatePage` page type to create an assisted setup guide. An assisted setup, also called a wizard, is a page with one or more user input steps. Link these steps to help users complete configuration or infrequent business tasks. In the client, the `NavigatePage` page doesn't have an action bar. Buttons at the bottom let users move through the steps with **Back** and **Next**, then complete the guide with **Finish**.

:::image type="content" source="media/to-do-assisted-setup-1.png" alt-text="Screenshot of the welcome step in the sample to-do assisted setup guide.":::

An example in [!INCLUDE[prod_short](includes/prod_short.md)] is the **Company Setup** assisted setup, page 1803.

## Build the assisted setup

This section describes the structure and basic tasks for creating an assisted setup guide. Use the AL snippets to build steps that look and feel like the guides provided by Microsoft. Learn more about the code and logic in the [full example](#example). The snippets illustrate the page structure; your implementation must also handle validation and data persistence.

1. Create a page for the assisted setup, for example:

    ```al
    page 50100 ToDoAssistedSetup
    {
        PageType = NavigatePage;
        SourceTable = "To-do";
        SourceTableTemporary = true;
        Caption = 'Add a To-Do for the Team';
    }
    ```

    Set the following properties:

    |Property|Description and value|
    |-|-|
    |[PageType property](properties/devenv-pagetype-property.md)|Set to `NavigatePage`.|
    |[SourceTable](properties/devenv-sourcetable-property.md)|Set to the name of the table that stores the data for the assisted setup.|
    |[SourceTableTemporary](properties/devenv-sourcetabletemporary-property.md)|Set to `true` to collect the page's source-record changes in temporary records. Explicitly transfer the data to persistent tables when the user finishes. This setting doesn't prevent database writes made by other page logic.|
    |[Caption](properties/devenv-caption-property.md)|Set to the title that you want to show on the top of each step of the assisted guide.|

1. Add the steps that comprise the assisted setup.

   For each step, add a `group()` control directly inside `area(Content)` in the `layout` section. Define a Boolean visibility variable for each step and an option variable that tracks the active step. Set the visibility variables in AL code so that only the active step appears. For example, the following code defines three steps.

    ```al
    layout
    {
        area(Content)
        {
            group(Step1)
            {
                Caption = '';
                InstructionalText = '';
                Visible = Step1Visible;

            }
            group(Step2)
            {
                Caption = '';
                InstructionalText = '';
                Visible = Step2Visible;

                field(Field2; "Field2")
                {
                    ApplicationArea = All;
                    InstructionalText = '';
                    Caption = '';
                }
            }
            group(Step3)
            {
                Caption = '';
                InstructionalText = '';
                Visible = Step3Visible;
            }
        }
    }

    var
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        Step: Option Start,Fill,Finish;

    local procedure EnableControls()
    begin
        ResetControls();
        case Step of
            Step::Start:
                ShowStep1();
            Step::Fill:
                ShowStep2();
            Step::Finish:
                ShowStep3();
        end;
    end;
    ```

1. Add the navigation buttons.

    Add **Back**, **Next**, and **Finish** buttons by using `action()` controls. Set [InFooterBar](properties/devenv-infooterbar-property.md) to `true`. Bind each action's [Enabled](properties/devenv-enabled-property.md) property to a Boolean variable and update the variables for the active step. Set [Image](properties/devenv-image-property.md) to `PreviousRecord`, `NextRecord`, and `Approve` for **Back**, **Next**, and **Finish**, respectively.

    ```al
    actions
    {
        area(Processing)
        {
            action(Back)
            {
                Enabled = BackEnable;
                InFooterBar = true;
                Image = PreviousRecord;

                trigger OnAction()
                begin
                    NextStep(true);
                end;
            }
            action(Next)
            {
                Enabled = NextEnable;
                InFooterBar = true;
                Image = NextRecord;

                trigger OnAction()
                begin
                    NextStep(false);
                end;
            }
            action(Finish)
            {
                Enabled = FinishEnable;
                InFooterBar = true;
                Image = Approve;

                trigger OnAction()
                begin
                    Finished();
                end;
            }
        }
    }

    var
        BackEnable: Boolean;
        NextEnable: Boolean;
        FinishEnable: Boolean;

    local procedure NextStep(Backwards: Boolean)
    begin
        if Backwards then
            Step := Step - 1
        else
            Step := Step + 1;
        EnableControls();
    end;

    local procedure Finished()
    begin
        StoreRecordVar();
        CurrPage.Close();
    end;

    ```

1. Transfer data from the temporary table to the database table. For example:

   ```al
    var
        ToDoRec: Record "To-do";

    local procedure StoreRecordVar()
    begin
        Clear(ToDoRec);
        ToDoRec.TransferFields(Rec, true);
        ToDoRec."No." := '';
        ToDoRec.Insert(true);
    end;
   ```

   Call `StoreRecordVar` from the `Finished` procedure used on the actions.

> [!NOTE]
> `Insert(true)` runs the table's insertion trigger to assign a task number. Configure **To-do Nos.** in **Marketing Setup** before using this pattern.

> [!IMPORTANT]
> The transfer snippet saves only the parent task record. It doesn't save the temporary attendees selected in the subpage or implement task assignment and meeting validation. Before using the example in an extension, complete those steps by following the task-creation flow in the base application's **Create Task** page and `To-do` table.

### Step layout and navigation behavior

The individual `group()` controls define the content for each step, such as text and data entry fields. Use the [Caption](properties/devenv-caption-property.md) and [InstructionalText](properties/devenv-instructionaltext-property.md) properties to add text. Use `field()` controls for source table fields. Nested groups can help arrange fields and add captions and instructional text within a step.

The order of the groups doesn't determine the step sequence. Your AL logic controls which group is visible. Apply a global Boolean variable or a step number condition to each group's [Visible](properties/devenv-visible-property.md) property. The example uses `Step1Visible`, `Step2Visible`, and `Step3Visible`, and a global option variable with one value for each step to track the active step.

In the desktop web client, navigation buttons typically appear at the bottom-right. Their presentation adapts on mobile devices. An action is added to the footer only when `InFooterBar` is `true`. Use the Boolean variables to disable **Back** on the first step and **Next** on the last step. The recommended `Image` values let the client recognize the navigation actions and apply the standard presentation.

> [!NOTE]
> Read-only multiline fields without captions inherit the step's background. Use them for instructional text with line breaks.

## Add standard banners

Assisted setup guides in the base application, and in this article, can include two banners under the step caption: a gear and a check mark. These banners use the following image files in the `Media Repository` table:

- `AssistedSetup-NoText-400px.png` for the gear.
- `AssistedSetupDone-NoText-400px.png` for the check mark.

You can reuse these images in your custom assisted setup guides to provide a consistent look.

To display the banners, add two root-level `group()` controls to the `area(Content)` control, as you did for the steps. Use `field()` controls to display the gear and check mark images. The following snippet illustrates one way to add the banners:

```AL
...
    layout
    {
        area(Content)
        {
            ...  
            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and not FinishActionEnabled;
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and FinishActionEnabled;
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
        }
    }
...
var
    ...
    MediaRepositoryDone: Record "Media Repository";
    MediaRepositoryStandard: Record "Media Repository";
    MediaResourcesDone: Record "Media Resources";
    MediaResourcesStandard: Record "Media Resources";

trigger OnInit();
begin
    ...    
    LoadTopBanners();
end;

local procedure LoadTopBanners()
begin
    if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(CurrentClientType())) and
        MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png', Format(CurrentClientType()))
    then
        if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
            MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref")
    then
            TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();
end;
```

## Add to the Assisted Setup page

Page 1801 **Assisted Setup** in the System Application gives users quick access to registered assisted setup guides. This section explains how to add your guide to the page.

The System Application includes the objects that control which items appear on the **Assisted Setup** page. Table 1990 `Guided Experience Item` is an internal table that stores the registered items. Use codeunit 1990 `Guided Experience` to register your guide and run it from the **Assisted Setup** page. Subscribe to its `OnRegisterAssistedSetup` event and register your guide through the codeunit. The **Assisted Setup** page displays the registered items.

```al
[IntegrationEvent(false, false)]
internal procedure OnRegisterAssistedSetup()
begin
end;
```

To add a guide to the **Assisted Setup** page, subscribe to `OnRegisterAssistedSetup` in a codeunit. The following example registers `ToDoAssistedSetup` in a new **Tasks** category. Call `InsertAssistedSetup` on each registration event so that the framework can refresh the registration and its translations.

```al
codeunit 50100 "AddToDoAssistedSetup"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', true, true)]
    local procedure OnRegisterAssistedSetup()
    var
        AssistedSetup: Codeunit "Guided Experience";
        AssistedSetupGroup: Enum "Assisted Setup Group";
        VideoCategory: Enum "Video Category";
    begin
        AssistedSetup.InsertAssistedSetup(
            // Link text for the assisted setup guide
            'Add a to-do',
            // Short description, not shown on the page
            'Create a task for your team',
            // Text shown in the Description column
            'Demonstrate task-entry steps and save a parent task record',
            1,
            ObjectType::Page,
            Page::ToDoAssistedSetup,
            // Assign the guide to the Tasks category
            AssistedSetupGroup::Tasks,
            // Video URL isn't required
            '',
            VideoCategory::Uncategorized,
            // Help URL isn't required
            '');
    end;
}


enumextension 50100 MyEnumExtension extends "Assisted Setup Group"
{
    value(100; Tasks)
    {
        Caption = 'Tasks';
    }
}
```

## Example

This example shows the layout and navigation for a three-step `NavigatePage` guide, as illustrated in the following figures. It uses the `To-do` table for task data. The second step includes the base application's **Attendee Wizard Subform** page for attendee selection. The example saves only the parent task record; implement assignment, validation, and attendee persistence before using it as a complete task-creation guide.

|Step 1|Step 2|Step 3|
|-|-|-
|:::image type="content" source="media/to-do-assisted-setup-1.png" alt-text="Screenshot of step one with welcome text and the Next button enabled." lightbox="media/to-do-assisted-setup-1.png":::|:::image type="content" source="media/to-do-assisted-setup-2.png" alt-text="Screenshot of step two with attendee selection and fields for task details." lightbox="media/to-do-assisted-setup-2.png":::|:::image type="content" source="media/to-do-assisted-setup-3.png" alt-text="Screenshot of step three with a completion banner and the Finish button enabled." lightbox="media/to-do-assisted-setup-3.png":::|

### Page and registration code

```al
page 50111 ToDoAssistedSetup
{
    PageType = NavigatePage;
    SourceTable = "To-do";
    SourceTableTemporary = true;
    Caption = 'Add a To-Do for the Team';

    layout
    {
        area(Content)
        {
            group(Step1)
            {
                Visible = Step1Visible;

                group("Welcome")
                {
                    Caption = 'Welcome to the to-do assisted setup';
                    group(group11)
                    {
                        Caption = '';
                        InstructionalText = 'Use this guide to register a to-do task for you and your team.';
                    }
                }
                group("Let's go")
                {
                    Caption = 'Let''s go';
                    group(group12)
                    {
                        Caption = '';
                        InstructionalText = 'Select Next to get started.';
                    }
                }
            }
            group(Step2)
            {
                Caption = 'Enter information about the to-do task';
                Visible = Step2Visible;

                group("11")
                {
                    Caption = 'Add attendees and fill in details';
                    part(AttendeeSubForm; "Attendee Wizard Subform")
                    {
                        ApplicationArea = All;
                    }
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    Caption = 'What type is the to-do?';

                }
                field("Date"; Rec."Date")
                {
                    ApplicationArea = All;
                    Caption = 'What''s the start date?';

                }
                field("Description"; Rec.Description)
                {
                    ApplicationArea = All;
                    InstructionalText = 'Example of a description';
                    Caption = 'Describe your to-do';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = All;
                    Caption = 'What''s the start time?';
                }
                field("Duration"; Rec."Duration")
                {
                    ApplicationArea = All;
                    Caption = 'How long does it last?';

                }
                field("Team To-do"; Rec."Team to-do")
                {
                    ApplicationArea = All;
                    Caption = 'Team to-do';

                }
                field("All Day Event"; Rec."All Day Event")
                {
                    ApplicationArea = All;
                    Caption = 'All Day Event';

                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    Caption = 'What''s the end date?';
                }
                field("Ending Time"; Rec."Ending Time")
                {
                    ApplicationArea = All;
                    Caption = 'What''s the end time?';
                }
            }
            group(Step3)
            {
                Caption = 'That''s it!';
                InstructionalText = 'Select Finish to save the to-do.';
                Visible = Step3Visible;

            }
            group(StandardBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and not FinishActionEnabled;
                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
            group(FinishedBanner)
            {
                Caption = '';
                Editable = false;
                Visible = TopBannerVisible and FinishActionEnabled;
                field(MediaResourcesDone; MediaResourcesDone."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Back)
            {
                ApplicationArea = All;
                Caption = '&Back';
                Enabled = BackEnable;
                InFooterBar = true;
                Image = PreviousRecord;

                trigger OnAction()
                begin
                    NextStep(true);
                end;
            }
            action(Next)
            {
                ApplicationArea = All;
                Caption = '&Next';
                Enabled = NextEnable;
                InFooterBar = true;
                Image = NextRecord;

                trigger OnAction()
                begin
                    NextStep(false);
                end;
            }
            action(Finish)
            {
                ApplicationArea = All;
                Caption = '&Finish';
                Enabled = FinishEnable;
                InFooterBar = true;
                Image = Approve;

                trigger OnAction()
                begin
                    Finished();
                end;
            }
        }
    }


    trigger OnInit()
    begin
        EnableControls();
        LoadTopBanners();
    end;

    trigger OnOpenPage()
    begin
        Clear(Rec);
        Rec.Init();
        Rec.Insert(false);
        CurrPage.Update(false);
    end;

    var
        BackEnable: Boolean;
        NextEnable: Boolean;
        FinishEnable: Boolean;
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        Step: Option Start,Fill,Finish;
        ToDoRec: Record "To-do";
        TopBannerVisible: Boolean;
        FinishActionEnabled: Boolean;
        MediaRepositoryDone: Record "Media Repository";
        MediaRepositoryStandard: Record "Media Repository";
        MediaResourcesDone: Record "Media Resources";
        MediaResourcesStandard: Record "Media Resources";

    local procedure NextStep(Backwards: Boolean)
    begin
        if Backwards then
            Step := Step - 1
        else
            Step := Step + 1;

        EnableControls();
    end;

    local procedure Finished()
    begin
        StoreRecordVar();
        CurrPage.Close();
    end;

    local procedure EnableControls()
    begin
        ResetControls();
        case Step of
            Step::Start:
                ShowStep1();
            Step::Fill:
                ShowStep2();
            Step::Finish:
                ShowStep3();
        end;
    end;

    local procedure ShowStep1()
    begin
        Step1Visible := true;
        BackEnable := false;
        NextEnable := true;
        FinishEnable := false;
    end;

    local procedure ShowStep2()
    begin
        Step2Visible := true;
        BackEnable := true;
        NextEnable := true;
        FinishEnable := false;
    end;

    local procedure ShowStep3()
    begin
        Step3Visible := true;
        BackEnable := true;
        NextEnable := false;
        FinishEnable := true;
        FinishActionEnabled := true
    end;

    local procedure ResetControls()
    begin
        FinishActionEnabled := false;
        FinishEnable := false;
        BackEnable := true;
        NextEnable := true;
        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;

    end;

    local procedure StoreRecordVar()
    begin
        Clear(ToDoRec);
        ToDoRec.TransferFields(Rec, true);
        ToDoRec."No." := '';
        ToDoRec.Insert(true);
    end;

    local procedure LoadTopBanners()
    begin
        if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(CurrentClientType())) and
            MediaRepositoryDone.Get('AssistedSetupDone-NoText-400px.png', Format(CurrentClientType()))
        then
            if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") and
                MediaResourcesDone.Get(MediaRepositoryDone."Media Resources Ref")
        then
                TopBannerVisible := MediaResourcesDone."Media Reference".HasValue();

    end;
}
codeunit 50100 "AddToDoAssistedSetup"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', true, true)]
    local procedure OnRegisterAssistedSetup()
    var
        AssistedSetup: Codeunit "Guided Experience";
        AssistedSetupGroup: Enum "Assisted Setup Group";
        VideoCategory: Enum "Video Category";
    begin
        AssistedSetup.InsertAssistedSetup(
            'Add a to-do',
            'Create a task for your team',
            'Demonstrate task-entry steps and save a parent task record',
            1,
            ObjectType::Page,
            Page::ToDoAssistedSetup,
            AssistedSetupGroup::Tasks,
            '',
            VideoCategory::Uncategorized,
            '');
    end;
}


enumextension 50100 MyEnumExtension extends "Assisted Setup Group"
{
    value(100; Tasks)
    {
        Caption = 'Tasks';
    }
}
```

## Related information

[Page types and layouts](devenv-page-types-and-layouts.md)  
[Page object](devenv-page-object.md)  
[Temporary tables](devenv-temporary-tables.md)  
[InFooterBar property](properties/devenv-infooterbar-property.md)  
