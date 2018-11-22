---
title: "Contains Method"
ms.author: solsen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 9
manager: edupont
author: SusanneWindfeldPedersen
redirect_url: /dynamics365/business-central/dev-itpro/developer/methods-auto/library
---

 

# Contains Method
Verifies if a [JsonObject](jsonobject-class.md) contains a property with a given key.

```
Ok := JsonObject.Contains(String)
```

## Parameters
*JsonObject*  
&emsp;Type: [JsonObject](jsonobject-class.md)

*String*  
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)

## Return Value
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

**True** if the object contains a property with the given key; otherwise, **false**.

## See Also
[JsonObject](jsonobject-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
