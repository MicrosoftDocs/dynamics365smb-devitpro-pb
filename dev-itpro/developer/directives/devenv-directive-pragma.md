---
title: Pragma Directives in AL Overview
description: Explore the pragma directives and supported actions that control compiler warnings and implicit record contexts in Microsoft Dynamics 365 Business Central.
author: SusanneWindfeldPedersen
ms.date: 10/05/2026
ms.topic: overview
ms.author: solsen
ms.reviewer: solsen
---

# Pragma directives and actions in AL

[!INCLUDE[2020_releasewave2](../../includes/2020_releasewave2.md)]

## Supported pragma directives

The `#pragma` directive gives the compiler special instructions for the compilation of the file in which it appears. AL supports two pragma instructions. `#pragma warning` supports the `disable` and `restore` actions. `#pragma implicitwith` supports the `enable`, `disable`, and `restore` actions.

AL supports the following pragma instructions:

- [Pragma ImplicitWith](devenv-directive-pragma-implicitwith.md)
- [Pragma Warning](devenv-directive-pragma-warning.md)

## Related information

[Development in AL](../devenv-dev-overview.md)  
[AL development environment](../devenv-reference-overview.md)  
[Region directive in AL](devenv-directive-region.md)  
[Conditional directives](devenv-directives-in-al.md#conditional-directives)  
[Deprecating explicit and implicit with statements](../devenv-deprecating-with-statements-overview.md)
