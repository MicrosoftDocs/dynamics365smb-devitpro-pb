---
title: "JsonObject.GetDuration(Text [, Boolean]) Method"
description: "Retrieves the value of a property with a given key from a JsonObject as a Duration."
ms.author: solsen
ms.date: 02/18/2025
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.GetDuration(Text [, Boolean]) Method
> **Version**: _Available or changed with runtime version 15.0._

Retrieves the value of a property with a given key from a JsonObject as a Duration.


## Syntax
```AL
Value :=   JsonObject.GetDuration(Key: Text [, DefaultIfNotFound: Boolean])
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*Key*  
&emsp;Type: [Text](../text/text-data-type.md)  
The key for the property to read as a Duration  

*[Optional] DefaultIfNotFound*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
If **true** and the key is not found on the object then 0 should be returned. If **false** and the property is not found on the object an error will be thrown  


## Return Value
*Value*  
&emsp;Type: [Duration](../duration/duration-data-type.md)  
The value of the property with the given key as a Duration


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## Related information
[JsonObject data type](jsonobject-data-type.md)  
[Getting started with AL](../../devenv-get-started.md)  
[Developing extensions](../../devenv-dev-overview.md)