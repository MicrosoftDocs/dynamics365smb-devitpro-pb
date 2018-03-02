---
title: "Access By Permission"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 12b241e9-b254-4c55-ac4a-5cdec453c8ec
caps.latest.revision: 5
manager: edupont
---
# Access By Permission
Specifies an object to which users must have certain permissions before the related UI element is accessible to the user.  

 The **AccessByPermission** property sets a value for a table field or UI element that determines the permission mask for an object that a user must have to see and access the related page fields or UI element in the client. The UI element will be removed at runtime if the user does not have permissions to a certain object as specified in the **Access By Permission** window. For more information, see [How to: Remove UI Elements Using the AccessByPermission Property](../How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md).  

 To use the **AccessByPermission** property, the **UI Elements Removal** field in the [!INCLUDE[nav_admin](../includes/nav_admin_md.md)] must be set to **LicenseFile** or **LicenseFileAndUserPermissions**. For more information, see [How to: Specify When UI Elements Are Removed](../How-to--Specify-When-UI-Elements-Are-Removed.md).  

> [!NOTE]  
>  To use the **LicenseFileAndUserPermissions** option in the **UI Elements Removal** field, you must assign the special FOUNDATION permission set to the user along with the relevant application permission sets that define which application objects the user will access. Unlike the BASIC permission set, the FOUNDATION permission set only grants access to application setup and system tables and requires that other assigned permission sets define which specific application objects can be accessed. For more information, see [Special Permission Sets](../Special-Permission-Sets.md).  
>   
>  Not all of the 167 default permission sets that are provided with [!INCLUDE[dyn_nav](../includes/dyn_nav_md.md)] are ready to support the FOUNDATION permission set to remove UI elements according to user permissions. You must therefore edit the relevant permission sets as explained in the following procedures.  
>   
>  To experience how UI elements are removed for a user performing the task to create and edit a new customer, you can create a sample user interface based on default permission sets provided with [!INCLUDE[dyn_nav](../includes/dyn_nav_md.md)]. For more information, see [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](../How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md).  

## See Also  
 [AccessByPermission Property](../AccessByPermission-Property.md)   
 [How to: Remove UI Elements Using the AccessByPermission Property](../How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md)   
 [How to: Specify When UI Elements Are Removed](../How-to--Specify-When-UI-Elements-Are-Removed.md)   
 [Removing Elements from the User Interface According to Permissions](../Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](../How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)   
 [Access By Permission](-$-S_2180-Access-By-Permission-$-.md)   
 [How to: Define Permissions for Users](../How-to--Define-Permissions-for-Users.md)   
 [Managing Permissions and Permission Sets](../Managing-Permissions-and-Permission-Sets.md)
