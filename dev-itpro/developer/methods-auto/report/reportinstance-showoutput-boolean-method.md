---
title: "Report.ShowOutput Method"
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
# Report.ShowOutput Method
> **Version**: _Available or changed with runtime version 2.3 until version 2.3 where it was deprecated._

Returns the current setting of whether a section should be printed, and changes this setting.


## Syntax
```
[Show := ]  Report.ShowOutput(Value: Boolean)
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.

*Value*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the section is printed, otherwise **false**.  


## Return Value
*Show*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the section is printed, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)