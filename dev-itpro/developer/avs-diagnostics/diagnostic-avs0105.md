---
title: "AVS Error AVS0105"
description: "The submission must target at least one existing release of Business Central. Verify the dependencies specified in the app.json of all the apps submitted."
ms.author: thpeder
ms.custom: na
ms.date: 02/05/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: thpeder
---

# AVS Error AVS0105

[!INCLUDE[banner_preview](../includes/banner_preview.md)]

The submission must target at least one existing release of [!INCLUDE [prod_short](../includes/prod_short.md)]. Verify the dependencies specified in the `app.json` file of all the apps submitted. For more information about the target release computation, see the examples in the [Technical Validation Checklist](../devenv-checklist-submission.md).

## How to fix this diagnostic?

The app.json files has a dependency either from the `application` property or the `dependencies` section that sets the requirement higher than the available releases of [!INCLUDE [prod_short](../includes/prod_short.md)]. To learn more see [Technical Validation FAQ](../devenv-checklist-submission-faq.md).

## See Also

[Choosing Runtime Version in AL](../devenv-choosing-runtime.md)
[Getting Started with AL](../devenv-get-started.md)
[Developing Extensions](../devenv-dev-overview.md)
