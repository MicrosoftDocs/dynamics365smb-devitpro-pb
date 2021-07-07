---
title: "HttpRequestMessage.Method([String]) Method"
description: "Gets or sets the method type as defined in the HTTP standard."
ms.author: solsen
ms.custom: na
ms.date: 07/07/2021
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
# HttpRequestMessage.Method([String]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the method type as defined in the HTTP standard.


## Syntax
```AL
[CurrentMethod := ]  HttpRequestMessage.Method([NewMethod: String])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*HttpRequestMessage*  
&emsp;Type: [HttpRequestMessage](httprequestmessage-data-type.md)  
An instance of the [HttpRequestMessage](httprequestmessage-data-type.md) data type.  

*[Optional] NewMethod*  
&emsp;Type: [String](../string/string-data-type.md)  
The HTTP method used by the request message.  


## Return Value
*[Optional] CurrentMethod*  
&emsp;Type: [String](../string/string-data-type.md)  
The HTTP method used by the request message. The default is the GET method.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpRequestMessage Data Type](httprequestmessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)