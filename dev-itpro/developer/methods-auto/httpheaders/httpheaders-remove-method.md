---
title: "HttpHeaders.Remove(Text) Method"
description: "Removes the specified header from the HttpHeaders collection."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpHeaders.Remove(Text) Method
> **Version**: _Available or changed with runtime version 1.0._

Removes the specified header from the HttpHeaders collection.


## Syntax
```AL
[Ok := ]  HttpHeaders.Remove(Name: Text)
```
## Parameters
*HttpHeaders*  
&emsp;Type: [HttpHeaders](httpheaders-data-type.md)  
An instance of the [HttpHeaders](httpheaders-data-type.md) data type.  

*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the header to remove from the collection.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the element is successfully removed; otherwise, **false**. This method also returns **false** if the given header was not found in the HttpHeaders collection. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[HttpHeaders Data Type](httpheaders-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)