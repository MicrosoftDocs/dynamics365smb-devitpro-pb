---
title: "Report.PageNo([Integer]) Method"
description: "Gets or sets the current page number of a report."
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
# Report.PageNo([Integer]) Method
> **Version**: _Available or changed with runtime version 1.0 until version 1.0 where it was deprecated._

Gets or sets the current page number of a report.


## Syntax
```AL
[CurrPageNo := ]  Report.PageNo([NewPageNo: Integer])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*[Optional] NewPageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The new page number of a report.  


## Return Value
*[Optional] CurrPageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current page number of a report.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
> [!IMPORTANT]  
> This method will be deprecated in a future update and we recommend that you do not use it.

## See Also
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)