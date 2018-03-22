---
title: "AsToken Method"
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

 

# AsToken Method
Converts the value in a [JsonArray](jsonarray-class.md) to a [JsonToken](jsontoken-class.md) data type.

```
JsonToken := JsonArray.AsToken
```

### Parameters
*JsonArray*   
&emsp;Type: [JsonArray](jsonarray-class.md)

## Return Value
*JsonToken*  
Type: [JsonToken](jsontoken-class.md)

## Remarks
The returned JsonToken contains the same data as the JsonArray, but allows for treating the data in a generic manner.

## See Also
[JsonArray](jsonarray-class.md)  
[JsonToken](jsontoken-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
