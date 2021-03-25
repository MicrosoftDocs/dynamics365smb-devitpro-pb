---
title: "HttpRequestMessage Data Type"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# HttpRequestMessage Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents an HTTP request message.



The following methods are available on instances of the HttpRequestMessage data type.

|Method name|Description|
|-----------|-----------|
|[Content([HttpContent])](httprequestmessage-content-method.md)|Gets or sets the contents of the HTTP message.|
|[GetHeaders(var HttpHeaders)](httprequestmessage-getheaders-method.md)|Gets a reference to the collection of HTTP request headers.|
|[GetRequestUri()](httprequestmessage-getrequesturi-method.md)|Gets the URI used for the HTTP request.|
|[Method([String])](httprequestmessage-method-method.md)|Gets or sets the method type as defined in the HTTP standard.|
|[SetRequestUri(String)](httprequestmessage-setrequesturi-method.md)|Sets the URI used for the HTTP request.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> For performance reasons all HTTP, JSON, TextBuilder, and XML types are reference types, not value types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data. 

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  