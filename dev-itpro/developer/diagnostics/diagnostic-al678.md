---
title: "Compiler Information AL0678"
description: "The metadata name of {0} '{1}' conflicts with {2} '{3}' defined in {4} '{5}' by the extension '{6}'."
ms.author: solsen
ms.date: 04/21/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Compiler Information AL0678

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The metadata name of {0} '{1}' conflicts with {2} '{3}' defined in {4} '{5}' by the extension '{6}'. Choose another name for one of them. Otherwise, this might cause runtime issues.


## Description
During compilation, identifier names are transformed into metadata names, which are used to interface with the runtime and may be further constrained than regular AL identifiers. This can cause collisions when different AL names result in the same metadata name. Common causes include names that differ only in white space or identifiers that match keywords reserved by the system.  

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  