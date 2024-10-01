---
title: "AppSourceCop Error AS0082"
description: "Renaming an enum value is not allowed."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0082
It is not allowed to rename an enum value.

## Description
Renaming an enum value is not allowed. Name changes are not allowed because it might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error ensures that the names of enum values remain consistent across different versions of an extension. Renaming an enum value can cause significant issues during the upgrade process, as existing installations and dependent extensions may rely on the original enum value names. Changing these names can lead to data inconsistencies, runtime errors, and unexpected behavior in dependent extensions. Maintaining the original names of enum values ensures compatibility and stability across upgrades.

## How to fix this diagnostic?

To resolve this error, follow these steps:

1. Locate the enum value in your code that has been renamed.
2. Restore the original name of the enum value.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  