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


## New Business Events

codeunit 44 ReportManagement

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


## Obsoleted Business Events

codeunit 44 ReportManagement
    [IntegrationEvent(false, false)]
    [Obsolete('Replaced by platform document merge using OnCustomDocumentMerger.', '20.0')]
    local procedure OnMergeDocumentReport(ObjectType: Option "Report","Page"; ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; XmlData: InStream; FileName: Text; var printDocumentStream: OutStream; var IsHandled: Boolean)
    begin
    end;

codeunit 9651 "Document Report Mgt."
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

## Technical upgrade from 19 and earlier

### Requirements

- System App must be updated to version 20.x
- ReportManagement.Codeunit.al (ID=44) must implement the new event subscribers and integration events.
- DocumentReport.Management.Codeunit.al (ID=9651) must implement a function to fetch the Word report layout from the application custom layout table.  


### New code to be added to codeunit 44 Report Management to support the upgraded platform requirements:


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

[EventSubscriber(ObjectType::Codeunit, Codeunit::"Reporting Triggers", 'ReportGetCustomWord', '', false, false)]
local procedure ReportGetCustomWord(ReportId: Integer; var LayoutStream: OutStream; var Success: Boolean)
var
    DocumentReportManagement: Codeunit "Document Report Mgt.";
begin
    DocumentReportManagement.GetWordLayoutStream(ReportId, LayoutStream, Success);
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
### New code to be added to DocumentReportMgt.Codeunit.al

(not mandatory, can be implemented if needed in report management codeunit as there are no other callers for this procedure. Only needed if custom word layouts are stored in app table. When this is moved to tenant Report Layout, this procedure can be discarded.

```AL
[Scope('OnPrem')]
procedure GetWordLayoutStream(ReportID: Integer; var LayoutStream: OutStream; var Success: Boolean)
var
    ReportLayoutSelection: Record "Report Layout Selection";
    CustomReportLayout: Record "Custom Report Layout";
    TempBlobIn: Codeunit "Temp Blob";
    CustomLayoutCode: Code[20];
    InStrWordDoc: InStream;
begin
    Success := false;
    // Temporarily selected layout for Design-time report execution?
    if ReportLayoutSelection.GetTempLayoutSelected() <> '' then
        CustomLayoutCode := ReportLayoutSelection.GetTempLayoutSelected()
    else  // Normal selection
        if ReportLayoutSelection.Get(ReportID, CompanyName) and
            (ReportLayoutSelection.Type = ReportLayoutSelection.Type::"Custom Layout")
        then
            CustomLayoutCode := ReportLayoutSelection."Custom Report Layout Code";

    OnAfterGetCustomLayoutCode(ReportID, CustomLayoutCode);

    if CustomLayoutCode <> '' then
        if not CustomReportLayout.Get(CustomLayoutCode) then
            CustomLayoutCode := '';

    if CustomLayoutCode <> '' then begin
        ValidateAndUpdateWordLayoutOnRecord(CustomReportLayout);
        CustomReportLayout.GetLayoutBlob(TempBlobIn);
        TempBlobIn.CreateInStream(InStrWordDoc);
        ValidateWordLayoutCheckOnly(ReportID, InStrWordDoc);
        CopyStream(LayoutStream, InStrWordDoc);
        Success := true;
    end;
end;
```



## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
