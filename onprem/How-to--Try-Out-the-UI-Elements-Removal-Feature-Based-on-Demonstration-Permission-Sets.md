---
title: "How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: c649c320-5c76-436d-8c91-317e4f81caa6
caps.latest.revision: 8
---
# How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets
Depending on the setting in the **UI Elements Removal** field in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], only UI elements on objects in the license or on objects that the user has permissions for will appear in the user interface. For more information, see [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md).  

> [!IMPORTANT]  
>  The majority of the permission sets that are provided with the [!INCLUDE[demo](includes/demo_md.md)] demonstration database cannot be combined with the FOUNDATION permission set to fully use the UI Elements Removal feature. You must first create or edit the relevant permission sets to avoid that the user is blocked from performing the involved tasks. For more information, see [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md).  

 To try out or demonstrate the effect of the feature to remove UI elements according to user permissions, you can quickly prepare a test UI based on two permission sets \(S&R-Customer and S&R-Customer, EDIT\) in [!INCLUDE[demo](includes/demo_md.md)] that are ready to support the FOUNDATION permission set for this purpose.  

### Prepare a permissions-based ORDER PROCESSOR UI that only shows UI elements for creating and editing a customer  

1.  Create a test user who has the ORDER PROCESSOR profile. For more information, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md) and [Managing Users](Managing-Users.md).  

2.  Assign the FOUNDATION permission set. For more information, see [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md).  

3.  Assign the following two application permission sets, which support the task to create and edit a customer in conjunction with the FOUNDATION permission set:  

    -   S&R-Customer  

    -   S&R-Customer, EDIT  

4.  Upload a user license. For more information, see [How to: Upload the License File](How-to--Upload-the-License-File.md).  

5.  Set the **UI Elements Removal** field to **LicenseFileAndUserPermissions**. For more information, see [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md).  

6.  Start the client for the ORDER PROCESSOR profile.  

 On the **Sales Order Processor** Role Center, you now only see the UI elements that are required to create and edit a customer. For example, only the **Customers** action is visible on the navigation pane, and all the tiles for sales documents are removed from the **Activities** part. On the involved pages, such as the **Customer Card** window, you now only see the fields, actions, and page parts that are required to create and edit a customer.  

## See Also  
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)   
 [Special Permission Sets](Special-Permission-Sets.md)   
 [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md)   
 [Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md)
