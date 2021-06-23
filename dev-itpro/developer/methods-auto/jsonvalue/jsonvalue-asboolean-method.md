---
title: "JsonValue.AsBoolean Method"
description: "Converts the value in a JsonValue to a Boolean data type."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# JsonValue.AsBoolean Method
> **Version**: _Available or changed with runtime version 1.0._

Converts the value in a JsonValue to a Boolean data type.


## Syntax
```AL
Result :=   JsonValue.AsBoolean()
```

## Parameters
*JsonValue*  
&emsp;Type: [JsonValue](jsonvalue-data-type.md)  
An instance of the [JsonValue](jsonvalue-data-type.md) data type.  

## Return Value
*Result*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The operation will succeed if the value was created from a Boolean using SetValue or if the value was parsed from a string containing one of the values : **true** or **false**. The operation will fail with a run-time error otherwise.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)



## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)