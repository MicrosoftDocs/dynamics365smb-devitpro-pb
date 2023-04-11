---
title: "How to: Specify Printer Selection for Reports"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 66b786ba-e499-424e-a8b5-58dac4673fab
caps.latest.revision: 9
translation.priority.ht: 
  - da-dk
  - de-at
  - de-ch
  - de-de
  - en-au
  - en-ca
  - en-gb
  - en-in
  - en-nz
  - es-es
  - es-mx
  - fi-fi
  - fr-be
  - fr-ca
  - fr-ch
  - fr-fr
  - is-is
  - it-ch
  - it-it
  - nb-no
  - nl-be
  - nl-nl
  - ru-ru
  - sv-se
---
# How to: Specify Printer Selection for Reports
You can set up reports so that they must be printed on a specific printer from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The following are some uses of printer selection:  
  
-   You can print reports on special company letterhead.  
  
-   You can print reports on different paper sizes.  
  
-   You can print reports on the default printer of a specified employee.  
  
-   When you start a session by using the [STARTSESSION Function \(Sessions\)](STARTSESSION-Function--Sessions-.md), which does not have a UI, you can print reports from the server.  
  
 You can set different values to obtain different output. If you set a specific printer selection, then it takes precedence over a more general printer selection. For example, you can set a printer selection that has values in the **User ID**, **Report ID**, and **Printer Name** fields. This printer selection takes precedence over a printer selection that has blank entries in the **User ID** or **Report ID** fields.  
  
 The following table describes the combination of values to specify when you set up printer selections for a report.  
  
|To|Set the following values|  
|--------|------------------------------|  
|Print a report to a specific printer for all users|Specify values in the **Report ID** and **Printer Name** fields and leave the **User ID** field blank.|  
|Print all reports to a specific printer for a specific user|Specify values in the **User ID** and **Printer Name** fields and leave the **Report ID** field blank.|  
|Set the default printer for all reports|Specify a value in the **Printer Name** field and leave the **User ID** and **Report ID** fields blank.|  
|Print a specific report to the user’s default printer|Specify a value in the **Report ID** field and leave the **Printer Name** and **User ID** fields blank.|  
|Print a specific report to a specific printer for a specific user|Specify values in all three fields.|  
  
### To set up printer selections for a report  
  
1.  In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], in the navigation pane, choose **Departments**, choose **Administration**, choose **IT Administration**, choose **General**, and then choose **Printer Selections**.  
  
2.  On the **Home** tab, in the **New** group, choose **New** to add a printer selection for a specific report.  
  
3.  In the **User ID** field, select whether the printer selection applies to a specific user.  
  
4.  In the **Report ID** field, select the ID of the report to print. The **Report Name** field is automatically populated with the report name.  
  
5.  In the **Printer Name** field, select from the list of available printers. The list of available printers is generated from the printers that are currently installed. Different users on different computers may see different options.  
  
6.  Choose the **OK** button to close the page.  
  
 The specified report is now set up to print to the selected printer. You can always change the printer selection in the **Print** dialog box.  
  
## See Also  
 [Printing Reports](Printing-Reports.md)
