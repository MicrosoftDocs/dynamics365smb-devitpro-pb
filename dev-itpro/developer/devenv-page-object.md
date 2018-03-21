---
title: "Page Object"
description: "Description of the page object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: a0ac492d-e3c8-4a76-87b4-b469e08c58e7
ms.author: solsen
caps.latest.revision: 18
---

[!INCLUDE[d365fin_dev_blog](includes/d365fin_dev_blog.md)]

# Page Object
Pages are the main way to display and organize visual data in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. They are the primary object that a user will interact with and have a different behavior based on the type that you choose. Pages are designed independently of the device they are to be rendered on, and in this way the same page can be reused across phone, tablet, and web clients.

The structure of a page is hierarchical and breaks down in to three sections. The first block contains metadata for the overall page; the type of the page and the source table it is showing data from. The next section; the layout, describes the visual parts on the page. The final section details the actions that are published on the page.

When developing a solution for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you will follow the code layout for a page as shown in the page example below, but for more details on the individual controls and properties that are available, see [Page Property Overview](properties/devenv-page-property-overview.md).

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.      

## Snippet support
Typing the shortcut ```tpage``` will create the basic layout for a page object when using the AL Extension in Visual Studio Code.

## Page example

```
page 70000200 SimpleCustomerCard
{
    PageType = Card;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No.";"No.")
                {
                    CaptionML = ENU='Hello'

                    trigger OnValidate()
                    begin
                        if "No." < 20
                            Message('Number too small')
                    end;
                }

                field(Name;Name) {}
                field(Address;Address) {}
            }
        }
    }
    actions
    {
        area(Navigation)
        {
            action(NewAction)
            {
                RunObject = codeunit "Document Totals";
            }         
        }
    }
}
```

## See Also  
[AL Development Environment](devenv-reference-overview.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Extension Properties](properties/devenv-page-property-overview.md)   
[Developing Extensions](devenv-dev-overview.md)  
