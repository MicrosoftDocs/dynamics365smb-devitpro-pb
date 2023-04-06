---
title: Create New Pages per Record
description: Print a new page for each new record by creating a report dataset that includes the data items and columns that you want in the report.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8cbf1aed-c255-4ac4-bdd1-b4bc5fe7aa95
caps.latest.revision: 22
---
# Creating New Pages per Record
For some reports, you may want to print a new page for each new record.  
  
 An example of a report that begins a new page for each new record is report 205, Order Confirmation, in the [!INCLUDE[demolong](includes/demolong_md.md)].  
  
### To create a new page for each record  
  
1.  Create a report dataset that includes the data items and columns that you want in the report. For more information, see [How to: Create a Report Dataset](How-to--Create-a-Report-Dataset.md).  
  
2.  In Report Dataset Designer, on the **View** menu, choose **Layout**.  
  
3.  In Visual Studio Report Designer, on the **View** menu, choose **Toolbox**, and then drag a **List** to the report layout.  
  
4.  Below the layout, under **Row Groups**, right-click **Details**, and then choose **Group Properties**.  
  
5.  In the **Group Properties** window, in the **Name** field, specify a name for the group. Under **Group expressions**, choose the **Add** button. In the **Group on** drop-down list, choose the field that you want to group on. For example, choose the primary key field so that you create a group for each record.  
  
6.  In the **Group Properties** window, choose the **Page Breaks** tab. Under **Page break options**, select **Between each instance of a group**.  
  
7.  Choose the **OK** button to close the **Group Properties** window.  
  
8.  Design the layout of the report by dragging items to the layout within the List item, so that they are grouped. For example, a table that you add to the List item will be grouped as specified in the group properties for the List item and will have a page break at the end of each group.  
  
 In earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], in Classic report layouts, you used the **NewPagePerRecord** property, the **NewPagePerGroup** property, or the **CurrReport.NEWPAGE** function to specify that you wanted a new page. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the **NewPagePerRecord** property, **NewPagePerGroup** property, and the **CurrReport.NEWPAGE** function are not supported. Instead of the **NewPagePerRecord** property and the **NewPagePerGroup** property, you create groups in Visual Studio Report Designer, as described in this topic. Instead of the **CurrReport.NEWPAGE** function, you can create a new page number variable that you increment each time you used **CurrReport.NEWPAGE**, and then group data based on the new page number variable and add a page break at the end of each group.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
