---
title: "Upgrading Reports"
description: Describes how to upgrade reports  
ms.custom: na
ms.date: 03/30/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---
# Upgrading Reports

[!INCLUDE[2022_releasewave1.md](../includes/2022_releasewave1.md)]

This article discusses changes to the report platform in Business Central 2022 release wave 1 (version) and their effect on upgrading from version 19 and earlier.

<!--  

In version 20, the reporting platform has been updated with respect to Microsoft Word render engine, custom render support, improved layout management using extension layouts, and new platform supported layout and selection tables. This also have an impact on the application events in codeunit **44 ReportManagement**.-->

## Report platform changes in version 20

Version 20 introduces a new report rendering model. Previously, report rendering was done by the application. Now, by default, report rendering is done by the platform. In support of this new model, various changes have been made, including:

- An updated Microsoft Word report rendering engine
- A new custom report render
- Improved layout management using extension layouts for designing multiple layouts for a single report.
- New platform-supported layouts and layout selection tables
- New and obsoleted application events in codeunit **44 ReportManagement**

### New and obsoleted events

This section lists the new and obsoleted events in version 20.

#### New events

Codeunit **44 ReportManagement** includes new integration events for processing reports and loading report layouts.

- Events for processing reports:

    ```al
    [IntegrationEvent(false, false)]
    local procedure OnAfterDocumentReady(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var TargetStream: OutStream; var Success: Boolean)
    begin
    end;
    
    [IntegrationEvent(false, false)]
    local procedure OnAfterDocumentDownload(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean)
    begin
    end;
    
    [IntegrationEvent(false, false)]
    local procedure OnCustomDocumentMerger(ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; XmlData: InStream; LayoutData: InStream; var printDocumentStream: OutStream; var IsHandled: Boolean)
    begin
    end;
    ```

- Events for loading report layouts:

    ```al
    [IntegrationEvent(false, false)]
    local procedure OnSelectReportLayoutCode(ObjectId: Integer; var LayoutCode: Text; var LayoutType: Option "None",RDLC,Word,Excel,Custom; var IsHandled: Boolean)
    begin
    end;
    
    [IntegrationEvent(false, false)]
    local procedure OnFetchReportLayoutByCode(ObjectId: Integer; LayoutCode: Text; var TargetStream: OutStream; var IsHandled: Boolean)
    begin
    end;
    
    [IntegrationEvent(false, false)]
    local procedure OnApplicationReportMergeStrategy(ObjectId: Integer; LayoutCode: Text; var InApplication: boolean; var IsHandled: Boolean)
    begin
    end;
    ```

#### Obsoleted events

Some events in codeunit **44 ReportManagement** and codeunit **9651 "Document Report Mgt."** have been obsoleted.

- Codeunit **44 ReportManagement** events:

    ```al
    [IntegrationEvent(false, false)]
    [Obsolete('Replaced by platform document merge using OnCustomDocumentMerger.', '20.0')]
    local procedure OnMergeDocumentReport(ObjectType: Option "Report","Page"; ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; XmlData: InStream; FileName: Text; var printDocumentStream: OutStream; var IsHandled: Boolean)
    begin
    end;
    
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'ReportGetCustomRdlc', '', false, false)]
    [Obsolete('This procedure will be replaced with platform functionality. Subscribe to the event FetchReportLayoutByCode instead to retrieve a layout.', '20.0')]
    local procedure ReportGetCustomRdlc(ReportId: Integer; var RdlcText: Text)
    begin
    end;
    
    [IntegrationEvent(false, false)]
    local procedure OnAfterHasCustomLayout(ObjectType: Option "Report","Page"; ObjectID: Integer; var LayoutType: Option "None",RDLC,Word,Excel,Custom)
    begin
    end;
    ```

- Codeunit **9651 "Document Report Mgt."**:

    ```al
    [IntegrationEvent(false, false)]
    [Obsolete('Platform will render Word Document Reports, look for OnAfterDocumentReady.', '20.0')]
    local procedure OnAfterConvertToPdf(var TempBlob: Codeunit "Temp Blob"; ReportID: Integer);
    begin
    end;
    
    [IntegrationEvent(false, false)]
    [Obsolete('Platform will render Word Document Reports.', '20.0')]
    local procedure OnAfterGetCustomLayoutCode(ReportID: Integer; var CustomLayoutCode: Code[20])
    begin
    end;
    
    [IntegrationEvent(false, false)]
    [Obsolete('Platform will render Word Document Reports.', '20.0')]
    local procedure OnBeforeMergeDocument(ReportID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; var InStrXmlData: InStream; PrinterName: Text; OutStream: OutStream; var Handled: Boolean; IsFileNameBlank: Boolean)
    begin
    end;
    
    [IntegrationEvent(false, false)]
    [Obsolete('Platform will render Word Document Reports.', '20.0')]
    local procedure OnBeforeMergeWordDocument()
    begin
    end;
    
    [IntegrationEvent(false, false)]
    [Obsolete('Platform will render Word Document Reports, look for OnDocumentReady.', '20.0')]
    local procedure OnAfterMergeWordDocument(ReportID: Integer; InStrXmlData: InStream; var TempBlob: Codeunit "Temp Blob")
    begin
    end;
    
    [IntegrationEvent(false, false)]
    [Obsolete('Platform will render Word Document Reports.', '20.0')]
    local procedure OnMergeReportLayoutOnSuppressCommit(ReportID: Integer; var IsHandled: Boolean)
    begin
    end;
    ```

