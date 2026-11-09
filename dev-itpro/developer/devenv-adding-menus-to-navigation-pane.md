---
title: Add Menus to Role Center Navigation
description: Learn how to add pages, reports, and actions to role center navigation menus, navigation bars, and action areas in Business Central.
author: jswymer
ms.date: 11/05/2026
ms.topic: how-to
ms.author: jswymer
ms.reviewer: jswymer
---
# Add menus to navigation and action areas

The navigation area appears at the top of a role center and contains sections that help users go to pages and perform actions in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. The client separates it into the navigation menu, navigation bar, and actions area. Learn more about the layout in [Designing role centers](devenv-designing-role-centers.md). In AL, the `area()` control defines these areas.

## Adding to the navigation menu

The top-level navigation area is the navigation menu. It contains one or more root menu items that expand to show links to other pages. You define the links with `action()` controls and can group them into submenus that match the needs of the user role. List pages normally open in the role center's content area. Other page types open according to the client's navigation rules.

You define the navigation menu by using an `area(Sections)` control in the page code.

<!--
The top-level navigation should provide access to relevant entity lists for the role's areas of business. For example, typical root items for a business manager could be finance, sales, and purchasing. Place the root items in order of importance, starting from the left. Define the actions in this area by using a `area(Sections)` keyword. The **Home** menu items play by default; users can access the other menu items by selecting the small drop-down arrow next to the selected menu category in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. For users, the menu groups that display in the navigation area could change depending on the Role Center page that they access. 
-->

### Example

The following example adds the **My Customers** root item to the navigation menu of the **Sales Order Processor** role center. **My Customers** contains the **Customer Bank Account List** and **Customer Ledger Entries** actions, which open the corresponding pages. It also contains a group with two actions that open sales documents. **Sales Document Entity** opens an integration page, rather than a conventional invoice list.

```AL
namespace Contoso.RoleCenters;

using Microsoft.Sales.RoleCenters;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Receivables;
using Microsoft.Integration.Entity;
using Microsoft.Sales.History;
using Microsoft.CRM.Opportunity;
using Microsoft.Finance.GeneralLedger.Journal;
using Microsoft.Sales.Reports;

pageextension 50120 ExtendNavigationArea extends "Order Processor Role Center"
{

    actions
    {
        addlast(Sections)
        {
            group("My Customers")
            {
                action("Customer Bank Account List")
                {
                    RunObject = page "Customer Bank Account List";
                    ApplicationArea = All;
                }
                 action("Customer Ledger Entries")
                {
                    RunObject = page "Customer Ledger Entries";
                    ApplicationArea = All;
                }

                // Creates a sub-menu
                group("Sales Documents")
                {
                    action("Sales Document Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Entity";
                    }
                    action(MyPostedSalesInvoices)
                    {
                        ApplicationArea = All;
                        Caption = 'Posted Sales Invoices';
                        RunObject = page "Posted Sales Invoices";
                    }
                }
            }
        }
    }
}
```

You can also make pages and reports available in search. Learn more in [Add pages and reports to Tell Me](devenv-al-menusuite-functionality.md).

Add the following fragments to the `actions` block of the same page extension. The ellipses represent omitted surrounding code.

## Adding to the navigation bar

The second-level navigation is referred to as the navigation bar. The navigation bar offers a flat list of links to other pages. Navigation-bar links should open the pages most relevant to the user's business process. Place only the most important links at this level and place the other links in the top-level navigation.

You define the navigation bar by using an `area(Embedding)` control in the page code.

### Example
The following example uses an `area(Embedding)` control to add the **Sales Cycles** page as the last link in the navigation bar.

```AL
...
addlast(Embedding)
{
    action("Sales Cycles")
    {
        RunObject = page "Sales Cycles";
        ApplicationArea = All;
    }
}
```

## Adding to actions

The actions area displays the tasks and operations that users need most often. It contains links to pages, reports, and codeunits. You can place links at the root level or group them in a submenu.

You can define the actions by using three different `area()` controls.

The first action area at the top of the role center page is `area(Creation)`. The following example adds an action that opens the **Sales Journal** page. This action opens a worksheet; placing the action in `Creation` doesn't create a new sales document.

### Example

```AL
...
addlast(Creation)
{
    action("Sales Journal")
    {
        ApplicationArea = All;
        RunObject = page "Sales Journal";
    }
}
```

The actions in the `area(Processing)` control appear after the `area(Creation)` items.
The following example uses a group control to organize similar actions under a common parent. The group is appended to the processing area and opens pages for processing sales documents.

### Example

```AL
...
addlast(Processing)
{
    group(Documents)
    {
        action(MySalesDocumentEntityProcessing)
        {
            ApplicationArea = All;
            Caption = 'Sales Document Entity';
            RunObject = page "Sales Document Entity";
        }
        action(MyPostedSalesInvoicesProcessing)
        {
            ApplicationArea = All;
            Caption = 'Posted Sales Invoices';
            RunObject = page "Posted Sales Invoices";
        }
    }
}
```


Actions in the `area(Reporting)` control appear last in the action area. Root-level reporting actions use the default report icon. Use this area for report actions. The following example opens the `Customer/Item Sales` report.

### Example

```AL
...
addlast(Reporting)
{
    action("Customer Statistics")
    {
        ApplicationArea = All;
        RunObject = report "Customer/Item Sales";
    }
}
```


## Related information
[AL development environment](devenv-reference-overview.md)  
[Page extension object](devenv-page-ext-object.md)  
[Actions overview](devenv-actions-overview.md)  
[Add pages and reports to Tell Me](devenv-al-menusuite-functionality.md)  
