---
title: "AsToken Method"
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

 

# AsToken Method
Converts the value in a [JsonObject](jsonobject-class.md) to a [JsonToken](jsontoken-class.md) data type.

```
JsonToken := JsonObject.AsToken
```

### Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-class.md)

## Return Value
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-class.md)

The returned JsonToken contains the same data as the JsonObject, but allows for treating the data in a generic manner.

## See Also
[JsonObject](jsonobject-class.md)  
[JsonToken](jsontoken-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
