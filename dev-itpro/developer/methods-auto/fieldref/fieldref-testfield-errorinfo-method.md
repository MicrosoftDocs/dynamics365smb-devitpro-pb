---
title: "FieldRef.TestField(ErrorInfo) Method"
description: "Determines whether the contents of a field matches a given value."
ms.author: solsen
ms.custom: na
ms.date: 10/07/2021
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
# FieldRef.TestField(ErrorInfo) Method
> **Version**: _Available or changed with runtime version 8.1._

Determines whether the contents of a field matches a given value. If the contents differ from the given value, an error message is displayed.


## Syntax
```AL
 FieldRef.TestField(ErrorInfo: ErrorInfo)
```
## Parameters
*FieldRef*  
&emsp;Type: [FieldRef](fieldref-data-type.md)  
An instance of the [FieldRef](fieldref-data-type.md) data type.  

*ErrorInfo*  
&emsp;Type: [ErrorInfo](../errorinfo/errorinfo-data-type.md)  
Additional information to include in the error if the test fails.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[FieldRef Data Type](fieldref-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)