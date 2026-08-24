---
title: Promoted Property for Profiles
description: Learn how the Promoted property controls whether a profile is available in Role Explorer in Dynamics 365 Business Central.
ms.date: 08/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.author: solsen
ms.reviewer: solsen
---

# Promoted property on profiles

> **Version**: _Available from runtime version 4.0._

<!-- this article is manually created, and the parent node is devenv-promoted-property.md -->

Specifies whether the profile is available to users in **Role Explorer**. The profile must also be enabled.

The `Promoted` property also applies to page actions. Learn more in [Promoted property for page actions](devenv-promoted-action-property.md).

## Applies to

- Profiles

## Property value

Set the property to `true` to make the profile available in **Role Explorer** when the profile is enabled. Otherwise, set it to `false`. The default is `false`.

## Example

The following example makes a profile available in **Role Explorer**.

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

[Properties](devenv-properties.md)  
[Profile properties](devenv-profile-properties.md)  
[Promoted property for page actions](devenv-promoted-action-property.md)
