---
title: "Get Method"
ms.author: solsen
ms.custom: na
ms.date: 09/27/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# Get Method
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
&emsp;Type: [String](string-data-type.md)  

        
*Result*  
&emsp;Type: [JsonToken](jsontoken-data-type.md)  
A variable of type JsonToken that will contain the result if the operation is successful.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
**true** if the operation was successful; otherwise, **false**.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
The operation will fail if the object does not contain a property with the given Key.

## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)