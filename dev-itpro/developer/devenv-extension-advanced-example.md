---
author: SusanneWindfeldPedersen
title: "Building an Advanced Sample Extension"
description: "Includes code for an advanced example extension using Business Central and AL in Visual Studio Code."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Building an Advanced Sample Extension
It is required to submit tests with your extension in order to pass validation. This walkthrough builds an advanced sample extension which is used as the foundation for writing a test which you can read about in the [Testing the Advanced Sample Extension](devenv-extension-advanced-example-test.md) topic. If you are new to building extensions, we suggest that you get familiar with [Building your first sample extension that uses new objects and extension objects](devenv-extension-example.md). 

For information about submitting your app to AppSource, see [Checklist for Submitting Your App](devenv-checklist-submission.md).

This walkthrough will guide you through all the steps that you must follow to create the sample extension in AL. The final result can be published, installed, and tested on your sandbox. After you have built your extension, you must write the test for it.

## About this walkthrough
This walkthrough illustrates the following tasks:

- Developing a sample extension that uses codeunits, tables, card pages, list pages, navigate page (Assisted Setup) actions, and events and it includes tooltips and links to context-sensitive Help.  

- Creating extension objects that can be used to modify page and table objects.  

- Initializing the database during the installation of the extension.  

- Developing a sample test that tests external calls to a service, events, permissions, actions, navigate page (Assisted Setup), and other modified pages.  

- Running the sample test using the Test Tool.  

## Prerequisites
To complete this walkthrough, you will need: 

- The [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] tenant

- Visual Studio Code

- The [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] for Visual Studio Code

For more information on how to get started with your first extension for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], see [Getting Started](devenv-get-started.md). It is recommended to try out simpler examples, before starting this walkthrough.

## Customer Rewards extension overview
This sample extension enables the ability to set up any number of reward levels and the minimum number of rewards points required to attain that level. When the sample extension is installed, customers begin to accrue one reward point per sales order. When no reward levels are set up, the customer's reward level is set to 'NONE' even though the customer may have reward points. To begin using the sample extension, the user must accept the extension terms and activate the extension by entering a valid activation code using the **Customer Rewards Assisted Setup Wizard**. Following all the steps of this walkthrough allows you to publish the extension on your tenant and create a possible new feature for your customers. 

## Developing the sample Customer Rewards extension
In the following section, you will be adding the objects that are needed for the Customer Rewards extension. 

### Customer Rewards table objects
First, we will get started with the table objects that store the data. 

#### Reward Level table object
The following code adds a new table 50100 **Reward Level** for storing reward level information set up by the user. The table consists of two fields: **Level** and **Minimum Reward Points**. 

```
table 50100 "Reward Level" 
{ 
    fields 
    { 
        field(1; Level; Text[20]) { } 

        field(2; "Minimum Reward Points"; Integer) 
        { 
            MinValue = 0; 
            NotBlank = true; 

            trigger OnValidate(); 
            var 
                tempPoints: Integer; 
                RewardLevel: Record "Reward Level"; 
            begin 
                tempPoints := "Minimum Reward Points"; 
                RewardLevel.SetRange("Minimum Reward Points", tempPoints); 
                if RewardLevel.FindFirst then 
                    Error('Minimum Reward Points must be unique'); 
            end; 
        } 
    } 

    keys 
    { 
        key(PK; Level) 
        { 
            Clustered = true; 
        } 
        key("Minimum Reward Points"; "Minimum Reward Points") { } 
    } 

    trigger OnInsert(); 
    begin 

        Validate("Minimum Reward Points"); 
    end; 

    trigger OnModify(); 
    begin 
        Validate("Minimum Reward Points"); 
    end; 
} 
```

#### Activation Code Information table object 
The following code adds a new table 50101 **Activation Code Information** for storing activation information for the extension. The table consists of three fields: **ActivationCode**, **Date Activated**, and **Expiration Date**. 

```
table 50101 "Activation Code Information" 
{ 
    fields 
    { 
        field(1; ActivationCode; Text[14]) 
        { 
            Description = 'Activation code used to activate Customer Rewards'; 
        } 

        field(2; "Date Activated"; Date) 
        { 
            Description = 'Date Customer Rewards was activated'; 
        } 

        field(3; "Expiration Date"; Date) 
        { 
            Description = 'Date Customer Rewards activation expires'; 
        } 
    } 

    keys 
    { 
        key(PK; ActivationCode) 
        { 
            Clustered = true; 
        } 
    } 
} 

``` 

