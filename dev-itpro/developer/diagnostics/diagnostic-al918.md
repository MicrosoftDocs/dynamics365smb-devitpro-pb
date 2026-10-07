---
title: "Compiler Error AL0918"
description: "Interface '{0}' has the same runtime ID as interface '{1}' from module '{2}'."
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Error AL0918

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

Interface '{0}' has the same runtime ID as interface '{1}' from module '{2}'. Rename one of the interfaces or change its methods to resolve the conflict.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The AL compiler assigns a runtime ID to each interface based on its namespace, module, name, and method signatures. The ID generation should result in unique IDs, but in rare cases, conflicts can arise. If two interfaces from different modules produce the same runtime ID, the runtime cannot distinguish between them. This error prevents ambiguous interface dispatch at runtime.

## How to fix it

If your interface triggers this error, rename the interface, change its namespace, or rename one of its methods so the two interfaces produce different runtime IDs.

## Related information
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
[Interfaces in AL](../devenv-interfaces-in-al.md)  
