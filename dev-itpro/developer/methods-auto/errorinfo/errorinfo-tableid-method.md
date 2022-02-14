---
title: "ErrorInfo.TableId([Integer]) Method"
description: "Specifies the table ID that the error relates to."
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
# ErrorInfo.TableId([Integer]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the table ID that the error relates to.


## Syntax
```AL
[TableId := ]  ErrorInfo.TableId([TableId: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] TableId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The table ID of the ErrorInfo  


## Return Value
*[Optional] TableId*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current table ID of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also

[Collecting Errors](../../devenv-error-collection.md)  
[ErrorInfo Data Type](errorinfo-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)