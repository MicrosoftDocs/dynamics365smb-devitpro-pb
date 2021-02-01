---
title: "HttpClient.Put Method"
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
# HttpClient.Put Method
> **Version**: _Available from runtime version 1.0._

Sends a PUT request to the specified URI as an asynchronous operation.


## Syntax
```
[Ok := ]  HttpClient.Put(Path: String, Content: HttpContent, var Response: HttpResponseMessage)
```
## Parameters
*HttpClient*
&emsp;Type: [HttpClient](httpclient-data-type.md)
An instance of the [HttpClient](httpclient-data-type.md) data type.

*Path*  
&emsp;Type: [String](../string/string-data-type.md)  
The path the request is sent to.
        
*Content*  
&emsp;Type: [HttpContent](../httpcontent/httpcontent-data-type.md)  
The HTTP request content sent to the server.
        
*Response*  
&emsp;Type: [HttpResponseMessage](../httpresponsemessage/httpresponsemessage-data-type.md)  
The response received from the remote endpoint.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)