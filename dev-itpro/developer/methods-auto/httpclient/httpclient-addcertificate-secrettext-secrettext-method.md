---
title: "HttpClient.AddCertificate(SecretText [, SecretText]) Method"
description: "Adds a certificate as a SecretText to the HttpClient class."
ms.author: solsen
ms.custom: na
ms.date: 09/06/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpClient.AddCertificate(SecretText [, SecretText]) Method
> **Version**: _Available or changed with runtime version 12.0._

Adds a certificate as a SecretText to the HttpClient class.


## Syntax
```AL
 HttpClient.AddCertificate(Certificate: SecretText [, Password: SecretText])
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*Certificate*  
&emsp;Type: [SecretText](../secrettext/secrettext-data-type.md)  
The Base64 encoded certificate.  

*[Optional] Password*  
&emsp;Type: [SecretText](../secrettext/secrettext-data-type.md)  
The certificate password.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)