---
title: "Type (Entitlement) Property"
description: "The type of entitlement."
ms.author: solsen
ms.custom: na
ms.date: 08/18/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---

<!-- this topic is manually created, parent node is devenv-type-property.md -->

# Type (Entitlement) Property

> **Version**: _Available or changed with runtime version 7.0._

The type of entitlement. When a user logs into [!INCLUDE [prod_short](../includes/prod_short.md)], it's checked if the user is assigned the given Azure AD service plan, the given Azure AD role etc., and if that's the case, the user will be entitled to use the objects covered by this entitlement. The same applies if an application logs into Business Central.

## Applies to
-   Entitlement

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**PerUserServicePlan**|The entitlement is associated with an Azure AD service plan which is licensed to specific users.|
|**PerUserOfferPlan**|The entitlement is associated with an offer, which is licensed to specific users.|
|**FlatRateServicePlan**|The entitlement is associated with an Azure AD service plan which is licensed to an Azure AD tenant|
|**Role**|The entitlement is associated with an Azure AD role.|
|**ConcurrentUserServicePlan**|The entitlement is associated with a named Azure AD group.|
|**Application**|The entitlement is associated with an Azure AD application.|
|**ApplicationScope**|The entitlement is associated with an Azure AD application scope.|
|**Implicit**|Everyone has this license.|
|**Unlicensed**|Entitlement applied when no other entitlements from an app has been applied. This type is used to enable side-by-side support for transactability-enabled apps on AppSource. For more information, see [Selling Business Central apps through AppSource](devenv-sell-apps-appsource.md).|
|**Group**|The entitlement is associated with a specific Azure AD group, identified by the object ID specified in the id property. For more information, see [Selling Business Central apps through AppSource](devenv-sell-apps-appsource.md).|

## Remarks

> [!NOTE]  
> With [!INCLUDE [prod_short](../../includes/prod_short.md)] 2023 release wave 1, the entitlement type `Unlicensed` is introduced. This type is used for scenarios when the user isn't licensed through entitlements mapping to AppSource offer plans. 
> 
> The `Unlicensed` type of entitlement is only applied to users who don't have a plan, that is a license, defined in the app’s entitlements. You can test for the unlicensed scenario and perform your custom licensing as before for existing customers, allowing side-by-side support while transitioning existing customers to the new AppSource transactability model. For more information, see [Selling Business Central apps through AppSource](devenv-sell-apps-appsource.md).

<!--
> [!NOTE]  
> In the current version of [!INCLUDE [prod_short](../../includes/prod_short.md)] entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks that we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. For more information, see [Entitlement Object](../devenv-entitlement-object.md). -->

When `Type` is set to `Role`, the [RoleType Property](devenv-roletype-property.md) is used to further define whether the `RoleType` is `Local` or `Delegated`.


## Syntax

The following code snippet, shows how to use the `Type` property in the `entitlement` object. For more information, see [Entitlement object](../devenv-entitlement-object.md).

```al
entitlement MyEntitlement
{
    ...
    Type = Role;                    // Entitlement type, if Role, then specify RoleType property
    RoleType = Delegated;
    ObjectEntitlements = 
        ”D365 BUS PREMIUM - BaseApp”;​
}
```

## See Also

[Get Started with AL](../devenv-get-started.md)  
[Entitlement object](../devenv-entitlement-object.md)  
[Type (Report) Property](devenv-type-report-property.md)  