#### Customer Rewards Mgt. Setup table object 
The following code adds a new table 50102 **Customer Rewards Mgt. Setup** for storing information about the codeunit that should be used to handle events in the extension. This enables us to mock events in our sample test. The table consists of two fields: **Primary Key** and **Customer Rewards Ext. Mgt. Codeunit ID**. 
```
table 50102 "Customer Rewards Mgt. Setup" 
{ 
    fields 
    { 
        field(1; "Primary Key"; Code[10]) 
        { 
        } 

        field(2; "Customer Rewards Ext. Mgt. Codeunit ID"; Integer) 
        { 
            TableRelation = "CodeUnit Metadata".ID; 
        } 
    } 

    keys 
    { 
        key(PK; "Primary Key") 
        { 
            Clustered = true; 
        } 
    } 
} 
```

### Customer Rewards table extension objects 

#### Customer table extension object 
The **Customer** table, like many other tables, is part of the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service and it cannot be modified directly by developers. To add additional fields or to change properties on this table, developers must create a new type of object; a table extension. The following code creates a table extension for the **Customer** table and adds the **RewardPoints** field. 

``` 
tableextension 50100 "CustomerTable Ext." extends Customer 
{ 
    fields 
    { 
        field(10001; RewardPoints; Integer) 
        { 
            MinValue = 0; 
        } 
    } 
} 
```

### Customer Rewards page objects

For each page object, you can specify the target Help page that describes the feature that the page object is part of. The `ContextSensitiveHelpPage` property on the page object works together with the link that is specified in the app.json file. For more information, see [Configure Context-Sensitive Help](../help/context-sensitive-help.md).  

#### Customer Rewards Wizard page object
The following code adds the 50100 **Customer Rewards Wizard** page that enables the user to accept the terms for using the extension as well as activating the extension. The page consists of a welcome step, an activation step, and a finish step. The welcome step has a checkbox for the Terms of Use that must be enabled. The activation step has a text box where the activation code must be entered for validation. A valid activation code for this sample extension is any 14 character alphanumeric code. 

