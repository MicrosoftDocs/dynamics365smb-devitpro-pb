---
title: Upgrading reports
description: Describes how to upgrade reports in Business Central. 
ms.custom: bap-template
ms.date: 03/18/2024
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---
# Upgrading reports

> **APPLIES TO:** Upgrading to Business Central 2024 release wave 1 (version 24) and later from Business Central version 19 and earlier 

This article discusses changes to the report platform done in Business Central 2022 release wave 1 (version 20) and their effect on upgrading from version 19 and earlier to version 24 and later.

## Report platform changes

Version 20 introduced a new report rendering model. Previously, report rendering was done by the application. Now, by default, report rendering is done by the platform. In support of this new model, various changes have been made, including:

- An updated Microsoft Word report rendering engine
- A new custom report render
- Improved layout management using extension layouts for designing multiple layouts for a single report.
- New platform-supported layouts and layout selection tables
- New and obsoleted application events in codeunit **44 ReportManagement**

### New and obsoleted events

This section lists the new and obsoleted events in version 24 and later.

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
    local procedure OnCustomDocumentMergerEx(ObjectID: Integer; ReportAction: Option SaveAsPdf,SaveAsWord,SaveAsExcel,Preview,Print,SaveAsHtml; ObjectPayload: JsonObject; XmlData: InStream; LayoutData: InStream; var DocumentStream: OutStream; var IsHandled: Boolean)
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
    ```

#### Obsoleted events

Some events in codeunit **44 ReportManagement** and codeunit **9651 "Document Report Mgt."** have been obsoleted.

- Codeunit **44 ReportManagement** events:

    ```al
    [IntegrationEvent(false, false)]
    [Obsolete('Replaced by platform document merge using OnCustomDocumentMergerEx.', '20.0')]
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

    [IntegrationEvent(false, false)]
    local procedure OnApplicationReportMergeStrategy(ObjectId: Integer; LayoutCode: Text; var InApplication: boolean; var IsHandled: Boolean)
    begin
    end;

    [IntegrationEvent(false, false)]
    local procedure OnWordDocumentMergerAppMode(ObjectId: Integer; LayoutCode: Text; var InApplication: boolean; var IsHandled: Boolean)
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

When doing a full upgrade (application and platform), you might have to rewrite custom code to use the new events. See [Upgrade of reports with custom layouts](#appupgrade).

> [!NOTE]
> You have the option to continue to use the application rendering on all or specific reports that depend on Word layouts. In this case, you won't have to make any code changes at this time. For more information, see [Continue using application rendering of Word reports](#continue).


The report rendering changes don't affect the upgrade process for RDLC report layouts or built-in Word reports layouts. So if your current Business Central solution doesn't have any custom Word Layouts, then no additional action is required for report upgrade. If it does, read the sections that follow to what you need to do, if anything.

## <a name="appupgrade"></a>Upgrade of reports with custom layouts

The new platform supports the native rendering of Microsoft Word reports. With this new rendering, the following report events in AL are no longer used:

- `OnAfterHasCustomLayout`
- `OnMergeDocumentReport`
- `OnBeforeMergeDocument`

If you have custom code that subscribes to these events, you'll have to change the code to subscribe to new events, including:

- `OnSelectReportLayoutCode`
- `OnFetchReportLayoutByCode`
- `OnCustomDocumentMergerEx`

### Customization of OnAfterHasCustomLayout event

Custom code that uses the `OnAfterHasCustomLayout` event must be reimplemented to use the following events instead:

- `OnSelectReportLayoutCode`

  This event gets the layout code and type that the application has set using the **Report Layout Selection** application table.

- `OnFetchReportLayoutByCode`

  This event reads the layout data from application tables (not needed if the layouts are stored in platform system tables by using extension provided layouts or layouts inserted manually in the `Tenant Report Layout` table.

### Customization of OnMergeDocumentReport or OnBeforeMergeDocument

Extensions that depend on the legacy Microsoft Word render by using the `OnMergeDocumentReport` or `OnBeforeMergeDocument` events must be changed to use the new custom report render type and subscribe to `OnCustomDocumentMergerEx` instead.

By subscribing to `OnCustomDocumentMergerEx`, the application can use extension defined report renders featuring layouts stored in the platform layout tables. These layouts must be added as type custom in the reports rendering section. By subscribing to `OnCustomDocumentMergerEx`, the layouts can be added in the extension by using the `rendering` section in AL code of the report. The layout will then be stored in the platform layout tables.

## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
[Custom Report Render Event](../developer/devenv-oncustomdocumentmergerex-event.md)
