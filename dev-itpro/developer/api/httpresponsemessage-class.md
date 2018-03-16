---
title: "HttpResponseMessage Class"
ms.author: solsen
ms.custom: na
ms.date: 12/13/2017
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

 

# HttpResponseMessage Class
Represents an HTTP response message.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the HttpResponseMessage class.

|Method name|Description|
|-----------|-----------| 
|[Content](httpresponsemessage-content-method.md)|Gets the contents of the HTTP message.|
|[Headers](httpresponsemessage-headers-method.md)|Gets the HTTP request's HTTP headers.|
|[HttpStatusCode](httpresponsemessage-httpstatuscode-method.md)|Gets the status code of the HTTP response.|
|[IsSuccessStatusCode](httpresponsemessage-issuccessstatuscode-method.md)|Gets a value that indicates if the HTTP response was successful.|
|[SetRequestUri](httpresponsemessage-reasonphrase-method.md)|Gets the reason phrase which typically is sent by servers together with the status code.|


## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[HttpRequestMessage](httprequestmessage-class.md)  
[HttpClient](httpclient-class.md)  
[HttpContent](httpcontent-class.md)  
[HttpHeaders](httpheaders-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
