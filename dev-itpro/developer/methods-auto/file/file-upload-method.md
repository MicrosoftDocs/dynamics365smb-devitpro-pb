---
title: "File.Upload Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# File.Upload Method
Sends a file from the client computer to the server computer. The client computer is the computer that is running the Windows client or the computer that is running a browser that accesses the web client.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[Ok := ]  File.Upload(DialogTitle: String, FromFolder: String, FromFilter: String, FromFile: String, var ToFile: Text)
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*DialogTitle*  
&emsp;Type: [String](../string/string-data-type.md)  
The title that you want to display in the dialog box for uploading the file. This parameter is not supported by the web client. The title is determined by the end-user's browser.
          
*FromFolder*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the folder that is displayed in the dialog box. This is the default value, and the user can change it. This parameter is not supported by the web client. The browser uses the folder that was last accessed.
          
*FromFilter*  
&emsp;Type: [String](../string/string-data-type.md)  
The type of file that can be uploaded to the server. In the Windows client, the type is displayed in the upload dialog box, so that the user can only select files of the specified type. For the web client, a user can try to upload any file type but an error occurs if the file is not the specified type.
        
*FromFile*  
&emsp;Type: [String](../string/string-data-type.md)  
The default file that you want to upload to the service. The name displays in the dialog box for uploading the file. The user can change the file. This parameter is not supported by the web client.
          
*ToFile*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path and file name to give the uploaded file. If you do not provide a path, or you upload the file that uses web client, then the file is uploaded to the following folder on the computer that is running the server: \\ProgramData\\Microsoft\\Microsoft Dynamics NAV\\110\\Server\\MicrosoftDynamicsNAVServer$DynamicsNAV110\\users\\ServiceAccount
          


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

> [!NOTE]  
>  This method is not supported<!--NAV by the [!INCLUDE[d365fin_web_md](../includes/d365fin_web_md.md)]--> on devices that run Apple iOS, such as iPad. The dialog box for uploading a file displays, but it is disabled and the user cannot select a file.  

The business logic is run on the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not on the client. Files are created on the [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] and not locally on the client.  

[UPLOAD Method \(FILE\)](../../methods-auto/file/file-upload-method.md) and [UPLOADINTOSTREAM Method \(File\)](../../methods-auto/file/file-uploadintostream-method.md) are used to send a file from the client to a [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)].  

[DOWNLOAD Method \(File\)](../../methods-auto/file/file-download-method.md) and [DOWNLOADFROMSTREAM Method \(File\)](../../methods-auto/file/file-downloadfromstream-method.md) are used to send a file from a [!INCLUDE[d365fin_server_md](../../includes/d365fin_server_md.md)] to the client.  

We recommend that you use the methods in codeunit 419, File Management, to upload and download files.  

## Example  

```  
UPLOAD('Upload file','C:\','Text file(*.txt)|*.txt','Test.txt',varTest);  
```  

## See Also
[File Data Type](file-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)