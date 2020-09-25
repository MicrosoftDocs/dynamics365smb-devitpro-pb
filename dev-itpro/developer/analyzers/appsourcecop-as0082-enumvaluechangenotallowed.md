---
title: "It is not allowed to change a value's ID in an enum."
ms.author: solsen
ms.custom: na
ms.date: 09/23/2020
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
# AppSourceCop Rule AS0082
It is not allowed to change a value's ID in an enum.  

## Description
Changing an enum value's ID is not allowed, unless the enum is marked as obsolete. This restriction prevents dependent extensions from breaking, if they use the old ordinal value of the enum value.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  