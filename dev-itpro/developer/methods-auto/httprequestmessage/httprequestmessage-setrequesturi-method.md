---
title: "HttpRequestMessage.SetRequestUri Method"
description: "Sets the URI used for the HTTP request."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
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
# HttpRequestMessage.SetRequestUri Method
> **Version**: _Available or changed with runtime version 1.0._

Sets the URI used for the HTTP request.


## Syntax
```
[Ok := ]  HttpRequestMessage.SetRequestUri(RequestUri: String)
```
## Parameters
*HttpRequestMessage*  
&emsp;Type: [HttpRequestMessage](httprequestmessage-data-type.md)  
An instance of the [HttpRequestMessage](httprequestmessage-data-type.md) data type.  

*RequestUri*  
&emsp;Type: [String](../string/string-data-type.md)  
The URI to use for the HTTP request.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the URI was set successfully, otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpRequestMessage Data Type](httprequestmessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)