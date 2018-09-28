---
title: "Post Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Post Method
Sends a POST request to the specified URI as an asynchronous operation.

## Syntax
```
[Ok := ]  HttpClient.Post(Path: String, Content: HttpContent, var Response: HttpResponseMessage)
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*Path*  
&emsp;Type: [String](string-data-type.md)  
The path the request is sent to.  
*Content*  
&emsp;Type: [HttpContent](httpcontent-data-type.md)  
The HTTP request content sent to the server.
        
*Response*  
&emsp;Type: [HttpResponseMessage](httpresponsemessage-data-type.md)  
The response received from the remote endpoint.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)