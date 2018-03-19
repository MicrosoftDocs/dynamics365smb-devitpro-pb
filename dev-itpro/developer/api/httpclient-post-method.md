---
title: "Post Method"
ms.author: solsen
ms.custom: na
ms.date: 12/12/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 9
manager: edupont
author: SusanneWindfeldPedersen
---

 

# Post Method
Sends a POST request to the specified Uniform Resource Identifier (URI) as an asynchronous operation.

```
[Ok := ] HttpClient.Post(Path, Content, Reponse)
```

## Parameters
*Path*  
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)

*Content*  
&emsp;Type: [HttpContent](httpcontent-class.md)  

*Response*  
&emsp;Type: [HttpResponseMessage](httpresponsemessage-class.md)  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)  

&emsp;**True** if the operation was successful; otherwise, **false**.

Accessing the [HttpContent](httpcontent-class.md) property of [HttpResponseMessage](httpresponsemessage-class.md) in a case when the request fails will result in an error.

## See Also
[HttpClient](httpclient-class.md)  
[HttpContent](httpcontent-class.md)  
[HttpRequestMessage](httprequestmessage-class.md)  
[HttpReponseMessage](httpresponsemessage-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  