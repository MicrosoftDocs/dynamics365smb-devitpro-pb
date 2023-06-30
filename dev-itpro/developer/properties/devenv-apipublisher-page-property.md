---
title: "APIPublisher Property (Page)"
ms.author: solsen
ms.custom: na
ms.date: 06/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
 
# APIPublisher Property (Page)
> **Version**: _Available from runtime version 1.0._

<!-- this topic is manually created, parent node is devenv-apipublisher-property.md -->

Sets the publisher of the API endpoint the page is exposed in. The APIPublisher contains the first part of the URL for the endpoint. The syntax for providing a publisher is illustrated in the example below, and is typically the name of the company that owns the API.

## Applies to  

- Page object 

## Syntax

```AL
APIPublisher = 'contoso';
```

> [!NOTE]  
> The property **APIPublisher** can only be set if the [PageType Property](devenv-pagetype-property.md) is set to **API**. For more information, see [API Page Type](../devenv-api-pagetype.md).


## See Also

[Properties](devenv-properties.md)   
[Page Object](../devenv-page-object.md)  
[APIPublisher Property (Query)](devenv-apipublisher-query-property.md)  