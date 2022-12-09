---
title: "UICop Info AW0006"
description: "Pages and reports should use the UsageCategory and ApplicationArea properties to be searchable."
ms.author: solsen
ms.custom: na
ms.date: 12/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# UICop Info AW0006
Pages and reports should use the UsageCategory and ApplicationArea properties to be searchable.

## Description
Pages and reports should use the UsageCategory and ApplicationArea properties to be searchable.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## How to fix this diagnostic?

For a page that should be searchable, set both the [UsageCategory](../properties/devenv-usagecategory-property.md) and [ApplicationArea](../properties/devenv-applicationarea-property.md) properties.

If a page should not be searchable, set the property as follows:

```AL
UsageCategory = None;
```

## See Also  
[UICop Analyzer](uicop.md)  
[Get Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