```
page 50100 "Customer Rewards Wizard" 
{ 
    // Specifies that this page will be a navigate page. 
    PageType = NavigatePage; 
    Caption = 'Customer Rewards assisted setup guide'; 
    ContextSensitiveHelpPage = 'sales-rewards';

    layout
    {
        area(content)
        { 
            group(MediaStandard) 
            { 
                Caption = ''; 
                Editable = false; 
                Visible = TopBannerVisible; 

                field("MediaResourcesStandard.""Media Reference"""; MediaResourcesStandard."Media Reference") 
                { 
                    ApplicationArea = All; 
                    Editable = false; 
                    ShowCaption = false; 
                } 
            } 

            group(FirstPage) 
            { 
                Caption = ''; 
                Visible = FirstPageVisible; 

                group("Welcome") 
                { 
                    Caption = 'Welcome'; 
                    Visible = FirstPageVisible; 

                    group(Introduction) 
                    { 
                        Caption = ''; 
                        InstructionalText = 'This Customer Rewards extension is a sample extension. It adds rewards tiers support for Customers.'; 
                        Visible = FirstPageVisible; 

                        field(Spacer1; '') 
                        { 
                            ApplicationArea = All; 
                            ShowCaption = false; 
                            Editable = false; 
                            MultiLine = true; 
                        } 
                    } 

                    group("Terms") 
                    { 
                        Caption = 'Terms of Use'; 
                        Visible = FirstPageVisible; 

                        group(Terms1) 
                        { 
                            Caption = ''; 
                            InstructionalText = 'By enabling the Customer Rewards extension...'; 
                            Visible = FirstPageVisible; 
                        } 
                    } 

                    group(Terms2) 
                    { 
                        Caption = ''; 

                        field(EnableFeature; EnableCustomerRewards) 
                        { 
                            ApplicationArea = All; 
                            MultiLine = true; 
                            Editable = true; 
                            Caption = 'I understand and accept these terms.'; 

                            trigger OnValidate(); 
                            begin 
                                ShowFirstPage; 
                            end; 
                        } 
                    } 
                } 
            } 

            group(SecondPage) 
            { 
                Caption = ''; 
                Visible = SecondPageVisible; 

                group("Activation") 
                { 
                    Caption = 'Activation'; 
                    Visible = SecondPageVisible; 

                    field(Spacer2; '') 
                    { 
                        ApplicationArea = All; 
                        ShowCaption = false; 
                        Editable = false; 
                        MultiLine = true; 
                    } 

                    group(ActivationMessage) 
                    { 
                        Caption = ''; 
                        InstructionalText = 'Enter your 14 digit activation code to continue'; 
                        Visible = SecondPageVisible; 

                        field(Activationcode; ActivationCode) 
                        { 
                            ApplicationArea = All; 
                            ShowCaption = false; 
                            Editable = true; 
                        } 
                    } 
                } 
            } 

            group(FinalPage) 
            { 
                Caption = ''; 
                Visible = FinalPageVisible; 

                group("ActivationDone") 
                { 
                    Caption = 'You''re done!'; 
                    Visible = FinalPageVisible; 

                    group(DoneMessage) 
                    { 
                        Caption = ''; 
                        InstructionalText = 'Click Finish to setup your rewards level and start using Customer Rewards.'; 
                        Visible = FinalPageVisible; 
                    } 
                } 
            } 
        } 
    } 

    actions 
    { 
        area(Processing) 
        { 
            action(ActionBack) 
            { 
                ApplicationArea = All; 
                Caption = 'Back'; 
                Enabled = BackEnabled; 
                Visible = BackEnabled; 
                Image = PreviousRecord; 
                InFooterBar = true; 

                trigger OnAction(); 
                begin 
                    NextStep(true); 
                end; 
            } 

            action(ActionNext) 
            { 
                ApplicationArea = All; 
                Caption = 'Next'; 
                Enabled = NextEnabled; 
                Visible = NextEnabled; 
                Image = NextRecord; 
                InFooterBar = true; 

                trigger OnAction(); 
                begin 
                    NextStep(false); 
                end; 
            } 

            action(ActionActivate) 
            { 
                ApplicationArea = All; 
                Caption = 'Activate'; 
                Enabled = ActivateEnabled; 
                Visible = ActivateEnabled; 
                Image = NextRecord; 
                InFooterBar = true; 

                trigger OnAction(); 
                var 
                    CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
                begin 
                    if ActivationCode = '' then 
                        Error('Activation code cannot be blank.'); 

                    if Text.StrLen(ActivationCode) <> 14 then 
                        Error('Activation code must have 14 digits.'); 

                    if CustomerRewardsExtMgt.ActivateCustomerRewards(ActivationCode) then 
                        NextStep(false) 
                    else 
                        Error('Activation failed. Please check the activtion code you entered.'); 
                end; 
            } 

            action(ActionFinish) 
            { 
                ApplicationArea = All; 
                Caption = 'Finish'; 
                Enabled = FinalPageVisible; 
                Image = Approve; 
                InFooterBar = true; 

                trigger OnAction(); 
                begin 
                    FinishAndEnableCustomerRewards 
                end; 
            } 
        } 
    } 

    trigger OnInit(); 
    begin 
        LoadTopBanners; 
    end; 

    trigger OnOpenPage(); 
    begin 
        Step := Step::First; 
        EnableControls; 
    end; 

    local procedure EnableControls(); 
    begin 
        ResetControls; 

        case Step of 
        Step::First : 
          ShowFirstPage; 

        Step::Second : 
          ShowSecondPage; 

        Step::Finish : 
          ShowFinalPage; 
        end; 
    end; 

    local procedure NextStep(Backwards: Boolean); 
    begin 
        if Backwards then 
            Step := Step - 1 
        ELSE 
            Step := Step + 1; 
        EnableControls; 
    end; 

    local procedure FinishAndEnableCustomerRewards(); 
    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
    begin 
        CurrPage.Close; 
        CustomerRewardsExtMgt.OpenRewardsLevelPage; 
    end; 

    local procedure ShowFirstPage(); 
    begin 
        FirstPageVisible := true; 
        SecondPageVisible := false; 
        FinishEnabled := false; 
        BackEnabled := false; 
        ActivateEnabled := false; 
        NextEnabled := EnableCustomerRewards; 
    end; 

    local procedure ShowSecondPage(); 
    begin 
        FirstPageVisible := false; 
        SecondPageVisible := true; 
        FinishEnabled := false; 
        BackEnabled := true; 
        NextEnabled := false; 
        ActivateEnabled := true; 
    end; 

    local procedure ShowFinalPage(); 
    begin 
        FinalPageVisible := true; 
        BackEnabled := true; 
        NextEnabled := false; 
        ActivateEnabled := false; 
    end; 

    local procedure ResetControls(); 
    begin 
        FinishEnabled := true; 
        BackEnabled := true; 
        NextEnabled := true; 
        ActivateEnabled := true; 
        FirstPageVisible := false; 
        SecondPageVisible := false; 
        FinalPageVisible := false; 
    end; 

    local procedure LoadTopBanners(); 
    begin 
        if MediaRepositoryStandard.GET('AssistedSetup-NoText-400px.png', FORMAT(CURRENTCLIENTTYPE)) 
      then 
            if MediaResourcesStandard.GET(MediaRepositoryStandard."Media Resources Ref") 
        then 
                TopBannerVisible := MediaResourcesStandard."Media Reference".HASVALUE; 
    end; 

    var 
        MediaRepositoryStandard: Record 9400; 
        MediaResourcesStandard: Record 2000000182; 
        Step: Option First, Second, Finish; 
        ActivationCode: Text; 
        TopBannerVisible: Boolean; 
        FirstPageVisible: Boolean; 
        SecondPageVisible: Boolean; 
        FinalPageVisible: Boolean; 
        FinishEnabled: Boolean; 
        BackEnabled: Boolean; 
        NextEnabled: Boolean; 
        ActivateEnabled: Boolean; 
        EnableCustomerRewards: Boolean; 
} 

``` 

