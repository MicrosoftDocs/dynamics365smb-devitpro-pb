---
title: "ErrorBehavior System Option"
description: "Specifies whether errors will be collected within the scope of the method."
ms.author: solsen
ms.custom: na
ms.date: 11/05/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorBehavior Option Type
> **Version**: _Available or changed with runtime version 8.0._

Specifies whether errors will be collected within the scope of the method.

## Members
|  Member  |  Description  |
|----------------|---------------|
|Collect|Collectible errors will be gathered and code execution will be continued until the end of the ErrorBehvior scope. If errors are left unhandled at the nd of the ErrorBehavior scope, execution will stop with an aggregated error.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
