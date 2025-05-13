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

OnPreRendering is a data collection trigger only, and will not invoke the processing instructions directly, but only build the Json object with a list of files to append or embed, and user/admin passwords. The platform will apply these values in the right context and ensure that files passed to the trigger are properly cleaned up afterwards. 

- Embed:

   Applied when the report is saving an artifact (running SaveAsXX). Embedding documents does not apply to print / preview scenarios as the embedded files do not appear in the user facing pages. When the Json property primaryDocument has been set and the saveformat is specified as Einvoice, this attachment will be promoted to the Alternative representation of the master pdf document (invoice type) and will be added to the XMP pdf metadata for identification in electronic payment systems. The relationship type will be set according to the Json properties given when the attachment was defined (should be Alternative for the primary document and Data for other).

- Append

   Applied to actions that show user facing versions of the artifact (print/preview) as the user can print to completed document like the end-user will set it.

- Protect

   Applied to save and browser print scenarios. Documents that are scheduled for universal print will not be protected in the standard setup but will be protected if universal print fails and downloads to the web client print local print.

   Printing a protected document requires that the user enters the given user password. The password is used when users choose the **Print to PDF** priner option to store the document locally.

This trigger is supported on report and report extension objects.

## RenderingPayload

The rendering payload has metadata for the files to embed and append, and passwords that protect the files. The payload includes several attributes and properties with the following structure.

```json
{
  "$schema": "http://json-schema.org/draft-04/schema#",
  "description": "",
  "type": "object",
  "properties": {
    "version": {
      "type": "string",
      "minLength": 1
    },
    "saveformat": {
      "type": "string",
      "enum": [ "Default", "PdfA3B", "Einvoice" ]
    },
    "primaryDocument": {
      "type": "string",
      "minLength": 1
    },
    "attachments": {
      "type": "array",
      "uniqueItems": true,
      "minItems": 0,
      "items": {
        "required": [
          "name",
          "description",
          "relationship",
          "mimetype",
          "filename"
        ],
        "properties": {
          "name": {
            "type": "string",
            "minLength": 1
          },
          "description": {
            "type": "string",
            "minLength": 1
          },
          "relationship": {
            "type": "string",
            "enum": [ "Source", "Data", "Alternative", "Supplement", "Unspecified" ]
          },
          "mimetype": {
            "type": "string",
            "minLength": 1
          },
          "filename": {
            "type": "string",
            "minLength": 1
          }
        }
      }
    },
    "additionalDocuments": {
      "type": "array",
      "items": {
        "type": "string"
      }
    },
    "protection": {
      "type": "object",
      "properties": {
        "user": {
          "type": "string",
          "minLength": 0
        },
        "admin": {
          "type": "string",
          "minLength": 0
        }
      },
      "required": [
        "user",
        "admin"
      ]
    }
  },
  "required": [
    "version",
    "saveformat",
    "attachments",
    "additionalDocuments",
    "protection"
  ]
}
```

### Properties

The following table describes property keys of the json schema.

|Property|Description|
|-|-|
|version|Json schema version using the standard version format X.X.X.X|
|saveformat|Defines the final pdf file format to be one of the following values:<ul><li>Default (leave as is )<\li><li>PdfA3B – Convert to pure PDF/A-3B.<\li><li>Einvoice – Convert to PDF/A-3B and add the xmp metadata for CrossIndustryDocument/invoice compliance. <\li><\ul>|
|primaryDocument|The name of the document represents the alternative version of the user facing pdf (this is the invoicing xml document). This document will be added to the xmp metadata as the DocumentFileName|
|attachments| List of attachments as a json array|
|attachments\name|	Attachment name that will be stored in the pdf embedding.|
|attachments\description|Descriptive text for this attachment.|
|attachments\relationship|Relationship type according to the Adobe Pdf standard (use the enum type given in the sample extension).|
|attachments\mimetype|The attachment mimetype. The alternative invoice must be of type text\xml|
|attachments\filename|The filename that will point to the object to be attached (the server will delete the file when the operation is complete).|
|additionalDocuments|List of pdf files to append to the resulting document.
protection	Contains the optional document passwords.| 
|protection\user|Defines the user password that is required to open the document.|
|protection\admin.|Defines the admin password that gives full access to the document. Notice that if this element is empty, the platform will apply the user password to this field|

## Related information

[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  