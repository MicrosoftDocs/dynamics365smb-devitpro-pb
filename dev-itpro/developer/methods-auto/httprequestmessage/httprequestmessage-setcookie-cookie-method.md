---
title: "HttpRequestMessage.SetCookie(Cookie) Method"
description: "Sets the cookie given a cookie object."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpRequestMessage.SetCookie(Cookie) Method
> **Version**: _Available or changed with runtime version 13.0._

Sets the cookie given a cookie object.


## Syntax
```AL
[Ok := ]  HttpRequestMessage.SetCookie(Cookie: Cookie)
```
## Parameters
*HttpRequestMessage*  
&emsp;Type: [HttpRequestMessage](httprequestmessage-data-type.md)  
An instance of the [HttpRequestMessage](httprequestmessage-data-type.md) data type.  

*Cookie*  
&emsp;Type: [Cookie](../cookie/cookie-data-type.md)  
The cookie object.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the cookie was successfully set, **false** otherwise. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[HttpRequestMessage Data Type](httprequestmessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)