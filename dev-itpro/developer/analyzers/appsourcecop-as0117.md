---
title: "AppSourceCop Warning AS0117"
description: "When an application object is moved we should first set the ObsoleteState to PendingMove in a previous version of the extension."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 01/02/2025
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Warning AS0117
Application object is moved without the use of PendingMove.

## Description
When an application object is moved we should first set the ObsoleteState to PendingMove in a previous version of the extension.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

An application object has been moved without first setting the `ObsoleteState` to `PendingMove` in a previous version of the extension. This is important because setting the `ObsoleteState` to `PendingMove` provides a transition period for dependent extensions to adapt to the change. It allows developers to mark an object as obsolete and indicate that it will be moved in a future version, giving dependent extensions time to update their references and avoid breaking changes.

## How to fix this diagnostic?

Follow a two-step process when moving an application object. First, set the `ObsoleteState` to `PendingMove` in a previous version of the extension. Then, in a subsequent version, move the object to its new location. Here are the steps to fix this diagnostic:

1. Identify the application object that has been moved and is causing the AS0117 warning.
2. In the current version of the extension, set the `ObsoleteState` of the object to `PendingMove` and provide an `ObsoleteReason` and `ObsoleteTag`.
3. In the next version of the extension, move the object to its new location and update the references accordingly.

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  