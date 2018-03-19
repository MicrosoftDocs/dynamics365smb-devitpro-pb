---
title: "Send Method"
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

 

# Send Method
Sends an HTTP request as an asynchronous operation.

```
[Ok := ] HttpClient.Send(Content, Response)
```

## Parameters
*Request*  
&emsp;Type: [HttpRequestMessage](httprequestmessage-class.md)  

*Response*  
&emsp;Type: [HttpResponseMessage](httpresponsemessage-class.md)  

## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

&emsp;**True** if the operation was successful; otherwise, **false**.

Accessing the [HttpContent](httpcontent-class.md) property of [HttpResponseMessage](httpresponsemessage-class.md) in a case when the request fails will result in an error.

## See Also
[HttpClient](httpclient-class.md)  
[HttpRequestMessage](httprequestmessage-class.md)  
[HttpResponseMessage](httpresponsemessage-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  