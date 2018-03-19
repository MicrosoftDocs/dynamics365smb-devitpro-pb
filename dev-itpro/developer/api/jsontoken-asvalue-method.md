---
title: "AsValue Method"
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

 

# AsValue Method

Converts the value in a [JsonToken](jsontoken-class.md) to a [JsonValue](jsonvalue-class.md) data type.

```
JsonValue := JsonToken.AsValue
```

### Parameters
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-class.md)

A JsonToken for which IsValue returns **true**. If the JsonToken does not represent a fundamental JSON value, a run-time error occurs.

## Return Value
Type: [JsonValue](jsonvalue-class.md)

The returned JsonValue contains the same data as the JsonToken, but allows value-specific operations to be performed on the data.

## See Also
[JsonToken](jsontoken-class.md)  
[JsonValue](jsonvalue-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
