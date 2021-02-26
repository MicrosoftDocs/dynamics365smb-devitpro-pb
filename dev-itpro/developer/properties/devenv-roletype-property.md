---
title: "Roletype Property"
ms.author: solsen
ms.custom: na
ms.date: 01/26/2021
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
# Roletype Property
> **Version**: _Available or changed with runtime version 7.0._

If the entitlement type is Role, the RoleType is used to distinguish between local and delegated assignments of the role.

## Applies to
-   Entitlement

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**Local**|The user is either a native user or a guest user in the company's AAD tenant, and that specific AAD role was assigned in the given AAD tenant.|
|**Delegate**|The user has the given AAD role in the company's AAD tenant via a Delegated Admin relationship with a partner's AAD tenant.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

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

## Remarks

When the [Type Property](devenv-type-property.md) is set to `Role`, the `RoleType` property is used to further define whether the `RoleType` is `Local` or `Delegated`.

## See Also  

[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Type Property](devenv-type-property.md)