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

[!INCLUDE [2021_releasewave1](../includes/2021_releasewave1.md)]

The entitlement object in [!INCLUDE[prod_short](includes/d365fin_long_md.md)][!INCLUDE [prod_long](includes/prod_long.md)] describes which objects in [!INCLUDE [prod_short](includes/prod_short.md)] a customer is entitled to use according to the license that they purchased or the role that they have in AAD. 

An entitlement consists of a number of [PermissionSet Object](devenv-permissionset-object.md) put together to constitute a set of meaningful permissions for a user. An entitlement can only include permission set objects which reference the objects that are included within the same app. This is to ensure that the entitlements included with one app cannot alter or redefine the entitlements included with another app.

Entitlements can only be used with the online version of [!INCLUDE[prod_short](includes/d365fin_long_md.md)][!INCLUDE [prod_long](includes/prod_long.md)].

> [!NOTE]  
> In the current version of [!INCLUDE[prod_short](includes/d365fin_long_md.md)] entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks that we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. 

## Snippet support

Typing the shortcut `tentitlement` will create the basic layout for an entitlement object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Entitlement examples

This example illustrates a simple entitlement object with the <!--[Type property](properties/devenv-type-property.md)--> [Type property](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-type-property?branch=new-properties) set to `Role`, which means that the is entitlement is associated with an AAD role. When `Type` is set to `Role`, the <!-- [RoleType property](properties/devenv-roletype-property.md)--> [RoleType property](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-roletype-property?branch=new-properties) is used to distinguish between local and delegated assignments of the role, in this case it is `Delegated`. The <!--[ObjectEntitlements property](properties/devenv-objectentitlements-property.md)-->[ObjectEntitlements property](https://review.docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/properties/devenv-objectentitlements-property?branch=new-properties) defines the list of permissions that the entitlement includes.

```al
entitlement BC_Role_Delegated
{
    Type = Role;
    RoleType = Delegated;
    Id = '1a2aaaaa-3aa4-5aa6-789a-a1234567aaaa';
    ObjectEntitlements = 
        ”D365 BUS PREMIUM - BaseApp”;​
}

```

An example of an entitlement where `Type` is `PerUserServicePlan`:

```al
entitlement BC_PerUserServicePlan
{
    Type = PerUserServicePlan;
    Id = '1a2aaaaa-3aa4-5aa6-789a-a1234567aaaa';

    ObjectEntitlements = "D365 BASIC";
   
}
```

## See Also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Entitlements and Permission Set Overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Extension Object](devenv-permissionset-ext-object.md)
