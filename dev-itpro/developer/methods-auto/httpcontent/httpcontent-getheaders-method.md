---
title: "HttpContent.GetHeaders Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# HttpContent.GetHeaders Method
> **Version**: _Available from runtime version 1.0._

Gets the HTTP content headers as defined in RFC 2616.


## Syntax
```
[Ok := ]  HttpContent.GetHeaders(var Headers: HttpHeaders)
```
## Parameters
*HttpContent*
&emsp;Type: [HttpContent](httpcontent-data-type.md)
An instance of the [HttpContent](httpcontent-data-type.md) data type.

*Headers*  
&emsp;Type: [HttpHeaders](../httpheaders/httpheaders-data-type.md)  
The HTTP headers associated with the content.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpContent Data Type](httpcontent-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)