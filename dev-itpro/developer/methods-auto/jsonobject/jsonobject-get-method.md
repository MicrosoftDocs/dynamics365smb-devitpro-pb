---
title: "JsonObject.Get(Text, var JsonToken) Method"
description: "Retrieves the value of a property with a given key from a JsonObject."
ms.author: solsen
ms.date: 08/26/2024
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.Get(Text, var JsonToken) Method
> **Version**: _Available or changed with runtime version 1.0._

Retrieves the value of a property with a given key from a JsonObject.


## Syntax
```AL
[Ok := ]  JsonObject.Get(Key: Text, var Result: JsonToken)
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*Key*  
&emsp;Type: [Text](../text/text-data-type.md)  
  

*Result*  
&emsp;Type: [JsonToken](../jsontoken/jsontoken-data-type.md)  
A variable of type JsonToken that will contain the result if the operation is successful.  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
The operation will fail if the object does not contain a property with the given Key.

## Related information
[JsonObject Data Type](jsonobject-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)