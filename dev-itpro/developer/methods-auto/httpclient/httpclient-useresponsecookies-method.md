---
title: "HttpClient.UseResponseCookies(Boolean) Method"
description: "If true, the client automatically attaches cookies received in the response to all subsequent requests."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpClient.UseResponseCookies(Boolean) Method
> **Version**: _Available or changed with runtime version 13.0._

If true, the client automatically attaches cookies received in the response to all subsequent requests.


## Syntax
```AL
 HttpClient.UseResponseCookies(UseResponseCookies: Boolean)
```
## Parameters
*HttpClient*  
&emsp;Type: [HttpClient](httpclient-data-type.md)  
An instance of the [HttpClient](httpclient-data-type.md) data type.  

*UseResponseCookies*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
True to automatically attach cookies received in the response to all subsequent requests. False to disable.  



[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `HttpClient.UseResponseCookies` method allows you to specify whether the client should automatically attach cookies received in the response to all subsequent requests. If you set the `UseResponseCookies` parameter to `true`, the client automatically attaches cookies received in the response to all subsequent requests. If you set the `UseResponseCookies` parameter to `false`, the client doesn't automatically attach cookies received in the response to all subsequent requests.

```al
// Example of enabling and disabling cookie caching

local procedure UseResponseCookiesExample()
var
    Client: HttpClient;
begin
    // Enable cookie caching
    Client.UseResponseCookies(true);

    // Disable cookie caching
    Client.UseResponseCookies(false);
end;

```


## Related information
[HttpClient Data Type](httpclient-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)