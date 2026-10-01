---
title: "AppSourceCop Warning AS0152"
description: "Dependent enum extensions have the default implementation codeunit's object ID baked into their compiled metadata."
ms.author: solsen
ms.date: 08/31/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0152
Removing a codeunit used as a default implementation is a runtime breaking change.

## Description
Dependent enum extensions have the default implementation codeunit's object ID baked into their compiled metadata. Removing that codeunit causes a runtime error 'Codeunit metadata not found' when the interface is invoked on extension enum values.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[AppSourceCop analyzer](appsourcecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  