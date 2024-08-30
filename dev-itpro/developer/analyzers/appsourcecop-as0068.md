---
title: "AppSourceCop Error AS0068"
description: "Changing the target of a table extension that has been published is not allowed, because this might break the upgrade of existing installations and dependent extensions."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0068
Changing a table extension's target is not allowed.

## Description
Changing the target of a table extension that has been published is not allowed, because this might break the upgrade of existing installations and dependent extensions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

This error occurs when an attempt is made to change the target table of a table extension that has already been published. The target table of a table extension defines, which table the extension is augmenting. Changing this target can disrupt the upgrade process for existing installations and break dependent extensions that rely on the original target table.

## How to fix this diagnostic?

To resolve this error, you need to avoid changing the target table of a published table extension. Here are the steps:

1. Locate the table extension in your code where the target table has been changed.
2. Restore the target table to its original value.


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  