---
title: "TestHttpResponseMessage.IsBlockedByEnvironment([Boolean]) Method"
description: "Gets or sets a value that indicates if the HTTP response is the result of the environment blocking an outgoing HTTP request."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpResponseMessage.IsBlockedByEnvironment([Boolean]) Method
> **Version**: _Available or changed with runtime version 15.0._

Gets or sets a value that indicates if the HTTP response is the result of the environment blocking an outgoing HTTP request.


## Syntax
```AL
[IsBlockedByEnvironment := ]  TestHttpResponseMessage.IsBlockedByEnvironment([SetIsBlockedByEnvironment: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHttpResponseMessage*  
&emsp;Type: [TestHttpResponseMessage](testhttpresponsemessage-data-type.md)  
An instance of the [TestHttpResponseMessage](testhttpresponsemessage-data-type.md) data type.  

*[Optional] SetIsBlockedByEnvironment*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the HTTP response is the result of the environment blocking an outgoing HTTP request, otherwise **false**.  


## Return Value
*[Optional] IsBlockedByEnvironment*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the HTTP response is the result of the environment blocking an outgoing HTTP request, otherwise **false**.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestHttpResponseMessage data type](testhttpresponsemessage-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)