---
title: Add and Identify Hidden Report Fields
description: Mark the hidden fields on a report, so they are easy to identify, and move them to a different location in the layout to avoid problems with formatting.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d93e829b-5fd3-4f9d-a767-4f5ee5b3b4f1
caps.latest.revision: 16
---
# How to Add and Identify Hidden Report Fields in Dynamics NAV
If you have hidden fields on a report, we recommend that you mark them so that they are easy to identify. Additionally, you may want to move hidden fields to a different location in the layout to avoid problems with formatting.  
  
### To add and identify a hidden field  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In **Object Designer**, choose **Report**, select the report to which you want to add a hidden field, and then choose the **Design** button.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Visual Studio Report Designer, on the **View** menu, choose **Toolbox**.  
  
     From the **Toolbox**, under **Report Items**, drag a **Text Box** to the report layout.  
  
    > [!TIP]  
    >  If the hidden text box is in a table data region, we recommend that you insert a new row in the table and add the hidden text box to this new row. In the **Properties** window of the row, under **Layout**, you can change the value of the Height property to a value that is large enough so that you can view the row when you are designing the report, but small enough that it will not cause formatting problems when you print the report, such as **0.2cm**.  
  
5.  Select the text box that you created. On the **View** menu, choose **Properties Window**.  
  
6.  In the **Properties** window, under **Font**, set the **Color** property to **Yellow**, or select the yellow square from the drop-down list.  
  
7.  In the **Properties** window, under **Position**, expand **Size**, and then set the **Width** property to a small width, such as **0.15cm**.  
  
8.  In the **Properties** window, under **Visibility**, set the **Hidden** property to **True**.  
  
9. On the **File** menu, choose **Save Report.rdlc**.  
  
## See Also  
 [Understanding Headers and Footers](Understanding-Headers-and-Footers.md)   
 [Designing Reports](Designing-Reports.md)
