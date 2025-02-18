---
title: "HttpClient.UseServerCertificateValidation(Boolean) Method"
description: "If true, the client validates the server certificate for all HTTP requests."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpClient.UseServerCertificateValidation(Boolean) Method
> **Version**: _Available or changed with runtime version 15.0._

If true, the client validates the server certificate for all HTTP requests. If false, it skips validation.


## Syntax
```AL
CurrentUseServerCertificateValidation :=   HttpClient.UseServerCertificateValidation(UseServerCertificateValidation: Boolean)
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*UseServerCertificateValidation*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Set to `true` to validate the server certificate; when set to `false` the validation is skipped. Default value is `true`.  


## Return Value
*CurrentUseServerCertificateValidation*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
Specifies whether the client validates the server certificate or not.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpClient data type](httpclient-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)