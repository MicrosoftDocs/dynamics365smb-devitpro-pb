---
title: "AppSourceCop Error AS0128"
description: "An interface must not be removed from the list of extended interfaces on an interface that has been published, because dependent extensions may break"
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
ai-usage: ai-assisted
ms.custom:
 - ai-gen-docs-bap
 - ai-seo-date: 12/19/2024
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0128
An interface must not be removed from the the list of extended interfaces on an interface that has been published.

## Description
An interface must not be removed from the list of extended interfaces on an interface that has been published, because dependent extensions may break

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Removing an extended interface from a published interface can break dependent extensions that rely on the original interface. When an interface is published, other extensions may implement or depend on it. Changing the interface by removing extended interfaces can introduce compatibility issues and cause dependent extensions to fail.

## How to fix this diagnostic?

To address the AS0128 error, avoid modifying the list of extended interfaces on an interface that has already been published. If you need to deprecate functionality, consider marking the interface as obsolete instead of removing it. Here are the steps to fix this diagnostic:

1. Identify the interface that has been published and is causing the AS0128 error.
2. Evaluate whether the functionality can be deprecated without modifying the existing interface.
3. If the functionality needs to be deprecated, mark the interface as obsolete using the `ObsoleteState` and `ObsoleteReason` attributes.
4. Update your documentation and notify dependent extension developers about the deprecation.

## Related information  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  