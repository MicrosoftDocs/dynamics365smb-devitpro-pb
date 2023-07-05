---
title: "APIVersion Property (Page)"
description: "Sets the versions of the API endpoint that the page is exposed in."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
 
# APIVersion Property (Page)
> **Version**: _Available from runtime version 1.0._

<!-- this topic is manually created, parent node is devenv-apiversion-property.md -->

Sets the version(s) of the API endpoint the page is exposed in. If the `APIVersion` isn't specified, the default value is `beta`. The syntax for providing versions is illustrated in the example below:

## Applies to  

- Page object 

## Syntax

```AL
APIVersion = 'beta', 'v1.0';
```

> [!NOTE]  
> The property **APIVersion** can only be set if the [PageType Property](devenv-pagetype-property.md) is set to **API**. For more information, see [API Page Type](../devenv-api-pagetype.md).


## See Also  
[Properties](devenv-properties.md)   
[Page Object](../devenv-page-object.md)  
[APIVersion Property (Query)](devenv-apiversion-query-property.md) 
