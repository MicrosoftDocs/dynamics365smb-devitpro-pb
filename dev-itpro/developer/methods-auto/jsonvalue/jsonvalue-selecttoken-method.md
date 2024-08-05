---
title: "JsonValue.SelectToken(Text, var JsonToken) Method"
description: "Selects a JsonToken using a JPath expression."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonValue.SelectToken(Text, var JsonToken) Method
> **Version**: _Available or changed with runtime version 1.0._

Selects a JsonToken using a JPath expression.


## Syntax
```AL
[Ok := ]  JsonValue.SelectToken(Path: Text, var Result: JsonToken)
```
## Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.  

*Path*  
&emsp;Type: [Text](../text/text-data-type.md)  
  

*Result*  
&emsp;Type: [JsonToken](../jsontoken/jsontoken-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)