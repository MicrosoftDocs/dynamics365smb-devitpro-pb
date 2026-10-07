---
title: Add FactBoxes to Business Central Pages
description: Learn how to add FactBoxes to Business Central pages, connect related records, configure system parts, and improve page-loading performance.
author: SusanneWindfeldPedersen
ms.date: 10/06/2026
ms.topic: how-to
ms.author: solsen
ms.reviewer: solsen
---

# Add a FactBox to a page

FactBoxes surface related, at-a-glance information for the current record in the page’s right pane. They can host `CardPart` or `ListPart` pages, charts and cues, and system parts such as Notes and Links. This article shows how to add a FactBox area to a page, add parts, pass context by using the `SubPageLink` or `SubPageView` properties, and apply performance best practices. Users can expand or collapse the FactBox pane by using the FactBox toggle in the top-right corner of the page.

The following image shows customer sales information in the FactBox pane on a sales order.

:::image type="content" source="media/factboxApril19.png" alt-text="Sales order with customer sales information shown in the FactBox pane." lightbox="media/factboxApril19.png":::

The following list highlights a few categories of FactBoxes:

- Show related records and fields by using `ListPart` or `CardPart` pages.
- Show related KPIs by using `CardPart` pages with charts or cues. Learn more about Role Center design in [Designing Role Centers](devenv-designing-role-centers.md).
- Visualize related data from external sources by using a `CardPart` page that contains a client add-in.

## Adding a FactBox area to a page

You define the FactBox by adding a FactBox area container control to the page. There can only be one FactBox area control on one page. The FactBox area container control acts as a placeholder to which you can add different parts for the FactBox. You can add a FactBox area container control on the following page types. 
  
- `Card`
- `Document`
- `ListPlus`
- `List`
- `Worksheet`

> [!NOTE]  
> You can add a part to the FactBox area only if it displays an existing `CardPart` or `ListPart` page. If you attempt to use another page type, you get an error.

### Example

