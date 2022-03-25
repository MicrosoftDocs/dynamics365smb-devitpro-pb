---
title: "ErrorInfo.DetailedMessage([Text]) Method"
description: "Specifies a detailed error message."
ms.author: solsen
ms.custom: na
ms.date: 03/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.DetailedMessage([Text]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies a detailed error message.


## Syntax
```AL
[DetailedMessage := ]  ErrorInfo.DetailedMessage([DetailedMessage: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] DetailedMessage*  
&emsp;Type: [Text](../text/text-data-type.md)  
The detailed message of the ErrorInfo  


## Return Value
*[Optional] DetailedMessage*  
&emsp;Type: [Text](../text/text-data-type.md)  
The current detailed message of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)