---
title: "JsonObject.Add Method"
description: "Adds a new property to a JsonObject."
ms.author: solsen
ms.custom: na
ms.date: 05/31/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# JsonObject.Add Method
> **Version**: _Available or changed with runtime version 1.0._

Adds a new property to a JsonObject.


## Syntax
```
[Ok := ]  JsonObject.Add(Key: String, Value: DateTime)
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*Key*  
&emsp;Type: [String](../string/string-data-type.md)  
  
*Value*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The operation will fail if the object already contains a property with the given key.

## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)