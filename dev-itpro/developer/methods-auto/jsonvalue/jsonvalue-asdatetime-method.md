---
title: "JsonValue.AsDateTime Method"
ms.author: solsen
ms.custom: na
ms.date: 09/15/2020
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
# JsonValue.AsDateTime Method
Converts the value in a JsonValue to a DateTime data type.


## Syntax
```
Result :=   JsonValue.AsDateTime()
```

## Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.  

## Return Value
*Result*  
&emsp;Type: [DateTime](../datetime/datetime-data-type.md)  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks 
If the JsonValue does not contain a string of the format "o" as specified here the operation will fail with a run-time error.

If there is no timezone specifier, the value will be treated as a UTC DateTime. If the timezone specifier is local, it will be treated as local to the server's timezone and converted to UTC. We recommend using UTC time to prevent unexpected behavior.

## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)