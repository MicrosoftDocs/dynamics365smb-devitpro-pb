---
title: "AppSourceCop Error AS0083"
description: "Deleting an enum value is not allowed, unless the enum is marked as obsolete."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0083
It is not allowed to delete a value from an enum.

## Description
Deleting an enum value is not allowed, unless the enum is marked as obsolete. This restriction prevents dependent extensions from breaking, if they use the enum value.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error ensures that enum values remain consistent and available across different versions of an extension. Deleting an enum value can cause significant issues for dependent extensions that rely on that value. These extensions may fail to function correctly if the expected enum value is missing, leading to runtime errors and unexpected behavior. By marking an enum value as obsolete instead of deleting it, you provide a transition period during which dependent extensions can adapt to the change without breaking.

## How to fix this diagnostic?

To resolve this error, follow these steps:

1. Locate the enum value in your code that has been deleted.
2. Re-add the deleted enum value to the enum definition.
3. If the enum value should no longer be used, mark it as obsolete instead of deleting it.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  