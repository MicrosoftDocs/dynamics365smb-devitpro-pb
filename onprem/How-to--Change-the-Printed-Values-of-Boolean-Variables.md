---
title: Change Printed Values of Boolean Variables
description: This article describes how to change the printed value of a Boolean variable or field in an RDLC report layout from True or False to Yes or No.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a4d7b9c6-17f6-4083-b0fe-3b238b4e2138
caps.latest.revision: 16
---
# How to Change the Printed Values of Boolean Variables
In a client report definition \(RDLC\) report layout, when a Boolean value appears on a report, the value is printed as "True" or "False" in the target language.  
  
 In some cases, you may want to change the printed value of a Boolean variable or field in an RDLC report layout. You can change the value to "Yes" or "No" instead of "True" or "False."  
  
### To change the printed value of a Boolean field  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Report**, select the report for which you want to change the printed values of Boolean variables or fields, and then choose the **Design** button.  
  
3.  In Report Dataset Designer, find the **Column** for the Boolean variable or field that you want to change.  
  
4.  In the **Data Source** field, change the \<*BooleanVariable*> to **FORMAT\(**\<*BooleanVariable*>**\)**.  
  
5.  On the **File** menu, choose **Save**.  
  
6.  In the **Save** window, select the **Compiled** check box, and then choose the **OK** button.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
