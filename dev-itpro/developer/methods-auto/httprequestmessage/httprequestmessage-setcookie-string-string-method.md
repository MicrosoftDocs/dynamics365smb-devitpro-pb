---
title: "HttpRequestMessage.SetCookie(Text, Text) Method"
description: "Sets the cookie given a name and value."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HttpRequestMessage.SetCookie(Text, Text) Method
> **Version**: _Available or changed with runtime version 13.0._

Sets the cookie given a name and value.


## Syntax
```AL
[Ok := ]  HttpRequestMessage.SetCookie(Name: Text, Value: Text)
```
## Parameters
*HttpRequestMessage*  
&emsp;Type: [HttpRequestMessage](httprequestmessage-data-type.md)  
An instance of the [HttpRequestMessage](httprequestmessage-data-type.md) data type.  

*Name*  
&emsp;Type: [Text](../text/text-data-type.md)  
The name of the cookie.  

*Value*  
&emsp;Type: [Text](../text/text-data-type.md)  
The value of the cookie.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the cookie was successfully set, **false** otherwise. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpRequestMessage Data Type](httprequestmessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)