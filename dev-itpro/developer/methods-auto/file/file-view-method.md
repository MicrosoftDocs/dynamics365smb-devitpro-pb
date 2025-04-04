---
title: "File.View(Text [, Boolean]) Method"
description: "Opens a file from server computer on the client computer in preview mode."
ms.author: solsen
ms.date: 02/18/2025
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
## Related information
[File data type](file-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)