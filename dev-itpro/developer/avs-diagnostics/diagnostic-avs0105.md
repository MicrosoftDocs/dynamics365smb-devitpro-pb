---
title: AVS Error AVS0105
description: "The submission must target at least one existing release of Business Central. Verify the dependencies specified in the app.json of all the apps submitted."
ms.author: thpeder
ms.date: 04/26/2024
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0105

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The submission must target at least one existing release of [!INCLUDE [prod_short](../includes/prod_short.md)]. Verify the dependencies specified in the `app.json` file of all the apps submitted. For more information about the target release computation, see the examples in the [Technical Validation Checklist](../devenv-checklist-submission.md).

## How to fix this diagnostic?

The app.json files has a dependency either from the `application` property or the `dependencies` section that sets the requirement higher than the available releases of [!INCLUDE [prod_short](../includes/prod_short.md)]. To learn more see [Technical Validation FAQ](../devenv-checklist-submission-faq.md).

## See also

[Choosing Runtime Version in AL](../devenv-choosing-runtime.md)
[Get started with AL](../devenv-get-started.md)
[Developing Extensions](../devenv-dev-overview.md)
