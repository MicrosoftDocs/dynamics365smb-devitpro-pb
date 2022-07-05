---
title: "ErrorInfo.Callstack() Method"
description: "Specifies a callstack where the ErrorInfo was collected."
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
# ErrorInfo.Callstack() Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies a callstack where the ErrorInfo was collected.


## Syntax
```AL
Callstack :=   ErrorInfo.Callstack()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

## Return Value
*Callstack*  
&emsp;Type: [Text](../text/text-data-type.md)  
The callstack where the ErrorInfo was collected.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also

[Collecting Errors](../../devenv-error-collection.md)  
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)