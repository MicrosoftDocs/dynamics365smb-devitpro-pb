---
title: Create a Report Dataset
description: A dataset determines the data that displays on a generated report, built from data items and columns, where data item is a table and column is a field in the table.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 44c9f5c2-5bd2-4f26-85f5-7accb25c2112
caps.latest.revision: 18
---
# Creating a Report Dataset in Dynamics NAV
A dataset determines the data that displays on a generated report. You build the report dataset from data items and columns, where a data item is a [!INCLUDE[navnow](includes/navnow_md.md)] table and a column can be a field in the table, a variable, an expression, or a text constant.  
  
 After you create the dataset, you can design the report layout.  
  
### To create a blank report and add items to the dataset  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, and then choose **New**.  
  
3.  In Report Dataset Designer, the first line contains **DataItem** in the **Data Type** column. In the **Data Source** column, either enter a table name or table number, or choose the Assist button to select a table from the table list.  
  
4.  In the **Name** field of the **DataItem** line, either enter a name or verify the default name. The name must be a Common Language Specification \(CLS\)–compliant name. For more information, see the "Naming" section in [Common Language Specification](https://go.microsoft.com/fwlink/?LinkId=193144) in the MSDN Library.  
  
5.  In Report Dataset Designer, on the first blank line, in the **Data Type** column, select **Column** from the drop-down list.  
  
6.  In the **View** menu, choose **Field Menu**.  
  
     The **Field Menu** window opens, displaying the list of available fields from the data item.  
  
7.  In the **Field Menu** window, select one or more fields that you want to add to the report dataset. Select multiple fields by holding down the SHIFT key or the CTRL key. Choose the **OK** button to add the selected fields to the dataset.  
  
8.  If you want to include the caption of a column in the dataset, then select the **Include Caption** check box in Report Dataset Designer. The caption is included as a parameter in Visual Studio Report Designer.  
  
    > [!NOTE]  
    >  If the **Include Caption** column is not visible in Report Dataset Designer, then on the **View** menu, choose **Show Column**, select **Include Caption**, and then choose the **OK** button.  
  
9. In Report Dataset Designer, enter data items and columns until you have added all fields from all the tables that you want to include in the report.  
  
10. If you want to add a label to the report, such as a caption for a table header or a title for the report, then add a label to the dataset. For more information, see [How to: Create Labels for a Report](How-to--Create-Labels-for-a-Report.md).  
  
11. If you want to include a variable in the report dataset, then do the following:  
  
    1.  In Report Dataset Designer, on a blank line, in the **Data Type** column, select **Column** from the drop-down list.  
  
    2.  In the **Data Source** column, enter the variable. You can use the up arrow to open the **C/AL Symbol Menu** dialog box and view the variables for the report.  
  
    3.  In Report Dataset Designer, in the **Name** column, enter a CLS-compliant name for the variable. This name is used in the dataset in Visual Studio.  
  
12. If you want to include a calculation or other source expression in the report dataset, then do the following:  
  
    1.  In Report Dataset Designer, on a blank line, in the **Data Type** column, select **Column** from the drop-down list.  
  
    2.  In the **Data Source** column, enter the source expression, such as **8\*125**.  
  
    3.  In the **Name** column, enter a CLS-compliant name for the variable. This name is used in the dataset in Visual Studio.  
  
13. On the **File** menu, choose **Save**.  
  
14. In the **Save As** dialog box, in the **ID** field, enter an ID for the report object. The ID must be in a valid range for your solution. In the **Name** field, enter a name for the report. Select the **Compiled** check box, and then choose **OK**.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
