---
title: "How to: Format Date Values"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 13c69956-81bb-4f3d-920b-68dcf8874c68
caps.latest.revision: 16
---
# How to: Format Date Values
You can modify date values in Report Dataset Designer to specify how they are formatted in the layout of a report.  
  
### To format date values  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Report**, select a report that you want to modify, and then choose **Design**.  
  
3.  In Report Dataset Designer, in the **Data Source** field of a Column that contains a date, use the [FORMAT Function \(Code, Text\)](FORMAT-Function--Code--Text-.md) with the date. For example, instead of entering **TODAY** in the **Data Source** field, enter **FORMAT\(TODAY,0,4\)**.  
  
     Use the parameters of the **FORMAT** function to specify the length and the exact format that you want for the date.  
  
4.  On the **File** menu, choose **Save**.  
  
5.  In the **Save** window, select the **Compiled** check box, and then choose the **OK** button.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
