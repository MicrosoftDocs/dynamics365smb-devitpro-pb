---
title: "File.UploadIntoStream(String, String, String, var Text, var InStream) Method"
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
# File.UploadIntoStream(String, String, String, var Text, var InStream) Method
> **Version**: _Available or changed with runtime version 1.0._

Sends a file from the client computer to the corresponding server. The client computer is the computer that is running the Windows client or the computer that is running a browser that accesses the web client.


## Syntax
```AL
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
The type of file that can be uploaded to the server. A user can try to upload any file type but an error occurs if the file is not the specified type.
          
*FromFile*  
&emsp;Type: [Text](../text/text-data-type.md)  
The default file to upload to the service. The name displays in the dialog box for uploading the file. The user can change the file. This parameter is not supported by the web client.
        
*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!IMPORTANT]  
> This method is deprecated from runtime 7.0. Use [File.UploadIntoStream Method](file-uploadintostream-string-instream-method.md) instead.


## See Also
[File Data Type](file-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)  