---
title: "File.DownloadFromStream Method"
description: "Sends a file from server computer to the client computer. The client computer is the computer that is running the Windows client or the computer that is running the browser that accesses the web client."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# File.DownloadFromStream Method
> **Version**: _Available or changed with runtime version 1.0._

Sends a file from server computer to the client computer. The client computer is the computer that is running the Windows client or the computer that is running the browser that accesses the web client.


## Syntax
```
[Ok := ]  File.DownloadFromStream(InStream: InStream, DialogTitle: String, ToFolder: String, ToFilter: String, var ToFile: Text)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
An InStream that you want to use to send the data in a file on Business Central Server to a file on the client computer.
        
*DialogTitle*  
&emsp;Type: [String](../string/string-data-type.md)  
The title that you want to display in the dialog box for downloading the file. This parameter is not supported by the web client. The title is determined by the end-user's browser.
          
*ToFolder*  
&emsp;Type: [String](../string/string-data-type.md)  
The default folder in which to save the file to be downloaded. The folder name is displayed in the dialog box for downloading the file. The folder can be changed by the user. This parameter is not supported by the web client. By default, files are saved to the default download location that is configured in the end-user's browser.
          
*ToFilter*  
&emsp;Type: [String](../string/string-data-type.md)  
The type of file that can be downloaded to the client computer. The type is displayed in the dialog box for downloading the file. This parameter is not supported by the web client.
          
*ToFile*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name to give the downloaded file. This is the default file name that is shown in the dialog box for downloading the file. This value, can be changed by the user.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

<!-- This method is not fully supported by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] on devices that run Apple iOS, such as iPad.--> 

> [!NOTE]  
> On devices that run Apple iOS, such as iPad, you can only download a file if the Apple iOS device on which you are downloading the file has an application that supports the file type.  

The business logic runs on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not on the client. Files are created on a [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] service and not locally on the client computer. When you write code, you must consider where files are created.  

Use [Upload Method \(File\)](../../methods-auto/file/file-upload-method.md) and [UploadIntoStream Method \(File\)](../../methods-auto/file/file-uploadintostream-method.md) to send a file from a client to a [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance.  

Use [Download Method \(File\)](../../methods-auto/file/file-download-method.md) and [DownloadFromStream Method \(File\)](../../methods-auto/file/file-downloadfromstream-method.md) to send a file from a [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance to a client.  

We recommend that you use the methods in codeunit **419 File Management** to upload and download files.

[!INCLUDE[multi_file_download_web_client](../../includes/multi_file_download_web_client.md)]

## Example  

```al
 var
    TempFile: File;
    NewStream: InsTream;
    ToFileName: Variant;
begin  
    TempFile.CreateTempFile();  
    TempFile.Write('abc');  
    TempFile.CreateInStream(NewStream);  
    ToFileName := 'SampleFile.txt';  
    DownloadFromStream(NewStream,'Export','','All Files (*.*)|*.*',ToFileName);
end;
```  


## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)