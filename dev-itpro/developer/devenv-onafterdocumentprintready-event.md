---
title: "OnAfterDocumentPrintReady Event"
description: Describe the OnAfterDocumentPrintReady Event in Business Central.  
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: jswymer
---
# OnAfterDocumentPrintReady Event

This article describes the syntax of the OnAfterDocumentPrintReady event and the attributes of the report payload.

## Usage

Use the OnAfterDocumentSetupPrinters event to specify what happens when the user selects the **Print** action on a report request page. The `OnAfterDocumentPrintReady` event is used to send a report to a target extension printer. For more information about subscribing to this event, see [Developing Printer Extensions Overview](devenv-reports-printing.md). 

## Publisher

Codeunit **44 ReportManagement**.

## Raised

When a user selects the print action on a report request page

## Syntax

```AL
IntegrationEvent(false, false)]
local procedure OnAfterDocumentPrintReady(ObjectType: Option "Report","Page"; ObjectId: Integer; ObjectPayload: JsonObject; DocumentStream: InStream; var Success: Boolean);
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
  
## See Also

[Working With and Troubleshooting Payloads](devenv-reports-troubleshoot-printing.md)  
[Developing Printer Extensions Overview](devenv-reports-printing.md)  
[Creating a Printer Extension](devenv-reports-create-printer-extension.md)  
[Events in AL](devenv-events-in-al.md)   
[Publishing Events](devenv-publishing-events.md)   
[Raising Events](devenv-raising-events.md)   
[Subscribing to Events](devenv-subscribing-to-events.md)  