#### Rewards Level List page object

The following code adds the 50101 **Rewards Level List** page that enables the user to view, edit, or add new reward levels and their corresponding minimum required points. The code example includes tooltips for controls and a relative link to context-sensitive Help.  

```
page 50101 "Rewards Level List"
{ 
    PageType = List;
    ContextSensitiveHelpPage = 'sales-rewards';
    SourceTable = "Reward Level";
    SourceTableView = sorting ("Minimum Reward Points") order(ascending);

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Level; Level)
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the level of reward that the customer has at this point.';
                }

                field("Minimum Reward Points"; "Minimum Reward Points")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies the number of points that customers must have to reach this level.';
                }
            }
        }
    }

    trigger OnOpenPage(); 
    begin 

        if(not CustomerRewardsExtMgt.IsCustomerRewardsActivated) then 
            Error(NotActivatedTxt); 
    end; 

    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
        NotActivatedTxt: Label 'Customer Rewards is not activated'; 
} 
```

### Customer Rewards page extension objects 

#### Customer card page extension object 
A page extension object can be used to add new functionality to pages that are part of the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service. The following page extension object extends the **Customer Card** page object by adding two field controls: **RewardLevel** and **RewardPoints** after the **Name** field control on the page. The fields are added in the layout section. 

```
pageextension 50100 "Customer Card Ext." extends "Customer Card" 
{ 
    layout 
    { 
        addafter(Name) 
        { 
            field(RewardLevel; RewardLevel) 
            { 
                ApplicationArea = All; 
                Caption = 'Reward Level'; 
                Description = 'Reward level of the customer.'; 
                ToolTip = 'Specifies the level of reward that the customer has at this point.';
                Editable = false; 
            } 

            field(RewardPoints; RewardPoints) 
            { 
                ApplicationArea = All; 
                Caption = 'Reward Points'; 
                Description = 'Reward points accrued by customer'; 
                ToolTip = 'Specifies the total number of points that the customer has at this point.';
                Editable = false;
            }
        }
    }

    trigger OnAfterGetRecord(); 
    var 
        CustomerRewardsMgtExt: Codeunit "Customer Rewards Ext. Mgt."; 
    begin 
        // Get the reward level associated with reward points 
        RewardLevel := CustomerRewardsMgtExt.GetRewardLevel(RewardPoints); 
    end; 

    var 
        RewardLevel: Text; 
} 
```
 
#### Customer list page extension object 
A page extension object can be used to add new functionality to pages that are part of the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] service. The following page extension object extends the **Customer List** page object by adding one action control; **Reward Levels** to the **Customer** group on the page. 

