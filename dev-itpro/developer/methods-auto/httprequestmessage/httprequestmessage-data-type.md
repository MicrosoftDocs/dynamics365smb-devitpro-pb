---
title: "HttpRequestMessage Data Type"
description: "Represents an HTTP request message."
ms.author: solsen
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpRequestMessage Data Type
> **Version**: _Available or changed with runtime version 1.0._

Represents an HTTP request message.



## Instance methods
The following methods are available on instances of the HttpRequestMessage data type.

|Method name|Description|
|-----------|-----------|
|[Content([HttpContent])](httprequestmessage-content-method.md)|Gets or sets the contents of the HTTP message.|
|[GetCookie(Text, var Cookie)](httprequestmessage-getcookie-method.md)|Gets the specified cookie given a name.|
|[GetCookieNames()](httprequestmessage-getcookienames-method.md)|Gets the list of cookie names.|
|[GetHeaders(var HttpHeaders)](httprequestmessage-getheaders-method.md)|Gets a reference to the collection of HTTP request headers.|
|[GetRequestUri()](httprequestmessage-getrequesturi-method.md)|Gets the URI used for the HTTP request.|
|[GetSecretRequestUri()](httprequestmessage-getsecretrequesturi-method.md)|Gets the secret URI used for the HTTP request.|
|[Method([Text])](httprequestmessage-method-method.md)|Gets or sets the method type as defined in the HTTP standard.|
|[RemoveCookie(Text)](httprequestmessage-removecookie-method.md)|Removes the specified cookie given a name.|
|[SetCookie(Text, Text)](httprequestmessage-setcookie-string-string-method.md)|Sets the cookie given a name and value.|
|[SetCookie(Cookie)](httprequestmessage-setcookie-cookie-method.md)|Sets the cookie given a cookie object.|
|[SetRequestUri(Text)](httprequestmessage-setrequesturi-method.md)|Sets the URI used for the HTTP request.|
|[SetSecretRequestUri(SecretText)](httprequestmessage-setsecretrequesturi-method.md)|Sets the secret URI used for the HTTP request.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

> [!NOTE]  
> For performance reasons all HTTP, JSON, TextBuilder, and XML types are reference types, not value types. Reference types holds a pointer to the data elsewhere in memory, whereas value types store its own data. 

## See Also
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  