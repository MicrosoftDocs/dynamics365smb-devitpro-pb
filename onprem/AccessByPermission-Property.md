---
title: "AccessByPermission Property"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 72602cd4-853f-4bca-8fd9-b33c206a593b
caps.latest.revision: 12
manager: edupont
---
# AccessByPermission Property
Sets a value for a table field or UI element that determines the permission mask for an object that a user must have to see and access the related page fields or UI element in the client. The UI element will be removed at runtime if the user does not have permissions to a certain object as specified in the **Access By Permission** window. For more information, see [How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md).  

 All types of UI elements will be removed if they relate to an object to which the user does not have the required permissions:  

-   Fields on pages, including FactBoxes  

-   Actions on pages, including toolbars and navigation panes  

-   Page parts, such as **Lines** FastTabs  

> [!NOTE]  
>  To use this property, the **UI Elements Removal** field in the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] must be set to **LicenseFile** or **LicenseFileAndUserPermissions**. For more information, see [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md).  

## Applies To  

-   Fields in tables \(affecting all related fields on pages\)  

-   Fields on pages  

-   Actions on pages  

-   MenuSuite items  

-   Page parts, such as a **Lines** FastTab  

## Property Value  
 When you choose the **AssistEdit** button, the **Access By Permission** window opens. Fill the fields as described in the following table.  

|[!INCLUDE[bp_tablefield](includes/bp_tablefield_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------------------------|---------------------------------------|  
|**Object Type**|Specify the type of object to which permission is required to display the UI element.|  
|**Object ID**|Specify the object to which permission is required to display the UI element.|  
|**Read**|Specify if Read permission is required to display the UI element.|  
|or **Insert**|Specify if Insert permission is required to display the UI element.|  
|or **Modify**|Specify if Modify permission is required to display the UI element.|  
|or **Delete**|Specify if Delete permission is required to display the UI element.|  
|or **Execute**|Specify if Execute permission is required to display the UI element.|  

> [!NOTE]  
>  If multiple permissions are selected, then one or the other applies.  

## Example: Remove the Unit Price field if the user does not have permission to the Sales Price table  

1.  Open table 27, **Item Card**, with the Table Designer.  

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

> [!NOTE]  
>  To use the **LicenseFileAndUserPermissions** option in the **UI Elements Removal** field, you must assign the special FOUNDATION permission set to the user along with the relevant application permission sets that define which application objects the user will access. Unlike the BASIC permission set, the FOUNDATION permission set only grants access to application setup and system tables and requires that other assigned permission sets define which specific application objects can be accessed. For more information, see [Special Permission Sets](Special-Permission-Sets.md).  
>   
>  Not all of the 167 default permission sets that are provided with [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)] are ready to support the FOUNDATION permission set to remove UI elements according to user permissions. You must therefore edit the relevant permission sets as explained in the following procedures.  
>   
>  To experience how UI elements are removed for a user performing the task to create and edit a new customer, you can create a sample user interface based on default permission sets provided with [!INCLUDE[dyn_nav](includes/dyn_nav_md.md)]. For more information, see [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md).  

## See Also  
 [How to: Remove UI Elements Using the AccessByPermission Property](How-to--Remove-UI-Elements-Using-the-AccessByPermission-Property.md)   
 [How to: Specify When UI Elements Are Removed](How-to--Specify-When-UI-Elements-Are-Removed.md)    
 [How to: Try Out the UI Elements Removal Feature Based on Demonstration Permission Sets](How-to--Try-Out-the-UI-Elements-Removal-Feature-Based-on-Demonstration-Permission-Sets.md)   
 [Removing Elements from the User Interface According to Permissions](Removing-Elements-from-the-User-Interface-According-to-Permissions.md)   
 [Properties](Properties.md)   
 [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md)   
 [Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md)
