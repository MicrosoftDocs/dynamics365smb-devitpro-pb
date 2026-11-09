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

FactBoxes surface related, at-a-glance information for the current record in the page’s right pane. They can host `CardPart` or `ListPart` pages, charts and cues, and system parts such as **Notes** and **Links**. This article shows how to add a FactBox area, add parts, pass context with `SubPageLink` or `SubPageView`, and improve page-loading performance. In the desktop client, users can expand or collapse the pane with its action-bar toggle.

The following image shows customer sales information in the FactBox pane on a sales order.

:::image type="content" source="media/factboxApril19.png" alt-text="Sales order with customer sales information shown in the FactBox pane." lightbox="media/factboxApril19.png":::

The following list highlights a few categories of FactBoxes:

- Show related records and fields by using `ListPart` or `CardPart` pages.
- Show related KPIs by using `CardPart` pages with charts or cues. Learn more about role center design in [Designing role centers](devenv-designing-role-centers.md).
- Visualize related data from external sources by using a `CardPart` page that contains a client add-in.

## Adding a FactBox area to a page

Define a FactBox by adding a FactBox area container control to the page. A page can have only one FactBox area. The container is a placeholder for the parts you add. The following common page types support a FactBox area:

- `Card`
- `Document`
- `ListPlus`
- `List`
- `Worksheet`

> [!NOTE]
> Use an existing `CardPart` or `ListPart` page. Other page types aren't supported as ordinary FactBox page parts and can produce compiler diagnostics.

### Example

The following example shows a simple page with a FactBox. The FactBox contains financial-report KPI lines, a Notes part, and a Links part. Starting in [!INCLUDE[prod_short](includes/prod_short.md)] 2025 release wave 2, you can control the visibility of the `Summary` part, as shown in the following code example. Learn more about the available system parts in [System parts](#system-parts).

This placement example has no source table. Add a source table and any required links when adapting it to a record-backed page.

```AL
namespace Contoso.FactBoxes;

using Microsoft.Finance.FinancialReports;

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
> A FactBox can show current-record or aggregate information, depending on its filters and implementation. Selecting multiple rows doesn't automatically pass the whole selection to the FactBox.

### System parts

Define system parts by using the `systempart()` keyword. The following table describes the system parts commonly used in FactBoxes:

|  Value | Description |
|--------|-------------|
| `Links` | Add an HTTP or HTTPS link to the current record, such as a link to the supplier's item catalog on an item card. The links appear with the record when you view it. Selecting a link opens the target URL.|
| `Notes` | Write a note on the current record. For example, when creating a sales order, add a note about the order. The note appears with that record when you view it.|
| `Summary` | View a summary of the record shown in the page on pages that display a summary by default. For example, on a Customer card, see a summary of the customer's sales history. The summary is available on pages when the **Summarize** capability is enabled on the **Copilots and agents capabilities** page. The summary appears with the record when you view it. With 2025 release wave 2, you can hide the Summary part in code on page objects, page extensions, and profiles. Use the `DefaultSummaryPart` keyword to refer to it in code. Learn more about how to use it in Business Central in [Summarize records with Copilot](/dynamics365/business-central/summarize-with-copilot).|


#### Summary

The Summary system part provides a high-level overview of a record. Developers can hide it on `Card`, `Document`, and `ListPlus` pages when it isn't needed. Use `DefaultSummaryPart` to hide it in page objects, page extensions, and profiles. The compiler supplies the default Summary part for supported pages. Whether users see it depends on the page layout, a normal non-temporary source table, desktop client capabilities, the **Summarize** capability, and permissions.

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
namespace Contoso.FactBoxes;

using Microsoft.Sales.Customer;

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
                    Caption = 'No.';
                    ToolTip = 'Specifies the customer number.';
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
2. Ordinary FactBoxes open after the hosting page and load in sequence as they come into view. The selected FactBox tab can affect loading priority.
3. When the pane is collapsed, ordinary FactBoxes normally wait until their content is needed. Notes and Links can open earlier to populate attachment counts, even when their content isn't visible.

Hidden FactBoxes normally don't load until needed. Exceptions include hidden providers required by visible parts and content needed by Designer. These exceptions also apply when a part's `Visible` property is `false`.

The following are some practical tips to help you make the most of this optimization:

- Consider hiding any FactBoxes that represent secondary content that only some users require. Learn more about part visibility in [Choosing the visibility of parts](devenv-designing-parts.md#choosing-the-visibility-of-parts).
- For FactBoxes that require heavy processing, consider processing in the page background task. Learn more about background processing in [Using page background tasks](devenv-designing-parts.md#using-page-background-tasks).
- Avoid triggers on the hosting page that call into a FactBox. These triggers bypass FactBox performance optimizations and force the FactBox to load with the hosting page, which increases load time.

### FAQ about performance

#### Are any FactBox triggers run when the FactBox is hidden?

For an ordinary deferred page FactBox, opening waits until the part is needed. This behavior doesn't guarantee that no code runs while a loaded part is hidden. System attachment parts and explicit calls into a part are separate cases.

#### How often are triggers run if the FactBox pane is expanded, collapsed, and then expanded again?

Collapsing and expanding the pane doesn't reopen an already opened FactBox or rerun `OnOpenPage`. Its data can still refresh while the page remains open.

#### Are FactBoxes processed asynchronously?

No. This optimization is simply a controlled sequence in which triggers are run, still within the same session as the hosting page. Learn more about asynchronous background processing in [Designing page parts for page background tasks](devenv-page-background-tasks.md#partpages).

#### Does this optimization work with SubPageLink or SubPageView properties?

The use of these properties has no effect on the sequence of loading content on a page. Using properties such as `SubPageView` is preferred to writing trigger code to update a FactBox.

#### Does this optimization apply to parts that aren't FactBoxes?

Role center parts have their own deferred-loading behavior. In content areas, initially hidden parts can also be deferred. Hidden providers required by visible parts and Designer content are exceptions.

#### Can I force a FactBox to load along with page content?

There's no AL API to force FactBoxes to load along with the content of the hosting page.

#### Can I set the FactBox pane to start collapsed on all pages?

No. The default state of the FactBox pane is set by the [!INCLUDE[prod_short](includes/prod_short.md)] platform and modified by the user.

#### Does the experience vary on different browsers?

Loading uses browser visibility detection. For example, opening [!INCLUDE[prod_short](includes/prod_short.md)] in a new browser tab and quickly switching back to the original tab might pause loading of FactBoxes in the new tab.

#### Does this optimization apply to other form factors?

The optimization applies where FactBoxes are supported. On tablets and phones, this support is normally `Card` and `Document` pages, not `List` or `Worksheet` pages. FactBoxes aren't shown in selection mode or task dialogs.

## Related information

[Pages overview](devenv-pages-overview.md)  
[Page and page extension properties overview](properties/devenv-page-property-overview.md)  
[Designing role centers](devenv-designing-role-centers.md)  
[Use Designer](devenv-inclient-designer.md)  
[Arranging fields on a FastTab](devenv-arranging-fields-on-fasttab.md)  
[Actions overview](devenv-actions-overview.md)  
