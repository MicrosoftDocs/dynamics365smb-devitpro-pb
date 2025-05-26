---
title: Attach Files, Append, and Protect Report PDFs with AL
description: Learn to attach files, append PDFs, and password protect report PDFs in AL. Follow best practices for compliance and secure document handling.
author: jswymer
ms.custom: bap-template
ms.date: 05/26/2025
ms.reviewer: jswymer
ms.topic: how-to
ms.author: jswymer
---

# Attach files, append, and protect report PDFs using AL

This aricles explains how AL developers can enhance the PDF output when a report is saved/downloaed, previewed, or printed. Using AL, you can make the following modifications to the report PDF output:

- **Attach files:** Add files as attachments that are embedded in the report PDF output. The attachements show in the **Attachments** side panel in PDF reader. The attachments appear in the **Attachments** side panel in the PDF reader. You can attach different file formats like images, PDFs, Word documents, Excel spreadsheets, and multimedia files.
- **Append with other PDF documents:** Add other PDF documents to the end of the report PDF to create a single PDF.
- **Protect with passwords:** Protect the report PDF by setting user and admin passwords needed to open the file.

These capabilities are designed to support requirements such as e-invoicing and regulatory requirements for embedded documents, additional files, and document protection.

## How it works

This functionality is enabled by the `OnPreRendering` trigger, which runs after the last data item trigger and before `OnPostReport`. Learn where the trigger is with respect to other report trigger in [Report Triggers and Runtime Operations](devenv-report-triggers.md#overall-report-trigger-and-operations) in the report triggers.

The `OnPreRendering` trigger is available on report and report extension objects and has the following syntax:

```al
trigger OnPreRendering(var RenderingPayload: JsonObject)
begin
    //Code to build the report payload json
end;
```

The trigger collects report rendering data in a JSON payload, which the platform processes to apply the requested modifications to the report PDF output. The platform uses this payload to apply the requested modifications to the report PDF output. Add code to the trigger to specify the output modifications you want&mdash;attach, append, or password-protect&mdash;according to the [report rendering payload schema](#report-rendering-payload-schema-definition).


### Action Matrix

| Intent/Action      | Embed | Append | Protect |
|--------------------|:-----:|:------:|:-------:|
| Save               |   X   |   X    |    X    |
| Schedule           |   -   |   -    |    -    |
| Preview            |   -   |   X    |    -    |
| Print (universal)  |   -   |   X    |    -    |
| Print (browser)    |   -   |   X    |    X    |

The collected data is returned to the platform, which applies the necessary actions based on the scenario:

- **Attach:** Applied when saving an artifact (using SaveAsXX). Embedding does not apply to print/preview scenarios, as embedded files do not appear in user-facing pages. If the JSON property `primaryDocument` is set and `saveformat` is **Einvoice**, this attachment is promoted to the alternative representation of the master PDF document and added to the XMP PDF metadata for identification in electronic payment systems. The relationship type is set according to the JSON properties (Alternative for the primary document, Data for others).
- **Append:** Applied to actions that show user-facing versions of the artifact (print/preview), allowing users to print the completed document as they see it.
- **Protect:** Applied to save and browser print scenarios. Documents scheduled for universal print are not protected by default, but will be protected if universal print fails and downloads to the web client for local print.

   > [!NOTE]
   > Printing a protected document requires the user password. Browser print does not support password-protected PDFs. 

> Notice that printing a protected document requires that the user enters the given user password. This is needed as you can print to a “Print to Pdf” printer that will store the document locally. The Current PdfPrint support in the WebClient does not support password protected documents and will not render the print page (tracked by *[Bug 568351: W1 2025 - Bug Bash III: Browser print of a password protected pdf stream does not show a print window with password request](https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_workitems/edit/568351).*)

## Action Overview

| **Intent/Action**     | **Embed** | **Append** | **Protect** |
|-----------------------|-----------|------------|-------------|
| **Save**              | X         | X          | X           |
| **Schedule**          | -         | -          | -           |
| **Preview**           | -         | X          | -           |
| **Print (universal)** | -         | X          | -           |
| **Print (browser)**   | -         | X          | X           |


The rendering schema is defined in section Report Rendering Payload Schema Definition on page [2](#_Ref189494529).  
OnPreRendering is a data collection trigger only, and will not invoke the processing instructions directly, but only build the Json object with a list of files to append or embed, and user/admin passwords. The platform will apply these values in the right context and ensure that files passed to the trigger are properly cleaned up afterwards.

### Sample usage

Code sample has been implemented in TestSuite.PdfAttachment that can be found in ‘Apps\Platform\Reporting[\TestSuite.PdfAttachments’](https://dynamicssmb2.visualstudio.com/Dynamics%20SMB/_git/Platform-Core?path=/Apps/Platform/Reporting/TestSuite.PdfAttachments) in the Platform-Core ADO repository.

There is a standalone test report and a report extension on the Standard Sales Invoice.

The sample code configures the ReportRenderingCompleteHandler[^1] codeunit in the OnPreReport and OnPreRendering triggers, and support append, attach and protect. The files that are embedded and appended are created on the fly by helper code.

### Report Instance Properties

*ReportTarget: ReportFormat,*

where ReportFormat is the built-in type defining output file formats (pdf, Word,…)  
This property will allow the AL developer to determine the current output format in any trigger following the request page (the last place the user can change).

##  Limitations and known issues

- **Attachment file size:** The maximum attachment file size is limited to 100 MB per attachment[^2].
- **Pdf/A compliance:** Conversion to PDF/A isn't fully functional because of problems in the Non-Microsoft component that it uses. The file is converted but fails compliance validation due to lack of font substitution and internal data structure.
- Browser print doesn't support password-protected PDFs.

## Runtime flow chart snippet

[ReportTriggers.vsdx](https://microsofteur-my.sharepoint.com/:u:/g/personal/nhsejth_microsoft_com/ESn6T_RL47xOipe9fZJmhBkBOzK7faQkQJh-9kzvZJa-jw)


## Report rendering payload schema definition

```json
{
  "\$schema": "http://json-schema.org/draft-04/schema#",
  "description": "",
  "type": "object",
  "properties": {
    "version": {
      "type": "string",
      "minLength": 1
    },
    "saveformat": {
      "type": "string",
      "enum": \[ "Default", "PdfA3B", "Einvoice" \]
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
        "required": \[
          "name",
          "description",
          "relationship",
          "mimetype",
          "filename"
        \],
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
            "enum": \[ "Source", "Data", "Alternative", "Supplement",
"Unspecified" \]
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
      "required": \[
        "user",
        "admin"
      \]
    }
  },
  "required": \[
    "version",
    "saveformat",
    "attachments",
    "additionalDocuments",
    "protection"
  \]
}
```

## Element definitions

| Json element| Documentation|
|-|-|
| version| Json schema version using the standard version format X.X.X.X      |
| saveformat               | Defines the final pdf file format to be one of the following values:<br>- Default (leave as is )<br>- PdfA3B – Convert to pure PDF/A-3B.<br>- Einvoice – Convert to PDF/A-3B and add the xmp metadata for CrossIndustryDocument/invoice compliance. |
| primaryDocument          | The name of the document represents the alternative version of the user facing pdf (this is the invoicing xml document). This document will be added to the xmp metadata as the DocumentFileName|
| attachments              | List of attachments as a json array              |
| attachments\name         | Attachment name that will be stored in the pdf embedding.          |
| attachments\description  | Descriptive text for this attachment.            |
| attachments\relationship | Relationship type according to the Adobe Pdf standard (use the enum type given in the sample extension).                 |
| attachments\mimetype     | The attachment mimetype. The alternative invoice must be of type text\xml            |
| attachments\filename     | The filename that will point to the object to be attached (the server will delete the file when the operation is complete).                |
| additionalDocuments      | List of pdf files to append to the resulting document.             |
| protection               | Contains the optional document passwords.        |
| protection\user          | Defines the user password that is required to open the document.   |
| protection\admin         | Defines the admin password that gives full access to the document. Notice that if this element is empty, the platform will apply the user password to this field.           |

## Data Type definitions

### PdfAttachmentDataRelationShip Data Type - \<enum\>

/// \<summary\>

/// Enum for the relationship between the attachment and the data.

/// Factur-X Version 1.07.2 (ZUGFeRD v. 2.3.2) \| November 15th, 2024,
section 6.2.2 Data relationship

/// \</summary\>

enum 50950 PdfAttachmentDataRelationShip

{

    Extensible = true;

    /// \<summary\>

    /// The embedded file contains data which is used for the visual
representation in the PDF part,

    /// e.g. for a table or a graph.

    /// \</summary\>

    value(0; Data)

    {

    }

    /// \<summary\>

    /// The embedded file contains the source data for the visual
representation derived therefrom in

    /// the PDF part, e.g. a PDF file created via an XSL transformation
from an (embedded) XML source file or the

    /// MS Word file from which the PDF file was created.

    /// \</summary\>    

    value(1; Source)

    {

    }

    /// \<summary\>

    /// This data relationship should be used if the embedded data are
an alternative

    /// representation of the PDF contents.

    /// \</summary\>

    value(2; Alternative)

    {

    }

    /// \<summary\>

    /// This data relationship is used if the embedded file serves
neither as the source nor as

    /// the alternative representation, but the file contains additional
information, e.g. on easier automatic

    /// processing.

    /// \</summary\>

    value(3; Supplement)

    {

    }

    /// \<summary\>

    /// This data relationship term applies where none of the data
relationships above

    /// apply, or where there is an unknown data relationship.

    /// \</summary\>  

    value(4; Unspecified)

    {

    }

}

###  Pdf Save Format Data Type - \<enum\>

/// \<summary\>

/// Enum for the PDf formats that can be used.

/// Factur-X Version 1.07.2 (ZUGFeRD v. 2.3.2) \| November 15th, 2024,
section 6.2.2 Data relationship

/// TODO: Replace standard reference with the Adope PDF v2.0 reference
move this file to system app.

/// \</summary\>

enum 50951 PdfSaveFormat

{

    Extensible = false;

    /// \<summary\>

    /// Save the PDF in the default format (traditionally PDF version
1.7). Platform will decide the PDF version.

    /// \</summary\>

    value(0; Default)

    {

    }

    /// \<summary\>

    /// Save the PDF in the PDF/A-3B format. This will not update the
embedded XMP metadata.

    /// \</summary\>

    value(1; PdfA3B)

    {

    }

    /// \<summary\>

    /// Save the PDF in the PDF/A-3B format and add the embedded XMP
metadata required by E-Invoice standards

/// like ZUGFeRD/Facturec.

    /// \</summary\>

    value(2; Einvoice)

    {

    }

}

## Sample Json document

{

    "version": "1.0",

    "saveformat": "Einvoice",

    "primaryDocument": "factur-x.xml",

    "attachments": \[

        {

            "name": "Attachment1.pdf",

            "description": "This is attachment 1",

            "relationship": "Data",

            "mimetype": "application/pdf",

            "filename": "DIR\\Attachment1.pdf"

        },

        {

            "name": "Attachment2.pdf",

            "description": "This is attachment 2",

            "relationship": "Data",

            "mimetype": "application/pdf",

            "filename": "DIR\\Attachment2.pdf"

        },

        {

            "name": "factur-x.xml",

            "description": "This is the e-invoicing xml document",

            "relationship": "Alternative",

            "mimetype": "text/xml",

            "filename": "DIR\\factur-x.xml"

        }

    \],

    "additionalDocuments": \[

        "DIR\\LegalDocumentToAppend1.pdf",

        "DIR\\LegalDocumentToAppend2.pdf"

    \],

    "protection": {

        "user": "userPassword",

        "admin": "adminPassword"

    }

}

[^1]: This codeunit is the suggested implementation that guarantees that the rendering payload Json object contains the correct elements and properties.

[^2]: 100MB is a suggested limitation for documentation purposes. It's not yet enforced by platform but the size has to be limited for performance reasons (memory footprint can be an issue).