## What the changes mean for upgrade

These report rendering changes may have implications on upgrading from earlier versions if your application includes reports that use layouts stored in application table **9650 Custom Report Layouts** or make use of the application report layout selection features. And, you have events that subscribe to any of the obsoleted events.

Basically, the following areas can be impacted:

- Report layout selection with dependencies to the `OnAfterHasCustomLayout` event or design-time temporary selection. The reason is that layout selection logic has been extended because of new layout types.
- Events on the **Document Management** codeunit related to Word documents as layouts now render in platform by default.

Use the following information to determine what you need to do for your upgrade scenario:

- If you're doing a full upgrade (application and platform), you may have to rewrite custom code to use the new events. See [Upgrade of document reports with Word layouts](#appupgrade).

  > [!NOTE]
  > You have the option to continue to use the application rendering on all or specific reports that depend on Word layouts. In this case, you won't have to make any code changes at this time. For more information, see [Continue using application rendering of Word reports](#continue).

- If you're doing a technical upgrade (platform only), you may have to modify codeunit **44 Report Management** of the application to include new event subscribers and integration events. For more information, see [Technical upgrade from 19 and earlier](#techupgrade).

The report rendering changes don't affect the upgrade process for RDLC report layouts or built-in Word reports layouts. So if your current Business Central solution doesn't have any custom Word Layouts, then no additional action is required for report upgrade. If it does, read the sections that follow to what you need to do, if anything.

## <a name="appupgrade"></a>Upgrade reports with custom layouts 

The new platform supports the native rendering of Microsoft Word reports. With this new rendering, the following report events in AL are no longer used:

- `OnAfterHasCustomLayout`
- `OnMergeDocumentReport`
- `OnBeforeMergeDocument`

If you have custom code that subscribes to these events, you'll have to change the code to subscribe to new events, including:

- `OnSelectReportLayoutCode`
- `OnFetchReportLayoutByCode`
- `OnCustomDocumentMerger`

<!--
if the application has customizations in this area, it's possible to switch to backward compatibility mode (calling the application render logic as in previous versions) by:

- Disable the application feature key `Feature: New Microsoft Word report rendering platform` in the **Feature Management** page.
- Use the new business event `OnApplicationReportMergeStrategy` to select application or platform engine support for particular layout in a specific report. By using this event, the application can select rendering engine based on the selected report ID and layout name.-->

### Customization of OnAfterHasCustomLayout event

Custom code that uses the `OnAfterHasCustomLayout` event must be reimplemented to use the following events instead:

<!-- do they need to use both?-->
- `OnSelectReportLayoutCode`


  This event gets the layout code and type that the application has set using the **Report Layout Selection** application table.

