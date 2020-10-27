---
title: "PageType Property"
author: solsen
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# PageType Property

Sets the type of page that is created. The page type defines the layout and options on the page and it is important to choose the page type that aligns with the purpose of a page. For more information about designing pages, see [Page Types and Layouts](../devenv-page-types-and-layouts.md). For more information about the page object, see [Pages Overview](../devenv-pages-overview.md).

The following page types are available:

|PageType|Description|
|----|----|
|`RoleCenter`|Overview of business performance and the start page for a specific user profile.|
|`Card`|Master, reference, and set up data management.|
|`Document`|Transaction and other document management.|
|`ListPlus`|Statistics, details, and related data management.|
|`List`|Entity overviews and navigation, and inline editing of simple entities.|
|`Worksheet`|Line-based data entry tasks (such as journals) and inquiries.|Collection of entities|
|`StandardDialog`|Routine dialog that starts or progresses a task.|Single or collection|
|`ConfirmationDialog`|Confirmative or exceptional dialog, such as warnings.|Single or collection|
|`NavigatePage`|Multi-step dialog (also known as a "Wizard").|
|`CardPart`|A page that is embedded in another page, such as in a FactBox.|
|`ListPart`|A page that is embedded in another page, such as in a FactBox.|Collection of entities/entries|
|`HeadlinePart` | A page that is embedded in a `RoleCenter` page to display relevant insights from across the business.|


## Applies to

- Pages  

## Syntax

```AL
PageType = List;
```

## Remarks  

You typically set this property when you are create new pages, but you can change it at any time. The value for the **PageType** property specifies the Page layout.

The exception is the value *API*. Pages of this type are used to generate web service endpoints and cannot be shown in the user interface. For an overview of supported page types, see [Pages Overview](../devenv-pages-overview.md).

## See Also  

[Page Properties](devenv-page-properties.md)  
[Properties](devenv-properties.md)  
[Pages Overview](../devenv-pages-overview.md)  
