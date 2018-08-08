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
Reads the JSON data from the string into a JsonArray variable.

## Syntax
```
[Ok := ]  JsonArray.ReadFrom(Data: String)
```
## Parameters
*JsonArray*  
&emsp;Type: [JsonArray](jsonarray-data-type.md)  
An instance of the [JsonArray](jsonarray-data-type.md) data type.  
*Data*  
&emsp;Type: [String](string-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks
This method can fail if the JSON data is malformed..
If the operation succeeds, the JsonArray will be disconnected from its current JSON tree and the data contained by the JsonArray will be replaced with the new value.
To delete the contents in a JsonArray variable use the Clear function.

```
Clear(JsonArray)
```

## Example
This example shows how to read JSON data from a string into a JsonArray variable.

```
local procedure ReadJson(data : Text) result : JsonArray;
begin
    result.ReadFrom(data);    
end;
```

## See Also
[JsonArray Data Type](jsonarray-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)