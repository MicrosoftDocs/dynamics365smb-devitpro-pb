---
title: "ErrorInfo.ErrorType Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# ErrorInfo.ErrorType Method
> **Version**: _Available from runtime version 3.0._

Specifies type of the error. 'Client' shows the specified message in the client and sends it to telemetry. 'Internal' shows a generic message in the client and sends the specified message to telemetry.


## Syntax
```
[ErrorType := ]  ErrorInfo.ErrorType([ErrorType: ErrorType])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.

*ErrorType*  
&emsp;Type: [ErrorType](../errortype/errortype-option.md)  
The error type of the error.  


## Return Value
*ErrorType*
&emsp;Type: [ErrorType](../errortype/errortype-option.md)
The current error type of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)