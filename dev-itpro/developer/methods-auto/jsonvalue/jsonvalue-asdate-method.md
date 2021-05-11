---
title: "JsonValue.AsDate Method"
description: "Converts the value in a JsonValue to a Date data type."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
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
# JsonValue.AsDate Method
> **Version**: _Available or changed with runtime version 1.0._

Converts the value in a JsonValue to a Date data type.


## Syntax
```
Result :=   JsonValue.AsDate()
```

## Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.

## Return Value
*Result*  
&emsp;Type: [Date](../date/date-data-type.md)  
If the JsonValue does not contain a string of the format "yyyy-MM-dd" e.g. "2017-01-17" (2017-January-17), the operation will fail with a run-time error.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)



## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)