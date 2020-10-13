---
title: "Views"
description: "Description of what views are and how they are defined in Business Central."

author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2020
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Views
Views in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are used on list pages to define a different view of the data on a given page. Views can be defined for [Pages](devenv-page-object.md), [Page Extensions](devenv-page-ext-object.md), and [Page Customization](devenv-page-customization-object.md). Views are defined on page extension objects to provide an alternative view of data and/or layout on an existing page, and in views on page customization objects, they can be used to provide an alternative view for a certain profile.

A view offers:

- Filtering on multiple table fields on the source table defined for the page.
- Sorting of the data on multiple table fields, but only in one direction; either *ascending* or *descending*.
- Layout changes, modifying page columns, moving them, etc. 

Views are defined directly in code, on the list page that they modify. The defined view or views are available to the user through **Filter Pane** on a page and appear in the sequence that they are defined in code.

> [!NOTE]  
> `showMyCode` does not apply to views. Views defined in an extension with `showMyCode` set to false can still be copied using the in-client designer.

## Snippet support
Typing the shortcut `tview` will create the basic layout for a view when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Filtering and sorting
You can filter on the data in a view by using the `Filters` property. The following is an example of the syntax:
```AL
Filters = where ("Balance (LCY)" = filter (> 500), Name = filter ('G*'));
```
For more information, see [Filters](properties/devenv-filters-property.md).

You can sort on the data in a view by using the `OrderBy` property. The following is an example of the syntax:
```AL
OrderBy = ascending ("Balance (LCY)", Name);
```
For more information, see [OrderBy](properties/devenv-orderby-property.md).

> [!NOTE]
> All filters are applied to the table field(s), not the page field(s), which allows filtering on a table field not shown on the page.

## View example
The following example shows a page customization of the **Customer List** page, which is available for a specific role center only; the **My Role Center**. Change the role center view under **My Settings**. The definition of the view adds a caption which is displayed on the left side in the UI. The view sorts the customer balance in ascending mode and the view modifies the layout by moving the customer balance first and adding a freeze column after it.

> [!IMPORTANT]  
> The definition of the `view` section must come after any definition of layout and actions, otherwise you will get a compilation error.

```AL
profile MyProfile
{
    Description = 'My Role Center';
    RoleCenter = "Order Processor Role Center";
    Customizations = MyCustomization;
}

pagecustomization MyCustomization customizes "Customer List"
{
    layout
    {
        // Change the layout of the page
    }

    actions
    {
        // Add any actions to the page
    }

    views
    {
        addfirst
        {
            view(BalanceLCY)
            {
                Caption = 'Ordered Balance LCY';
                OrderBy = ascending ("Balance (LCY)");

                layout
                {
                    // Change the layout of the view

                    movefirst(Control1; "Balance (LCY)")

                    modify(Control1)
                    {
                        FreezeColumn = "Balance (LCY)";

                    }
                }
            }
        }
    }
}
```

## Limitations
In general, views can in several ways be compared to page customizations. These are the limitations of views:

- For views you can modify the same control properties as for page customization objects independently of where the view has been defined (page, page extension, or page customization level). This is validated by the compiler. 
- It is not possible to use variables or methods in a view. When writing client-side expressions for properties like **Visibility**, it will only be possible to use constant values or table field references. This is validated by the compiler.
- It is not possible to create new controls for a page from a view.

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Customization Object](devenv-page-customization-object.md)  
[SharedLayout Property](properties/devenv-sharedlayout-property.md)
