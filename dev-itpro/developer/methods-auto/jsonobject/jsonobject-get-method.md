---
title: "JsonObject.Get Method"
ms.author: solsen
ms.custom: na
ms.date: 11/23/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.Get Method
> **Version**: _Available from runtime version 1.0._

Retrieves the value of a property with a given key from a JsonObject.


## Syntax
```
[Ok := ]  JsonObject.Get(Key: String, var Result: JsonToken)
```
## Parameters
*JsonObject*
&emsp;Type: [JsonObject](jsonobject-data-type.md)
An instance of the [JsonObject](jsonobject-data-type.md) data type.

*Key*  
&emsp;Type: [String](../string/string-data-type.md)  

        
*Result*  
&emsp;Type: [JsonToken](../jsontoken/jsontoken-data-type.md)  
A variable of type JsonToken that will contain the result if the operation is successful.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
The operation will fail if the object does not contain a property with the given Key.

## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)