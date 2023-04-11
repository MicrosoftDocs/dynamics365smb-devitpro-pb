---
title: Conditionally Format Rows to Bold Font
description: In reports, you can format rows as bold based on the value of a field in the row. Change the rows to bold font conditionally in the development environment.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f4dff8b9-66fe-4b5c-8f6a-8c4797714f39
caps.latest.revision: 19
---
# Conditionally Format a Row to Bold Font in Reports
In some reports, you may want to format rows as bold based on the value of a field in the row. For example, in the [!INCLUDE[demolong](includes/demolong_md.md)], on report 1, Chart of Accounts, you could conditionally specify that rows whose account type is **Posting** are bold and rows whose account type is anything other than **Posting** are not bold.  
  
### To conditionally change rows to bold font  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, select the report that you are modifying, and then choose **Design**.  
  
3.  On the **View** menu, choose **Layout**.  
  
4.  In Visual Studio, create a hidden text box. The hidden text box should contain the field on which you will determine whether the row is bold. For example, in the Chart of Accounts report, the hidden field contains the account type field. For more information, see [How to: Add and Identify Hidden Fields](How-to--Add-and-Identify-Hidden-Fields.md).  
  
5.  In design view, select the data row that you want to appear as bold.  
  
6.  In the **Properties** window, expand **Font**. In the **FontWeight** field, select **\<Expression…>** from the drop-down list.  
  
7.  In the **Expression** window, clear the expression text box, and then select **Fields\(DataSet\_Result\)** from the **Category** list. Under **Values**, double-click the field on which you will determine whether the row is bold.  
  
8.  In the text box at the top of the **Expression** window, use the field that you selected in step 7to create a conditional statement. For example, the following is a conditional statement for report 1.  
  
     **=IIf\(Fields\!G\_L\_Account\_\_\_Account\_Type\_.Value="1","Normal","Bold"\)**  
  
9. On the **File** menu, choose **Save Report.rdlc**.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
