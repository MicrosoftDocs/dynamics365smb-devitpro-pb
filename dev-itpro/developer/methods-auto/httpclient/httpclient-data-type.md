---
title: "HttpClient Data Type"
description: "Provides a data type for sending HTTP requests and receiving HTTP responses from a resource identified by a URI."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# HttpClient Data Type
> **Version**: _Available or changed with runtime version 1.0._

Provides a data type for sending HTTP requests and receiving HTTP responses from a resource identified by a URI.



The following methods are available on instances of the HttpClient data type.

|Method name|Description|
|-----------|-----------|
|[AddCertificate(String [, String])](httpclient-addcertificate-method.md)|Adds a certificate to the HttpClient class.|
|[Clear()](httpclient-clear-method.md)|Sets the HttpClient variable to the default value.|
|[DefaultRequestHeaders()](httpclient-defaultrequestheaders-method.md)|Gets the default request headers which should be sent with each request.|
|[Delete(String, var HttpResponseMessage)](httpclient-delete-method.md)|Sends a DELETE request to delete the resource identified by the request URL.|
|[Get(String, var HttpResponseMessage)](httpclient-get-method.md)|Sends a GET request to get the resource identified by the request URL.|
|[GetBaseAddress()](httpclient-getbaseaddress-method.md)|Gets the base address of Uniform Resource Identifier (URI) of the Internet resource used when sending requests.|
|[Post(String, HttpContent, var HttpResponseMessage)](httpclient-post-method.md)|Sends a POST request to the specified URI as an asynchronous operation.|
|[Put(String, HttpContent, var HttpResponseMessage)](httpclient-put-method.md)|Sends a PUT request to the specified URI as an asynchronous operation.|
|[Send(HttpRequestMessage, var HttpResponseMessage)](httpclient-send-method.md)|Sends an HTTP request as an asynchronous operation.|
|[SetBaseAddress(String)](httpclient-setbaseaddress-method.md)|Sets the base address of Uniform Resource Identifier (URI) of the Internet resource used when sending requests.|
|[Timeout([Duration])](httpclient-timeout-method.md)|Gets or sets the duration in milliseconds to wait before the request times out.|
|[UseDefaultNetworkWindowsAuthentication()](httpclient-usedefaultnetworkwindowsauthentication-method.md)|Sets the HttpClient credentials to use the default network credentials for Windows authentication. If this method is invoked after any HTTP request has started; a runtime error occurs.|
|[UseWindowsAuthentication(String, String [, String])](httpclient-usewindowsauthentication-method.md)|Sets the HttpClient credentials to use the specified network credentials for Windows authentication. If this method is invoked after any HTTP request has started; a runtime error occurs.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The supported security protocols are controlled by the **SecurityProtocol** configuration setting. For more information, see [Microsoft Dynamics 365 Business Central Server Configuration](../../../administration/configure-server-instance.md#Compatibility).

## See Also
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  