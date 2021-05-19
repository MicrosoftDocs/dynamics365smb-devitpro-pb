---
title: "Report.PageNo Method"
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
# Report.PageNo Method
> **Version**: _Available from runtime version 1.0 until version 1.0 where it was deprecated._

Gets or sets the current page number of a report.


## Syntax
```
[CurrPageNo := ]  Report.PageNo([NewPageNo: Integer])
```
## Parameters
*Report*
&emsp;Type: [Report](report-data-type.md)
An instance of the [Report](report-data-type.md) data type.

*NewPageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The new page number of a report.  


## Return Value
*CurrPageNo*
&emsp;Type: [Integer](../integer/integer-data-type.md)
The current page number of a report.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)