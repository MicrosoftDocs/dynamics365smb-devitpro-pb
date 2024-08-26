---
title: "HttpResponseMessage.GetCookieNames() Method"
description: "Gets the list of cookie names."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpResponseMessage.GetCookieNames() Method
> **Version**: _Available or changed with runtime version 13.0._

Gets the list of cookie names.


## Syntax
```AL
CookieNames :=   HttpResponseMessage.GetCookieNames()
```
## Parameters
*HttpResponseMessage*  
&emsp;Type: [HttpResponseMessage](httpresponsemessage-data-type.md)  
An instance of the [HttpResponseMessage](httpresponsemessage-data-type.md) data type.  

## Return Value
*CookieNames*  
&emsp;Type: [List of [Text]](../list/list-data-type.md)  
The list of cookie names.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `HttpResponseMessage.GetCookieNames` method allows you to get the list of cookie names from the response message. 

```al
// This example shows how to get the list of cookie names from the response message

local procedure GetCookieNamesHttpResponseMessageExample()
var
    Response: HttpResponseMessage;
    CookieNames: List of [Text];
begin
    // Get list of cookie names from the response
    CookieNames := Response.GetCookieNames();
end;
```

## See also

[HttpResponseMessage Data Type](httpresponsemessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)