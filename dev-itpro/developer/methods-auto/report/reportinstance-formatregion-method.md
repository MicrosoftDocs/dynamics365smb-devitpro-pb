---
title: "Report.FormatRegion([Text]) Method"
description: "Gets or sets the current format region setting for the report."
ms.author: solsen
ms.custom: na
ms.date: 01/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.FormatRegion([Text]) Method
> **Version**: _Available or changed with runtime version 11.0._

Gets or sets the current format region setting for the report.


## Syntax
```AL
[CurrentFormatRegion := ]  Report.FormatRegion([FormatRegion: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*[Optional] FormatRegion*  
&emsp;Type: [Text](../text/text-data-type.md)  
The new format region setting for the report.  


## Return Value
*[Optional] CurrentFormatRegion*  
&emsp;Type: [Text](../text/text-data-type.md)  
The current format region setting for the report.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)