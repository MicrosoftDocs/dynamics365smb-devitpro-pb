---
title: "OnAfterDocumentReady Event"
description: Describe the OnAfterDocumentReady Event in Business Central.
ms.custom: na
ms.date: 03/13/2023
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: nhsejth
---

# OnAfterDocumentReady Event

This article describes the syntax of the OnAfterDocumentReady event and the attributes of the report payload.

## Usage

Use the OnAfterDocumentReady event to specify what happens when the user has generated a report artifact by stream or file, from code or a request page action. The `OnAfterDocumentReady` event is used to enable document patching scenarios in the application or to copy the artifact to a different location during testing.

The event input is the report ID, a JSON collection with report runtime information and the generated document in an InStream. Use the `documenttype` JSON property to identify the data type stored in the `DocumentStream` parameter and act accordingly. The final result must be written to the `TargetStream` parameter and the parameter `Success` must be set to `true` if the modified stream is to be used in the platform. The content in the `TargetStream` will be discarded if the `Success` parameter is `false` upon return from the procedure.

Notice that it's not allowed to change the content type.

## Publisher

Codeunit **44 ReportManagement**.

## Raised

When the report runtime has generated an output artifact that can be persisted. This can occur when the application runs a SaveAs method, the user invokes one of the SendTo actions in the report request page or when the document is being printed using an extension printer or by using the web client print capability.

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

A stream object that contains the generated artifact. The actual data type can be found from the MIME type in the report payload document.

### *TargetStream*

Type: [OutStream](methods-auto/outstream/outstream-data-type.md)

Target stream that must contain the modified artifact if the application code handles the object and returns `success = true`.

### *Success*

Type: [Boolean](methods-auto/boolean/boolean-data-type.md)

Specifies whether the extension handled the generated artifact successfully.

[!INCLUDE[report_payload_md](includes/report_payload.md)]

## Sample code

Subscribe to the standard event in codeunit ReportManagement. This sample saves the JSON payload to a text file and copies the document stream content to the target stream.

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterDocumentReady', '', true, true)]
local procedure OnAfterDocumentReady(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var TargetStream: OutStream; var Success: Boolean)
var
    JsonText: Text;
    JsonFile: File;
    mimeType: Text;
    ReportIntentJson: JsonToken;
    ReportIntentTxt: Text;
    SharedDocumentStream: InStream;
begin
    // Honor the standard handle pattern
    if Success = true then
        exit;

    // Empty stream, no actions possible on the stream so return immediately
    if DocumentStream.Length < 1 then
        exit;

    // Use a shared stream and reset the read pointer to beginning of stream
    SharedDocumentStream := DocumentStream;
    if SharedDocumentStream.Position > 1 then
        SharedDocumentStream.ResetPosition();
    
    // Save the report payload in a text file.
    ObjectPayload.WriteTo(JsonText);
    JsonFile.TextMode := true;
    JsonFile.Create('c:\temp\OnAfterDocumentReady.json', TextEncoding::UTF8);
    JsonFile.Write(JsonText);
    JsonFile.Close();

    ObjectPayload.Get('intent', ReportIntentJson);
    ReportIntentTxt := ReportIntentJson.AsValue().AsText();

    case ReportIntentTxt of
        'Save':
            HandleSaveScenario();
        'Download':
            HandleDownloadScenario();
        'Print':
            HandlePrintScenario();
    end;
    
    // do something on the document stream and write it back to the serverr.
    CopyStream(TargetStream, SharedDocumentStream);
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
