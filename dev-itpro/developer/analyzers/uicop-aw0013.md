---
title: "UICop Warning AW0013"
description: "Promoted actions defined in a hidden group are still rendered on the promoted section of the command bar, but this behavior might change and these promoted actions might be hidden in the future."
ms.author: solsen
ms.custom: na
ms.date: 06/15/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# UICop Warning AW0013
Groups containing promoted actions should not be hidden.

## Description
Promoted actions defined in a hidden group are still rendered on the promoted section of the command bar, but this behavior might change and these promoted actions might be hidden in the future. If you want to see these actions on the promoted side, remove the Visible property on the group and add 'PromotedOnly = true' on the promoted actions. If you do not want to see these actions on the promoted side, removed the Promoted property on the promoted actions.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[UICop Analyzer](uicop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  