---
title: "Special Permission Sets"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f115c382-7a1b-4290-8609-d2b2f294667d
caps.latest.revision: 32
---
# Special Permission Sets
The following permission sets have special definitions that you should be aware of as you implement permissions and security for [!INCLUDE[navnow](includes/navnow_md.md)] users.  

|Permission set|Definition|  
|--------------------|----------------|  
|SUPER|Can read, use, update, and delete all data and all application objects in the scope of your license. [!INCLUDE[navnow](includes/navnow_md.md)] requires that at least one user be assigned this permission set in each database.<br /><br /> For more information, see [First User Is Automatically Assigned the SUPER Permission Set](First-User-Is-Automatically-Assigned-the-SUPER-Permission-Set.md).<br /><br /> You cannot modify permissions for the SUPER permission set.|  
|SUPER \(DATA\)|Can read, use, update, and delete all data. You typically assign this permission set to an accounting manager who needs to work with all data but does not need to change [!INCLUDE[navnow](includes/navnow_md.md)].<br /><br /> This permission set does not give access to the Object Designer.|  
|SECURITY|Can create new users and assign them the same permission sets. Must be able to access the **User**, **User Property**, **Permission Set**, and **Access Control** tables.<br /><br /> For example, you can create a SECURITY permission set that includes the four required tables and any additional permissions that you want to include. You can then assign this permission set to a user who is a department administrator. This user can then administer permissions for other users in their department.<br /><br /> Only a user who has the SUPER permission set can create and modify a SECURITY permission set. Users who have this permission set can assign the same permissions to other users, but they cannot assign themselves the SUPER permission set.|  
|BASIC|Grants Read access to almost all application tables and all system tables.<br /><br /> The main purpose of this permission set is to enable the client to open and show all pages.<br /><br /> When you create a new database, you must import the BASIC permission set from an XML file. For more information, see [How to: Work with the BASIC Permission Set](how-to-work-with-the-basic-permission-set.md).|  
|FOUNDATION|A prerequisite for all other permission sets. The FOUNDATION permission set grants access to system tables and application setup tables that are required for most application features to work. **Note:**  This permission set is recommended when using the UI Elements Removal feature to automatically remove UI elements according to user permissions. For more information, see [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md).|  

## See Also  
 [Security Overview](Security-Overview.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [About Permissions](About-Permissions.md)   
 [First User Is Automatically Assigned the SUPER Permission Set](First-User-Is-Automatically-Assigned-the-SUPER-Permission-Set.md)   
 [How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md)   
 [Profiles and Role Centers](Profiles-and-Role-Centers.md)   
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)  
 <!-- [Administration Outside of the Clients](Administration-Outside-of-the-Clients.md) -->
