---
title: "AppSourceCop Warning AS0136"
description: "The field must be pending for obsoletion so that its ID can change."
ms.author: solsen
ms.date: 02/26/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0136
Field IDs can only be changed with proper obsoletion.

## Description
The field must be pending for obsoletion so that its ID can change.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

When you need to change the ID of a field, you must first mark the field as obsolete and provide a replacement field. This allows existing implementations to continue functioning while giving developers time to transition to the new field. Once the field is marked as obsolete, you can then change its ID in a future release. This process ensures that changes are made in a controlled manner, minimizing disruption for users and maintaining compatibility with existing extensions and customizations. Learn more in [Obsolete objects, methods, and symbols in AL](../devenv-obsolete-objects.md).


## Related information

[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  