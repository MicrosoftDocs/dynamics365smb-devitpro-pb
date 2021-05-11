---
title: "Report.CreateTotals Method"
description: "Maintains totals for a variable in AL."
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
# Report.CreateTotals Method
> **Version**: _Available or changed with runtime version 1.0 until version 1.0 where it was deprecated._

Maintains totals for a variable in AL.


## Syntax
```
 Report.CreateTotals(var Var1: Decimal [, var Var2: Decimal,...])
```
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.

*Var1*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
Variable for which the system will maintain the total.
        
*Var2*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
Variable for which the system will maintain the total.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
> [!IMPORTANT]  
> This method will be deprecated in a future update and we recommend that you do not use it.

CreateTOTALS maintains group and grand totals. The totals can be printed by placing controls that have the variable or variables that are the arguments of CreateTOTALS as their source expressions in the appropriate sections. The group totals are printed in GroupFooter sections, and the grand totals are printed in Footer sections.  
  
This method is not supported on client report definition \(RDLC\) report layouts. In most cases, when you create a layout suggestion for a Classic report layout that uses the CreateTOTALS method, a SUM expression is created instead and no action is required.  
  
## Example  
 This example shows how to use the CreateTOTALS method to maintain totals for the two variables Amount and Quantity.  
  
```  
CurrReport.CreateTOTALS(Amount, Quantity);  
```  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)