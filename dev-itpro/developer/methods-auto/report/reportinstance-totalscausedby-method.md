---
title: "Report.TotalsCausedBy Method"
ms.author: solsen
ms.custom: na
ms.date: 05/19/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.TotalsCausedBy Method
> **Version**: _Available from runtime version 1.0 until version 1.0 where it was deprecated._

Determines which field caused a group total to be calculated. This determines which field changed contents and thereby concluded a group.


## Syntax
```
FieldNo :=   Report.TotalsCausedBy()
```

## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.

## Return Value
*FieldNo*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The number of the field that caused the group to end and a group total to be calculated.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)