---
title: Create or Modify Permission Sets
description: You can create new permission sets, if the default permission set provided with Dynamics NAV are not sufficient or appropriate for your organization. 
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e5b80343-d193-467f-8259-d6090cffcd76
caps.latest.revision: 23
---
# Creating or Modify Permission Sets
If the default permission sets that are provided with [!INCLUDE[navnow](includes/navnow_md.md)] are not sufficient or not appropriate for your organization, then you can create new permission sets. If the individual object permissions that define a permission set are not adequate, then you can modify a permission set.  

> [!NOTE]  
>  Depending on the setting in the **UI Elements Removal** field in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], only UI elements on objects in the license or on objects that the user has permissions for will appear in the user interface. For more information, see [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md).  
>   
>  The majority of the permission sets that are provided with the [!INCLUDE[demo](includes/demo_md.md)] demonstration database cannot be combined with the FOUNDATION permission set to fully use the UI Elements Removal feature. You must first create or edit the relevant permission sets to avoid that the user is blocked from performing the involved tasks.  

 You can create a permission set manually, or you can record permissions by navigating in the application.  

## Creating or Modifying Permission Sets  

#### To create or edit a permission set  

1.  In the **Search** box, enter **Permission Sets**, and then choose the related link.  

2.  In the **Permission Sets** window, choose **New**.  

3.  In the **Permission Sets** window, type a name for the new permission set in the **Permission Set** field and a brief description in the **Name** field.  

     The name of the new permission set is automatically formatted in all uppercase letters.  

4.  On the **User Permission Sets** FastTab, on the toolbar, choose **Permissions**.  

5.  In the **Permissions** window, type or select a value in the **Object Type** field on the first line in the list.  

    > [!NOTE]  
    >  If you would prefer to select from list that shows all database objects, on the **Home** tab, in the **New** group, choose **All Permissions**.  

6.  In the **Object ID** field, enter the object that you want to define permissions for.  

7.  Fill in the five fields for the different permission types as described in the following table.  

    |[!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |----------------------------------|---------------------------------------|  
    |\<**Blank**>|Specifies that the permission type is not granted for the object.|  
    |**Yes**|Specifies that the permission type is granted with direct access to the object.|  
    |**Indirect**|Specifies that the permission type is granted with indirect access to the object.<br /><br /> Having indirect permission to a table means that you cannot open the table and read from it, but you can view the data in the table through another object, such as a page, that you have direct permission to access.<br /><br /> For more information, see the “Example – Indirect Permission” section in this topic.|  

8.  In the **Security Filter** field, enter a filter that you want to apply to the permissions that you have assigned to the object. For more information, see [Record-Level Security](Record-Level-Security.md).  

9. Repeat steps 2 through 8 to add permissions for additional objects to the permission set.  

#### To record permissions  

1.  In the **Search** box, enter **Permission Sets**, and then choose the related link.  

2.  On the home tab, choose **New**.  

3.  Specify a name for the new permission set in the **Permission Set** field and a brief description in the **Name** field.  

4.  On the Home tab, in the **Process** group, choose **Permissions**.  

5.  In the **Permissions** window, on the **Actions** tab, choose **Start**.  

     This starts a recording process that is based on the code coverage functionality in [!INCLUDE[navnow](includes/navnow_md.md)]. You can now access the various windows and activities in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or the [!INCLUDE[nav_web](includes/nav_web_md.md)] that you want users with this permission set to access. You must carry out the tasks that you want to record permissions for.  

6.  When you want to finish the recording, return to the **Permissions** window, and then, on the **Actions** tab, choose **Stop**.  

7.  Choose **Yes** to add the recorded permissions to the new permission set, or choose **No** to cancel.  

8.  If you choose **Yes**, the objects that you accessed are added to the window. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], only the objects are recorded, so you must specify if users must be able to insert, modify, or delete records in the recorded tables.  

     For more information, see the previous procedure.  

### Example – Indirect Permission  
 You can assign an indirect permission to use an object only through another object.  

 For example, a user can have permission to run codeunit 80, Sales-Post. The Sales-Post codeunit performs many tasks, including modifying table 39, Purchase Line. When the user runs the Sales-Post codeunit, [!INCLUDE[navnow](includes/navnow_md.md)] checks whether the user has permission to modify the Purchase Line table.  

-   If not, then the codeunit cannot complete its tasks, and the user receives an error message.  

-   If so, the codeunit runs successfully.  

 However, the user does not need to have full access to the Purchase Line table to run the codeunit. If the user has indirect permission for the Purchase Line table, then the Sales-Post codeunit runs successfully.  

 When a user has indirect permission, that user can only modify the Purchase Line table by running the Sales-Post codeunit or another object that has permission to modify the Purchase Line table. The user can only modify the Purchase Line table when doing so from supported application areas. The user cannot run the feature inadvertently or maliciously by other methods.  

## See Also  
 [Special Permission Sets](Special-Permission-Sets.md)   
 [About Permissions](About-Permissions.md)   
 [How to: Work with the BASIC Permission Set](how-to-work-with-the-basic-permission-set.md)   
 [Object-Level Security](Object-Level-Security.md)   
 <!-- [User Groups](User-Groups.md) -->   
 [Profiles and Role Centers](Profiles-and-Role-Centers.md)   
 [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)   
 [How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md)
