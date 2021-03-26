---
title: "File.Download Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# File.Download Method
> **Version**: _Available or changed with runtime version 1.0._

Sends a file from a server computer to the client computer. The client computer is the computer that is running the Windows client or the computer that is running a browser that accesses the web client.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  File.Download(FromFile: String, DialogTitle: String, ToFolder: String, ToFilter: String, var ToFile: Text)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*FromFile*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the file on the server computer that you want to download to the client computer.
        
*DialogTitle*  
&emsp;Type: [String](../string/string-data-type.md)  
The title that you want to display in the dialog box for downloading the file. This parameter is not supported by the web client. The title is determined by the end-user's browser.
          
*ToFolder*  
&emsp;Type: [String](../string/string-data-type.md)  
The default folder in which to save the file to be downloaded. The folder name is displayed in the dialog box for downloading the file. The folder can be changed by the user. This parameter is not supported by the web client. By default, the files are saved to the default download location that is configured in the end-user's browser.
          
*ToFilter*  
&emsp;Type: [String](../string/string-data-type.md)  
The type of file that can be downloaded to the client computer. The type is displayed in the dialog box for downloading the file. This parameter is not supported by the web client.
          
*ToFile*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name to give the downloaded file. This is the default file name that is shown in the dialog box for downloading the file. This value can be changed by the user.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

<!-- This method is not fully supported by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)] on devices that run Apple iOS, such as iPad.-->

> [!NOTE]  
> On devices that run Apple iOS, such as iPad, you can only download a file if the Apple iOS device on which you are downloading the file has an application which supports the file type.  

Files are saved to the default download location that is configured in the end-user's browser.

The business logic is run on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not on the client. Files are created on the computer that is running [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not locally on the client computer.  

[Upload Method \(File\)](../../methods-auto/file/file-upload-method.md) and [UploadIntoStream Method \(File\)](../../methods-auto/file/file-uploadintostream-method.md) are used to send a file from the client to a [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance.  

[Download Method \(File\)](../../methods-auto/file/file-download-method.md) and [DownloadFromStream Method \(File\)](../../methods-auto/file/file-downloadfromstream-method.md) are used to send a file from a [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] instance to the client.  

We recommend that you use the methods in codeunit **419 File Management** to upload and download files. 

[!INCLUDE[multi_file_download_web_client](../../includes/multi_file_download_web_client.md)]

## Example

This example shows how to use the Download method.

```al
 var
    ToFile: Text;
begin
    ToFile := 'ToFile.txt';  
    Download('FromFile.txt','Download file','C:\','Text file(*.txt)|*.txt',ToFile);  
end;
```  


## See Also

[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)