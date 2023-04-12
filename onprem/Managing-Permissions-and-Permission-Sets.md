---
title: "Managing Permissions and Permission Sets"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 392ea3d8-e127-4a7a-8404-c558aa8fef50
---
# Managing Permissions and Permission Sets
A *permission set* is a set of permissions for a set of objects in the [!INCLUDE[navnow](includes/navnow_md.md)] database that you can assign to one or more users. A number of predefined permission sets are provided by default in the [!INCLUDE[demolong](includes/demolong_md.md)]. You can use these permission sets as defined, modify them, or create your own permission sets. Then, add the new permissions sets to the relevant user groups, or create new user groups. For more information, see [Managing  User Groups](managing-user-groups.md).  

When you create a new [!INCLUDE[navnow](includes/navnow_md.md)] database, only one permission set is provided automatically: the SUPER permission set.  

As you create and define permissions for permission sets in a new database, remember to always add the BASIC permission set, which grants users access to required system tables and other fundamental tables.  

The BASIC permission set primarily functions as a prerequisite to open the client and show all pages. The BASIC permission set is provided in an XML file, UserRoles.xml, which you import into your database using a [!INCLUDE[rtc](includes/rtc_md.md)]. Permissions for the BASIC permission set are provided in a separate XML file, UserRolePermissions.xml, which you also import. For more information, see [How to: Work with the BASIC Permission Set](how-to-work-with-the-basic-permission-set.md).  

> [!NOTE]  
>  Another prerequisite permission set is the FOUNDATION permission set.  
>   
>  This permission set, together with other application permission sets, is required to automatically remove UI elements according to user permissions. For more information, see [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md).  

> [!NOTE]  
>  Depending on the setting in the **UI Elements Removal** field in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], only UI elements that the user has permissions for will appear in the user interface. For more information, see [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md).  

## See Also  
[About Permissions](About-Permissions.md)   
[Managing Users](Managing-Users.md)
[Managing  User Groups](managing-user-groups.md)
[First User Is Automatically Assigned the SUPER Permission Set](First-User-Is-Automatically-Assigned-the-SUPER-Permission-Set.md)  
[How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md)  
[Special Permission Sets](Special-Permission-Sets.md)  
[Profiles and Role Centers](Profiles-and-Role-Centers.md)   
[Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)
