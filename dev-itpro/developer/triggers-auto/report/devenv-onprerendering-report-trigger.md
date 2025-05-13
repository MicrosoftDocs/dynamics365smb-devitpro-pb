---
title: "OnPreRendering (Report) trigger"
description: "Runs when a report dataset has been finalized and before the output artifact has been rendered."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)

# OnPreRendering (Report) trigger
> **Version**: _Available or changed with runtime version 15.0._

Runs when a report dataset has been finalized and before the output artifact has been rendered.


## Syntax
```AL
trigger OnPreRendering(var RenderingPayload: JsonObject)
begin
    ...
end;
```

### Parameters

*RenderingPayload*  
&emsp;Type: [JsonObject](../../methods-auto/jsonobject/jsonobject-data-type.md)  
The JSON object containing post rendering setup which will be applied by the runtime during artifact rendering.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `OnPreRendering trigger` runs after the `OnPreDataItem` trigger for last dataitem and before `OnPostReport`trigger.

The trigger collects information needed for performing the following operations:

- Attach document for PDF targets
- Append other documents to the current output artifact
- Protect the output artifact with user and admin passwords.

Collected data is returned to the platform, which then applies the necessary actions depending on the current scenario:  

- Embed:

   Applied when the report is saving an artifact (running SaveAsXX). Embedding documents does not apply to print / preview scenarios as the embedded files do not appear in the user facing pages. When the Json property primaryDocument has been set and the saveformat is specified as Einvoice, this attachment will be promoted to the Alternative representation of the master pdf document (invoice type) and will be added to the XMP pdf metadata for identification in electronic payment systems. The relationship type will be set according to the Json properties given when the attachment was defined (should be Alternative for the primary document and Data for other).

- Append

   Applied to actions that show user facing versions of the artifact (print/preview) as the user can print to completed document like the end-user will set it.

- Protect

   Applied to save and browser print scenarios. Documents that are scheduled for universal print will not be protected in the standard setup but will be protected if universal print fails and downloads to the web client print local print.

   Printing a protected document requires that the user enters the given user password. The password is used when users choose the **Print to PDF** priner option to store the document locally.



The trigger scope is related to current REGF and E-invoicing requirements for embedded documents, additional files and protection

## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  