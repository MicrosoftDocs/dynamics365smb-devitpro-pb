---
title: Apply Conditional Visibility Controls
description: Print reports with conditional data by using an expression on the visibility property of the report item or table row in the RDLC report layout.  
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 29c2d105-7602-4a32-85b9-9bf31390291c
caps.latest.revision: 15
manager: edupont
---
# How to: Apply Conditional Visibility Controls
Some reports have data that is printed conditionally. For example, if the request page for the report has a **Show Address Details** check box, then the address details are printed only if the check box is selected. Another example is a report that could show data based on a value such as a balance. If the balance is 0, then the report does not show the balance. To specify conditional visibility in an RDLC report layout, use an expression on the **Visibility** property of the report item or table row.  
  
### To specify conditional visibility controls  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Report**, select the report that you want to modify, and then choose **Design**.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Visual Studio, in the Report.rdlc file, select the control or table row that you want to show conditionally.  
  
5.  On the **View** menu, choose **Properties Window**.  
  
6.  In the **Properties** window, expand **Visibility**.  
  
7.  Under **Visibility**, in the **Hidden** field, select **\<Expression…>** from the drop-down list.  
  
8.  In the  **Expression** window, enter the conditional statement for when the control or row is hidden, and then choose the **OK** button.  
  
     The following illustration shows an example of a conditional visibility expression on report 116, Statement, in the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
     ![Conditional visibility.](media/NAV_PLAT_Report2_ConditionalVisibility.PNG "NAV\_PLAT\_Report2\_ConditionalVisibility")  
  
## See Also  
 [Designing Reports](Designing-Reports.md)   
 [How to: Conditionally Display Filter Headers](How-to--Conditionally-Display-Filter-Headers.md)