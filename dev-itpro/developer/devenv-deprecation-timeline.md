---
title: "Timeline for Deprecating Code in Business Central"
description: "Description of the process deprecating code in the Base App for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/15/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Timeline for Deprecating Code in Business Central

This topic provides an overview of the timeline of how code in the Base App is obsoleted. To obsolete code, the [ObsoleteTag Property](properties/devenv-obsoletetag-property.md) is used to specify where and when an object is marked as obsolete, for example, branch, build, or date of obsoleting the object. The timeline for obsoleting code is the following:

When an object is marked with the `ObsoleteTag`, another 12 months will pass before the code is removed. In some cases even longer, in many cases, Microsoft does not set a specific date. Once developers start seeing deprecation warnings, it is encouraged to start removing dependencies by refactoring their code. This work is important to do because once Microsoft does remove the code, the dependent app will then be broken if it has not been refactored.


## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[ObsoleteTag Property](properties/devenv-obsoletetag-property.md)  
[ObsoleteState Property](properties/devenv-obsoletestate-property.md)  
[ObsoleteReason Property](properties/devenv-obsoletereason-property.md)  
