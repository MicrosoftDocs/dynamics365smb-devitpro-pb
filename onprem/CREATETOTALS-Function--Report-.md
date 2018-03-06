---
title: "CREATETOTALS Function (Report)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c1813dac-0e39-4538-8ca2-14431a529bbd
caps.latest.revision: 8
manager: edupont
---
# CREATETOTALS Function (Report)
Maintains totals for a variable in C/AL.  
  
## Syntax  
  
```  
  
CREATETOTALS(Var1 [, Var2] ,...)  
```  
  
#### Parameters  
 *Var1*, *Var2*, …  
 Type: Decimal  
  
## Remarks  
 CREATETOTALS maintains group and grand totals. The totals can be printed by placing controls that have the variable or variables that are the arguments of CREATETOTALS as their source expressions in the appropriate sections. The group totals are printed in GroupFooter sections, and the grand totals are printed in Footer sections.  
  
 This function is not supported on client report definition \(RDLC\) report layouts. In most cases, when you create a layout suggestion for a Classic report layout that uses the CREATETOTALS function, a SUM expression is created instead and no action is required.  
  
## Example  
 This example shows how to use the CREATETOTALS function to maintain totals for the two variables Amount and Quantity.  
  
```  
CurrReport.CREATETOTALS(Amount, Quantity);  
```  
  
## See Also  
 [Report Data Type](Report-Data-Type.md)