---
title: AVS0006 Application Validation Error
description: Learn why Application Validation Service diagnostic AVS0006 reports an unsupported runtime version and how to target a supported version.
ms.author: thpeder
ms.date: 10/05/2026
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0006

The runtime version '{0}' is not supported for the release '{1}' because its latest supported runtime version is '{2}'.

## How to fix this diagnostic?

In the app's `app.json` file, specify the latest supported runtime version or an earlier version. Learn more about this setting in [app.json file](../devenv-json-files.md#appjson-file) and [Choose runtime version in AL](../devenv-choosing-runtime.md).

## Related information

[Get started with AL](../devenv-get-started.md)  
[Developing extensions in AL](../devenv-dev-overview.md)  
