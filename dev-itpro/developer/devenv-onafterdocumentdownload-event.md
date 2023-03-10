---
title: "OnAfterDocumentDownload Event"
description: Describe the OnAfterDocumentDownload Event in Business Central.
ms.custom: na
ms.date: 01/26/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---

# OnAfterDocumentDownload Event

This article describes the syntax of the OnAfterDocumentDownload event and the attributes of the report payload.

## Usage

Use the OnAfterDocumentDownload event to specify what happens when the user has generated a report artifact by stream or file, from code or a request page action. The `OnAfterDocumentDownload` event is used to enable document patching scenarios in the application.

## Publisher

Codeunit **44 ReportManagement**.

## Raised

When the report runtime has generated an output artifact which is going to be downloaded to a UI client. This can occur when the user invokes one of the SendTo actions in the report request page or when the document is being printed using the client print capability.

## Syntax

```AL
[IntegrationEvent(false, false)]
local procedure OnAfterDocumentDownload(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean)
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

### *Success*

Type: [Boolean](methods-auto/boolean/boolean-data-type.md)

Specifies whether the extension handled the generated artifact successfully. The document will not be downloaded to the client if the application code handles the artifact and sets the *Success* parameter to true.

[!INCLUDE[report_payload_md](includes/report_payload.md)]

## Sample code

Save the JSON payload to text file in the temporary folder and save the report artifact to a file. Skip the client download by setting `Success` to `true`.

```AL
[EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterDocumentDownload', '', true, true)]
local procedure OnAfterDocumentDownload(ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean)
var
    JsonText: Text;
    JsonFile: File;
    ObjectName: JsonToken;
    DocumentTypeParts: List of [Text];
    DocumentType: JsonToken;
    ReportIntentJson: JsonToken;
    ReportIntentTxt: Text;
    FileHandler: File;
    FileContent: OutStream;
    FilePath: Text;
    FileName: Text;
    Extension: Text;
    TempFolderPath: Text;
    SharedDocumentStream: InStream;
begin
    // Honor the standard handle pattern
    if Success = true then
        exit;

    // Empty stream, no actions possible on the stream so return immediatly
    if DocumentStream.Length < 1 then
        exit;

    // Use a shared stream and reset the read pointer to beginning of stream.
    SharedDocumentStream := DocumentStream;
    if SharedDocumentStream.Position > 1 then
        SharedDocumentStream.ResetPosition();
    
    TempFolderPath := System.TemporaryPath;

    ObjectPayload.WriteTo(JsonText);
    JsonFile.TextMode := true;

    JsonFile.Create(TempFolderPath + 'OnAfterDocumentDownload.json', TextEncoding::UTF8);
    JsonFile.Write(JsonText);
    JsonFile.Close();

    ObjectPayload.Get('intent', ReportIntentJson);
    ReportIntentTxt := ReportIntentJson.AsValue().AsText();

    case ReportIntentTxt of
        'Download':
            HandleDownloadScenario();
        'Preview':
            HandlePreviewScenario();
        'Print':
            HandlePrintScenario();
    end;

    ObjectPayload.Get('objectname', ObjectName);
    FileName := ObjectName.AsValue().AsText();

    ObjectPayload.Get('documenttype', DocumentType);
    DocumentTypeParts := DocumentType.AsValue().AsText().Split('/');
    Extension := DocumentTypeParts.Get(DocumentTypeParts.Count);

    FilePath := TempFolderPath + 'DownLoad - ' + FileName + '.' + Extension;
    FileHandler.Create(FilePath);
    FileHandler.CreateOutStream(FileContent);
    CopyStream(FileContent, SharedDocumentStream);
    FileHandler.Close();
    Success := true; // Return true so platform don't attempt to download to client
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
