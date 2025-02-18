---
title: "TestHttpRequestMessage.Path() Method"
description: "Gets the path of the HTTP request unless a secret URI was set, in which case it's an empty string."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpRequestMessage.Path() Method
> **Version**: _Available or changed with runtime version 15.0._

Gets the path of the HTTP request unless a secret URI was set, in which case it's an empty string.


## Syntax
```AL
Path :=   TestHttpRequestMessage.Path()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHttpRequestMessage*  
&emsp;Type: [TestHttpRequestMessage](testhttprequestmessage-data-type.md)  
An instance of the [TestHttpRequestMessage](testhttprequestmessage-data-type.md) data type.  

## Return Value
*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
The path of the HTTP request if the request does not have a secret URI, otherwise an empty string.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestHttpRequestMessage data type](testhttprequestmessage-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)