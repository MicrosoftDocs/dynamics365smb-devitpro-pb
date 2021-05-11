---
title: "HttpClient.AddCertificate Method"
description: "Adds a certificate to the HttpClient class."
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
# HttpClient.AddCertificate Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a certificate to the HttpClient class.


## Syntax
```
 HttpClient.AddCertificate(Certificate: String [, Password: String])
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.

*Certificate*  
&emsp;Type: [String](../string/string-data-type.md)  
The Base64 encoded certificate.  
*Password*  
&emsp;Type: [String](../string/string-data-type.md)  
The certificate password.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The certificate must be in base 64 format.

With the **AddCertificate** method you set the certificates that you want to be associated to the request of the http client connection. These have the only purpose of authenticating the client.

The system caches SSL sessions as they are created and attempts to reuse a cached session for a new request, if possible. When attempting to reuse an SSL session, it uses the first certificate that was added or tries to reuse an anonymous session if no certificates have been specified.


## See Also

[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)