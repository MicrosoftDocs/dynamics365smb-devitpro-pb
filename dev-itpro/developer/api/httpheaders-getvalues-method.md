---
title: "GetValues Method"
ms.author: solsen
ms.custom: na
ms.date: 12/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 620f0e32-eadc-43e9-8f6e-8fc0b12c3aaf
caps.latest.revision: 9
manager: edupont
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# GetValues Method
Gets the values for the specified key.

```
[Ok := ] HttpHeaders.GetValues(Key, Result)
```

## Parameters
*HttpHeaders*  
&emsp;Type: [HttpHeaders](httpheaders-class.md)

*Key*  
&emsp;Type: [Text](../datatypes/devenv-text-data-type.md)

*Result*  
&emsp;Type: Array of [Text](/datatypes/devenv-text-data-type.md)

## Return Value
*Ok*  
&emsp;Type: [Boolean](../datatypes/devenv-boolean-data-type.md)

&emsp;**True** if headers contain the key; **false** otherwise.

## See Also
[HttpHeaders](httpheaders-class.md)  
[HTTP, JSON, TextBuilder, and XML API](../devenv-restapi-overview.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
