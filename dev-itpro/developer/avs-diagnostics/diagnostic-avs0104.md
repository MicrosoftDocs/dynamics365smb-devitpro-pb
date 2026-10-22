---
title: AVS0104 Application Validation Error
description: Learn why Application Validation Service diagnostic AVS0104 rejects a runtime package and how to submit a non-runtime package instead.
ms.author: thpeder
ms.date: 10/05/2026
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0104

The extension '{0}' by '{1}' (version '{2}') is a runtime package, which is not allowed in [!INCLUDE [prod_short](../includes/prod_short.md)] online.

## How to fix this diagnostic?

Submit a new non-runtime package because [!INCLUDE [prod_short](../includes/prod_short.md)] online doesn't allow runtime packages. Learn more about the restrictions in [Runtime package limitations](../devenv-creating-runtime-packages.md#limitations).

## Related information

[Get started with AL](../devenv-get-started.md)  
[Developing extensions in AL](../devenv-dev-overview.md)  
