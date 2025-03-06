---
title: "AppSourceCop Error AS0129"
description: "An interface must not be added to the list of extended interfaces on an interface that has been published, because dependent extensions may break"
ms.author: solsen
ms.date: 12/19/2024
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
# AppSourceCop Error AS0129
An interface must not be added to the the list of extended interfaces on an interface that has been published.

## Description
An interface must not be added to the list of extended interfaces on an interface that has been published, because dependent extensions may break

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Adding new interfaces to an already published interface can break dependent extensions that rely on the original interface. When an interface is published, other extensions may implement or depend on it. Changing the interface by adding new extended interfaces can introduce compatibility issues and cause dependent extensions to fail.

## How to fix this diagnostic?

To address the AS0129 error, avoid modifying the list of extended interfaces on an interface that has already been published. If you need to introduce new functionality, consider creating a new interface instead of modifying the existing one. Here are the steps to fix this diagnostic:

1. Identify the interface that has been published and is causing the AS0129 error.
2. Evaluate whether the new functionality can be added without modifying the existing interface.
3. If the new functionality is necessary, create a new interface that includes the required extended interfaces.
4. Update your extensions to implement the new interface instead of modifying the existing one.

Learn about how you can extend interfaces in [Extending interfaces in AL](../devenv-interfaces-in-al-extend.md)

## Related information  

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  