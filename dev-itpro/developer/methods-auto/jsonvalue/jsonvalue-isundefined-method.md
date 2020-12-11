---
title: "JsonValue.IsUndefined Method"
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
# JsonValue.IsUndefined Method
> **Version**: _Available from runtime version 1.0._

Indicates whether the JsonValue contains the JSON value of UNDEFINED.


## Syntax
```
Ok :=   JsonValue.IsUndefined()
```
> [!NOTE]
> This method can be invoked using property access syntax.

## Parameters
*JsonValue*
&emsp;Type: [JsonValue](jsonvalue-data-type.md)
An instance of the [JsonValue](jsonvalue-data-type.md) data type.

## Return Value
*Ok*
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)
**true** if the JsonValue contains the JSON value of UNDEFINED; otherwise, **false**


[//]: # (IMPORTANT: END>DO_NOT_EDIT)
## See Also
[JsonValue Data Type](jsonvalue-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)