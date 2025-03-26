---
title: Deprecating BcContainerHelper
description: Learn about the deprecation of BcContainerHelper and its replacement in AL-Go for GitHub.
ms.date: 03/20/2025
ms.reviewer: solsen
ms.topic: overview
author: SusanneWindfeldPedersen
---

# Deprecating BcContainerHelper

`BcContainerHelper` is an open-source PowerShell module, which is available on the [PowerShell Gallery](https://powershellgallery.com/packages/BcContainerHelper). You can find the source code on [GitHub](https://github.com/microsoft/navcontainerhelper).

Microsoft will phase out the usage of `BcContainerHelper` in AL-Go for GitHub, with official support for `BcContainerHelper` ending on October 1, 2027.

If you currently rely on `BcContainerHelper` for custom DevOps solutions, we recommend that you switch to [AL-Go for GitHub](https://github.com/microsoft/AL-Go) or another managed DevOps option to eliminate dependency on `BcContainerHelper`.

For local development on Docker, equivalent functionality will likely become available in a new PowerShell module released as part of AL-Go for GitHub.

If you use `BcContainerHelper` for older Dynamics NAV or [!INCLUDE [prod_short](../developer/includes/prod_short.md)] versions, it might continue to work for a while after it's supported. The source code will remain on GitHub, and you may continue using it after October 1, 2027. However, as [!INCLUDE [prod_short](../developer/includes/prod_short.md)] evolves, `BcContainerHelper` will eventually become outdated and cease to function.

## Related information

[Microsoft timeline for deprecating code in Business Central](../developer/devenv-deprecation-timeline.md)  
[AL development environment](../developer/devenv-reference-overview.md)