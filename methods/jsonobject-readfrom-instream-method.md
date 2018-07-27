---
title: "ReadFrom Method"
ms.author: solsen
ms.custom: na
ms.date: 07/27/2018
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
# ReadFrom Method
Reads the JSON data from the stream into a JsonObject variable.

## Syntax
```
[Ok := ]  JsonObject.ReadFrom(Data: InStream)
```
#### Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-data-type.md)  
An instance of the [JsonObject](jsonobject-data-type.md) data type.  
*Data*  
&emsp;Type: [InStream](instream-data-type.md)  



#### Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


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
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)