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

## Remarks

This method works only in Business Central on-premises environments. For online environments, use [File.ViewFromStream](file-viewfromstream-method.md).  

## Example

This example shows how to use the `File.View` method to preview a file that resides on the Business Central server on the client computer.

```al
procedure ViewServerFileOnClient()
var
    ServerFileName: Text;
    Success: Boolean;
begin
    // Full path to a file that exists on the Business Central server computer
    ServerFileName := 'C:\Temp\Top10Customers.pdf';

    // Open the file on the client computer in preview mode,
    // allowing the user to download and print it
    Success := File.View(ServerFileName, true);

    // Handle the case where the file could not be displayed
    if not Success then
        Error('Failed to display the file.');
end;
```

> [!TIP]  
> The base application uses this method to view PDF attachments on documents like sales orders, items, and more. Learn more in the [Microsoft.Foundation.Attachment reference](/dynamics365/business-central/application/base-application/table/microsoft.foundation.attachment.document-attachment).

[File data type](file-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)
