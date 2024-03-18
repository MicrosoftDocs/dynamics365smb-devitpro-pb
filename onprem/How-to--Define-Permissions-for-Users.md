---
title: Define User Permissions
description: Dynamics NAV provides a standard permission sets. All users must be assigned one or more permission sets before they can access Dynamics NAV.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: a8018367-db1d-45fd-b086-0b8fe714b709
caps.latest.revision: 22
---
# Define Permissions for Users
[!INCLUDE[navnow](includes/navnow_md.md)] provides a set of standard permission sets. A permission set is a collection of permissions for specific objects in the database. All users must be assigned one or more permission sets before they can access [!INCLUDE[navnow](includes/navnow_md.md)].  
  
> [!NOTE]  
>  Depending on the setting in the **UI Elements Removal** field in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], only UI elements that the user has permissions for will appear in the user interface. For more information, see [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md).  
  
 A number of predefined permission sets are provided by default in [!INCLUDE[navnow](includes/navnow_md.md)]. You can use these permission sets as already defined, modify the default permission sets, or create additional permission sets.  
  
> [!NOTE]  
>  A table can contain a FlowField that generates sums based on values that are stored in another table. In this case, users must have permission to read both tables or they will not be able to read the first table.  
  
### To define permissions for a user  
  
1.  In the **Search** box on your **Home** page in the [!INCLUDE[rtc](includes/rtc_md.md)], type  **Users** and then choose the associated link in the Results list.  
  
2.  Select a user and choose **Edit** in the ribbon.  
  
     Any permission sets that are already assigned to the user are displayed in the **User Permission Sets** area.  
  
3.  To assign a new permission set to the user, click to position the cursor on a blank line in the in the **User Permission Sets** area and then choose the **Assist** button in the **Permission Set** column to display a list of existing permission sets.  
  
4.  Click to select a permission set.  
  
5.  If there is more than one company in your database, you can type or select a company in the **Company** column to restrict these permissions to that company. If you leave this column blank, the user will have the relevant permissions for the entire database.  
  
6.  Choose the **OK** button to exit the **Edit – User Card** page.  
  
## See Also  
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
 [How to: Assign a User to a Profile](how-to-assign-a-user-to-a-profile.md)   
 [Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md)   
 [Profiles and Role Centers](Profiles-and-Role-Centers.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)
