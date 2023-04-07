---
title: Conditionally Display Filter Headers
description: Conditionally display the filter header by adding a filter variable to the report dataset and create a conditional expression in the RDLC report layout.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cda49471-7eef-450e-8907-d63654c2b9a6
caps.latest.revision: 16
---
# How to Conditionally Display Filter Headers in Reports
If you apply a filter to the data in a report, then we recommend that you create an additional header row in the report to display the filter. You display this header row only if the user specifies a filter. If no filter is specified, then the filter header is not displayed.  
  
 To conditionally display the filter header, you must add a filter variable to the report dataset. Next, in the RDLC report layout, you must create a conditional expression on the visibility of the filter header that uses the filter variable that you added to the dataset.  
  
 An example of a report that has additional header rows to display filter information is report 113, **Customer/Item Sales**.  
  
### To hide non-filtered headers  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, select the report that you want to modify, and then choose **Design**.  
  
3.  On the **View** menu, choose **C/AL Globals**.  
  
4.  In the **C/AL Globals** window, on the **Variables** tab, add a new variable for the filter. The **DataType** of the variable is Text.  
  
5.  On the **View** menu, choose **C/AL Code**.  
  
6.  In the **C/AL Editor**, in the **OnPreReport** trigger, add code to get the filters. For example, if you have a filter on the Customer table and the filter variable that you created is named CustFilter, then add the following code.  
  
    ```  
    CustFilter := Customer.GETFILTERS;  
    ```  
  
7.  In Report Dataset Designer, under the **DataItem** for the table to which a filter can be applied, add a new line.  
  
8.  In the **Data Type** field of the new line, choose **Column**.  
  
9. In the **Data Source** field of the new line, enter the name of the filter variable.  
  
10. On the **File** menu, choose **Save**. In the **Save** dialog box, verify that **Compiled** is selected, and then choose **OK**.  
  
11. On the **View** menu, choose **Layout**.  
  
12. In Microsoft Visual Studio, on the **View** menu, choose **Toolbox**.  
  
     From the Toolbox, under **Report Items**, drag a **Text Box** to the report layout.  
  
13. Select the filter header text box that you created in step 12, and then on the **View** menu, choose **Properties Window**.  
  
14. In the **Properties** window, expand the **Visibility** field. In the **Hidden** field, select **\<Expression…>** from the drop-down list.  
  
15. In the **Expression** window, create a conditional statement. For example, the following are the conditional statements for the two filter text boxes on report 113.  
  
    ```  
    =IIF(First(Fields!CustFilter.Value) = "",TRUE,FALSE)  
    ```  
  
    ```  
    IIF(First(Fields!ItemLedgEntryFilter.Value) = "",TRUE,FALSE)  
    ```  
  
16. Save and compile the report. For more information, see [How to: Integrate Report Dataset Designer and Visual Studio Report Designer](How-to--Integrate-Report-Dataset-Designer-and-Visual-Studio-Report-Designer.md).  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
