---
title: "ErrorInfo.Verbosity Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.Verbosity Method
Specifies the severity level of the error. This can determine whether the error should be sent to telemetry (which is based on the trace level setting of the server).


## Syntax
```
[Verbosity := ]  ErrorInfo.Verbosity([Verbosity: Verbosity])
```
> [!NOTE]  
> This method can be invoked using property access syntax.  
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*Verbosity*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
The verbosity that the error should be sent with.  


## Return Value
*Verbosity*  
&emsp;Type: [Verbosity](../verbosity/verbosity-option.md)  
The current verbosity of the ErrorInfo.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)