The following example shows a simple page with a FactBox. The FactBox contains financial-report KPI lines, a Notes part, and a Links part. Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2025 release wave 2, you can control the visibility of the `Summary` part, as shown in the following code example. Learn more about the available system parts in [System parts](#system-parts).

```AL
page 50100 "Simple Customercard Page"
{
    PageType = Card;
 
    layout
    {
        area(FactBoxes)
        {
            part(MyPart; "Acc. Sched. KPI Web Srv. Lines")
            {
                ApplicationArea = All;
                SubPageView = sorting("Acc. Schedule Name");
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }         
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
            systempart(DefaultSummaryPart; Summary)
            {
                Visible = false; // Hide the default summary part
            }
        }
    }
}
```

> [!TIP]  
> On `List` pages, FactBoxes can show information about the entire list or the user's current selection. The filter passed to the FactBox determines its contextual content.

### System parts

Define system parts by using the `systempart()` keyword. The following table describes the system parts commonly used in FactBoxes:

|  Value | Description |
|--------|-------------|
| `Links` | Add links to a URL or path on the record shown in the page. For example, on an Item card, add a link to the supplier's item catalog. The links appear with the record when you view it. When a user chooses a link, the target file opens.|
| `Notes` | Write a note on the record shown in the page. For example, when creating a sales order, add a note about the order. The note appears with the item when you view it.|
| `Summary` | View a summary of the record shown in the page on pages that display a summary by default. For example, on a Customer card, see a summary of the customer's sales history. The summary is available on pages when the Summarize capability is enabled on the **Copilots and agents capabilities** page. The summary appears with the record when you view it. With 2025 release wave 2, you can hide the Summary part in code on page objects, page extensions, and profiles. Use the `DefaultSummaryPart` keyword to refer to it in code. Learn more about how to use it in Business Central in [Summarize records with Copilot](/dynamics365/business-central/summarize-with-copilot).|


#### Summary

The Summary system part provides a high-level overview of a record. Developers can hide the Summary FactBox on `Card`, `Document`, and `ListPlus` pages when it isn't needed. Use `DefaultSummaryPart` to hide it in page objects, page extensions, and profiles. The Summary part is enabled by default on eligible `Card`, `Document`, and `ListPlus` pages that have a `FactBoxes` area. Eligibility also depends on the page using a normal, non-temporary source table, the desktop client, the Summarize capability, and the user's permissions.

In the following example, a page extension of the Customer card hides the Summary part:

```al
pageextension 50101 MyPageExtension extends "Customer Card"
{
    ...
    layout
    {
        modify(DefaultSummaryPart)
        {
            Visible = false;
        }
    }
    ...
}
```

Or, to hide it in new pages:

```al
page 50101 MyPage
{
    PageType = Card;
    ApplicationArea = All;

    ...
    layout
    {
        area(FactBoxes)
        {
            systempart(DefaultSummaryPart; Summary)
            {
                Visible = false;
            }
        }
    }
    ...
}
```

> [!NOTE]
> A page can contain only one `Summary` system part.


## Filtering data displayed on a page in a FactBox

Use a FactBox filter to show content related to the current record on the main page. For example, a Customer List page can include a Customer Details FactBox. When a user selects a customer, the FactBox shows details for that customer. To create this behavior, associate a field in the FactBox source table with a field in the main page's source table. You can also filter on a constant value or a set of conditions.

### Example

The following example adds a customer details FactBox to a customer list:

```AL
page 50101 "Simple Customerlist Page"
{
    PageType = List;
    SourceTable = Customer;

    layout
    {
        area(content)
        {
            repeater(Control)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
            }

        }

        area(FactBoxes)
        {
            part(CustomerList; "Customer Details FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = FIELD("No.");
            }
        }
    }
}
```

## Performance considerations

Having a page composed of multiple FactBox pages that each process data from different sources can degrade performance. To improve responsiveness and the time it takes to load the page, [!INCLUDE[prod_short](includes/prod_short.md)] 2020 release wave 2 and later optimizes the sequence in which content is loaded. The sequence is as follows:

1. Content on the hosting page is loaded first, and users can immediately begin interacting with it.
2. The FactBox pane is loaded next, where each FactBox is loaded independently in sequence starting from the top.
    1. FactBoxes whose `Visible` property evaluates to `false` aren't loaded.
    2. FactBoxes that aren't within view are only loaded when the user scrolls them into view.
3. If the FactBox pane is collapsed, no FactBoxes are loaded until the user expands it.

The following are some practical tips to help you make the most of this optimization:

- Consider hiding any FactBoxes that represent secondary content that only some users require. Learn more about part visibility in [Choosing the visibility of parts](devenv-designing-parts.md#choosing-the-visibility-of-parts).
- For FactBoxes that require heavy processing, consider processing in the page background task. Learn more about background processing in [Using page background tasks](devenv-designing-parts.md#using-page-background-tasks).
- Avoid triggers on the hosting page that call into a FactBox. These triggers bypass FactBox performance optimizations and force the FactBox to load with the hosting page, which increases load time.
 
### FAQ about performance

#### Are any FactBox triggers run when the FactBox is hidden?

No. The trigger is only run when the FactBox is visible and within the user's view.

#### How often are triggers run if the FactBox pane is expanded, collapsed, and then expanded again?

In this scenario, the `OnOpenPage` trigger is only run the first time. Once a FactBox is loaded, it isn't loaded again for as long as the page remains open.

#### Are FactBoxes processed asynchronously?

No. This optimization is simply a controlled sequence in which triggers are run, still within the same session as the hosting page. Learn more about asynchronous background processing in [Designing page parts for page background tasks](devenv-page-background-tasks.md#partpages).

#### Does this optimization work with SubPageLink or SubPageView properties?

The use of these properties has no effect on the sequence of loading content on a page. Using properties such as `SubPageView` is preferred to writing trigger code to update a FactBox.

#### Does this optimization apply to parts that aren't FactBoxes?

This optimization doesn't apply to Role Center pages. When parts are used in the content area of a page, such as on a Card page, they aren't loaded if their `Visible` property evaluates to `false`. 

#### Can I force a FactBox to load along with page content?

There's no AL API to force FactBoxes to load along with the content of the hosting page.

#### Can I set the FactBox pane to start collapsed on all pages?

No. The default state of the FactBox pane is set by the [!INCLUDE[prod_short](includes/prod_short.md)] platform and modified by the user.

#### Does the experience vary on different browsers?

Each browser has its own definition of whether a FactBox is considered within view or not. For example, opening [!INCLUDE[prod_short](includes/prod_short.md)] in a new browser tab and quickly switching back to the original tab might pause loading of any FactBoxes in the new tab.

#### Does this optimization apply to other form factors?

This optimization applies to desktop, tablet, and phone clients where FactBoxes are supported. On tablet and phone clients, FactBoxes are shown on `Card` and `Document` pages, but not on `List` or `Worksheet` pages.

## Related information 
 
[Pages overview](devenv-pages-overview.md)   
[Page and page extension properties overview](properties/devenv-page-property-overview.md)  
[Designing Role Centers](devenv-designing-role-centers.md)  
[Use Designer](devenv-inclient-designer.md)  
[Arranging fields on a FastTab](devenv-arranging-fields-on-fasttab.md)  
[Actions overview](devenv-actions-overview.md)  
