---
title: "PageBackgroundTaskErrorLevel system option"
description: "Specifies how an error in the page background task appears in the client."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# PageBackgroundTaskErrorLevel Option Type
> **Version**: _Available or changed with runtime version 4.0._

Specifies how an error in the page background task appears in the client.

## Members
|  Member  |  Description  |
|----------------|---------------|
|Error|Error occurring in a page background task is displayed as an normal error in the client. This is the default value.|
|Warning|Error occurring in a page background task is displayed as an warning in the client. **Note:** Any error thrown in completion trigger will ignore this value and will be displayed in the client as a normal error.|
|Ignore|Error occurring in a page background task is not displayed in the client. **Note:** Any error thrown in completion trigger will ignore this value and will be displayed in the client as a normal error.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
