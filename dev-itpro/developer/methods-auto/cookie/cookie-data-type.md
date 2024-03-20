---
title: "Cookie Data Type"
description: "Provides a data structure to work with Http cookies."
ms.author: solsen
ms.custom: na
ms.date: 02/26/2024
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Cookie Data Type
> **Version**: _Available or changed with runtime version 13.0._

Provides a data structure to work with Http cookies.



## Instance methods
The following methods are available on instances of the Cookie data type.

|Method name|Description|
|-----------|-----------|
|[Domain()](cookie-domain-method.md)|The domain of the cookie. It defines to which host the cookie can be sent to.|
|[Expires()](cookie-expires-method.md)|The expiration date of the cookie.|
|[HttpOnly()](cookie-httponly-method.md)|True if the cookie is HttpOnly, false otherwise.|
|[Name([Text])](cookie-name-method.md)|The name of the cookie.|
|[Path()](cookie-path-method.md)|The path of the cookie. It indicates the path that must exist in the request URL to send the cookie.|
|[Secure()](cookie-secure-method.md)|True if the cookie is Secure, false otherwise. It indicates that the cookie is sent only when a request is made with the https.|
|[Value([Text])](cookie-value-method.md)|The value of the cookie.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `Cookie` data type allows you to efficiently work with HTTP cookies. You can use the `Cookie` data type to send and receive cookies while sending HTTP requests. The `Cookie` data type provides methods to get and set the domain, expiration date, name, path, and value of a cookie. It also provides a method to check if a cookie is `Secure`. You can choose to automatically reuse response cookies in subsequent requests, handle cookies manually, or a mix of both.

The following data types have methods that return or use the `Cookie` data type:

- [HttpClient.UseResponseCookies method](../httpclient/httpclient-useresponsecookies-method.md)  
- [HttpResponseMessage.GetCookie method](../httpresponsemessage-getcookie-method.md)  
- [HttpResponseMessage.GetCookieNames method](../httpresponsemessage/httpresponsemessage-getcookienames-method.md)  
- [HttpRequestMessage.GetCookie method](../httprequestmessage/httprequestmessage-getcookie-method.md)  
- [HttpRequestMessage.GetCookieNames method](../httprequestmessage/httprequestmessage-getcookienames-method.md)  

## See also

[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  