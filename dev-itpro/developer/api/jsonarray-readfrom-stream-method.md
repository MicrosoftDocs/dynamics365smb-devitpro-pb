---
title: "ReadFrom_Stream Method"
ms.author: solsen
ms.custom: na
ms.date: 12/15/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 9
manager: edupont
author: SusanneWindfeldPedersen
---

 

# ReadFrom_Stream Method
Reads the JSON data from the stream into a JsonArray variable.

```
[Ok := ] JsonArray.ReadFrom(InStream)
```

## Parameters
*JsonArray*  
&emsp;Type: [JsonArray](jsonarray-class.md)

*InStream*  
&emsp;Type: [InStream](../datatypes/devenv-instream-and-outstream-data-types.md)

The InStream object from which the JSON data will be read.

## Property Value/Return Value
Type: [Boolean](../datatypes/devenv-text-data-type.md)

**True** if the read was successful; otherwise, **false**.

If you omit this optional return value and if the read does not execute successfully, then a run-time error occurs.

## Remarks
1. This method can fail if the stream is in an invalid state or if the JSON data is malformed.
2. If the operation succeeds, the JsonArray will be disconnected from its current JSON tree and the data contained by the JsonArray will be replaced with the new value.
3. To delete the contents in a JsonArray variable use the Clear function.

```
Clear(JsonArray)
```
## Example
This example shows how to read JSON data from a stream into a [JsonArray](jsonarray-class.md) variable.

```
local procedure ReadJson(source : InStream) result : JsonArray;
begin
    result.ReadFrom(source);    
end;

```
## See Also
[JsonArray](jsonarray-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
