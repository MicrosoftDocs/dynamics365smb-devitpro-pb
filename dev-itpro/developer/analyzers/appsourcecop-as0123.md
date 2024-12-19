---
title: "AppSourceCop Error AS0123"
description: "A key cannot be declared as clustered on an existing table."
ms.author: solsen
ms.date: 08/26/2024
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
# AppSourceCop Error AS0123
A key cannot be declared as clustered on an existing table.

## Description
A key cannot be declared as clustered on an existing table.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Changing the clustering of a key on an existing table can have significant performance implications and may disrupt the behavior of dependent extensions. Clustered keys determine the physical order of data in a table, and altering them can lead to unexpected results and degraded performance.

## How to fix this diagnostic?

To address the AS0123 error, avoid declaring a key as clustered on an existing table. If you need to introduce a clustered key, consider creating a new table with the desired clustered key instead of modifying the existing one. Here are the steps to fix this diagnostic:

1. Identify the table and key that you intend to declare as clustered.
2. Evaluate whether the change is necessary or if you can achieve your goal without modifying the existing table.
3. If the change is necessary, create a new table with the desired clustered key.
4. Update your extensions to use the new table instead of modifying the existing one.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  