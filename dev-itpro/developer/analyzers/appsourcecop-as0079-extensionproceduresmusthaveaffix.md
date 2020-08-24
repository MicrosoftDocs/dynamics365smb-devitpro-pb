---
title: "An affix is required for procedures defined in extension objects."
ms.author: solsen
ms.custom: na
ms.date: 06/19/2020
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
# AppSourceCop Rule AS0079
An affix is required for procedures defined in extension objects.  

## Description
An affix is required for procedures defined in extension objects, because it prevents breaking dependent extensions that reference it in case a procedure with the same signature is introduced by the base object or by another extension.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  