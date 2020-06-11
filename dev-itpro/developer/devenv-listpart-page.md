---
title: "ListPart Pages"
description: ""
ms.custom: na
ms.date: 04/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: t-blrobl
author: blrobl
---

# ListPart pages

A *ListPart* page is a type of page part used to display a list of records embedded within another page. It consists of a repeater, which presents the records of the source table as rows and columns, and optionally of an action menu. 

A list part can be contained in Role Centers, FactBoxes on pages of several types, as a Tabular step in a Wizard and a Subpage on a Document page. Depending on the type of the hosting page, a list part is subject to different constraints, in addition to those inherent to page parts. For more information about design considerations, see [Design Considerations](devenv-designing-parts#design-considerations.md).

## Including a list part on a page

To define a list part, you create a page object and set the [PageType Property](properties/devenv-pagetype-property.md) to `ListPart`. The structure is similar to that of a `List` page, except that is cannot display Factboxes. For more information about the structure of a list page, see [List Page Structure](devenv-designing-list-pages.md?tabs=structure#structure-1). 

Once the list part object is created, you add it to a page from the[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].

in Visual Studio Code, you add a part control on the hosting page object that references the page part object. The part control also defines a small set of properties, such as the caption that will accompany the part. This allows separation of responsibility: the page part object defines self-contained functionality, whilst the hosting page defines how the container of the part should behave without knowledge of its' functionality.



## See Also

[Page Parts Overview](developer/devenv-designing-parts.md)