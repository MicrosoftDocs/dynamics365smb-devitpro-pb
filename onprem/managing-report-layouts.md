---
title: Manage Report Layouts in Client
description: Create custom report layouts based on the build-in report layouts to enable users to switch between different layouts for the same report.
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Managing Report Layouts in Dynamics NAV Clients
In the [!INCLUDE[navnow](includes/navnow_md.md)] clients, users can specify whether to use the built-in RDLC or Word report layout on a report from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)]. Users can also create *custom* report layouts that are based on the built-in report layouts. This enables users to have several different layouts for the same report which they can switch among. For a detailed explanation of built-in and custom layouts, see [Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md#BuiltinCustomLayouts).
 

## Creating and Modifying Custom Report Layouts  
 Custom report layouts are managed from page **9650 Report Layouts** in the [!INCLUDE[navnow](includes/navnow_md.md)] client. Unlike built-in report layouts, which are part of the report object, custom report layouts are stored in table **9650 Report Layouts** of the database. 
 
 From page **9650 Report Layouts**, you can:
 -	Create a new layout from scratch or by copying another layout.
 -	Modify an existing layout directly in Word or directly in Word or SQL Server Report Builder ([!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] only). Or, modify a layout by using the **Export Layout** and **Import Layout** actions.
 -	Update a custom report layout to designs change made to the report's data set. 
     
##  <a name="UpdateCustomLayouts"></a>Updating Report Layouts to Dataset Changes  
If there has been a design change to a report's data set, for example, a field that is used in the layout has been removed from the report data set, custom report layouts that use the report dataset will have to be updated to the changes. If not, users will get an error message when they try to preview, print, or save the report.

There are different ways to automatically update or test updates. You can update a report layout from the error message that appears when you run the report or, in advance of running reports, you can update specific report layouts or all custom report layouts that might be affected by dataset changes. 

Not all report dataset changes can be automatically updated in the report layouts. When you choose to update or test the custom report layout updates, Microsoft Dynamics NAV scans the custom report layouts that are stored in the database and compares them to their corresponding dataset design. Some changes will require that you manually edit the report layout. For more information, see Limitations of the Custom Report Layout Update.

### Testing updates first
You also have the option to test updates without applying the required changes to the custom report layouts. This enables you to see what changes will be applied to the report layout and identify possible issues in the process.

To test layput updates, open page 9652 **Report Layout Selection**, and then choose the **Test Layout Updates** action. 

From the test results, you can open the custom report layouts directly for editing to fix any issues. We recommend that you test the report layout update before you apply the updates. 

### Automatically updating report layouts
To attempt an automatic update of report layouts, you can do the following:
-	To update a specific custom report layout, open page 9650 **Report Layouts** page, open the layout that you want to update, and then choose the **Update Layout** action.

-	To update all custom report layouts for the company, open page 9652 **Report Layout Selection**, and then choose the **Update All Layouts** action.

The system will attempt to update the custom report layouts to dataset changes. If no errors occur, then the update is applied to the report layouts. If errors occur, then a message that contains the errors appears. You will then have to manually edit the custom report layouts to fix the error. 

### Limitations of the automatic custom report layout update
There are several types of changes that the automatic update can apply to custom report layouts, for example, a field that is used in the layout has been removed from the report data set. However, the automatic update cannot handle the following changes to a report dataset.

-	Deleted fields, labels, or data items.

-	Duplicate field names in the report layout after a field has been renamed in the dataset. This should be treated as a design error.

-	Upgrade scenarios where there are multiple iterations of a report layout that causes multiple rename actions on the same fields, labels or data items.

If the update process detects any one of these issues, the update cannot be applied. You will have to fix the issues manually, for example by editing the report layout in Word, or programmatically by using upgrade codeunits. 

### Fixing Errors
If you get an error message when you update or test report layout updates, you most likely will have to modify the report layout to fix the problem. Read the error message to help determine the cause of the problem. 

The most typical problem occurs when a field that is used on the layout has been removed from the report dataset. In this case, you will see a line in the error message that states that an item has been removed. To fix this issue, you will have to modify the layout and remove the field in question. 

After you modify the layout, try to update the layout again.
 
## See Also
[Designing Report Layouts from the Microsoft Dynamics NAV Development Environment](Designing-Report-Layouts-from-the-Microsoft-Dynamics-NAV-Development-Environment.md)  
[How to: Change Which Layout is Currently Used on a Report](How-to--Change-Which-Layout-is-Currently-Used-on-a-Report.md)  
