---
title: "RoleType Property"
description: "If the entitlement type is Role, the RoleType is used to distinguish between local and delegated assignments of the role."
ms.author: solsen
ms.custom: na
ms.date: 10/25/2023
ms.reviewer: na
ms.suite: na
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
|**Local**|runtime version 1.0|The user is either a native user or a guest user in the company's Azure AD tenant, and that specific Azure AD role was assigned in the given Azure AD tenant.|
|**Delegated**|runtime version 1.0|The user has the given Azure AD role in the company's Azure AD tenant via a Delegated Admin relationship with a partner's Azure AD tenant.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

> [!NOTE]  
> In the current version of [!INCLUDE [prod_short](../../includes/prod_short.md)] entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks that we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. For more information, see [Entitlement Object](../devenv-entitlement-object.md).

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