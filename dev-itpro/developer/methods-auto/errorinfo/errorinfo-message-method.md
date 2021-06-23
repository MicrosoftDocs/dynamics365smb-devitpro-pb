---
title: "ErrorInfo.Message Method"
description: "Specifies the message that will be sent to telemetry."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# ErrorInfo.Message Method
> **Version**: _Available or changed with runtime version 3.0._

Specifies the message that will be sent to telemetry. For a 'Client' error type, the message will also be appear in the client.


## Syntax
```AL
[Message := ]  ErrorInfo.Message([Message: String])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] Message*  
&emsp;Type: [String](../string/string-data-type.md)  
The message of the the ErrorInfo  


## Return Value
*[Optional] Message*  
&emsp;Type: [String](../string/string-data-type.md)  
The current message of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)