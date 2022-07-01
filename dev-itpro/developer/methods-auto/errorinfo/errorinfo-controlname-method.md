---
title: "ErrorInfo.ControlName([Text]) Method"
description: "Specifies the control name that the error relates to."
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
# ErrorInfo.ControlName([Text]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the control name that the error relates to.


## Syntax
```AL
[ControlName := ]  ErrorInfo.ControlName([ControlName: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] ControlName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The control name of the ErrorInfo  


## Return Value
*[Optional] ControlName*  
&emsp;Type: [Text](../text/text-data-type.md)  
The current control name of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  