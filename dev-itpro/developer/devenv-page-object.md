---
title: Page object
description: Description of the page object and its syntax in AL for Business Central.
author: SusanneWindfeldPedersen
ms.date: 04/26/2024
ms.topic: conceptual
ms.author: solsen
---

# Page object

Pages are the main way to display and organize visual data in [!INCLUDE [prod_short](includes/prod_short.md)]. They are the primary object that a user will interact with and have a different behavior based on the type that you choose. Pages are designed independently of the device they are to be rendered on, and in this way the same page can be reused across phone, tablet, and web clients. 

When developing a solution for [!INCLUDE [prod_short](includes/prod_short.md)], you follow the code layout for a page as shown in the page example below, but for more details on the individual controls and properties that are available, see [Page property overview](properties/devenv-page-property-overview.md).

If you want to, for example, add functionality to a page that already exists in [!INCLUDE[prod_short](includes/prod_short.md)], you can create a page extension object that changes an existing page object. For more information, see [Page extension object](devenv-page-ext-object.md). Depending on how much you want to change on an existing page, you can also create a page customization object, which offers modifications on actions and layout. For more information, see [Page customization object](devenv-page-customization-object.md).

> [!IMPORTANT]  
> Only pages with the [Extensible property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

## Page syntax

The structure of a page object is hierarchical and breaks down into three sections:

- The first block contains metadata for the overall page; the type of the page and the source table it's showing data from. 
- The next section; the layout, describes the visual parts on the page. 
- The final section details the actions that are published on the page.

The order in which the sections appear matters. The following example illustrates the ordering:

```AL
page ObjectId PageName
{
    // page properties such as 
    PageType = Card;
    SourceTable = Customer;
    ContextSensitiveHelpPage = 'my-feature';

    layout {}

    actions {}

    views {} // only for pages of type ListPage

    // optionally, add AL code here
}
```

## Snippet support

Typing the shortcut `tpage` will create the basic layout for a page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.


[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]


## Add tooltips on page fields

Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2024 release wave 1, you can define tooltips on table fields. When a tooltip is defined on a table field, any page that uses the field automatically inherits the tooltip. 

For more information, see [Add tooltips to table and page fields](devenv-adding-tooltips.md).


## Views

Views in [!INCLUDE [prod_short](includes/prod_short.md)] are used on list pages to define a different view of the data on a given page. Views can be defined for [Pages](devenv-page-object.md), [Page extensions](devenv-page-ext-object.md), and [Page customization](devenv-page-customization-object.md). For more information, see [Views](devenv-views.md).


## Page example

```AL
page 50101 SimpleCustomerCard
{
    PageType = Card;
    SourceTable = Customer;
    ContextSensitiveHelpPage = 'my-feature';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = All;
                    CaptionML = ENU = 'Hello';

                    trigger OnValidate()
                    begin
                        if "No." < '' then
                            Message('Number too small')
                    end;
                }

                field(Name; Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Address)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(NewAction)
            {
                ApplicationArea = All;
                RunObject = codeunit "Document Totals";
            }
        }
    }
}
```

## See also

[AL development environment](devenv-reference-overview.md)  
[Views](devenv-views.md)  
[Adding help links from pages, reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Page extension object](devenv-page-ext-object.md)  
[Page, page fields, and page extension properties](properties/devenv-page-property-overview.md)  
[Page properties](./properties/devenv-properties.md)  
[Developing extensions](devenv-dev-overview.md)  
[Configure context-sensitive help](../help/context-sensitive-help.md)
