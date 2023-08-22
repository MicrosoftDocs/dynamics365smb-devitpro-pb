---
title: "FieldRef.TestField(Decimal, ErrorInfo) Method"
description: "Determines whether the contents of a field matches a given value."
ms.author: solsen
ms.custom: na
ms.date: 11/25/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# FieldRef.TestField(Decimal, ErrorInfo) Method
> **Version**: _Available or changed with runtime version 8.1._

Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.


## Syntax
```AL
 FieldRef.TestField(Value: Decimal, ErrorInfo: ErrorInfo)
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*Value*  
&emsp;Type: [Decimal](../decimal/decimal-data-type.md)  
The value that you want to compare with the contents of the field referred to by FieldRef. The data type of Value must match the type of the field. If you include Value and the contents of the field do not match, an error message is displayed. If you omit Value and the content of the field is zero or blank (empty string), an error message is displayed.  

*ErrorInfo*  
&emsp;Type: [ErrorInfo](../errorinfo/errorinfo-data-type.md)  
Additional information to include in the error if the test fails.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[FieldRef Data Type](fieldref-data-type.md)
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)