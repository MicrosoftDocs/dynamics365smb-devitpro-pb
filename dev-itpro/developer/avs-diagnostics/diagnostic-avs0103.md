---
title: AVS0103 Application Validation Error
description: Learn why Application Validation Service diagnostic AVS0103 reports duplicate extension IDs and how to assign a unique app ID before resubmitting.
ms.author: thpeder
ms.date: 10/05/2026
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0103

The extension with ID '{0}' appears multiple times in the submission, while all extensions submitted are expected to have a unique ID.

## How to fix this diagnostic for Marketplace submissions?

Make sure that each submitted `.app` package has a unique app ID and that the same package isn't included more than once. If two different apps use the same ID, assign a new ID to one app, rebuild it, and submit the updated package.

## Related information

[Get started with AL](../devenv-get-started.md)  
[Developing extensions in AL](../devenv-dev-overview.md)  
