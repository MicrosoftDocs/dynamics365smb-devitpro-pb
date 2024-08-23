---
title: "AppSourceCop Error AS0008"
description: "The namespace must be different from System and Microsoft."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0008
Defining reserved namespaces is not allowed.

## Description
The namespace must be different from System and Microsoft.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Using reserved namespaces like `System` or `Microsoft` can lead to conflicts and unexpected behavior, as these namespaces are intended for the platform's internal libraries and functionality. By enforcing this rule, AppSourceCop ensures that your code remains isolated and doesn't interfere with the core system libraries, promoting better maintainability and compatibility.

To resolve ths error, identify the namespace and change it to a unique name that doesn't conflict with reserved namespaces.

## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  