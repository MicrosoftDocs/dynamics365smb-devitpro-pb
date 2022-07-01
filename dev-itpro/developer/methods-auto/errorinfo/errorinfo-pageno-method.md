---
title: "ErrorInfo.PageNo([Integer]) Method"
description: "Specifies the page number that the error relates to."
ms.author: solsen
ms.custom: na
ms.date: 08/24/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ErrorInfo.PageNo([Integer]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the page number that the error relates to.


## Syntax
```AL
[PageNo := ]  ErrorInfo.PageNo([PageNo: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] PageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The page number of the ErrorInfo  


## Return Value
*[Optional] PageNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current page number of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also

[Collecting Errors](../../devenv-error-collection.md)  
[ErrorInfo Data Type](errorinfo-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)