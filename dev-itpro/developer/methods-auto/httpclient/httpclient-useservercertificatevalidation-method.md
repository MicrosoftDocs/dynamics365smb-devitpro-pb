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

## Remarks

This property is enbled by default. It's controlled by a feature key so that you can disable the validation for the whole tenant and roll back to the previous behavior, which is the way it worked in previous versions.

If you want to roll back to the previous behavior, we suggest you do the following:

- Update your AL code to uptake the new `UseServerCertificateValidation`.
- Disable the validation with the new feature key for now, but be aware that it will be removed in version 27.0.

> [!NOTE]
> The feature key will be removed in version 27.0. So they have to uptake the new property within version 26. The feature key is introduced to give them 6 months to transition to the new way without causing customer downtime.

## Related information

[HttpClient data type](httpclient-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)