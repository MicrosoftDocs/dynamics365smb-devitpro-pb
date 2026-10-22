---
title: AVS0105 Application Validation Error
description: Learn why Application Validation Service diagnostic AVS0105 reports no valid target release and how to verify application and dependency requirements.
ms.author: thpeder
ms.date: 10/05/2026
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0105

The submission must target at least one existing release of [!INCLUDE [prod_short](../includes/prod_short.md)]. Verify the dependencies specified in the `app.json` file of all the apps submitted. Learn more about the target release computation in [Technical validation checklist](../devenv-checklist-submission.md).

## How to fix this diagnostic?

One or more `app.json` files specify an `application` or `dependencies` requirement that is later than the available releases of [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more about dependency requirements in [Technical validation FAQ](../devenv-checklist-submission-faq.md).

## Related information

[Choose runtime version in AL](../devenv-choosing-runtime.md)  
[Get started with AL](../devenv-get-started.md)  
[Developing extensions in AL](../devenv-dev-overview.md)  
