---
title: OnGetFilename Event
description: Describe the OnAfterDocumentPrintReady Event in Business Central.  
ms.date: 04/01/2021
ms.topic: article
author: jswymer
---
# OnGetFilename event

This article describes the syntax of the OnGetFilename event and the attributes of the report payload.

## Usage

Use the OnGetFilename event to specify what happens when the user selects the **Print** action on a report request page. The `OnAfterDocumentPrintReady` event is used to send a report to a target extension printer. For more information about subscribing to this event, see [Developing Printer Extensions Overview](devenv-reports-printing.md). 

## Publisher

Codeunit **44 ReportManagement**.

## Raised

When a user selects the print action on a report request page

## Syntax

```AL
[IntegrationEvent(false, false)]
local procedure OnGetFilename(ReportID: Integer; Caption: Text[250]; ObjectPayload: JsonObject; FileExtension: Text[30]; ReportRecordRef: RecordRef; var Filename: Text; var Success: Boolean)
```

## Parameters

*ObjectType*

Type: [Enum](methods-auto/enum/enum-data-type.md)

The object to run. Currently only `report` is supported. 

*ObjectID*

Type: [Integer](methods-auto/integer/integer-data-type.md)

The ID of the report object to be run.

*ObjectPayload*

Type: [JsonObject](methods-auto/jsonobject/jsonobject-data-type.md)

Instance of the report payload. For more information, see [Report payload structure](#reportpayload).

*DocumentStream*

Type: [InStream](methods-auto/instream/instream-data-type.md)

A stream object that contains a .pdf file of the report to be printed.

*Success*

Type: [Boolean](methods-auto/boolean/boolean-data-type.md)

Specifies whether the extension handled the print action successfully.

[!INCLUDE[report_payload_md](includes/report_payload.md)]


## Example

This /* EventSubscriber Attribute: Subscribes to the OnGetFilename event in the ReportManagement codeunit.
Parameters:
ReportID: The ID of the report being exported.
FileExtension: The file extension (e.g., '.pdf').
Filename: The variable you set to your custom filename.
Success: Set to true if you handled the filename.
Logic:
Checks if the report is "Customer - List" and the export is a PDF.
Sets a custom filename with the current date/time.
Sets Success := true to indicate the filename was set.
This way, whenever a user exports the "Customer - List" report as PDF, the file will be named according to your logic. */

```AL
codeunit 50100 MyFilenameSubscriber
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnGetFilename', '', false, false)]
    local procedure OnGetFilenameHandler(
        ReportID: Integer;
        Caption: Text[250];
        ObjectPayload: JsonObject;
        FileExtension: Text[30];
        ReportRecordRef: RecordRef;
        var Filename: Text;
        var Success: Boolean)
    begin
        // Check if this is the "Customer - List" report and PDF export
        if (ReportID = Report::"Customer - List") and (FileExtension = '.pdf') then begin
            Filename := 'MyCustomCustomerList_' + Format(CurrentDateTime) + FileExtension;
            Success := true; // Mark as handled
        end;
    end;
}
```

## Related information

[Working With and Troubleshooting Payloads](devenv-reports-troubleshoot-printing.md)  
[Developing Printer Extensions Overview](devenv-reports-printing.md)  
[Creating a Printer Extension](devenv-reports-create-printer-extension.md)  
[Events in AL](devenv-events-in-al.md)   
[Publishing Events](devenv-publishing-events.md)   
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)  