```
pageextension 50101 "Customer List Ext." extends "Customer List" 
{ 
    actions 
    { 
        addfirst("&Customer") 
        { 
            action("Reward Levels") 
            { 
                ApplicationArea = All; 
                Image = CustomerRating; 
                Promoted = true; 
                PromotedCategory = Process; 
                PromotedIsBig = true;
                ToolTip = 'Open the list of reward levels.';


                trigger OnAction(); 
                begin 
                    if CustomerRewardsExtMgt.IsCustomerRewardsActivated then 
                        CustomerRewardsExtMgt.OpenRewardsLevelPage 
                    else 
                        CustomerRewardsExtMgt.OpenCustomerRewardsWizard; 
                end; 
            } 
        } 
    } 

    var 
        CustomerRewardsExtMgt: Codeunit "Customer Rewards Ext. Mgt."; 
} 
```
 
### Customer Rewards codeunit objects 

#### Customer Rewards Install Logic codeunit object 
The following code adds the 50100 **Customer Rewards Install Logic** codeunit that initializes the default codeunit that will be used for handling events. Because this is an install codeunit, it has its **Subtype** property set to **Install**. The **OnInstallAppPerCompany** trigger is run when the extension is installed for the first time and the same version is re-installed. 

```
codeunit 50100 "Customer Rewards Install Logic" 
{ 
    // Customer Rewards Install Logic 
    Subtype = Install; 

    trigger OnInstallAppPerCompany(); 
    begin 
        SetDefaultCustomerRewardsExtMgtCodeunit; 
    end; 

    procedure SetDefaultCustomerRewardsExtMgtCodeunit(); 
    var 
        CustomerRewardsExtMgtSetup: Record "Customer Rewards Mgt. Setup"; 
    begin 
        CustomerRewardsExtMgtSetup.DeleteAll; 
        CustomerRewardsExtMgtSetup.Init; 
        // Default Customer Rewards Ext. Mgt codeunit to use for handling events  
        CustomerRewardsExtMgtSetup."Customer Rewards Ext. Mgt. Codeunit ID" := Codeunit::"Customer Rewards Ext. Mgt."; 
        CustomerRewardsExtMgtSetup.Insert; 
    end; 
} 
```
 
#### Customer Rewards Ext. Mgt. codeunit object 
The 50101 **Customer Rewards Ext. Mgt.**  codeunit encapsulates most of the logic and functionality required for the Customer Rewards extension. This codeunit contains examples of how we can use events to react to specific actions or behavior that occur within our extension. In this sample extension, there is the need to make a call to an external service or API to validate activation codes entered by the user. Typically, you may do this by defining procedures that take in the activation code and then make calls to the API. Instead of using that approach, we use events in AL. Let us look at the following code from the codeunit. 
 
```
    // Activates Customer Rewards if activation code is validated successfully  
    procedure ActivateCustomerRewards(ActivationCode: Text): Boolean; 
    var 
        ActivationCodeInfo: Record "Activation Code Information"; 
    begin 
        // raise event 
        OnGetActivationCodeStatusFromServer(ActivationCode); 
        exit(ActivationCodeInfo.Get(ActivationCode)); 
    end; 

    // publishes event 
    [IntegrationEvent(false, false)] 
    procedure OnGetActivationCodeStatusFromServer(ActivationCode: Text); 
    begin 
    end; 

    // Subscribes to OnGetActivationCodeStatusFromServer event and handles it when the event is raised 
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Rewards Ext. Mgt.", 'OnGetActivationCodeStatusFromServer', '', false, false)] 
    local procedure OnGetActivationCodeStatusFromServerSubscriber(ActivationCode: Text); 
    var 
        ActivationCodeInfo: Record "Activation Code Information"; 
        ResponseText: Text; 
        Result: JsonToken; 
        JsonRepsonse: JsonToken; 

    begin 
        if not CanHandle then 
            exit; // use the mock 
        // Get response from external service and update activation code information if successful 
        if(GetHttpResponse(ActivationCode, ResponseText)) then begin 
            JsonRepsonse.ReadFrom(ResponseText); 

            if(JsonRepsonse.SelectToken('ActivationResponse', Result)) then begin 

                if(Result.AsValue().AsText() = 'Success') then begin 

                    if(ActivationCodeInfo.FindFirst()) then 
                        ActivationCodeInfo.Delete; 

                    ActivationCodeInfo.Init; 
                    ActivationCodeInfo.ActivationCode := ActivationCode; 
                    ActivationCodeInfo."Date Activated" := Today; 
                    ActivationCodeInfo."Expiration Date" := CALCDATE('<1Y>', Today); 
                    ActivationCodeInfo.Insert; 
                end; 
            end; 
        end; 
    end; 

    // Helper method to make calls to a service to validate activation code 
    local procedure GetHttpResponse(ActivationCode: Text; var ResponseText: Text): Boolean; 
    begin 
        // You will typically make external calls / http requests to your service to validate the activation code 
        // here but for the sample extension we simply return a successful dummy response 
        if ActivationCode = '' then 
            exit(false); 

        ResponseText := DummySuccessResponseTxt; 
        exit(true); 
    end; 
```
 
