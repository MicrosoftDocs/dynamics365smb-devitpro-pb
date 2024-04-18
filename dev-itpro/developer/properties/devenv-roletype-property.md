---
title: "RoleType Property"
description: "If the entitlement type is Role, the RoleType is used to distinguish between local and delegated assignments of the role."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RoleType Property
> **Version**: _Available or changed with runtime version 7.0._

If the entitlement type is Role, the RoleType is used to distinguish between local and delegated assignments of the role.

## Applies to
-   Entitlement

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**Local**|runtime version 7.0|The user is either a native user or a guest user in the company's Microsoft Entra tenant, and that specific Microsoft Entra role was assigned in the given Microsoft Entra tenant.|
|**Delegated**|runtime version 7.0|The user has the given Microsoft Entra role in the company's Microsoft Entra tenant via a Delegated Admin relationship with a partner's Microsoft Entra tenant.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

When the [Type Property](devenv-type-property.md) is set to `Role`, the `RoleType` property is used to further define whether the `RoleType` is `Local` or `Delegated`.


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

## See Also  

[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Type Property](devenv-type-property.md)