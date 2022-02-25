---
title: "Type Property"
description: "Sets the format type of the report layout."
ms.author: solsen
ms.custom: na
ms.date: 02/04/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Type Property
> **Version**: _Available or changed with runtime version 9.0._

Sets the format type of the report layout.

## Applies to
-   Report Layout
-   Entitlement

## Property Value

|Value|Description|
|-----------|---------------------------------------|
|**RDLC**|Specifies that the format of this report layout is RDLC.|
|**Word**|Specifies that the format of this report layout is Word.|
|**Excel**|Specifies that the format of this report layout is Excel.|
|**Custom**|Specifies that the format of this report layout is a user-defined custom type. This requires the MimeType property to be set.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

> [!NOTE]  
> In the current version of [!INCLUDE [prod_short](../../includes/prod_short.md)] entitlements can only be included with Microsoft apps (enforced by the AppSource cop rules and the technical validation checks that we run for the apps submitted to AppSource). These objects will become available for the ISV apps when we introduce ability to monetize AppSource apps in one of our future releases. For more information, see [Entitlement Object](../devenv-entitlement-object.md).

When `Type` is set to `Role`, the [RoleType Property](devenv-roletype-property.md) is used to further define whether the `RoleType` is `Local` or `Delegated`.


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
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  