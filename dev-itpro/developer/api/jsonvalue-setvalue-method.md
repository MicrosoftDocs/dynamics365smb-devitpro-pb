---
title: "SetValue Method"
ms.author: solsen
ms.custom: na
ms.date: 06/30/2017
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

 

# SetValue Method

Set the contents of the JsonValue variable to the JSON representation of the given value.

```
JsonValue.SetValue(Value)
```

## Parameters
*Value*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md) | Char | Byte | Option | Integer | BigInteger | Decimal | Duration | Date | Time | DateTime | String


### Remarks
1. When **Value** is a **Boolean** type, it will be stored and serialized as a **JSON Boolean** value.

2. When **Value** is a **Char**, **Byte**, **Option**, **Integer** type, the integral value will be stored and serialized as a JSON Number.

3. When **Value** is **BigInteger**, **Decimal**, the value will be stored as a **String** to not lose precision. 

4. When **Value** is **Duration**, it's underlying value, representing a 64-bit integer, is stored and serialized as a BigInteger.

5. When **Value** is a **Date** type, it will be serialized in the format *yyyy-MM-dd*(as described in [Custom Date and Time Format Strings](https://msdn.microsoft.com/en-us/library/8kb3ddd4(v=vs.110).aspx)).

6. When **Value** is a **Time** type, it will be serialized using the .NET format specifier *HH:mm:ss.FFFFFFF* (as described in [Custom Date and Time Format Strings](https://msdn.microsoft.com/en-us/library/8kb3ddd4(v=vs.110).aspx)).

7. When **Value** is a **DateTime** type, it will be serialized using the .NET format specifier *o* (*o* as described in [Standard Date and Time Format Strings](https://msdn.microsoft.com/en-us/library/az4se3k1(v=vs.110).aspx)

8. The JsonValue will be disconnected from its current JSON tree and the data contained by the JsonValue will be replaced with the new value.

## See Also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
