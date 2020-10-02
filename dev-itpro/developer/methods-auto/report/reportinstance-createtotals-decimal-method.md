---
title: "Report.CreateTotals Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# Report.CreateTotals Method
Maintains totals for a variable in AL.


## Syntax
```
 Report.CreateTotals(Vars: Array of [Decimal])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*Vars*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
Array of variables for which the system will maintain individual totals.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  

> [!IMPORTANT]  
> This method will be deprecated in a future update and we recommend that you do not use it.

CREATETOTALS maintains group and grand totals. The totals can be printed by placing controls that have the variable or variables that are the arguments of CREATETOTALS as their source expressions in the appropriate sections. The group totals are printed in GroupFooter sections, and the grand totals are printed in Footer sections.  
  
This method is not supported on client report definition \(RDLC\) report layouts. In most cases, when you create a layout suggestion for a Classic report layout that uses the CREATETOTALS method, a SUM expression is created instead and no action is required.  
  
## Example  
 This example shows how to use the CREATETOTALS method to maintain totals for the two variables Amount and Quantity.  
  
```  
CurrReport.CREATETOTALS(Amount, Quantity);  
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)