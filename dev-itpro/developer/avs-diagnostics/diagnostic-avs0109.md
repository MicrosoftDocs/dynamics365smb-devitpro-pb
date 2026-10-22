---
title: AVS0109 Application Validation Error
description: Learn why Application Validation Service diagnostic AVS0109 reports missing or conflicting dependencies and how to prepare deployment details.
ms.author: thpeder
ms.date: 10/05/2026
ms.reviewer: solsen
ms.topic: reference
author: thpeder
---

# AVS Error AVS0109

The per-tenant extension (or one of its dependencies) cannot be deployed as it has missing dependencies or the dependencies are conflicting with currently installed apps. Check if these dependencies are installed.

## How to fix this diagnostic?

A missing or incompatible dependency can prevent deployment. Confirm that each dependency is installed and that its publisher, name, and version are compatible with the extension. If the problem continues, collect the installed-app and dependency details before contacting support.

## Related information

[Get started with AL](../devenv-get-started.md)  
[Developing extensions in AL](../devenv-dev-overview.md)  