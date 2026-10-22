---
title: AVS0003 Application Validation Error
description: Learn why Application Validation Service diagnostic AVS0003 reports a duplicate file name and how to fix and resubmit the Business Central app.
ms.author: thpeder
ms.date: 10/05/2026
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0003

The file '{0}' could not be added to the file system because a file with the same name already exists.

## How to fix this diagnostic?

Remove or rename the duplicate file, and then rebuild and resubmit the app. File-name matching is case-insensitive, so names that differ only by capitalization also conflict. If the validation service introduced the duplicate, contact support and include the file name from the diagnostic.

## Related information

[Get started with AL](../devenv-get-started.md)  
[Developing extensions in AL](../devenv-dev-overview.md)  