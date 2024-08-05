---
title: "How to: Remove UI Elements Using the AccessByPermission Property"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 4bb3447d-246e-43c1-a83e-10424955b497
caps.latest.revision: 21
---
# How to: Remove UI Elements Using the AccessByPermission Property
UI elements that are directly related to an object through the **TableRelation** or the **CalcFormula** property can be removed automatically according to the license file and/or user permissions. For more information, see [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md).  
  
 For UI elements that are not directly related to an object, you can use the **AccessByPermission** property to remove an element according to the user’s permission to a related object.  
  
 The **AccessByPermission** property sets a value for a table field or UI element that determines the permission mask for an object that a user must have to see and access the related page fields or UI element in the client. The UI element will be removed at runtime if the user does not have permissions to a certain object as specified in the **Access By Permission** window. For more information, see [AccessByPermission Property](AccessByPermission-Property.md).  
  
 To make full use of the **LicenseFileAndUserPermissions** option in the **UI Elements Removal** field, it is recommended that you assign the special permission set, FOUNDATION, along with the relevant permission sets that define which application objects the user will access.  
  
> [!IMPORTANT]  
>  The majority of the permission sets that are provided with the [!INCLUDE[demo](includes/demo_md.md)] demonstration database cannot be combined with the FOUNDATION permission set to fully use the UI Elements Removal feature. You must first create or edit the relevant permission sets to avoid that the user is blocked from performing the involved tasks. For more information, see [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md).  
>   
>  If you only use the **LicenseFile** option in the **UI Elements Removal** field, then you do not have to edit any permission sets as they will not affect which UI elements are removed.  
  
### To remove UI elements by using the AccessByPermission property  
  
1.  In the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], view the properties of a table field for which you want to remove its page control\(s\) or view the properties of a field, action, or part on a page object. For more information, see [How to: View or Modify Properties on a Table or Field](How-to--View-or-Modify-Properties-on-a-Table-or-Field.md).  
  
2.  For the **AccessByPermission** property, choose the **AssistEdit** button.  
  
3.  In the **Access By Permission** window, fill the fields as described in the following table.  
  
    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**Object Type**|Specify the type of object to which permission is required for the UI element to be visible.|  
    |**Object ID**|Specify the object to which permission is required for the UI element to be visible.|  
    |**Read**|Specify if Read permission is required for the UI element to be visible.|  
    |**Insert**|Specify if Insert permission is required for the UI element to be visible.|  
    |**Modify**|Specify if Modify permission is required for the UI element to be visible.|  
    |**Delete**|Specify if Delete permission is required for the UI element to be visible.|  
    |**Execute**|Specify if Execute permission is required for the UI element to be visible.|  
  
    > [!NOTE]  
    >  When multiple permissions are selected, then one or another applies. For example, if you choose **Insert** and **Modify**, then the user must have either the Insert or the Modify permission to the object for the UI element to be visible.  
  
4.  Save and compile the changes.  
  
 The UI element in question is now invisible to users who do not have the specified permissions to the object.  
  
> [!IMPORTANT]  
>  If you defined the property for a table field, then all instances of the field on pages are removed from the user’s view. To override the property on an individual page field, delete the permission value after the **=** sign in the **Value** field. Do not delete the whole string as that will be replicated on the property of the table field.  
  
> [!TIP]  
>  When you configure user interfaces in [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)], you should make sure that the **UI Elements Removal** field is set to its default, **LicenseFileAndUserPermissions**, so that you only see the relevant UI elements in the **Customize** window. For more information, see [Profiles and Role Centers](Profiles-and-Role-Centers.md).  
>   
>  When you develop in [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)], you should make sure that the **UI Elements Removal** field is set to its default, **None**, to make sure that all UI elements are visible when you review your development in the UI.  
  
### Example: Remove the Unit Price field if the user does not have permission to the Sales Price table  
  
1.  Open table 27, **Item Card**, in the Table Designer.  
  
2.  View the properties of field 18, **Unit Price**.  
  
3.  For the **AccessByPermission** property, choose the **AssistEdit** button in the **Value** field.  
  
4.  In the **Access By Permission** window, fill the fields as described in the following table.  
  
    |[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
    |---------------------------------|---------------------------------------|  
    |**Object Type**|TableData|  
    |**Object ID**|Sales Price|  
    |**Read**|Select|  
    |**Insert**|Select|  
    |**Modify**|Leave blank|  
    |**Delete**|Leave blank|  
    |**Execute**|Leave blank|  
  
5.  Close the **Access By Permission** window and save the changes on table 27.  
  
 All instances of the **Unit Price** field on pages are now removed if the user does have Read or Insert permission to the **Sales Price** table.  
  
> [!IMPORTANT]  
>  If you defined the property for a table field, then all instances of the field on pages are removed. To override the property on an individual page field, delete the permission value after the **=** sign in the **Value** field. Do NOT delete the whole string as that will be replicated on the property of the table field.  
  
## See Also  
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)   
 [AccessByPermission Property](AccessByPermission-Property.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [How to: Create or Modify Permission Sets](How-to--Create-or-Modify-Permission-Sets.md)   
 [Special Permission Sets](Special-Permission-Sets.md)   
 [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md)   
 [How to: View or Modify Properties on a Table or Field](How-to--View-or-Modify-Properties-on-a-Table-or-Field.md)   
 [Properties](Properties.md)