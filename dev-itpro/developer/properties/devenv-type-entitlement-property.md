---
title: Type Property for Entitlement Objects
description: Learn how the Type property identifies the licensing source for an entitlement object in Dynamics 365 Business Central and review its values.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Type property on entitlement objects

> **Version**: _Available from runtime version 7.0._

<!-- this article is manually created, and the parent node is devenv-type-property.md -->

Specifies the licensing source associated with an entitlement object. Business Central uses the value to determine whether a user or application receives the permissions included in the entitlement.

## Applies to

- Entitlement objects

## Property value

| Value | Available from | Description |
|-------|----------------|-------------|
| `PerUserServicePlan` | Runtime version 7.0 | Associates the entitlement with a Microsoft Entra service plan licensed to specific users. |
| `FlatRateServicePlan` | Runtime version 7.0 | Associates the entitlement with a Microsoft Entra service plan licensed to a tenant. |
| `Role` | Runtime version 7.0 | Associates the entitlement with a Microsoft Entra role. |
| `ConcurrentUserServicePlan` | Runtime version 7.0 | Associates the entitlement with a named Microsoft Entra group and assigns licenses based on the number of concurrent users. |
| `Application` | Runtime version 7.0 | Associates the entitlement with a Microsoft Entra application. |
| `ApplicationScope` | Runtime version 7.0 | Associates the entitlement with a Microsoft Entra application scope. |
| `Implicit` | Runtime version 7.0 | Applies the entitlement to everyone. |
| `PerUserOfferPlan` | Runtime version 10.1 | Associates the entitlement with an offer licensed to specific users. |
| `Unlicensed` | Runtime version 10.2 | Applies when the app doesn't apply another entitlement to the user. |
| `Group` | Runtime version 11.1 | Associates the entitlement with a Microsoft Entra group identified by the `Id` property. |

When `Type` is `Role`, use the [RoleType property](devenv-roletype-property.md) to specify a `Local` or `Delegated` role.

## Syntax

```al
entitlement MyEntitlement
{
    Type = Role;
    RoleType = Delegated;
    Id = 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb';
    ObjectEntitlements = "My Permission Set";
}
```

## Related information

[Entitlement object](../devenv-entitlement-object.md)  
[Selling Business Central apps through Marketplace](../devenv-sell-apps-appsource.md)  
[Type property for report layouts](devenv-type-report-property.md)  
[Properties](devenv-properties.md)
