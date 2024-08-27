---
title: "HttpClient.Patch(Text, HttpContent, var HttpResponseMessage) Method"
description: "Sends a PATCH request to the specified URI as an asynchronous operation."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpClient.Patch(Text, HttpContent, var HttpResponseMessage) Method
> **Version**: _Available or changed with runtime version 14.0._

Sends a PATCH request to the specified URI as an asynchronous operation.


## Syntax
```AL
[Ok := ]  HttpClient.Patch(Path: Text, Content: HttpContent, var Response: HttpResponseMessage)
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path the request is sent to.  

*Content*  
&emsp;Type: [HttpContent](../httpcontent/httpcontent-data-type.md)  
The HTTP request content sent to the server.  

*Response*  
&emsp;Type: [HttpResponseMessage](../httpresponsemessage/httpresponsemessage-data-type.md)  
The response received from the remote endpoint.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Accessing the HttpContent property of HttpResponseMessage in a case when the request fails will result in an error. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[HttpClient data type](httpclient-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)