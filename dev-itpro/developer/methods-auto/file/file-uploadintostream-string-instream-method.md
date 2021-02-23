---
title: "File.UploadIntoStream Method"
ms.author: solsen
ms.custom: na
ms.date: 02/23/2021
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
# File.UploadIntoStream Method
> **Version**: _Available or changed with runtime version 7.0._

Sends a file from the client computer to the corresponding server. The client computer is the computer that is running a browser that accesses the web client.


## Syntax
```
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
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[File Data Type](file-data-type.md)
[Getting Started with AL](../devenv-get-started.md)
[Developing Extensions](../devenv-dev-overview.md)