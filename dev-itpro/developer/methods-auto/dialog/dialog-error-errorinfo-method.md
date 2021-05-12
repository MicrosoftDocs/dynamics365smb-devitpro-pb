---
title: "Dialog.Error Method"
description: "Displays an error message and ends the execution of AL code."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# Dialog.Error Method
> **Version**: _Available or changed with runtime version 3.0._

Displays an error message and ends the execution of AL code.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
 Dialog.Error(Message: ErrorInfo)
```
> [!NOTE]
> This method can be invoked without specifying the data type name.
## Parameters
*Message*  
&emsp;Type: [ErrorInfo](../errorinfo/errorinfo-data-type.md)  
The ErrorInfo structure that contains error message, error type, verbosity, and data classification.
        



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Dialog Data Type](dialog-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)