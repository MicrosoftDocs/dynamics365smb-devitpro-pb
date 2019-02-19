---
title: "Views"
description: "Description of what views are and how they are defined in Business Central."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/19/2019
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Views
Views in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are used on list pages to define a different view of the data on a given page. Views can be defined for [Pages](devenv-page-object.md), [Page Extensions](devenv-page-ext-object.md), and [Page Customization](devenv-page-cust-object.md). Views are defined on page extension objects to provide an alternative view of data and/or layout on an existing page, and in views on page customization objects, they can be used to provide an alternative view for a certain profile.

A view offers:

- Filtering on multiple table fields on the source table defined for the page.
- Sorting of the data on multiple table fields, but only in one direction; either ascending or descending.
- Layout changes, modifying page columns, moving them, etc. 

Views are defined directly in code, on the list page that they modify. The defined view or views are available to the user in **Filter Pane** on a page and appear in the sequence that they are defined in code.

## Snippet support
Typing the shortcut `tview` will create the basic layout for a view when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Filtering and sorting
You can filter on the data in a view by using the Filter <!--[Filter](properties/devenv-filter-property.md) --> property. The following is an example of the syntax:
```
Filters = where ("Balance (LCY)" = filter (> 500), Name = filter ('G*'));
```
You can sort on the data in a view by using the [OrderBy](properties/devenv-orderby-property) property.
The following is an example of the syntax:
```
OrderBy = ascending ("Balance (LCY)", Name);
```

## View example

```

```

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Customization Object](devenv-page-cust-object.md)  
