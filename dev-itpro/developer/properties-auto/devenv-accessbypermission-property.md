---
title: "AccessByPermission Property"
ms.author: solsen
ms.custom: na
ms.date: 10/29/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AccessByPermission Property
Sets a value for a table field or UI element that determines the permission mask for an object that a user must have to see and access the related page fields or UI element in the client. The UI element will be removed at runtime if the user does not have permissions to a certain object as specified in the AccessByPermission property.

All types of UI elements will be removed if they relate to an object to which the user does not have the required permissions:

-   Fields on pages, including FactBoxes

-   Actions on pages, including ToolBars and navigation panes

-   Page parts, such as Lines FastTabs

   

## Applies to
-   Field
-   Page Field
-   Page Part
-   Page System Part
-   Page Chart Part
-   Page Action
-   Page
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  