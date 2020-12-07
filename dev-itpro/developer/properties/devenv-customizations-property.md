---
title: "Customizations Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
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
# Customizations Property
> **Version**: _Available from runtime version 1.0._

Specifies the Page Customizations which are applied with this profile.

## Applies to
-   Profile


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value

Comma-separated list of page customization object names.

## Syntax

```AL
Customizations = SimpleCustomization, "My Customization";
```

## Remarks

Page customizations allow you to add changes to a page's layout and actions. You can apply several customizations to a same RoleCenter and use a single customization for different RoleCenters. For more information about creating page customizations, see [Page Customization Object](../devenv-page-customization-object.md).

Page customizations only apply to the RoleCenter they are specified for. In order to see them, in [!INCLUDE[prodlong](../includes/prodlong.md)] under **My Settings**, **Role Center** change to the specific RoleCenter for which a page customization is defined.

## See Also  

[Profile Object](../devenv-profile-object.md)  
[Page Customization Object](../devenv-page-customization-object.md)