---
title: "AppSourceCop Rule AS0083"
description: "Deleting an enum value is not allowed, unless the enum is marked as obsolete."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Rule AS0083
It is not allowed to delete a value from an enum.

## Description
Deleting an enum value is not allowed, unless the enum is marked as obsolete. This restriction prevents dependent extensions from breaking, if they use the enum value.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  