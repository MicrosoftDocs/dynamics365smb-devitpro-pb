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

The entitlement object in [!INCLUDE[prod_short](includes/d365fin_long_md.md)][!INCLUDE [prod_long](includes/prod_long.md)] describes which objects in [!INCLUDE [prod_short](includes/prod_short.md)] a customer is entitled to use according to the license that they purchased or the role that they have in AAD. 

An entitlement consists of a number of [PermissionSet Object](devenv-permissionset-object.md) put together to constitute a set of meaningful permissions for a user. An entitelment can only include [PermissionSet Object](devenv-permissionset-object.md) which reference the objects included within the same app. This is to ensure that the entitlements included with one app cannot alter or redefine the entitlements included with another app. 

Entitlements can only be used with the online version of [!INCLUDE[prod_short](includes/d365fin_long_md.md)][!INCLUDE [prod_long](includes/prod_long.md)].

> [!NOTE]
> In the current version of [!INCLUDE[prod_short](includes/d365fin_long_md.md)][!INCLUDE [prod_long](includes/prod_long.md)] the entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. 

## Snippet support

Typing the shortcut `t?` will create the basic layout for an entitlement object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Entitlement example

```al
entitlement MyEntitlement
{
    LicenseType = Role;
    Roletype = Delegated;
    ObjectEntitlements = 
        ”D365 BUS PREMIUM - BaseApp”;​
}

```

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Permission Set Extension Object](devenv-permissionset-ext-object.md)
