---
title: "ExecutionContext System Option"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# ExecutionContext Option Type
> **Version**: _Available or changed with runtime version 1.0._

Represents the context in which a session is running. In certain scenarios, for example during upgrade, the system will run a session in a special context for a limited time.

## Members
|  Member  |  Description  |
|----------------|---------------|
|Normal|The normal execution context.|
|Install|An application is being installed.|
|Uninstall|An application is being uninstalled.|
|Upgrade|An application is being upgraded.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  