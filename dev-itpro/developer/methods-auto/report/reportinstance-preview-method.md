---
title: "Report.Preview() Method"
description: "Indicates whether a report is being printed in preview mode."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.Preview() Method
> **Version**: _Available or changed with runtime version 1.0._

Indicates whether a report is being printed in preview mode.


## Syntax
```AL
IsPreview :=   Report.Preview()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

## Return Value
*IsPreview*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the report is being printed in preview mode, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)