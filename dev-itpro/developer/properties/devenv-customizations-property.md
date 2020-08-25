---
title: "Customizations Property"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Customizations Property
Specifies the list of page customizations associated with this profile.
  
## Applies To  
  
- Profile object  

## Property Value

Comma-separated list of page customization object names.

## Syntax
```
Customizations = SimpleCustomization, "My Customization";
```

## Remarks

 Page customizations allow you to add changes to a page's layout and actions. You can apply several customizations to a same RoleCenter and use a single customization for different RoleCenters. For more information about creating page customizations, see [Page Customization Object](../devenv-page-customization-object.md).

 Page customizations only apply to the RoleCenter they are specified for. In order to see them, in [!INCLUDE[prodlong](../includes/prodlong.md)] under **My Settings**, **Role Center** change to the specific RoleCenter for which a page customization is defined.

## See Also  
[Profile Object](../devenv-profile-object.md)  
[Page Customization Object](../devenv-page-customization-object.md)