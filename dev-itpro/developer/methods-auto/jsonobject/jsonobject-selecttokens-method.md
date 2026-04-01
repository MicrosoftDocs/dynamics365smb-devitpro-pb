---
title: "JsonObject.SelectTokens(Text, var List of [JsonToken]) Method"
description: "Selects tokens based on a JPath expression and returns them in a new list."
ms.author: solsen
ms.date: 03/11/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.SelectTokens(Text, var List of [JsonToken]) Method
> **Version**: _Available or changed with runtime version 17.0._

Selects tokens based on a JPath expression and returns them in a new list.


## Syntax
```AL
[Ok := ]  JsonObject.SelectTokens(Path: Text, var Result: List of [JsonToken])
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
A valid JPath expression.  

*Result*  
&emsp;Type: [List of [JsonToken]](../list/list-data-type.md)  
A list of JsonToken instances if the operation is successful.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonObject data type](jsonobject-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)