---
title: "File.View(Text [, Boolean]) Method"
description: "Opens a file from server computer on the client computer in preview mode."
ms.author: solsen
ms.date: 04/15/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# File.View(Text [, Boolean]) Method
> **Version**: _Available or changed with runtime version 15.0._

Opens a file from server computer on the client computer in preview mode. The client computer is the computer that is running the browser that accesses the web client.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
[Ok := ]  File.View(FromFile: Text [, AllowDownloadAndPrint: Boolean])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*FromFile*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the file on the server that you want to preview on the client computer.  

*[Optional] AllowDownloadAndPrint*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Whether to allow the user to download or print the file from the client or not.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the viewer was opened on the client; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

This example shows how to use the `File.View` method to preview the **Customer - Top 10 List** report as a PDF file embedded in the client UI.

```al
procedure ShowTop10CustomersReport()
var
    TempBlob: Codeunit "Temp Blob";
    OutStream: OutStream;
    InStream: InStream;
    FileName: Text;
    Success: Boolean;
begin
    // Define the file name for the PDF
    FileName := 'Top10Customers.pdf';

    // Save the "Customer - Top 10 List" report as a PDF in the TempBlob
    TempBlob.CreateOutStream(OutStream);
    if not Report.SaveAs(Report::"Customer - Top 10 List", '', ReportFormat::Pdf, OutStream) then
        Error('Failed to generate the Top 10 Customers report.');

    // Create an InStream from the TempBlob
    TempBlob.CreateInStream(InStream);

    // Display the PDF using File.ViewFromStream
    Success := File.ViewFromStream(InStream, FileName, true);

    // Handle the case where the PDF could not be displayed
    if not Success then
        Error('Failed to display the Top 10 Customers report.');
end;
```

## Related information
[File data type](file-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)