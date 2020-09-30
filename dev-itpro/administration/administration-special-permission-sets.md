---
title: "Special Permission Sets"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Special Permission Sets

The following permission sets have special definitions that you should be aware of as you implement permissions and security for [!INCLUDE[prodshort](../includes/prodshort.md)] users.  

|Permission set|Definition|  
|--------------|----------------|  
|SUPER|Can read, use, update, and delete all data and all application objects in the scope of your license. [!INCLUDE[prodshort](../includes/prodshort.md)] requires that at least one user is assigned this permission set in each database.<br /><br /> The first user created is automatically assigned the SUPER Permission Set<br /><br /> You can't modify permissions for the SUPER permission set.|  
|SUPER \(DATA\)|Can read, use, update, and delete all data. You typically assign this permission set to an accounting manager who needs to work with all data but doesn't need to change [!INCLUDE[prodshort](../includes/prodshort.md)].|  
|SECURITY|Manage the permission sets that are assigned to your account. When assigned this permission set, you can: <ul><li> Create new users and assign them any permission set that is also assigned to your account.</li><li>Remove a permission set from a user as long as the permission set is also assigned to your account. </li><li>Modify individual permission granted by a permission set as long as the permission set is also assigned to your account.</li></ul>The idea behind this permission set is to prohibit you from granting users more permissions than you have. The permission set is useful for SUPER users or global administrators who want to delegate permission management to team administrators. For example, a sales manager can assign permissions in sales area to sales people, sales assistant, sales coordinator, and so on.|  
|BASIC|Grants Read access to almost all application tables and all system tables.<br /><br /> The main purpose of this permission set is to enable the service to open and show all pages.<!-- <br /><br /> When you create a new database, you must import the BASIC permission set from an XML file. -->|  
|FOUNDATION|A prerequisite for all other permission sets. The FOUNDATION permission set grants access to system tables and application setup tables that are required for most application features to work. **Note:** This permission set is recommended when using the UI Elements Removal feature to automatically remove UI elements according to user permissions. For more information, see [Removing Elements from the User Interface According to Permissions](hide-ui-elements.md).|  

## See Also  
[Removing Elements from the User Interface According to Permissions](hide-ui-elements.md)  
[Assign Permissions to Users and Groups](/business-central/ui-define-granular-permissions)
<!--
[Security Overview](Security-Overview.md)   
[Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
[About Permissions](About-Permissions.md)   
[First User Is Automatically Assigned the SUPER Permission Set](First-User-Is-Automatically-Assigned-the-SUPER-Permission-Set.md)   
[How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md)   
 [Profiles and Role Centers](Profiles-and-Role-Centers.md)   
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)  
[Administration Outside of the Clients](Administration-Outside-of-the-Clients.md) -->
