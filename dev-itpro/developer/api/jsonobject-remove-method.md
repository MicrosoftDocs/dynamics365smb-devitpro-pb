---
title: "Remove Method"
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

 

# Remove Method
Removes the property with the given key from the object.

```
[Ok := ] JsonObject.Remove(Key)
```

## Parameters
*Key*  
&emsp;Type: [String](../datatypes/devenv-text-data-type.md)

## Return Value  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

**True** if a property with the given key was present on the object; otherwise, **false**.

## See Also
[JsonObject](jsonobject-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)
