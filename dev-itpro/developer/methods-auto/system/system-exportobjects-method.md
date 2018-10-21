---
title: "ExportObjects Method"
ms.author: solsen
ms.custom: na
ms.date: 10/17/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ExportObjects Method
Export application objects to a file.

## Syntax
```
 System.ExportObjects(FileName: String, var ObjectRecord: Table, [Format: Integer])
```
> [!NOTE]  
> This method can be invoked without specifying the data type name.  
## Parameters
*FileName*  
&emsp;Type: [String](../string/string-data-type.md)  
The path of the file to export to.
        
*ObjectRecord*  
&emsp;Type: [Table](../table/table-data-type.md)  
A record to the Object table.
        
*Format*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The format to use when exporting.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)