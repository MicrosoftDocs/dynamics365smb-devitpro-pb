---
title: "HttpRequestMessage Class"
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

 

# HttpRequestMessage Class
Represents an HTTP request message.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the HttpRequestMessage class.

|Method name|Description| 
|-----------|-----------|
|[Content](httprequestmessage-content-method.md)|Gets or sets the contents of the HTTP message.|
|[GetRequestUri](httprequestmessage-getrequesturi-method.md)|Gets the Uniform Resource Identifier (URI) used for the HTTP request.|
|[Method](httprequestmessage-method-method.md)|Gets or sets the method type as defined in the HTTP standard.|
|[SetRequestUri](httprequestmessage-setrequesturi-method.md)|Sets the URI used for the HTTP request.|


## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[HttpResponseMessage](httpresponsemessage-class.md)  
[HttpClient](httpclient-class.md)  
[HttpContent](httpcontent-class.md)  
[HttpHeaders](httpheaders-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  