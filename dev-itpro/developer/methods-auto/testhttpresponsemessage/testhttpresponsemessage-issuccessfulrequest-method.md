---
title: "TestHttpResponseMessage.IsSuccessfulRequest([Boolean]) Method"
description: "Gets or sets a value that indicates if the HTTP request was successful or not."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpResponseMessage.IsSuccessfulRequest([Boolean]) Method
> **Version**: _Available or changed with runtime version 15.0._

Gets or sets a value that indicates if the HTTP request was successful or not. By setting this value it is possible to mock the return value of the HttpClient call.


## Syntax
```AL
IsSuccessfulRequest :=   TestHttpResponseMessage.IsSuccessfulRequest([SetIsSuccessfulRequest: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHttpResponseMessage*  
&emsp;Type: [TestHttpResponseMessage](testhttpresponsemessage-data-type.md)  
An instance of the [TestHttpResponseMessage](testhttpresponsemessage-data-type.md) data type.  

*[Optional] SetIsSuccessfulRequest*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the HttpClient request should indicate success, otherwise **false**.  


## Return Value
*IsSuccessfulRequest*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the HttpClient request should indicate success, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestHttpResponseMessage data type](testhttpresponsemessage-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)