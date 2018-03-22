---
title: "Path Property"
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

 

# Path Property
Retrieves the JSON path of the token relative to its containing tree.

```
String := JsonToken.Path
```

## Parameters
*JsonToken*  
&emsp;Type: [JsonToken](jsontoken-class.md)

## Property Value/Return Value
Type: [String](../datatypes/devenv-text-data-type.md)

The path of the token relative to its containing JSON tree. If the token is the root of the JSON tree, the path will be empty.

## See Also
[JsonToken](jsontoken-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
