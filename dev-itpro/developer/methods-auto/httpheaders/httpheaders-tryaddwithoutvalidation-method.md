---
title: "HttpHeaders.TryAddWithoutValidation Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# HttpHeaders.TryAddWithoutValidation Method
> **Version**: _Available or changed with runtime version 3.0._

Adds the specified header and its value into the HttpHeaders collection. Doesn't validate the provided value.


## Syntax
```
[Ok := ]  HttpHeaders.TryAddWithoutValidation(Name: String, Value: String)
```
## Parameters
*HttpHeaders*
&emsp;Type: [HttpHeaders](httpheaders-data-type.md)
An instance of the [HttpHeaders](httpheaders-data-type.md) data type.

*Name*  
&emsp;Type: [String](../string/string-data-type.md)  
The header to add to the collection.  
*Value*  
&emsp;Type: [String](../string/string-data-type.md)  
The content of the header.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the value was added successfully, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpHeaders Data Type](httpheaders-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)