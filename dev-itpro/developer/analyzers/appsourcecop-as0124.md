---
title: "AppSourceCop Error AS0124"
description: "Changing the target of an extension object that has been published is not allowed, because this might break the dependent extensions."
ms.author: solsen
ms.date: 12/19/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 12/19/2024
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0124
Changing an extension object's target is not allowed.

## Description
Changing the target of an extension object that has been published is not allowed, because this might break the dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Altering the target of a published extension object can break dependent extensions that rely on the original target. When an extension object is published, other extensions may depend on its target. Changing the target can introduce compatibility issues and cause dependent extensions to fail.

## How to fix this diagnostic?

To address the AS0124 error, avoid changing the target of an extension object that has already been published. If you need to introduce new functionality or changes, consider creating a new extension object with the desired target instead of modifying the existing one. Here are the steps to fix this diagnostic:

1. Identify the extension object with the target that you intend to change.
2. Evaluate whether the change is necessary or if you can achieve your goal without modifying the existing target.
3. If the change is necessary, create a new extension object with the desired target.
1. Update your extensions to use the new extension object instead of modifying the existing one. 
1. Deprecate the extension object if it's a page extension or page customization and/or all its members.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  