---
title: "Compiler Warning (future error) AL0910"
description: "The field '{0}' cannot be used in a query DataItemLink because it is a FlowField or FlowFilter."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Warning (future error) AL0910

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The field '{0}' cannot be used in a query DataItemLink because it is a FlowField or FlowFilter.


> [!IMPORTANT]
> This warning will become an error with Business Central 2027 release wave 1.  

## Description
FlowFields and FlowFilters are computed at runtime and cannot be used in SQL join operations.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  