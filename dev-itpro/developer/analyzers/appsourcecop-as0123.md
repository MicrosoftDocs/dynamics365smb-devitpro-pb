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

It's not possible for a table to have more than one clustered key, a different key can't be declared as clustered after the table has been created. When no key has been declared as clustered, the first key or the first field that can be part of a key implicitly becomes the clustered key.

## How to fix this diagnostic?

To address the AS0123 error, avoid declaring a key as clustered on an existing table. If you need to introduce a clustered key, create a new table with the desired clustered key instead of modifying the existing one. Here are the steps to fix this diagnostic:

1. Identify the table and key that you intend to declare as clustered.
3. If the change is necessary, create a new table with the desired clustered key.
4. Update your extensions to use the new table instead of modifying the existing one.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  