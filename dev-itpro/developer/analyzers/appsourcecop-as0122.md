---
title: "AppSourceCop Error AS0122"
description: "The source symbol for this moved symbol cannot be found in the package with the given AppId."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0122
Source symbol for the moved symbol cannot be found in the package with the given AppId.

## Description
The source symbol for this moved symbol cannot be found in the package with the given AppId.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The symbol you are trying to reference or move doesn't exist in the specified package. This can lead to broken references and functionality issues in your extension. Ensuring that all symbols are correctly referenced and available in the specified package is crucial for maintaining the integrity of your extension.

## How to fix this diagnostic?

To address the AS0122 warning, verify that the source symbol exists in the package with the given AppId. If the symbol has been moved or renamed, update your references accordingly. Here are the steps to fix this diagnostic:

1. Identify the symbol that is causing the AS0122 warning.
2. Verify that the symbol exists in the package with the specified AppId.
3. If the symbol has been moved or renamed, update your references to point to the correct symbol.
4. Ensure that the package containing the symbol is correctly referenced in your extension.

## Related information

[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  