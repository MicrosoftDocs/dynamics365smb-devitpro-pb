---
title: "TestHttpRequestMessage.RequestType() Method"
description: "Gets the HTTP method type."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpRequestMessage.RequestType() Method
> **Version**: _Available or changed with runtime version 15.0._

Gets the HTTP method type.


## Syntax
```AL
RequestType :=   TestHttpRequestMessage.RequestType()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHttpRequestMessage*  
&emsp;Type: [TestHttpRequestMessage](testhttprequestmessage-data-type.md)  
An instance of the [TestHttpRequestMessage](testhttprequestmessage-data-type.md) data type.  

## Return Value
*RequestType*  
&emsp;Type: [HttpRequestType](../httprequesttype/httprequesttype-option.md)  
The HTTP method type of the request. Defaults to HttpRequestType.Unknown.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestHttpRequestMessage data type](testhttprequestmessage-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)