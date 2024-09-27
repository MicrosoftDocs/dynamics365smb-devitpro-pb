---
title: "AppSourceCop Error AS0071"
description: "An enum field replacing an option field should preserve the member ordinal values."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0071
An enum field replacing an option field should preserve the member ordinal values.

## Description
An enum field replacing an option field should preserve the member ordinal values. Modifying the member ordinal values might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error ensures that when you replace an option field with an enum field, the ordinal values (the numerical values assigned to each member) of the enum members must match those of the original option members. Changing these ordinal values can lead to data inconsistencies and corruption during the upgrade process. Additionally, dependent extensions that rely on specific ordinal values may fail if those values are altered in the new enum field.

## How to fix this diagnostic?

To resolve this error, follow these steps:

1. Locate the enum field in your code that is replacing an option field.
2. Ensure that the ordinal values of the enum members match those of the original option members.
3. If the ordinal values don't match, adjust the enum members to preserve the original ordinal values.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  