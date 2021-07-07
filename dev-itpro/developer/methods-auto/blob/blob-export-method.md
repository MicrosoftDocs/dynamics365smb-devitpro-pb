---
title: "Blob.Export(String) Method"
description: "Exports a binary large object (BLOB) to a file."
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
# Blob.Export(String) Method
> **Version**: _Available or changed with runtime version 1.0._

Exports a binary large object (BLOB) to a file.


## Syntax
```AL
[ExportName := ]  Blob.Export(Name: String)
```
## Parameters
*Blob*  
&emsp;Type: [Blob](blob-data-type.md)  
An instance of the [Blob](blob-data-type.md) data type.  

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The path and name of the BLOB that you want to export. When you enter the path, consider these shortcuts:
-   You can omit the drive letter if the command is located on the current drive.
-   You can omit the full path if the command is located in the current directory.
-   You can enter only the subdirectory name if the command is located in a subdirectory of the current directory.
          


## Return Value
*[Optional] ExportName*  
&emsp;Type: [String](../string/string-data-type.md)  
The name of the created file.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Blob Data Type](blob-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)