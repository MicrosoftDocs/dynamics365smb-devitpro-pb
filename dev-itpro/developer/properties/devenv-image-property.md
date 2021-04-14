---
title: "Image Property"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Image Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies the icon that you want to associate with a field in a CueGroup control.

## Applies to
-   Page Field
-   Page Action
-   Page Action Group

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

  > [!NOTE]  
  > You can only use images on fields that have an integer data type.

## Syntax

```AL
Image = Report;
```

## Remarks

 On **RoleCenter** type pages, the image property does not apply to actions that are set up in the navigation bar or top-level actions in the action bar. These actions cannot be assigned in icon, or if they have icon by default, the icon cannot be changed. The property only applies to subgroups and child actions in the action bar.

## See Also

[Properties](devenv-properties.md)   