- `OnFetchReportLayoutByCode`

  This event reads the layout data from application tables (not needed if the layouts are stored in platform system tables by using extension provided layouts or layouts inserted manually in the `Tenant Report Layout` table.

### Customization of OnMergeDocumentReport or OnBeforeMergeDocument

Extensions that depend on the legacy Microsoft Word render by using the `OnMergeDocumentReport` or `OnBeforeMergeDocument` events must be changed to use the new custom report render type and subscribe to `OnCustomDocumentMerger` instead.

By subscribing to `OnCustomDocumentMerger`, the layouts can be added in the extension by using the `rendering` section in AL code of the report. The layout will then be stored in the platform layout tables.

## <a name="techupgrade"></a>Technical upgrade from 19 and earlier

This section outlines what's required for custom report layouts to work properly after a technical upgrade. 

### Requirements

- System application must be version 20.x
- Codeunit **44 Report Management** must implement the new event subscribers and integration events.

### Add code to codeunit 44 Report Management

In the ReportManagement.Codeunit.al file the base application, you add code to support the new platform-driven events for documents and for selecting and loading report layouts from application logic.

The `OnAfterHasCustomLayout` event has been replaced with the following events:

- `SelectedBuiltinLayoutType`

  This event returns the layout type selected for the current report. It's for backward compatibility only and uses the application layout selection table for retrieving the desired built-in layout type.
- `SelectReportLayoutCode`

  This event returns the selected layout name and type using the **Custom Report Layout** table and associated logic. Substitute for OnAfterHasCustomLayout.
- `FetchReportLayoutByCode`

  This event loads the layout stream from application code, given a layout name and report ID.

#### Guidelines

1. Modify base application

    You'll have to create a new version of the base application using Visual Studio Code. In general, follow the guidelines at [Publishing Code-Customized Base Application](../developer/devenv-publish-code-customization.md), but make the following modifications for this scenario:

    1. Modify the app.json file to include the following changes:

        1. Change the system application dependency to version 20.
        2. Increase the application version.

    2. Delete the BusinessChartType.Enum.al file.

        This file is now part of the system application in version 20.
    3. In the ReportManagement.Codeunit.al file, add the following code:

        ```al
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'CustomDocumentMerger', '', false, false)]
        local procedure CustomDocumentMerger(ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; XmlData: InStream; LayoutData: InStream; var DocumentStream: OutStream)
        var
            IsHandled: Boolean;
        begin
            IsHandled := false;
            OnCustomDocumentMerger(ObjectID, ReportAction, XmlData, LayoutData, DocumentStream, IsHandled);
            if (IsHandled) then
                exit;
        end;
        
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'OnDocumentReady', '', false, false)]
        local procedure OnDocumentReady(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var TargetStream: OutStream; var Success: Boolean)
        begin
            OnAfterDocumentReady(ObjectId, ObjectPayload, DocumentStream, TargetStream, Success);
        end;
        
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'OnDocumentDownload', '', false, false)]
        local procedure OnDocumentDownload(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean)
        begin
            OnAfterDocumentDownload(ObjectId, ObjectPayload, DocumentStream, Success);
        end;
        
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'SelectedBuiltinLayoutType', '', false, false)]
        local procedure SelectedBuiltinLayoutType(ObjectID: Integer; var LayoutType: Option "None",RDLC,Word,Excel,Custom)
        var
            ReportLayoutSelection: Record "Report Layout Selection";
        begin
            LayoutType := ReportLayoutSelection.SelectedBuiltinLayoutType(ObjectID);
        end;
        
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'SelectReportLayoutCode', '', false, false)]
        local procedure SelectReportLayoutCode(ObjectId: Integer; var LayoutCode: Text; var LayoutType: Option "None",RDLC,Word,Excel,Custom; var Success: Boolean)
        var
            CustomReportLayout: Record "Custom Report Layout";
            FeatureKey: Record "Feature Key";
            ReportLayoutSelection: Record "Report Layout Selection";
            DesignTimeReportSelection: Codeunit "Design-time Report Selection";
            AppLayoutType: Enum "Custom Report Layout Type";
            SelectedLayoutName: Text[250];
            PlatformRenderingInPlatformTxt: Label 'RenderWordReportsInPlatform', Locked = true;
        begin
            OnSelectReportLayoutCode(ObjectId, LayoutCode, LayoutType, Success);
            if Success then
                exit;
        
            LayoutType := LayoutType::None; // Unknown layout type
            SelectedLayoutName := DesignTimeReportSelection.GetSelectedLayout();
        
            // Temporarily selected layout for design-time report execution or for looping in batch report scenarios
            if SelectedLayoutName = '' then
                // look in the app layout selection table for a selected layout for this report id.
                if ReportLayoutSelection.Get(ObjectId, CompanyName) and
                    (ReportLayoutSelection.Type = ReportLayoutSelection.Type::"Custom Layout")
                then
                    SelectedLayoutName := ReportLayoutSelection."Custom Report Layout Code";
        
            if SelectedLayoutName <> '' then begin
                // The code field in Custom Report Layout table can have a maximum size of 20 characters.
                if (StrLen(SelectedLayoutName) <= MaxStrLen(CustomReportLayout."Code")) then
                    if CustomReportLayout.Get(SelectedLayoutName.ToUpper()) then begin
                        LayoutCode := CustomReportLayout.Code;
                        AppLayoutType := CustomReportLayout.Type;
                        case AppLayoutType of
                            AppLayoutType::RDLC:
                                LayoutType := LayoutType::RDLC;
                            AppLayoutType::Word:
                                LayoutType := LayoutType::Word;
                            else
                                // Layout type extensions
                                if (FeatureKey.Get(PlatformRenderingInPlatformTxt) and (FeatureKey.Enabled = FeatureKey.Enabled::"All Users")) then
                                    // Platform rendering - The OnCustomDocumentMerger event will handle the rendering logic
                                    LayoutType := LayoutType::Custom
                                else
                                    // App rendering - The type will be treated like a word file and rendered by the app.
                                    LayoutType := LayoutType::Word;
                        end;
                    end;
                // Layout code is defined  but not found in application table.
                //The layout type is not known, and it's expected that the code refers to a layout in the platform. 
                // Return the layout code to platform for further processing.
                LayoutCode := SelectedLayoutName;
                Success := true;
            end;
        end;
        
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'FetchReportLayoutByCode', '', false, false)]
        local procedure FetchReportLayoutByCode(ObjectId: Integer; LayoutCode: Text; var TargetStream: OutStream; var Success: Boolean)
        var
            CustomReportLayout: Record "Custom Report Layout";
            TempBlobIn: codeunit "Temp Blob";
            TempInStream: InStream;
        begin
            OnFetchReportLayoutByCode(ObjectId, LayoutCode, TargetStream, Success);
            if Success then
                exit;
        
            if not CustomReportLayout.Get(LayoutCode) then
                LayoutCode := '';
        
            if LayoutCode <> '' then begin
                CustomReportLayout.GetLayoutBlob(TempBlobIn);
                TempBlobIn.CreateInStream(TempInStream);
                CopyStream(TargetStream, TempInStream);
                Success := true;
            end;
        end;
        
        [EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'ApplicationReportMergeStrategy', '', false, false)]
        local procedure ApplicationReportMergeStrategy(ObjectId: Integer; LayoutCode: Text; var InApplication: boolean)
        var
            IsHandled: Boolean;
        begin
            InApplication := false;
            IsHandled := false;
            OnApplicationReportMergeStrategy(ObjectId, LayoutCode, InApplication, IsHandled);
            if IsHandled then
                exit;
        end;
        
        [IntegrationEvent(false, false)]
        local procedure OnAfterDocumentReady(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var TargetStream: OutStream; var Success: Boolean)
        begin
        end;
        
        [IntegrationEvent(false, false)]
        local procedure OnAfterDocumentDownload(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean)
        begin
        end;
        
        [IntegrationEvent(false, false)]
        local procedure OnCustomDocumentMerger(ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; XmlData: InStream; LayoutData: InStream; var printDocumentStream: OutStream; var IsHandled: Boolean)
        begin
        end;
        
        [IntegrationEvent(false, false)]
        local procedure OnSelectReportLayoutCode(ObjectId: Integer; var LayoutCode: Text; var LayoutType: Option "None",RDLC,Word,Excel,Custom; var IsHandled: Boolean)
        begin
        end;
        
        [IntegrationEvent(false, false)]
        local procedure OnFetchReportLayoutByCode(ObjectId: Integer; LayoutCode: Text; var TargetStream: OutStream; var IsHandled: Boolean)
        begin
        end;
        
        [IntegrationEvent(false, false)]
        local procedure OnApplicationReportMergeStrategy(ObjectId: Integer; LayoutCode: Text; var InApplication: boolean; var IsHandled: Boolean)
        begin
        end;
        ```

    4. In the DesigntimeReportSelection.Codeunit.al file, add the following `var`:

        ```al
        SelectedCustomLayout: Text[250];
        ```

        Then, add the following procedure:

        ```al
        procedure GetSelectedLayout(): Text[250]
        begin
            if SelectedCustomLayout = '' then
                exit(SelectedCustomLayoutCode);
            exit(SelectedCustomLayout);
        end;
        ```

    5. In the ReportLayoutSelection.Table.al file, add the following `procedure`:

        ```al
        procedure SelectedBuiltinLayoutType(ReportID: Integer): Integer
        begin
            if not Get(ReportID, CompanyName) then
                exit(0);
            case Type of
                Type::"RDLC (built-in)":
                    exit(1);
                Type::"Word (built-in)":
                    exit(2);
                else
                    exit(0);
            end;
        end;
        ```

   6. Build the extension package for the new version. 

2. Run the technical upgrade

    Follow the instructions for a technical upgrade at [Technical Upgrade to Version 20](upgrade-technical-upgrade-v20.md#Preparedb). One the last tasks involves upgrading to the new system application and base application versions.

## <a name="continue"></a>Continue using application rendering of Word report layouts

There may be reports that you can't change at this time. In this case, it's possible to keep using the legacy application rendering. There are two ways to use to application rendering on reports: 

<!--
if the application has customizations in this area, it's possible to switch to backward compatibility mode (calling the application render logic as in previous versions) by:-->

- Disable the feature named **Feature: New Microsoft Word report rendering platform**.
 in the **Feature Management** page.

    For more information, see [Enabling the Microsoft Word rendering engine](../developer/devenv-howto-report-layout.md#enabling-the-microsoft-word-rendering-engine).
- Use the new business event `OnApplicationReportMergeStrategy` to select application or platform engine support for particular layout in a specific report.

  By subscribing this event, the application selects the rendering engine based on the selected report ID and layout name.

## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Custom Report Render Event](../developer/devenv-oncustomdocumentmerger-event.md)
