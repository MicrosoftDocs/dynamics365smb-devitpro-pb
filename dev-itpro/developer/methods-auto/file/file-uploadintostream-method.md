---
title: "File.UploadIntoStream Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# File.UploadIntoStream Method
> **Version**: _Available from runtime version 1.0._

Sends a file from the client computer to the corresponding server. The client computer is the computer that is running the Windows client or the computer that is running a browser that accesses the web client.


## Syntax
```
[Ok := ]  File.UploadIntoStream(DialogTitle: String, FromFolder: String, FromFilter: String, var FromFile: Text, var InStream: InStream)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*DialogTitle*  
&emsp;Type: [String](../string/string-data-type.md)  
The text displayed in the title bar of the Open dialog box. This parameter is not supported by the web client. The title is determined by the end-user's browser.
          
*FromFolder*  
&emsp;Type: [String](../string/string-data-type.md)  
The path of the folder that is displayed in the File Open dialog box. This is the default folder, but the user can browse to any available location. This parameter is not supported by the web client. By default, the browser uses the folder that was last accessed.
          
*FromFilter*  
&emsp;Type: [String](../string/string-data-type.md)  
The type of file that can be uploaded to the server. In the Windows client, the type is displayed in the upload dialog box, so the user can only select files of the specified type. For the web client, a user can try to upload any file type but an error occurs if the file is not the specified type.
          
*FromFile*  
&emsp;Type: [Text](../text/text-data-type.md)  
The default file to upload to the service. The name displays in the dialog box for uploading the file. The user can change the file. This parameter is not supported by the web client.
          
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

> [!NOTE]  
>  This method is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]--> on devices that run Apple iOS, such as iPad. The dialog box for uploading a file displays, but it is disabled and the user cannot select a file.  

<!-- NAV
 The maximum size of the file to be uploaded is specified by the MaxUploadSize setting in the CustomSettings.config file. The setting is specified in megabytes. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
-->

The business logic runs on the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not on the client. Files are created on [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not locally on the client computer.  

 Use [UPLOAD Method \(File\)](../../methods-auto/file/file-upload-method.md) and [UPLOADINTOSTREAM Method \(FILE\)](../../methods-auto/file/file-uploadintostream-method.md) to send a file from the client to the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)].  

 Use [DOWNLOAD Method \(File\)](../../methods-auto/file/file-download-method.md) and [DOWNLOADFROMSTREAM Method \(File\)](../../methods-auto/file/file-downloadfromstream-method.md) to send a file from the  [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] to the client.  

 We recommend that you use the methods in codeunit 419, File Management, to upload and download files.  

## Example  
 ```
 var
    FileName: Text;
    NVInStream: InStream;
begin
    FileName := 'c:\SomeFile.txt';  
    UPLOADINTOSTREAM('Import','',' All Files (*.*)|*.*',FileName,NVInStream); 
end;
```  


## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)