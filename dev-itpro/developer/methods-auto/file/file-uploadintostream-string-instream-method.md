---
title: "File.UploadIntoStream(String, var InStream) Method"
description: "Sends a file from the client computer to the corresponding server."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# File.UploadIntoStream(String, var InStream) Method
> **Version**: _Available or changed with runtime version 7.0._

Sends a file from the client computer to the corresponding server. The client computer is the computer that is running a browser that accesses the web client.


## Syntax
```AL
[Ok := ]  File.UploadIntoStream(FromFilter: String, var InStream: InStream)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*FromFilter*  
&emsp;Type: [String](../string/string-data-type.md)  
The type of file that can be uploaded to the server. A user can try to upload any file type but an error occurs if the file is not the specified type.
        
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

> [!NOTE]  
> This method is not supported on devices that run Apple iOS, such as iPad. The dialog box for uploading a file displays, but it is turned off and the user cannot select a file.  

The business logic runs on the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not on the client. Files are created on [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not locally on the client computer.  

Use [Upload Method \(File\)](../../methods-auto/file/file-upload-method.md) and [UploadIntoStream Method \(File\)](../../methods-auto/file/file-uploadintostream-string-string-string-text-instream-method.md) to send a file from the client to the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)].  

Use [Download Method \(File\)](../../methods-auto/file/file-download-method.md) and [DownloadFromStream Method \(File\)](../../methods-auto/file/file-downloadfromstream-method.md) to send a file from the  [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] to the client.  

We recommend that you use the methods in codeunit 419, File Management, to upload and download files.  

## Example

```al
codeunit 50100 MyCodeunit
{

    procedure MyProcedure()
    var
        FromFilter: Text;
        NVInStream: InStream;
    begin
        FromFilter := ' All Files (*.*)|*.*';
        UploadIntoStream(FromFilter, NVInStream);
    end;

}
```

## See Also
[File Data Type](file-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)  
