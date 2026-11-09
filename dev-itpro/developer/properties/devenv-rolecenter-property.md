---
title: "RoleCenter Property in Business Central"
description: "Learn how to assign a role center page to a Business Central profile, reuse pages across profiles, and separate profile settings from permissions."
ms.author: solsen
ms.date: 11/05/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# RoleCenter Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the Role Center Page for this profile.

## Applies to
-   Profile

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## Syntax

```AL
RoleCenter = MyRoleCenter;
```

## Remarks

Set `RoleCenter` to the name or ID of the page that users open as their home page when they use the profile. The referenced page must have its [PageType property](devenv-pagetype-property.md) set to `RoleCenter`.

Multiple profiles can use the same role center page. Use the [Customizations property](devenv-customizations-property.md) to apply different page customizations for each profile instead of duplicating the role center page. Learn more in [Designing profiles](../devenv-design-profiles.md).

Assigning a role center to a profile doesn't grant users permission to open the page or access its underlying data. Users still need the required permissions through their permission sets. Learn more in [Assign permissions to users and groups](/dynamics365/business-central/ui-define-granular-permissions).

## Related information

[Profile object](../devenv-profile-object.md)  
[Designing role centers](../devenv-designing-role-centers.md)  