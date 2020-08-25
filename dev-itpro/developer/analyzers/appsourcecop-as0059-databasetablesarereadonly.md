---
title: "Reserved database tables are read-only in a multi-tenant environment"
ms.author: solsen
ms.custom: na
ms.date: 08/25/2020
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
# AppSourceCop Rule AS0059
Reserved database tables are read-only in a multi-tenant environment  

## Description
Application database tables and reserved application tables should be used only as temporary tables in a multi-tenant environment. Writing to these tables can lead to runtime errors or unexpected behavior.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  