We define an event publisher method **OnGetActivationCodeStatusFromServer** that accepts the activation code entered by the user as a parameter, and, a subscriber method **OnGetActivationCodeStatusFromServerSubscriber** to listen for and handle the event. When the **ActivateCustomerRewards** procedure is run, the **OnGetActivationCodeStatusFromServer** event is raised. Because the **EventSubscriberInstance** property for the codeunit is set to **Static-Automatic** by default, the **OnGetActivationCodeStatusFromServerSubscriber** procedure is called. In this procedure, we handle the raised event by first checking if the current codeunit has been defined for handling this event. If the codeunit can handle the event, the **GetHttpResponse** helper procedure is called to validate the activation code. Depending on the response, Customer Rewards is activated or not. 

By using events when the extension makes external calls to a service, we are able to mock the behavior of what happens when events are raised. This becomes particularly useful when writing tests for the extension. 

For more information about events, see [Events in Microsoft [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]](devenv-events-in-al.md). 

Below is the full code for this codeunit. 

```
codeunit 50101 "Customer Rewards Ext. Mgt." 
{ 
    var 
        DummySuccessResponseTxt: Label '{"ActivationResponse": "Success"}', Locked = true; 
        NoRewardlevelTxt: Label 'NONE'; 

    // Determines if the extension is activated 
    procedure IsCustomerRewardsActivated(): Boolean; 
    var 
        ActivationCodeInfo: Record "Activation Code Information"; 
    begin 
        if not ActivationCodeInfo.FindFirst then 
            exit(false); 

        if(ActivationCodeInfo."Date Activated" <= Today) and(Today <= ActivationCodeInfo."Expiration Date") then 
            exit(true); 
        exit(false); 
    end; 

    // Opens the Customer Rewards Assisted Setup Guide 
    procedure OpenCustomerRewardsWizard(); 
    var 
        CustomerRewardsWizard: Page "Customer Rewards Wizard"; 
    begin 
        CustomerRewardsWizard.RunModal; 
    end; 

    // Opens the Reward Level page 
    procedure OpenRewardsLevelPage(); 
    var 
        RewardsLevelPage: Page "Rewards Level List"; 
    begin 
        RewardsLevelPage.Run; 
    end; 

    // Determines the correponding reward level and returns it 
    procedure GetRewardLevel(RewardPoints: Integer) RewardLevelTxt: Text; 
    var 
        RewardLevelRec: Record "Reward Level"; 
        MinRewardLevelPoints: Integer; 
    begin 
        RewardLevelTxt := NoRewardlevelTxt; 

        if RewardLevelRec.IsEmpty then 
            exit; 
        RewardLevelRec.SetRange("Minimum Reward Points", 0, RewardPoints); 
        RewardLevelRec.SetCurrentKey("Minimum Reward Points"); // sorted in ascending order 

        if not RewardLevelRec.FindFirst then 
            exit; 
        MinRewardLevelPoints := RewardLevelRec."Minimum Reward Points"; 

        if RewardPoints >= MinRewardLevelPoints then begin 
            RewardLevelRec.Reset; 
            RewardLevelRec.SetRange("Minimum Reward Points", MinRewardLevelPoints, RewardPoints); 
            RewardLevelRec.SetCurrentKey("Minimum Reward Points"); // sorted in ascending order 
            RewardLevelRec.FindLast; 
            RewardLevelTxt := RewardLevelRec.Level; 
        end; 
    end; 

    // Activates Customer Rewards if activation code is validated successfully  
    procedure ActivateCustomerRewards(ActivationCode: Text): Boolean; 
    var 
        ActivationCodeInfo: Record "Activation Code Information"; 
    begin 
        // raise event 
        OnGetActivationCodeStatusFromServer(ActivationCode); 
        exit(ActivationCodeInfo.Get(ActivationCode)); 
    end; 

    // publishes event 
    [IntegrationEvent(false, false)] 
    procedure OnGetActivationCodeStatusFromServer(ActivationCode: Text); 
    begin 
    end; 

    // Subscribes to OnGetActivationCodeStatusFromServer event and handles it when the event is raised 
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Customer Rewards Ext. Mgt.", 'OnGetActivationCodeStatusFromServer', '', false, false)] 
    local procedure OnGetActivationCodeStatusFromServerSubscriber(ActivationCode: Text); 
    var 
        ActivationCodeInfo: Record "Activation Code Information"; 
        ResponseText: Text; 
        Result: JsonToken; 
        JsonRepsonse: JsonToken; 
    begin 
        if not CanHandle then 
            exit; // use the mock 

        // Get response from external service and update activation code information if successful 
        if(GetHttpResponse(ActivationCode, ResponseText)) then begin 
            JsonRepsonse.ReadFrom(ResponseText); 

            if(JsonRepsonse.SelectToken('ActivationResponse', Result)) then begin 

                if(Result.AsValue().AsText() = 'Success') then begin 

                    if(ActivationCodeInfo.FindFirst()) then 
                        ActivationCodeInfo.Delete; 

                    ActivationCodeInfo.Init; 
                    ActivationCodeInfo.ActivationCode := ActivationCode; 
                    ActivationCodeInfo."Date Activated" := Today; 
                    ActivationCodeInfo."Expiration Date" := CALCDATE('<1Y>', Today); 
                    ActivationCodeInfo.Insert; 

                end; 
            end; 
        end; 
    end; 

    // Helper method to make calls to a service to validate activation code 
    local procedure GetHttpResponse(ActivationCode: Text; var ResponseText: Text): Boolean; 
    begin 
        // You will typically make external calls / http requests to your service to validate the activation code 
        // here but for the sample extension we simply return a successful dummy response 
        if ActivationCode = '' then 
            exit(false); 

        ResponseText := DummySuccessResponseTxt; 
        exit(true); 
    end; 

    // Subcribes to the OnAfterReleaseSalesDoc event and increases reward points for the sell to customer in posted sales order 
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnAfterReleaseSalesDoc', '', false, false)] 
    local procedure OnAfterReleaseSalesDocSubscriber(VAR SalesHeader: Record "Sales Header"; PreviewMode: Boolean; LinesWereModified: Boolean); 
    var 
        Customer: Record Customer; 
    begin 
        if SalesHeader.Status <> SalesHeader.Status::Released then 
            exit; 

        Customer.Get(SalesHeader."Sell-to Customer No."); 
        Customer.RewardPoints += 1; // Add a point for each new sales order 
        Customer.Modify; 
    end; 

    // Checks if the current codeunit is allowed to handle Customer Rewards Activation requests rather than a mock. 
    local procedure CanHandle(): Boolean; 
    var 
        CustomerRewardsExtMgtSetup: Record "Customer Rewards Mgt. Setup"; 
    begin 
        if CustomerRewardsExtMgtSetup.Get then 
            exit(CustomerRewardsExtMgtSetup."Customer Rewards Ext. Mgt. Codeunit ID" = CODEUNIT::"Customer Rewards Ext. Mgt."); 
        exit(false); 
    end; 
} 
```

### Conclusion
At this point, the Customer Rewards sample extension can be published and installed on your sandbox. To continue writing tests for the sample extension, see [Testing the Advanced Sample Extension](devenv-extension-advanced-example-test.md). 

## See Also  
[Developing Extensions](devenv-dev-overview.md)  
[Getting Started with AL](devenv-get-started.md)  
[How to: Publish and Install an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Converting Extensions V1 to Extensions V2](devenv-upgrade-v1-to-v2-overview.md)  
[Configure Context-Sensitive Help](../help/context-sensitive-help.md)  
