---
title: "AppSourceCop Error AS0115"
description: "The obsolete state cannot change directly from 'No' to 'Removed'."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AppSourceCop Error AS0115
The obsolete state cannot change directly from 'No' to 'Removed'.

## Description
The obsolete state cannot change directly from 'No' to 'Removed'. This can break the upgrade of existing installations and dependent extensions. Instead, the obsolete state must be changed to 'Pending' in this version and changed to 'Removed' in a later version.

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[AppSourceCop Analyzer](appsourcecop.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  