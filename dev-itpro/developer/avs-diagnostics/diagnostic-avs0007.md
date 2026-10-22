---
title: AVS0007 Application Validation Error
description: Learn why Application Validation Service diagnostic AVS0007 reports an unsupported release and how to verify the app's target release.
ms.author: thpeder
ms.date: 10/05/2026
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0007

The release version '{0}' is not supported.

## How to fix this diagnostic?

Target a [!INCLUDE[prod_short](../includes/prod_short.md)] release that the validation service supports. This diagnostic concerns the release being validated, not only the `runtime` value in `app.json`. If you can't select the target release directly, verify the submission's application and dependency versions or contact support to determine why the unsupported release was selected.

## Related information

[Get started with AL](../devenv-get-started.md)  
[Developing extensions in AL](../devenv-dev-overview.md)  
