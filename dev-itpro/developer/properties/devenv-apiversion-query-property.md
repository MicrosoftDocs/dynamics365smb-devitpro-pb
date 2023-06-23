---
title: "APIVersion Property (Query)"
ms.author: solsen
ms.custom: na
ms.date: 06/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
 
# APIVersion Property (Query)
> **Version**: _Available from runtime version 1.0._ 

<!-- this topic is manually created, parent node is devenv-apiversion-property.md -->

Sets the version(s) of the API endpoint the query is exposed in. If the `APIVersion` isn't specified, the default value is `beta`. The syntax for providing versions is illustrated in the example below:

## Applies to  

- Query object 

## Syntax
```AL
APIVersion = 'beta', 'v1.0';
```

For a full example, see [API Query Type](../devenv-api-querytype.md).


## See Also  
[Properties](devenv-properties.md)   
[Query Object](../devenv-query-object.md)  
[APIVersion Property (Page)](devenv-apiversion-page-property.md)  
