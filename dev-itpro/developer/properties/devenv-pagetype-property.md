---
title: "PageType Property"
author: solsen
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# PageType Property
Sets the type of page that is created.  

## Applies To  
 Pages  

## Syntax
```
PageType = List;
```

## Remarks  
You typically set this property when you are create new pages, but you can change it at any time. The value for the **PageType** property specifies the Page layout.

The exception is the value *API*. Pages of this type are used to generate web service endpoints and cannot be shown in the user interface. For an overview of supported page types, see [Pages Overview](../devenv-pages-overview.md).

## See Also  
 [Page Properties](devenv-page-properties.md)  
 [Properties](devenv-properties.md)  
 [Pages Overview](../devenv-pages-overview.md)  
