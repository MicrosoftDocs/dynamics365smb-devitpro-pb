---
title: "System.ExportObjects Method"
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
# System.ExportObjects Method
> **Version**: _Available or changed with runtime version 1.0 until version 1.0 where it was deprecated._

Exports application objects to a file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 System.ExportObjects(FileName: String, var ObjectRecord: Record [, Format: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path of the file to export to.
        
*ObjectRecord*  
&emsp;Type: [Record](../record/record-data-type.md)  
A record to the Object table.
        
*Format*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The format to use when exporting.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)