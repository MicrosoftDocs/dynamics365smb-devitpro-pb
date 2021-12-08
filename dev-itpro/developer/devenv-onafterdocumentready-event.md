---
title: "OnAfterDocumentReady Event"
description: Describe the OnAfterDocumentReady Event in Business Central.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: nhsejth
---
# OnAfterDocumentReady Event

This article describes the syntax of the OnAfterDocumentReady event and the attributes of the report payload.

## Usage

Use the OnAfterDocumentReady event to specify what happens when the user generated a report artifact (stream or file) from code or a request page action. The `OnAfterDocumentReady` event is used to enable document patching scenarios in the application or to copy the articat to a different location during testing.

The event input is the report ID, a json collection with report runtime information and the generated document in an InStream. Use the `documenttype` json property to identify the data type stored in the `DocumentStream` parameter and act accordingly. The final result must be written to the `TargetStream` parameter and the parameter `Success` must be set to true if the modified stream is to be used in the platform.  The content in the `TargetStream` will be discarded if the Success paraemter is false up-un return form the procedure.

Notice that it's not allowed to change the content type.

## Publisher

Codeunit **44 ReportManagement**.

## Raised

When the report runtime have generated an output artifact that can be persisted. This can occur when the application run a SaveAs function, the user invokes one of the SendTo actions in the report request page or when the document is being printed using an extension printer or by using the web client print capability.

## Syntax

```AL
[IntegrationEvent(false, false)]
local procedure OnAfterDocumentReady(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var TargetStream: OutStream; var Success: Boolean)
```

## Parameters

### *ObjectID*

Type: [Integer](methods-auto/integer/integer-data-type.md)

The ID of the report object to be run.

### *ObjectPayload*

Type: [JsonObject](methods-auto/jsonobject/jsonobject-data-type.md)

Instance of the report payload. For more information, see [Report payload structure](#reportpayload).

### *DocumentStream*

Type: [InStream](methods-auto/instream/instream-data-type.md)

A stream object that contains the generated artifact. The actual data type can be found from the mime type in the report payload document.

### *TargetStream*

Type: [OutStream](methods-auto/outstream/outstream-data-type.md)

Target stream that must contain the modified artifact if the application code handles the object and returns success = true

### *Success*

Type: [Boolean](methods-auto/boolean/boolean-data-type.md)

Specifies whether the extension handled the generated articat successfully.

## <a name="reportpayload"></a>Report payload

The report payload contains metadata for the report object and a list of attributes that identifies that current invocation. The payload consists of several attributes and has the following structure.

```json
{
    "filterviews":
    [
        {"name":"Header","tableid":112,"view":"VERSION(1) SORTING(Field3) WHERE(Field3=1(103027))"},
        {"name":"Line","tableid":113,"view":"VERSION(1) SORTING(Field3,Field4) WHERE(Field4=1(0..10000))"},
        {"name":"ShipmentLine","tableid":7190,"view":"VERSION(1) SORTING(Field1,Field2,Field3) WHERE(Field2=1(10000))"}
    ],
    "version":1,
    "objectname":"Standard Sales - Invoice",
    "objectid":1306,
    "documenttype":"application/pdf",
    "invokedby":"00000000-0000-0000-0000-000000000001",
    "invokeddatetime":"2020-01-17T15:33:52.48+01:00",
    "companyname":"CRONUS International Ltd.",
    "printername":"",
}

```

<!--
{
    "filterviews":
    [
        {
            "name":"[DATA_ITEM_NAME]",
            "tableid":"[TABLE_ID]",
            "view":"[FILTER_VIEW]"
        }
    ],
    "version":1,
    "objectname":"[OBJECT_NAME]",
    "objectid":[REPORT_ID],
    "documenttype":"[MIME_TYPE]",
    "invokedby":"[SESSION_USER_ID]",
    "invokeddatetime":"[CLENT_LOCAL_DATETIME]", // for example, "2019-10-22T22:25:54.338+02:00"
    "printername":"My Printer",
    "companyname":"[COMPANY_NAME]",
}

```
-->

### Attributes

#### *objectname*

Specifies the name of the object.

#### *objectid*

Specifies the ID of the object.

#### *documenttype*

Specifies the MIME type of the document.

#### *documeninvokedby*

Specifies the ID of the user who invoked the print action.

#### *invokeddatetime*

Specifies the date and time that the print action was invoked, for example, 2019-10-22T22:25:54.338+02:00. The value is the date and time on the client machine.

#### *companyname*

Specifies the Business Central company.

#### *version*

Specifies the version of the report payload. Currently, the only supported version for the payload is `1`.

#### *filterviews*

Specifies views that are used on the document.

#### *name*

Specifies the name of data item that the filter view applies to.

#### *tableid*

Specifies ID of the table for the view.

#### *view*

Specifies the name of the view.

## Sample code

Subscribe to the standard event in codeunit ReportManagement. This sample saves the JSON payload to a text file and copies the document stream content to the target stream.

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterDocumentReady', '', true, true)]
local procedure OnAfterDocumentReady(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var TargetStream: OutStream; var Success: Boolean)
var
    JsonText: Text;
    JsonFile: File;
    mimeType: Text;
begin
    // Save the report payload in a text file.
    ObjectPayload.WriteTo(JsonText);
    JsonFile.TextMode := true;
    JsonFile.Create('c:\temp\OnAfterDocumentReady.json', TextEncoding::UTF8);
    JsonFile.Write(JsonText);
    JsonFile.Close();

    // do something on the document stream and write it back to the serverr.
    CopyStream(TargetStream, DocumentStream);
    Success := true;
end;

```

## See Also

<!-- [Working With and Troubleshooting Payloads](devenv-reports-troubleshoot-printing.md)   -->
<!-- [Developing Printer Extensions Overview](devenv-reports-printing.md)   -->
<!-- [Creating a Printer Extension](devenv-reports-create-printer-extension.md)   -->
[Events in AL](devenv-events-in-al.md)
[Publishing Events](devenv-publishing-events.md)
[Raising Events](devenv-raising-events.md)
[Subscribing to Events](devenv-subscribing-to-events.md)
