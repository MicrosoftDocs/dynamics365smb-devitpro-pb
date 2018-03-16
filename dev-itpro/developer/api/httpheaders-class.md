---
title: "HttpHeaders Class"
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
---

 

# HttpHeaders Class
The HttpHeaders' class contains a collection of headers and their values.

> [!NOTE]
> For performance reasons all [HTTP, JSON, TextBuilder, and XML types](../devenv-restapi-overview.md) are *reference* types, not *value* types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data.

The following methods are available on the HttpHeaders class.

|Method name|Description|
|-----------|-----------|
|[Add](httpheaders-add-method.md)|Sets the provided value for the provided header name.|
|[Clear](httpheaders-clear-method.md)|Sets the HttpHeaders' variable to the default value.|
|[Contains](httpheaders-contains-method.md)|Checks if an HttpHeaders contains a property with a given key.|
|[GetValues](httpheaders-getvalues-method.md)|Gets the values for the specified key.|
|[Remove](httpheaders-remove-method.md)|Removes the key and the related values from the HttpHeaders object.|


## See Also
[HttpClient](httpclient-class.md)  
[HttpContent](httpcontent-class.md)  
[HttpRequestMessage](httprequestmessage-class.md)  
[HttpReponseMessage](httpresponsemessage-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  