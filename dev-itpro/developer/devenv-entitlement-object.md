---
title: "Entitlement Object"
description: "Description of the entitlement object in AL for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/30/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Entitlement Object

The entitlement object in [!INCLUDE[prod_short](includes/d365fin_long_md.md)][!INCLUDE [prod_long](includes/prod_long.md)] describes which objects in [!INCLUDE [prod_short](includes/prod_short.md)] a customer is entitled to use according to the license that they purchased from Microsoft or according to the Azure Active Directory role that they have assigned in Microsoft 365 Admin Center, for example, Global Administrator.  

## Snippet support

Typing the shortcut `t?` will create the basic layout for an entitlement object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Entitlement example

```al
entitlement MyEntitlement
{
    LicenseType = Role;
    Roletype = Delegated;
    Entitlements = 
        "MyPermission ""Set", 
        OtherSet;
}

```

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Permission Set Extension Object](devenv-permissionset-ext-object.md)