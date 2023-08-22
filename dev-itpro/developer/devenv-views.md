---
title: "Views"
description: "Description of what views are and how they're defined in Business Central."
ms.reviewer: jswymer
author: SusanneWindfeldPedersen
ms.custom: bap-template
ms.date: 12/08/2022
ms.topic: conceptual
ms.author: solsen
ms.service: dynamics365-business-central
---

# Views

Views in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are used on list pages to define a different view of the data on a given page. Views can be defined for [Pages](devenv-page-object.md), [Page Extensions](devenv-page-ext-object.md), and [Page Customization](devenv-page-customization-object.md). Views are defined on page extension objects to provide an alternative view of data and/or layout on an existing page. In views on page customization objects, they can be used to provide an alternative view for a certain profile.

A view offers:

- Filtering on multiple table fields on the source table defined for the page.
- Sorting of the data on multiple table fields, but only in one direction; either *ascending* or *descending*.
- Layout changes, modifying page columns, moving them, etc. 

Views are defined directly in code, on the list page that they modify. The defined view or views are available to the user through **Filter Pane** on a page and appear in the sequence that they're defined in code.

> [!NOTE]  
> `allowDebugging` does not apply to views. Views defined in an extension with `allowDebugging` set to `false` can still be copied using Designer.

## Snippet support

Typing the shortcut `tview` will create the basic layout for a view when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

## Filtering and sorting

You can filter on the data in a view by using the `Filters` property. The following code is an example of the syntax:
```AL
Filters = where ("Balance (LCY)" = filter (> 500), Name = filter ('G*'));
```
For more information, see [Filters](properties/devenv-filters-property.md).

You can sort on the data in a view by using the `OrderBy` property. The following code is an example of the syntax:
```AL
OrderBy = ascending ("Balance (LCY)", Name);
```
For more information, see [OrderBy](properties/devenv-orderby-property.md).

> [!NOTE]
> All filters are applied to the table field(s), not the page field(s), which allows filtering on a table field not shown on the page.

## Layout changes

By default, a view will have the same field layout as the page's **All** view, which means it will show the same columns, in the same order, with the same widths. The layout will also have the same freeze column. This behavior is a basic experience in the case where defining a specific layout for the view isn't important. It's controlled by the [SharedLayout property](properties/devenv-sharedlayout-property.md) on the page view, which in this case is set to `true`. This layout is referred to as a *shared layout view*. The following example code illustrates a *shared layout view*:

```al
view(SharedLayoutView) 

{ 
    // This view only define filters, but no specific layout. 
    // User personalization are applied on this view. 
    Caption = 'View With Shared Layout'; 
    Filters = where ("Balance (LCY)" = filter (> 500), Name = filter ('G*')); 
} 
```

By contrast, you set the `SharedLayout` to `false` to design a *unique layout view* that defines its own layout and is independent from all other views. Any changes coded in the `layout` section are applied in the view. User personalizations made on the page aren't applied on the view. For example:

```al
view(UniqueView)
{
    Caption = 'View With Unique Layout';
    Filters = where ("Balance (LCY)" = filter (> 500), Name = filter ('G*')); 
    // By settings this property to false, the view gets its own independent layout.
    // User personalization are not applied on this view.
    // Instead, the layout defined below is applied.
    SharedLayout = false;
    
    layout
    {
        movefirst(Control1; "Balance Due (LCY)")
    }
}
```

> [!IMPORTANT]
> `SharedLayout` must be set to `false` to use a custom layout on the view (the layout section). A compiler error is reported otherwise.

## View example

The following example shows a page customization of the **Customer List** page, which is available for a specific role center only; the **My Role Center**. Change the role center view under **My Settings**. The definition of the view adds a caption that's displayed on the left side in the UI. The view sorts the customer balance in ascending mode and the view modifies the layout by moving the customer balance first and adding a freeze column after it.

> [!IMPORTANT]  
> The definition of the `view` section must come after any definition of layout and actions, otherwise you will get a [compiler error AL0577](diagnostics/diagnostic-al577.md).

```AL
profile MyProfile
{
    Caption = 'My Role Center';
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
                Filters = where ("Balance (LCY)" = filter (> 500), Name = filter ('G*'));
                SharedLayout = false;

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
```

## Limitations

In general, views can in several ways be compared to page customizations. Here are the limitations of views:

- For views, you can modify the same control properties as for page customization objects independently of where the view has been defined (page, page extension, or page customization level). This condition is validated by the compiler. 
- It isn't possible to use variables or methods in a view. When writing client-side expressions for properties like **Visibility**, it will only be possible to use constant values or table field references. This condition is validated by the compiler.
- It isn't possible to create new controls for a page from a view.




## See Also
  
[AL Development Environment](devenv-reference-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Page Object](devenv-page-object.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Customization Object](devenv-page-customization-object.md)  
[SharedLayout Property](properties/devenv-sharedlayout-property.md)
