---
title: "Record.FieldError(Any, ErrorInfo) Method"
description: "Stops the execution of the code causing a run-time error, and creates an error message for a field."
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
# Record.FieldError(Any, ErrorInfo) Method
> **Version**: _Available or changed with runtime version 8.1._

Stops the execution of the code causing a run-time error, and creates an error message for a field.


## Syntax
```AL
 Record.FieldError(Field: Any, ErrorInfo: ErrorInfo)
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field*  
&emsp;Type: [Any](../any/any-data-type.md)  
The field for which you want to create an error message.
        

*ErrorInfo*  
&emsp;Type: [ErrorInfo](../errorinfo/errorinfo-data-type.md)  
Additional information to include in the error if the test fails.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[Record Data Type](record-data-type.md)
[Getting Started with AL](../../devenv-get-started.md)    
[Developing Extensions](../../devenv-dev-overview.md)  