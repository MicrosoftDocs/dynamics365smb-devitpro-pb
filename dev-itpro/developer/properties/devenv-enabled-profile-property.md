---
title: Enabled Profile Property Reference
description: Learn how the Enabled property controls whether a profile is available to users in Dynamics 365 Business Central and review its default value.
author: SusanneWindfeldPedersen
ms.date: 08/21/2026
ms.topic: reference
ms.author: solsen
ms.reviewer: solsen
---

# Enabled property on profiles

> **Version**: _Available from runtime version 4.0._

<!-- this article is manually created, and the parent node is devenv-enabled-property.md -->

Specifies whether users can use the profile.

For information about the `Enabled` property for pages, keys, and table fields, see [Enabled property](devenv-enabled-property.md).

## Applies to

- Profiles

## Property value

Set the property to `true` to make the profile available to users. Otherwise, set it to `false`. The default is `true`.

## Syntax

```al
Enabled = false;
```

## Example

The following example explicitly enables a profile.

```al
profile MyProfile
{
    Description = 'Sales order processor profile';
    Caption = 'Sales order processor';
    ProfileDescription = 'Creates and processes sales orders.';
    RoleCenter = MyRoleCenter;
    Enabled = true;
    Promoted = true;
    Customizations = MyCustomization;
}
```

## Related information

[Profile object](../devenv-profile-object.md)  
[Enabled property](devenv-enabled-property.md)  
[Properties](devenv-properties.md)