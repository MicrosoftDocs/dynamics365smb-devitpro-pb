---
title: "ErrorInfo.Collectible([Boolean]) Method"
description: "Specifies if the error is collectible using ErrorBehavior.Collect."
ms.author: solsen
ms.custom: na
ms.date: 08/24/2021
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
# ErrorInfo.Collectible([Boolean]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies if the error is collectible using ErrorBehavior.Collect.


## Syntax
```AL
[Collectible := ]  ErrorInfo.Collectible([Collectible: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] Collectible*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The collectible of the ErrorInfo  


## Return Value
*[Optional] Collectible*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The current collectible of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)