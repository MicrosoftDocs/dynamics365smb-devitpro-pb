---
title: "How to: Specify When UI Elements Are Removed"
author: edupont04
ms.date: 10/01/2018

ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: edupont
---
# How to: Specify When UI Elements Are Removed
Depending on the setting in the **UI Elements Removal** field in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], only user interface \(UI\) elements on objects in the license or on objects that the user has permissions to will appear in the user interface.  

 All types of UI elements will be removed if they relate to objects that are not included in the license or the user does not have the required permission to the objects:  

-   Fields  

-   Actions  

-   Page parts  

 UI elements that are directly related to an object through the **TableRelation** or the **CalcFormula** property can be removed automatically according to the license file and/or user permissions.  

 For UI elements that are not directly related to an object, you can use the **AccessByPermission** property to remove the element according to the user’s permission to a related object. For more information, see [How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md).  

 To make full use of the **LicenseFileAndUserPermissions** option in the **UI Elements Removal** field, it is recommended that you assign the special permission set, FOUNDATION, along with the relevant permission sets that define which application objects the user will access.  

> [!IMPORTANT]  
>  The majority of the permission sets that are provided with the [!INCLUDE[demo](includes/demo_md.md)] demonstration database cannot be combined with the FOUNDATION permission set to fully use the UI Elements Removal feature. You must first create or edit the relevant permission sets to avoid that the user is blocked from performing the involved tasks. For more information, see [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md).  
>   
>  If you only use the **LicenseFile** option in the **UI Elements Removal** field, then you do not have to edit any permission sets as they will not affect which UI elements are removed.  

### To specify when UI elements are removed  

1.  Open the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  

2.  In the **UI Elements Removal** field, choose the relevant option as described in the following table.  

    |[!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |----------------------------------|---------------------------------------|  
    |**None**|All UI elements are displayed, even if the license file does not include the related object and the user does not have permissions to the related object.|  
    |**LicenseFile**|A UI element is removed if the related object is not included in the license file.|  
    |**LicenseFileAndUserPermissions**|A UI element is removed if the related object is not included in the license file and the user does not have permissions to the object as defined in the **AccessByPermission** property for the related UI element.<br /><br /> By default, this option is selected.|  

> [!TIP]  
>  When you configure user interfaces in [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)], you should make sure that the **UI Elements Removal** field is set to its default, **LicenseFileAndUserPermissions**, so that you only see the relevant UI elements in the **Customize** window. For more information, see [Profiles and Role Centers](Profiles-and-Role-Centers.md).  
>   
>  When you develop in [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)], you should make sure that the **UI Elements Removal** field is set to **None** to make sure that all UI elements are visible when you review your development in the UI.  

## See Also  
 [How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md)   
 [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md)   
 [Special Permission Sets](Special-Permission-Sets.md)   
 [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md)   
 [Profiles and Role Centers](Profiles-and-Role-Centers.md)   
 [Managing Users](Managing-Users.md)
