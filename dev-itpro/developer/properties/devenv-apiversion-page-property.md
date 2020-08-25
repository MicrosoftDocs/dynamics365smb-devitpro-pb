---
title: "APIVersion Property (Page)"
ms.author: solsen
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
 
# APIVersion Property (Page)
Sets the version(s) of the API endpoint the page is exposed in. The syntax for providing versions is illustrated in the example below:

## Applies To  

- Page object 

## Syntax
```
APIVersion = 'beta', 'v1.0';
```

>[!NOTE]
> The property **APIVersion** can only be set if the [PageType Property](devenv-pagetype-property.md) is set to **API**. For more information, see [API Page Type](devenv-api-pagetype.md).


## See Also  
[Properties](devenv-properties.md)   
[Page Object](../devenv-page-object.md)  
[APIVersion Property (Query)](devenv-apiversion-query-property.md) 
