---
title: "JsonObject.ReadFrom Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2020
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
# JsonObject.ReadFrom Method
Reads the JSON data from the string into a JsonObject variable.


## Syntax
```
[Ok := ]  JsonObject.ReadFrom(String: String)
```
## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  

*String*  
&emsp;Type: [String](../string/string-data-type.md)  
The String object from which the JSON data will be read.  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
This method can fail if the JSON data is malformed.
If the operation succeeds, the JsonObject will be disconnected from its current JSON tree and the data contained by the JsonObject will be replaced with the new value.
To delete the contents in a JsonObject variable use the Clear function.

```
Clear(JsonObject)
```

## Example
This example shows how to read JSON data from a string into a JsonObject variable.

```
local procedure ReadJson(data : Text) result : JsonObject;
begin
    result.ReadFrom(data);    
end;
```
## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)