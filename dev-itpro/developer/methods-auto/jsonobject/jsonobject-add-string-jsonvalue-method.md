---
title: "JsonObject.Add Method"
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
# JsonObject.Add Method
> **Version**: _Available from runtime version 1.0._

Adds a new property to a JsonObject.


## Syntax
```
[Ok := ]  JsonObject.Add(Key: String, Value: JsonValue)
```
## Parameters
*JsonObject*
&emsp;Type: [JsonObject](jsonobject-data-type.md)
An instance of the [JsonObject](jsonobject-data-type.md) data type.

*Key*  
&emsp;Type: [String](../string/string-data-type.md)  
  
*Value*  
&emsp;Type: [JsonValue](../jsonvalue/jsonvalue-data-type.md)  
  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the operation was successful; otherwise **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
The operation will fail if the object already contains a property with the given key.

## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)