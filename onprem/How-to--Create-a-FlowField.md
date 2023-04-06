---
title: Create a FlowField
description: FlowFields display the result of the calculation described in the CalcFormula property. Learn how to set up a FlowField in Microsoft Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2f6560a1-33a5-4fee-beac-fa6a3100c85a
caps.latest.revision: 11
---
# How to: Create a FlowField in Dynamics NAV
The following procedure describes how to set up a FlowField.  

### To create a FlowField  

1.  On the **Tools** menu, choose **Object Designer**. Open the table that you want to add a FlowField to in the Table Designer.  

2.  Select the line for the field that you want to define as a FlowField, such as the **Amount** field.  

3.  On the **View** menu, choose **Properties**. The **Properties** window of the **Amount** field displays.  

4.  In the **FieldClass** property field, select **FlowField** from the drop-down list.  

5.  In the **CalcFormula** property field, enter the calculation formula for the FlowField.  

     For more information, see [Calculation Formulas and the CalcFormula Property](Calculation-Formulas-and-the-CalcFormula-Property.md).  

6.  \(optional\) In the **Editable** field, select **No**.  

## See Also  
 [How to: Create, View, and Edit a Calculation Formula](How-to--Create--View--and-Edit-a-Calculation-Formula.md)  
 [Troubleshooting Long Running SQL Queries Involving FlowFields by Disabling SmartSQL](Troubleshooting-Queries-Involving-FlowFields-By-Disabling-SmartSQL.md)  
