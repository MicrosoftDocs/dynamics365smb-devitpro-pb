---
title: "JsonValue.AsTime Method"
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
# JsonValue.AsTime Method
> **Version**: _Available or changed with runtime version 1.0._

Converts the value in a JsonValue to a Time data type.


## Syntax
```
Result :=   JsonValue.AsTime()
```

## Parameters
*JsonValue*
&emsp;Type: [JsonValue](jsonvalue-data-type.md)
An instance of the [JsonValue](jsonvalue-data-type.md) data type.

## Return Value
*Result*
&emsp;Type: [Time](../time/time-data-type.md)
If the JsonValue does not contain a string of the format "HH:mm:ss.FFFFFFF" ( see Custom Date and Time Format Strings) the operation will fail with a run-time error.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)


## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)