---
title: "Upgrading Reports"
description: Describes how to upgrade reports  
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---
# Upgrading Reports

## Updates to Business Central Report platform (version 20)

In version 20, the reporting platform has been updated with respect to Microsoft Word render engine, custom render support, improved layout management using extension layouts, and new platform supported layout and selection tables. This also have an impact on the application events in codeunit **44 ReportManagement**.

### Document report with Microsoft Word layouts

The new platform natively supports rendering of Microsoft Word reports and if the application have customizations in this area, it's possible to switch to backward compatibility mode (calling the application render logic as in previous versions) by

- Disable the application feature key `Feature: New Microsoft Word report rendering platform` in the Feature Management page.
- Use the new business event `OnApplicationReportMergeStrategy` to select application or platform engine support for particular layout in a specific report. By using this event, the application can select rendering engine based on the selected report ID and layout name.

### Customization of OnAfterHasCustomLayout event

Customized use of OnAfterHasCustomLayout has to be re-implemented by using the following events:

- `OnSelectReportLayoutCode` - Will find the layout code and type that the application has set using the Report Layout Selection application table.
- `OnFetchReportLayoutByCode` - Will read the layout data from application tables (not needed if the layouts are stored in platform system tables by using extension provided layouts or layouts inserted manually in the `Tenant Report Layout` table).

### Customization of `OnMergeDocumentReport` or `OnBeforeMergeDocument`

Extensions that depend on the legacy Microsoft Word render by using the events `OnMergeDocumentReport` or `OnBeforeMergeDocument` should be updated to use the new custom report render type and subscribe to `OnCustomDocumentMerger` instead. The layouts can now the added in the extension by using the `rendering` report AL section and will be stored in the platform layout tables. 

## New Integration Events

### Codeunit 44 ReportManagement

Events for processing reports.

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

Events for loading report layouts

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

## Obsoleted Business Events

### Codeunit 44 ReportManagement

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

### Codeunit 9651 "Document Report Mgt."

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

## Technical upgrade from 19 and earlier

### Requirements

- System App must be updated to version 20.x
- ReportManagement.Codeunit.al (ID=44) must implement the new event subscribers and integration events.

### New code to be added to codeunit 44 Report Management to support the upgraded platform requirements:

Add new functionality to support new platform driven events for documents and download, and for managing report layout selection and load from application logic.
The old event `OnAfterHasCustomLayout` has been replaced with the following events:

- `SelectedBuiltinLayoutType` - Will return the layout type selected for the current report. This is for backward compatibility only and uses the application layout selection table for retrieving the desired built-in layout type.
- `SelectReportLayoutCode` - Will return the selection layout name and type using the Custom Report Layout selection table and associated logic. Substitute for OnAfterHasCustomLayout.
- `FetchReportLayoutByCode` - Will load the layout stream from application code, given a layout name and report ID.

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

    // Temporarily selected layout for Design-time report execution or for looping in batch report scenarios?
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
                        // Layout Type extensions
                        if (FeatureKey.Get(PlatformRenderingInPlatformTxt) and (FeatureKey.Enabled = FeatureKey.Enabled::"All Users")) then
                            // Platform rendering - The OnCustomDocumentMerger event will handle the rendering logic
                            LayoutType := LayoutType::Custom
                        else
                            // App rendering - The type will be treated like a word file and rendered by the app.
                            LayoutType := LayoutType::Word;
                end;
            end;
        // A layout code is defined, but not found in application table. The layout type is not known and it's expected that the code refers to a layout in the platform. 
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

## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Custom Report Render Event](../developer/devenv-oncustomdocumentmerger-event.md)
