---
title: "HttpResponseMessage.GetCookie(Text, var Cookie) Method"
description: "Gets the specified cookie given a name."
ms.author: solsen
ms.date: 08/15/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpResponseMessage.GetCookie(Text, var Cookie) Method
> **Version**: _Available or changed with runtime version 13.0._

Gets the specified cookie given a name.


## Syntax
```AL
[Ok := ]  HttpResponseMessage.GetCookie(Name: Text, var Cookie: Cookie)
```
## Parameters
*HttpResponseMessage*  
&emsp;Type: [HttpResponseMessage](httpresponsemessage-data-type.md)  
An instance of the [HttpResponseMessage](httpresponsemessage-data-type.md) data type.  

*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the cookie.  

*Cookie*  
&emsp;Type: [Cookie](../cookie/cookie-data-type.md)  
The cookie object.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the specified cookie was found, **false** otherwise. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpResponseMessage Data Type](httpresponsemessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)