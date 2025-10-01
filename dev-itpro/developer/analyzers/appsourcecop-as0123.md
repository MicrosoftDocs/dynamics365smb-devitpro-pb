---
title: "AppSourceCop Error AS0123"
description: "A key cannot be declared as clustered on an existing table."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
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

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  