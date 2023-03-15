---
title: "CodeCop Warning AA0246"
description: "Suppressing all diagnostics is not allowed."
ms.author: solsen
ms.custom: na
ms.date: 03/15/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Warning AA0246
Suppressing all diagnostics is not allowed.

## Description
Suppressing all diagnostics is not allowed. Specify the diagnostic(s) that you want to suppress.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

Enabling this rule allows to enforce that when suppressing diagnostics using the #pragma warning `disable`, the code(s) of the diagnostics to suppress must be specified instead of suppressing all analyzer diagnostics and compiler warnings.

## See Also

[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Directives in AL](../directives/devenv-directives-in-al.md)