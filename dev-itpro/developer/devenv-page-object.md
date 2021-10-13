---
title: "Page Object"
description: "Description of the page object in AL for Business Central."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Page Object

Pages are the main way to display and organize visual data in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. They are the primary object that a user will interact with and have a different behavior based on the type that you choose. Pages are designed independently of the device they are to be rendered on, and in this way the same page can be reused across phone, tablet, and web clients. 

The structure of a page is hierarchical and breaks down in to three sections. The first block contains metadata for the overall page; the type of the page and the source table it is showing data from. The next section; the layout, describes the visual parts on the page. The final section details the actions that are published on the page.

When developing a solution for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you will follow the code layout for a page as shown in the page example below, but for more details on the individual controls and properties that are available, see [Page Property Overview](properties/devenv-page-property-overview.md).

If you want to, for example, add functionality to a page that already exists in [!INCLUDE[prod_short](includes/prod_short.md)], you can create a page extension object that changes an existing page object. For more information, see [Page Extension Object](devenv-page-ext-object.md). Depending on how much you want to change on an existing page, you can also create a page customization object, which offers modifications on actions and layout. For more information, see [Page Customization Object](devenv-page-customization-object.md).

> [!IMPORTANT]  
> Only pages with the [Extensible Property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

## Snippet support

Typing the shortcut `tpage` will create the basic layout for a page object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.


[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Views

Views in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are used on list pages to define a different view of the data on a given page. Views can be defined for [Pages](devenv-page-object.md), [Page Extensions](devenv-page-ext-object.md), and [Page Customization](devenv-page-customization-object.md). For more information, see [Views](devenv-views.md).

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

## See Also

[AL Development Environment](devenv-reference-overview.md)  
[Views](devenv-views.md)  
[Adding Help Links from Pages, Reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page, Page Fields, and Page Extension Properties](properties/devenv-page-property-overview.md)  
[Page Properties](./properties/devenv-properties.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Configure Context-Sensitive Help](../help/context-sensitive-help.md)