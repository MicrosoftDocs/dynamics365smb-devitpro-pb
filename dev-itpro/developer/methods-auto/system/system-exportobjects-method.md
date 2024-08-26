---
title: "System.ExportObjects(Text, var Record [, Integer]) Method"
description: "Exports application objects to a file."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# System.ExportObjects(Text, var Record [, Integer]) Method
> **Version**: _Available or changed with runtime version 1.0 until version 1.0 where it was deprecated._

Exports application objects to a file.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```AL
 System.ExportObjects(FileName: Text, var ObjectRecord: Record [, Format: Integer])
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*FileName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path of the file to export to.  

*ObjectRecord*  
&emsp;Type: [Record](../record/record-data-type.md)  
A record to the Object table.  

*[Optional] Format*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The format to use when exporting.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[System Data Type](system-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)