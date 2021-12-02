---
title: "ErrorInfo.FieldNo([Integer]) Method"
description: "Specifies the field ID that the error relates to."
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
# ErrorInfo.FieldNo([Integer]) Method
> **Version**: _Available or changed with runtime version 8.0._

Specifies the field ID that the error relates to.


## Syntax
```AL
[FieldNo := ]  ErrorInfo.FieldNo([FieldNo: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*ErrorInfo*  
&emsp;Type: [ErrorInfo](errorinfo-data-type.md)  
An instance of the [ErrorInfo](errorinfo-data-type.md) data type.  

*[Optional] FieldNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The field ID of the ErrorInfo  


## Return Value
*[Optional] FieldNo*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current field ID of the ErrorInfo.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also

[Collecting Errors](../../devenv-error-collection.md)  
[ErrorInfo Data Type](errorinfo-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)
[Developing Extensions](../../devenv-dev-overview.md)