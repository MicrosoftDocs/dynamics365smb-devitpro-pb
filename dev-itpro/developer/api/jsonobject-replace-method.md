---
title: "Replace Method"
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

 

# Replace Method

Replaces the value of the property with the given key with the new value.

```
[Ok := ] JsonObject.Replace(Key, Value)
```

## Parameters
*Key*
Type: [String](../datatypes/devenv-text-data-type.md)

*Value*
Type: [JsonToken](jsontoken-class.md) | [JsonObject](jsonobject-class.md) | [JsonValue](jsonvalue-class.md) | [JsonArray](jsonarray-class.md) | [Boolean](../datatypes/devenv-boolean-data-type.md) | [Char](../datatypes/devenv-char-data-type.md) | [Byte](../datatypes/devenv-byte-data-type.md) | [Integer](../datatypes/devenv-integer-data-type.md) | [BigInteger](../datatypes/devenv-biginteger-data-type.md) | [Decimal](../datatypes/devenv-decimal-data-type.md) | [Duration](../datatypes/devenv-duration-data-type.md) | [String](../datatypes/devenv-text-data-type.md) | [Date](../datatypes/devenv-date-data-type.md) | [Time](../datatypes/devenv-time-data-type.md) | [DateTime](../datatypes/devenv-datetime-data-type.md)


## Return Value
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

**True** if the operation was successful; otherwise, **false**.

If you omit this optional return value and if the select does not execute successfully, then a run-time error occurs.

## Remarks
The operation will fail if the object does not contain a property with the given key.

## See Also
[JsonObject](jsonobject-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
