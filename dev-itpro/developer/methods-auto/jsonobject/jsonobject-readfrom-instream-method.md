---
title: "JsonObject.ReadFrom Method"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2021
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
# JsonObject.ReadFrom Method
> **Version**: _Available or changed with runtime version 1.0._

Reads the JSON data from the stream into a JsonObject variable.


## Syntax
```
[Ok := ]  JsonObject.ReadFrom(InStream: InStream)
```
## Parameters
*JsonObject*
&emsp;Type: [JsonObject](jsonobject-data-type.md)
An instance of the [JsonObject](jsonobject-data-type.md) data type.

*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The InStream object from which the JSON data will be read.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the read was successful; otherwise, **false**. If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
This method can fail if the stream is in an invalid state or if the JSON data is malformed.
If the operation succeeds, the JsonObject will be disconnected from its current JSON tree and the data contained by the JsonObject will be replaced with the new value.
To delete the contents in a JsonObject variable use the Clear function.

```
Clear(JsonObject)
```

## Example
This example shows how to read JSON data from a stream into a JsonObject variable.

```
local procedure ReadJson(source : InStream) result : JsonObject;
begin
    result.ReadFrom(source);    
end;
```
## See Also
[JsonObject Data Type](jsonobject-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)