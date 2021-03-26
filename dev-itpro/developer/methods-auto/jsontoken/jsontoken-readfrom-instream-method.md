---
title: "JsonToken.ReadFrom Method"
ms.author: solsen
ms.custom: na
ms.date: 02/15/2021
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
# JsonToken.ReadFrom Method
> **Version**: _Available or changed with runtime version 1.0._

Reads the JSON data from the stream into a JsonToken variable.


## Syntax
```
[Ok := ]  JsonToken.ReadFrom(InStream: InStream)
```
## Parameters
*JsonToken*
&emsp;Type: [JsonToken](jsontoken-data-type.md)
An instance of the [JsonToken](jsontoken-data-type.md) data type.

*InStream*  
&emsp;Type: [InStream](../instream/instream-data-type.md)  
The InStream object from which the JSON data will be read.  


## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the read was successful; otherwise, **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
This method can fail if the stream is in an invalid state or if the JSON data is malformed.
If the operation succeeds, the JsonToken will be disconnected from its current JSON tree and the data contained by the JsonToken will be replaced with the new value.
To delete the contents in a JsonToken variable use the Clear function.

```
Clear(JsonToken)
```

## Example 
This example shows how to read JSON data from a stream into a JsonToken variable.

```
local procedure ReadJson(source : InStream) result : JsonToken;
begin
    result.ReadFrom(source);    
end;
```
## See Also
[JsonToken Data Type](jsontoken-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)