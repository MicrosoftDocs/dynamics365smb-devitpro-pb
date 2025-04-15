---
title: "File.ViewFromStream(InStream, Text [, Boolean]) Method"
description: "Opens a file from the server on the client computer in preview mode."
ms.author: solsen
ms.date: 04/15/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# File.ViewFromStream(InStream, Text [, Boolean]) Method
> **Version**: _Available or changed with runtime version 15.0._

Opens a file from the server on the client computer in preview mode. The client computer is defined as the machine running the browser accessing the web client.


## Syntax
```AL
[Ok := ]  File.ViewFromStream(InStream: InStream, FileName: Text [, AllowDownloadAndPrint: Boolean])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
An InStream that you want to use to send the data in a file on the Business Central server to be previewed on the client computer.  

*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the file that will be viewed in the client.  

*[Optional] AllowDownloadAndPrint*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Whether to allow the user to download or print the file from the client or not.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the viewer was opened on the client; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This method works only in Business Central on-premises environments and supports PDF files. For online environments, use [File.View](file-view-method.md).  

## Example

This example shows how to use the `File.ViewFromStream` method to preview the **Customer - Top 10 List** report as a PDF file embedded in the client UI.

```al
procedure ShowTop10CustomersReport()
var
    TempBlob: Codeunit "Temp Blob";
    MyInStream: InStream;
    MyOutStream: OutStream;
    FileName: Text;
    Success: Boolean;
    RecRef: RecordRef; // Declare a RecordRef variable
begin
    // Define the file name for the PDF
    FileName := 'Top10Customers.pdf';

    // Save the "Customer - Top 10 List" report as a PDF in the TempBlob
    TempBlob.CreateOutStream(MyOutStream);
    if not Report.SaveAs(Report::"Customer - Top 10 List", '', ReportFormat::Pdf, MyOutStream, RecRef) then
        Error('Failed to generate the Top 10 Customers report.');

    // Create an InStream from the TempBlob
    TempBlob.CreateInStream(MyInStream);

    // Display the PDF using File.ViewFromStream
    Success := File.ViewFromStream(MyInStream, FileName, true);

    // Handle the case where the PDF could not be displayed
    if not Success then
        Error('Failed to display the Top 10 Customers report.');
end;
```

> [!TIP]  
> The base application uses this method in areas such as viewing PDF attachments on documents, including sales orders, customers, and items. Learn more in the [Microsoft.Foundation.Attachment reference](/dynamics365/business-central/application/base-application/table/microsoft.foundation.attachment.document-attachment).  

## Related information
[File data type](file-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)