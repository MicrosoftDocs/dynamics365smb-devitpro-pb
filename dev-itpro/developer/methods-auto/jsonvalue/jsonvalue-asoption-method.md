---
title: "JsonValue.AsOption Method"
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
# JsonValue.AsOption Method
> **Version**: _Available from runtime version 1.0._

Converts the value in a JsonValue to an Option data type.


## Syntax
```
Result :=   JsonValue.AsOption()
```

## Parameters
*JsonValue*
&emsp;Type: [JsonValue](jsonvalue-data-type.md)
An instance of the [JsonValue](jsonvalue-data-type.md) data type.

## Return Value
*Result*
&emsp;Type: [Option](../option/option-data-type.md)
If the JsonValue does not contain a number which can be converted without loss of precision to an Option, the operation will fail with a run-time error.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)



## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)