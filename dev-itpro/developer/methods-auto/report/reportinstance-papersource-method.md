---
title: "Report.PaperSource Method"
description: "Gets or sets the paper source used for the current page or a specified page."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Report.PaperSource Method
> **Version**: _Available or changed with runtime version 1.0 until version 1.0 where it was deprecated._

Gets or sets the paper source used for the current page or a specified page.


## Syntax
```
 Report.PaperSource(PaperBinNo: Integer [, PhysicalPage: Integer])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.

*PaperBinNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The tray number.  
*PhysicalPage*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The page number.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)