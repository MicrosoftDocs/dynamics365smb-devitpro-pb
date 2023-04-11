---
title: "How to: Use Option Strings in Multilanguage Implementations"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8daa2b6d-6b6d-41f9-a96d-9a57a2a1f66d
caps.latest.revision: 14
---
# How to: Use Option Strings in Multilanguage Implementations
In a client report definition \(RDLC\) report layout, an option variable is handled as a normal string, not an option string. If you have a multilanguage application, handling the option as a normal string will cause problems in the displayed report. You must manually convert the option string to an integer variable and then use the integer variable in the RDLC report layout.  
  
 An example of a report with an option variable that is converted to an integer variable is report 111, Customer - Top 10 List. The request page has an option variable, ShowType, that allows the user to choose to display either Sales \(LCY\) or Balance \(LCY\) in the report. The value of the ShowType variable is assigned to an integer variable, ShowTypeNo, in the **OnAfterGetRecord** trigger.  
  
### To assign the option string to an integer variable  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, choose **Report**, select the report that you want to modify, and then choose the **Design** button.  
  
3.  On the **View** menu, choose **C/AL Globals**.  
  
4.  In the **C/AL Globals** window, on the **Variables** tab, add an integer variable. You use this variable for the integer value of an existing option variable.  
  
     For example, in report 111, Customer – Top 10 List, you have an option variable on the request page named ShowType. On the report, you create an integer variable called ShowTypeNo.  
  
5.  Close the **C/AL Globals** window to save your changes.  
  
6.  On the **View** menu, choose **C/AL Code**.  
  
7.  In the **C/AL Editor**, add a line of code to the **OnAfterGetRecord** trigger to assign the option string to an integer value.  
  
     For example, in report 111, you have the following line of code.  
  
    ```  
    ShowTypeNo := ShowType;  
    ```  
  
8.  In Report Dataset Designer, add a Column with **ShowTypeNo** as the value of the **Data Source** field.  
  
9. On the **File** menu, choose **Save**.  
  
10. In the **Save** window, select the **Compiled** check box, and then choose the **OK** button.  
  
### To use the integer variable instead of the option string in the layout  
  
1.  In **Object Designer**, choose **Report**, select the report that you want to modify, and then choose the **Design** button.  
  
2.  On the **View** menu, choose **Layout**.  
  
3.  In Microsoft Visual Studio, in the Report.rdlc file, use the integer variable instead of the option variable, such as in expressions.  
  
     In report 111, the ShowTypeNo integer variable is used in expressions on the bar chart and the pie chart.  
  
## See Also  
 [Designing Reports](Designing-Reports.md)
