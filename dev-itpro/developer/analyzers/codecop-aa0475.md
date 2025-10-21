---
title: "CodeCop Error AA0475"
description: "Truncate can only be used on normal tables and not on system tables, temporary tables, or tables with media fields."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Error AA0475
Truncate can only be used on normal tables without media fields and outside of try functions.

## Description
Truncate can only be used on normal tables and not on system tables, temporary tables, or tables with media fields. Truncate also cannot be used within a try function.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[CodeCop analyzer](codecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  