---
title: "AppSourceCop Error AS0069"
description: "An enum field replacing an option field should have at least the same number of values as the number of options members defined on the field in the previous version of the extension."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 10/01/2024
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0069
An enum field replacing an option field should have at least the same number of members.

## Description
An enum field replacing an option field should have at least the same number of values as the number of options members defined on the field in the previous version of the extension. Having fewer members might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error ensures that when you replace an option field with an enum field, the new enum field must include all the values that were present in the original option field. This is crucial because reducing the number of values can lead to data loss or corruption during the upgrade process. Additionally, dependent extensions that rely on the original option values may fail if those values are not present in the new enum field.

## How to fix this diagnostic?

To resolve this error, follow these steps:

1. Locate the enum field in your code that is replacing an option field.
2. Ensure that the enum field has at least the same number of members as the option field it replaces.
3. If the enum field has fewer members, add the missing members to match the original option field.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
