---
title: "HttpContent Class"
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

 

# HttpContent Class
A base class representing an HTTP entity body and content headers.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the HttpContent class.

|Method name|Description|
|-----------|-----------|
|[Clear](httpcontent-clear-method.md)|Sets the HttpContent object to a default value.|
|[GetHeaders](httpcontent-getheaders-method.md)|Gets the content's Http headers.|
|[ReadAs](httpcontent-readas-method.md)|Reads the content into the provided text.|
|[WriteFrom](httpcontent-writefrom-method.md)|Sets HttpContent content to the provided text or stream.|


## See Also
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[HttpClient](httpclient-class.md)  
[HttpHeaders](httpheaders-class.md)  
[HttpRequestMessage](httprequestmessage-class.md)  
[HttpReponseMessage](httpresponsemessage-class.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  