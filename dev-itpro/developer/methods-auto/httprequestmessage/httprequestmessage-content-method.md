---
title: "HttpRequestMessage.Content Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
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
# HttpRequestMessage.Content Method
> **Version**: _Available from runtime version 1.0._

Gets or sets the contents of the HTTP message.


## Syntax
```
[CurrentContent := ]  HttpRequestMessage.Content([SetContent: HttpContent])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*HttpRequestMessage*
&emsp;Type: [HttpRequestMessage](httprequestmessage-data-type.md)
An instance of the [HttpRequestMessage](httprequestmessage-data-type.md) data type.

*SetContent*  
&emsp;Type: [HttpContent](../httpcontent/httpcontent-data-type.md)  
The contents of the HTTP message.  


## Return Value
*CurrentContent*
&emsp;Type: [HttpContent](../httpcontent/httpcontent-data-type.md)
The contents of the HTTP message.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[HttpRequestMessage Data Type](httprequestmessage-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)