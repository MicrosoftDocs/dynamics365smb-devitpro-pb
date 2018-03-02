---
title: "Removing Elements from the User Interface According to Permissions"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
---
# Removing Elements from the User Interface According to Permissions
You can configure [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)] to show and hide user interface \(UI\) elements based on the license or the user's permissions to the underlying tables. All elements, fields, actions, and page parts, can be removed from the user’s view of [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)].

>[!Note]
>You can also show or hide \(UI\) elements based on the application area that is assigned to the element. For more information, see [Removing Elements from User Interface According to Application Area](Hiding-User-Interface-Elements-Based-on-Application-Area.md).

 Depending on the setting in the **UI Elements Removal** field in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], only UI elements on objects in the license or on objects that the user has permissions to will appear in the user interface.  

 UI elements that are directly related to an object through the **TableRelation** or the **CalcFormula** property can be removed automatically according to the license file and/or user permissions.  

 For UI elements that are not directly related to an object, you can use the **AccessByPermission** property to remove the element according to the user’s permission to a related object.  

 To make full use of the **LicenseFileAndUserPermissions** option in the **UI Elements Removal** field, it is recommended that you assign the special permission set, FOUNDATION, along with the relevant permission sets that define which application objects the user will access.  

>[!IMPORTANT]  
> The majority of the permission sets that are provided with the [!INCLUDE[demo](includes/demo_md.md)] demonstration database cannot be combined with the FOUNDATION permission set to fully use the UI Elements Removal feature. You must first create or edit the relevant permission sets to avoid that the user is blocked from performing the involved tasks.  
>   
>  If you only use the **LicenseFile** option in the **UI Elements Removal** field, then you do not have to edit any permission sets as they will not affect which UI elements are removed.  

A couple of permission sets in the [!INCLUDE[demo](includes/demo_md.md)] demonstration database are adapted to support the FOUNDATION permission set for demonstration purposes. You can use those permission sets to try out how UI elements are removed for a user performing the task to create and edit a new customer.  

 The following table describes a sequence of tasks, with links to the topics that describe them. These tasks are listed in the order in which they are generally performed.  

|**To**|**See**|  
|------------|-------------|  
|Configure [!INCLUDE[nav_server](includes/nav_server_md.md)] to automatically remove UI elements from the user’s interface if they are on objects that are not in the license or on objects that the user does not have permissions for.|[How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)|  
|Use the **AccessByPermission** property to define which user permissions to a certain object are required before the user can see and access the UI element. This method can be used to remove UI elements without a direct object relation from the user’s interface based on permissions.|[How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md)|  
|To experience how UI elements are removed for a user performing the task to create and edit a new customer, create a sample user interface based on two permission sets that are provided with [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)].|[How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)|  
|Learn about FOUNDATION and other special permission sets.|[Special Permission Sets](Special-Permission-Sets.md)|  
|Modify the existing permission sets to fully support the FOUNDATION permission set.|[How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md)|  

## See Also  
 [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)   
 [Profiles and Role Centers](Profiles-and-Role-Centers.md)
