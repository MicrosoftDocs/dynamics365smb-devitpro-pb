---
title: "Entitlement object"
description: "Description of the entitlement object in AL for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 08/18/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: solsen
---

# Entitlement object

[!INCLUDE [2021_releasewave1](../includes/2021_releasewave1.md)]

The entitlement object in [!INCLUDE [prod_short](includes/prod_short.md)] describes which objects in [!INCLUDE [prod_short](includes/prod_short.md)] a customer is entitled to use according to the license that they purchased or the role that they have in AAD. 

An entitlement consists of a number of [PermissionSet Objects](devenv-permissionset-object.md) put together to constitute a set of meaningful permissions for a user. An entitlement can only include permission set objects which reference the objects that are included within the same app. This is to ensure that the entitlements included with one app cannot alter or redefine the entitlements included with another app.

Entitlements can only be used with the online version of [!INCLUDE [prod_short](includes/prod_short.md)].

With [!INCLUDE [prod_short](includes/prod_short.md)] 2023 release wave 2, entitlements can be used to enable transactability for AppSource apps. For more information, see [Selling Business Central apps through AppSource](devenv-sell-apps-appsource.md).

<!--
> [!NOTE]  
> In the current version of [!INCLUDE [prod_short](includes/prod_short.md)] entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks that we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. 
-->

## Snippet support

Typing the shortcut `tentitlement` will create the basic layout for an entitlement object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Entitlement example - delegated admin

This example illustrates a simple entitlement object with the [Type property](properties/devenv-type-property.md) set to `Role`, which means that the is entitlement is associated with an AAD role. When `Type` is set to `Role`, the [RoleType property](properties/devenv-roletype-property.md) is used to distinguish between local and delegated assignments of the role, in this case it is `Delegated`. The [ObjectEntitlements property](properties/devenv-objectentitlements-property.md) defines the list of permissions that the entitlement includes.

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

## Entitlement example - per-user plan

An example of an entitlement where `Type` is `PerUserServicePlan`. This type is used to enable transactability for AppSource apps. The `Id` property is used to map the entitlement to the plan in Partner Center, and must contain the **Service ID** for the plan. For more information, see [Selling Business Central apps through AppSource](devenv-sell-apps-appsource.md).

```al
entitlement BC_PerUserServicePlan
{
    Type = PerUserServicePlan;
    Id = '1a2aaaaa-3aa4-5aa6-789a-a1234567aaaa';

    ObjectEntitlements = "D365 BASIC";
   
}
```

## Entitlement example - unlicensed

For scenarios when the user isn't licensed through entitlements mapping to AppSource offer plans, the `Unlicensed` type of entitlement is used. This type is used to enable side-by-side support for transactability-enabled apps on AppSource. For more information, see [Selling Business Central apps through AppSource](devenv-sell-apps-appsource.md).

```al
entitlement BC_Unlicensed
{    
    Type = Unlicensed;
    ObjectEntitlements = "Custom license";
}

```

## See also

[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Entitlements and Permission Set Overview](devenv-entitlements-and-permissionsets-overview.md)  
[Permission Set Extension Object](devenv-permissionset-ext-object.md)  
[Selling Business Central apps through AppSource](devenv-sell-apps-appsource.md)  
