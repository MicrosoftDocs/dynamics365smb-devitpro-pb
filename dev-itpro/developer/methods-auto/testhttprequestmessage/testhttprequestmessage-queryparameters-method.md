---
title: "TestHttpRequestMessage.QueryParameters() Method"
description: "Gets the query parameters of the HTTP request if the request does not have a secret URI, otherwise an empty Dictionary."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpRequestMessage.QueryParameters() Method
> **Version**: _Available or changed with runtime version 15.0._

Gets the query parameters of the HTTP request if the request does not have a secret URI, otherwise an empty Dictionary.


## Syntax
```AL
QueryParameters :=   TestHttpRequestMessage.QueryParameters()
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHttpRequestMessage*  
&emsp;Type: [TestHttpRequestMessage](testhttprequestmessage-data-type.md)  
An instance of the [TestHttpRequestMessage](testhttprequestmessage-data-type.md) data type.  

## Return Value
*QueryParameters*  
&emsp;Type: [Dictionary of [Text, Text]](../dictionary/dictionary-data-type.md)  
The query parameters of the HTTP request if the request does not have a secret URI, otherwise an empty Dictionary.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[TestHttpRequestMessage data type](testhttprequestmessage-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)