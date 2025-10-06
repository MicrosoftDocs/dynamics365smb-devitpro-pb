---
title: "CodeCop Warning AA0249"
description: "PageField trigger is unused due to a property value."
ms.author: solsen
ms.date: 08/05/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Warning AA0249
PageField trigger is unused due to a property value.

## Description
PageField trigger is unused due to a property value.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## How to fix this diagnostic?
The warning may be triggered for the [`OnLookup` trigger](../triggers-auto/pagefield/devenv-onlookup-pagefield-trigger.md) while the page field is not editable. In such cases, it is best practice to replace the `OnLookup` trigger with the [`OnDrillDown` trigger](../triggers-auto/pagefield/devenv-ondrilldown-pagefield-trigger.md).

## Related information  
[CodeCop analyzer](codecop.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  
