---
title: "OnPreRendering (Report) trigger"
description: "Runs when a report dataset has been finalized and before the output artifact has been rendered."
ms.author: solsen
ms.date: 08/08/2025
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

The trigger collects information needed for performing the following operations :

- Attach document for PDF targets
- Append other documents to the current output artifact
- Protect the output artifact with user and admin passwords.

You add code to the trigger to specify the output modifications you want&mdash;attach, additional documents, or protect&mdash;according to the [report rendering payload schema](../../devenv-post-process-report-pdf.md#report-rendering-payload-schema-definition).

The trigger collects report rendering data in a JSON payload. It doesn't invoke processing instructions directly. Instead, it builds the JSON object with a list of attached and appended files, and user or admin passwords. The platform uses this payload to apply the requested changes to the report PDF output.

Learn more in [Attach files, append, and protect report PDFs in AL](../../devenv-post-process-report-pdf.md).

## Example

> [!NOTE]
>  The capability in described in this article works with both [!INCLUDE [prod_short](includes/prod_short.md)] online and on-premises. However, some parts of this example apply to on-premises only. For more detailed examples, go to [Business Central Tech Samples on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/ReportTech/PdfAttachments).
>
> Sample code that shows how use the `OnPreRendering` report trigger to manage PDF attachments for electronic invoicing in [!INCLUDE [prod_short](../../includes/prod_short.md)] is available in the [BCTech](https://github.com/microsoft/BCTech/tree/master/samples/ReportTech/PdfAttachments) repository.

The following AL code example create a report extension object that modifies the **Customer - List** report PDF output to include an attached file and append it with the **Customer - Top 10 List** report. In the OnPreRendering trigger of the report extension, the code:

- Adds a version number to the rendering payload.
- Creates a sample XML file and attaches it as a file to the report's PDF output.

  To view the attachment in the rendered PDF, select **Send to** > **PDF** on the report request page, download the PDF, and open it in a PDF viewer like Adobe Reader.
- Generates a PDF file of the **Customer - Top 10 List** report and appends it to the main report output as an additional document.

  To observe the **Customer - Top 10 List** report in the rendered PDF, select any of these actions from the request page: **Send to PDF**, **Preview**, **Print**.
- Adds password protection information to the rendering payload.

  To test the password on the rendered PDF, use the **Send to PDF** action from the request page and open downloaded file.

The code uses AL's `JsonObject` and `JsonArray` types to build the JSON payload for the report rendering engine. The output includes attachments, additional documents, and protection settings.

```AL
reportextension 50136 MyCustRepExtension extends "Customer - List"
{
    dataset
    {
    }

    requestpage
    {
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = Word;
            LayoutFile = 'mycustlayout.docx';
        }
    }

    trigger OnPreRendering(var RenderingPayload: JsonObject)
    var
        Name: Text;
        FileName: Text;
        ProtectionObj: JsonObject;
        AttachmentsArray: JsonArray;
        AttachmentObj: JsonObject;
        AdditionalDocumentsArray: JsonArray;
        AdditionalDocObj: JsonObject;
        Top10PdfFile: Text;
    begin
        RenderingPayload.Add('version', '1.0.0.0');

        // Create a simple attachment object
        Name := 'sample-attachment.xml';
        FileName := CreateXmlFile(Name, 'This is a sample xml file');
        AttachmentObj.Add('name', Name);
        AttachmentObj.Add('filename', FileName);
        AttachmentObj.Add('description', 'This is a sample xml document');
        AttachmentObj.Add('relationship', 'Data');
        AttachmentObj.Add('mimetype', 'text/xml');
        // Add the attachment object to rendering payload
        AttachmentsArray.Add(AttachmentObj);
        RenderingPayload.Add('attachments', AttachmentsArray);

        // Create PDF of Customer - Top 10 List report for appending 
        Top10PdfFile := CreatePdfFile('CustomerTop10.pdf', '');
        // Add PDF to rendering payload  
        AdditionalDocumentsArray.Add(Top10PdfFile);
        RenderingPayload.Add('additionalDocuments', AdditionalDocumentsArray);

        // Create the protection object with user password
        ProtectionObj.Add('user', 'UserPasswordHere');
        // Add protection object to rendering payload
        RenderingPayload.Add('protection', ProtectionObj);
    end;

    local procedure CreatePdfFile(Filename: Text; Content: Text) FilePath: Text
    begin
        FilePath := System.TemporaryPath + Filename;
        Report.SaveAsPdf(Report::"Customer - Top 10 List", FilePath);
    end;

    local procedure CreateXmlFile(Filename: Text; Content: Text) FilePath: Text
    var
        FileObject: File;
        OutStream: OutStream;
    begin
        FilePath := System.TemporaryPath + Filename;
        FileObject.TextMode := true;
        FileObject.Create(FilePath);
        FileObject.CreateOutStream(OutStream);
        OutStream.WriteText('<?xml version="1.0" encoding="utf-8" standalone="yes"?>');
        OutStream.WriteText('<root><test>');
        OutStream.WriteText(Content);
        OutStream.WriteText('</test></root>');
    end;
}
```

## Related information

[OnInitReport (report) trigger](devenv-oninitreport-report-trigger.md)  
[OnPreReport (report) trigger](devenv-onprereport-report-trigger.md)  
[OnPostReport (report) trigger](devenv-onpostreport-report-trigger.md)  
[Report triggers and runtime operations](../../devenv-report-triggers.md)  
[Get started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)  
