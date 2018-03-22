---
title: "AsObject Method"
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

 

# AsObject Method

Converts the value in a [JsonToken](jsontoken-class.md) to a [JsonObject](jsonobject-class.md) data type.

```
JsonObject := JsonToken.AsObject
```

## Parameters
*JsonToken*  
Type: [JsonToken](jsontoken-class.md)

A JsonToken for which IsObject returns **true**. If the JsonToken does not represent a JSON object, a run-time error occurs.

## Return Value
Type: [JsonObject](jsonobject-class.md)

The returned JsonObject contains the same data as the JsonToken, but allows object-specific operations to be performed on it.

## See Also
[JsonToken](jsontoken-class.md)  
[JsonObject](jsonobject-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
