---
title: "Clone Method"
ms.author: solsen
ms.custom: na
ms.date: 12/14/2017
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

 

# Clone Method

Creates a deep-copy of the [JsonToken](jsontoken-class.md) value.

```
Result := JsonToken.Clone()
```

### Parameters
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-class.md)

## Return Value
Type: [JsonToken](jsontoken-class.md)

The *Result* will be a full, deep-copy of the *Value*.

## See Also
[JsonArray](jsonarray-class.md)  
[JsonObject](jsonobject-class.md)  
[JsonToken](jsontoken-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
