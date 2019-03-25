---
title: "Remove Method"
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
<!--This topic is deprected, see redirection URL-->

 

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
