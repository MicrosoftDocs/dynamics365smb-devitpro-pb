---
title: "Microsoft Timeline for Deprecating Code in Business Central"
description: "Description of the timeline for deprecating code in Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/16/2021
ms.reviewer: solsen
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Microsoft Timeline for Deprecating Code in Business Central

This topic provides an overview of the timeline of when to expect code to be obsoleted once you start seeing warnings when extending it. To obsolete objects, the [ObsoleteState Property](properties/devenv-obsoletestate-property.md) and [ObsoleteTag Property](properties/devenv-obsoletetag-property.md) are used to specify where and when an object is marked as obsolete, for example, branch, build, or date of obsoleting the object. For methods and variables, the [Obsolete Attribute](methods/devenv-obsolete-attribute.md) is used for the same purpose. Some of the best practices for how Microsoft deprecates code can be seen in the [Best Practices for Deprecation of Code in the Base App](devenv-deprecation-guidelines.md) topic. 

When Microsoft obsoletes code, we intentionally set the obsolete tag to the version in which the element is obsoleted and not when the code will be removed. This is due to the fact that our deprecation rules and timelines may change, and that releases and versioning schemes may change. Setting the version in which things are obsoleted is a statement of fact and does not change. When an object is marked as obsolete, another 12 months will pass before the code is removed, in some cases even longer. Microsoft does not set a specific date for the removal due to engineering and architectural considerations. This means that once you start getting warnings the feature or code will not be deprecated for at least two versions. If the tag is set to, for example, `'18.0'`, the code will still be present in versions 19 and 20. We will at the earliest remove the code in version 21.

When a major update of [!INCLUDE[prod_short](../includes/prod_short.md)] is released, and you start seeing deprecation warnings, it is strongly encouraged to start removing dependencies by refactoring the code. This work is important to do because once Microsoft does remove the code, the dependent app will be broken if it has not been refactored.

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Directives in AL](directives/devenv-directives-in-al.md)  
[Best Practices for Deprecation of Code in the Base App](devenv-deprecation-guidelines.md)  
[ObsoleteTag Property](properties/devenv-obsoletetag-property.md)  
[ObsoleteState Property](properties/devenv-obsoletestate-property.md)  
[ObsoleteReason Property](properties/devenv-obsoletereason-property.md)  
