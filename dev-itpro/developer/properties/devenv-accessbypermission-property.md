---
title: "AccessByPermission Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AccessByPermission Property
> **Version**: _Available or changed with runtime version 1.0._

Sets a value for a table field or UI element that determines the permission mask for an object that a user must have to see and access the related page fields or UI element in the client. The UI element will be removed at runtime if the user does not have permissions to a certain object as specified in the AccessByPermission property.

All types of UI elements will be removed if they relate to an object to which the user does not have the required permissions:

-   Fields on pages, including FactBoxes

-   Actions on pages, including ToolBars and navigation panes

-   Page parts, such as Lines FastTabs

   

## Applies to
-   Table Field
-   Page Field
-   Page Part
-   Page System Part
-   Page Chart Part
-   Page Action
-   Page
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


> [!IMPORTANT]  
>  If the **AccessByPermission** property is applied to a page field from a virtual table, this property is ignored. This means that users will see this field on the page in the client even if they do not have the permissions that are required by this property.

> [!NOTE]  
>  For this property to take effect in the client, the **UI Elements Removal** setting of [!INCLUDE[server](../includes/server.md)] configuration must be set to **LicenseFile** or **LicenseFileAndUserPermissions**. For more information, see [Hide UI Elements](../../administration/hide-ui-elements.md).  

## Property Values  

The **AccessByPermission** property values are as described below: 

| Values   |Represents  |Description   |
|----------|------------|-------------------------------------------------------|
|R         |Read        |Specify if Read permission is required to display the UI element.|
|I         |Insert      |Specify if Insert permission is required to display the UI element.| 
|M         |Modify      |Specify if Modify permission is required to display the UI element.
|D         |Delete      |Specify if Delete permission is required to display the UI element.|
|X         |Execute     |Specify if Execute permission is required to display the UI element.|

## Syntax
```AL
AccessByPermission = tabledata MySetup = I; 
```

## Remarks

The property value for TableData can be set with a combination of **Read**, **Insert**, **Modify** and **Delete** permissions. This means, you can set the property value to ``RIMD`` permissions; the value ``X`` is not valid for TableData. 

For other objects including Table, Page, Query, Report, Codeunit, or Xmlport, it can only be **Execute** permission. This means, you can set the property value to ``X`` for the specified object type. 

> [!NOTE]  
>  If you set multiple permissions, then one or the other applies. 

## Dependent Property

The **UsageCategory** property is a required setting used together with the **AccessByPermission** property. This enables a page or a report to be available in Search for the navigation support. For more information about navigation support, see [Adding Pages and Reports to Search](../devenv-al-menusuite-functionality.md).  

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  