---
title: "TestHttpResponseMessage.ReasonPhrase([Text]) Method"
description: "Gets or sets the reason phrase which typically is sent by servers together with the status code."
ms.author: solsen
ms.date: 08/08/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# TestHttpResponseMessage.ReasonPhrase([Text]) Method
> **Version**: _Available or changed with runtime version 15.0._

Gets or sets the reason phrase which typically is sent by servers together with the status code.


## Syntax
```AL
[ReasonPhrase := ]  TestHttpResponseMessage.ReasonPhrase([SetReasonPhrase: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*TestHttpResponseMessage*  
&emsp;Type: [TestHttpResponseMessage](testhttpresponsemessage-data-type.md)  
An instance of the [TestHttpResponseMessage](testhttpresponsemessage-data-type.md) data type.  

*[Optional] SetReasonPhrase*  
&emsp;Type: [Text](../text/text-data-type.md)  
The reason phrase.  


## Return Value
*[Optional] ReasonPhrase*  
&emsp;Type: [Text](../text/text-data-type.md)  
The reason phrase.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[TestHttpResponseMessage data type](testhttpresponsemessage-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)