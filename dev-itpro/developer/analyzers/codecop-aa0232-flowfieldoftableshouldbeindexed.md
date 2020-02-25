---
title: "The FlowField of a table should be indexed."
ms.author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/25/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CodeCop Rule AA0232
The FlowField of a table should be indexed.  

## Description
You can potentially increase performance if fields that are used in FlowFields are added to SumIndexedFields of the corresponding key.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[CodeCop Analyzer](codecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  