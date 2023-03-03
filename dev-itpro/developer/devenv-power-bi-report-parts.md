---
title: "Adding Power BI Report Parts to Pages"
description: Explains how to add a page on a page that displays Power BI reports
ms.custom: bap-template
ms.date: 06/12/2022
ms.reviewer: na
ms.topic: how-to
ms.search.keywords: Power BI, reports, faq, errors
author: jswymer
ms.author: jswymer
ms.service: dynamics365-business-central
---
# Add Power BI Report Parts to Pages

> **APPLIES TO:** Business Central 2022 release wave (v21) and later. For earliers versions, see [Adding Power BI Report Parts to Pages (Legacy)](devenv-power-bi-report-parts-legacy.md).

[!INCLUDE [prod_short](includes/prod_short.md)] integrates with Microsoft Power BI, enabling users to create Power BI reports based on Business Central data. Users can view the reports from their Power BI workspaces, but also from the Business Central client. For an overview about Power BI integration, see [Business Central and Power BI](/dynamics365/business-central/admin-powerbi).

Displaying a Power BI report in a Business Central page requires the page includes a **Power BI Report** part. This part makes the connection to the Power BI Service, and lets users choose which report to display. Business Central comes equipped with several pages that already include the **Power BI Report** part. For a list of these pages, see [Power BI FAQ](/dynamics365/business-central/power-bi-faq?tabs=designer#which-pages-in-business-central-have-the-power-bi-report-part).

## Power BI Report part framework

The Business Central base application has many remote that provide the framework for Power BI integration. You'll find these objects in the **Applications\BaseApp\Source\Base Application.Source.zip\Power BI framework** folder of the installation media (DVD). But specifically, the main object for displaying **Power BI Report** part on role centers and other pages is page 6325 "Power BI Embedded Report Part".

On roles centers, you'd typically use the part to display reports related to the user's role and daily activities. In FactBoxes, you'd typically use it on list type pages to show reports related to selected records. A page can include more than one Power BI Report part.

The "Power BI Embedded Report Part" page exposes several methods for controlling when the **Power BI Report** part appears and the data it contains. The next sections include code examples of how to extend pages with the **Power BI Report** part. You can also read more in the [BCTech repo](https://github.com/microsoft/BCTech/tree/master/samples/PowerBi/MultipleReportsOnRoleCenter).

## Add a Power BI Report part

To add a Power BI part to a page, you add a `part` control to the hosting page and associate it with page 6325 "Power BI Embedded Report Part" using the following syntax:

```al
part(<part_name>; "Power BI Embedded Report Part")
{
}
```

For example, the following code adds a Power BI Report part to the **Team Member Role Center** page by using a page extension.

```al
pageextension 50101 TeamMemberRCPwrBiExt extends "Team Member Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {  
            // Add the Power BI Report part on the role center page 
            part(PowerBIReportPart"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
        }
    }
}
```

The following code adds a Power BI Report part to the **Sales Invoices List** page by using a page extension.

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {         
            // Add the Power BI Report FactBox page as the first part in the
            // FactBox area on the Sales Invoice List page
            part("Power BI Report FactBox"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
        }
    }
}
```

## Add a Power BI Report part that updates data based on selected record

With Power BI Report parts in FactBoxes of list and card pages, in many cases you'll want the report to update to display data that pertains to selected record on the page. You can implement this capability by using the `SetCurrentListSelection` method of page 6325 "Power BI Embedded Report Part". The method has the following signature:

```al
Page."Power BI Report FactBox Part".PAGE.SetCurrentListSelection(InputSelection: Variant)
```

The `InputSelection` variant specifies the table field that uniquely identifies records in the list page. This field should resolve to the primary key of the source table.

### <a name="examples"></a>Example 1

This example extends the **Sales Invoices** page to include a Power BI Report part and uses the `SetCurrentListSelection` method to use the update data in the report based on the primary key `No.` of the **Sales Invoice** table.

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {         
            part("Power BI Report FactBox"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
       }
    }

    trigger OnAfterGetCurrRecord()
    begin
        // Gets data from Power BI to display data for the selected record in the list
        // based on the primary key, in this case the "No." field.
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection(Rec."No.");
    end;
}
```

## Add multiple Power BI Report parts

If you want to add more than one Power BI Report part to a page, where each part can display different reports, you have to assign each part a context keyword. There are two ways to assign a context keyword, depending on the page type. 

### Use SubPageView property

For role centers and other page types, you can use the [SubPageView property](properties/devenv-subpageview-property.md) of the `part` control that contains the Power BI report part. In this case, the syntax for the adding a Power BI Report part is:

```al
part(<part_name>; "Power BI Embedded Report Part")
{
    SubPageView = where(Context = const('<context_keyword>'));
}
```

For example, suppose you wanted to add two Power BI Report parts to the **Team Member Role Center** page. In this case, you could use the following code: 

```al
pageextension 50101 TeamMemberRCPwrBiExt extends "Team Member Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {  
            part(PowerBIReportPart; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
                SubPageView = where(Context = const('TeamMemberReportsPart1'));
            }
            part(PowerBIReportPart2; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
                SubPageView = where(Context = const('TeamMemberReportsPart2'));
            }
        }
    }
}
```

You can do the same for FactBoxes on list and card type page. For example, suppose you wanted to add two Power BI Report parts in the FactBox of the **Sales Invoices List**. In this case, you could use the following code:

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {         
            part("Power BI Report FactBox 1"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports 1';
                SubPageView = where(Context = const('DetailedSalesInvoiceReports1'));

            }
            part("Power BI Report FactBox 2"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports 2';
                SubPageView = where(Context = const('DetailedSalesInvoiceReports2'));
            }
       }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage."Power BI Report FactBox 1".PAGE.SetCurrentListSelection(Rec."No.");
        CurrPage."Power BI Report FactBox 2".PAGE.SetCurrentListSelection(Rec."No.");
    end;
}
```

### Use SetPageContext method 

For list and card type pages, another way to assign context keywords is to call the `SetPageContext` method of the "Power BI Embedded Report Part" page.  

```al
procedure SetPageContext(InputContext: Text)
```

By calling `SetPageContext`, you can get the same results as you do with the `SubPageView` property. For example:

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {         
            part("Power BI Report FactBox 1"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports 1';

            }
            part("Power BI Report FactBox 2"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports 2';
            }
       }
    }

    trigger OnOpenPage()
        begin
            CurrPage."Power BI Report FactBox 1".PAGE.SetPageContext('DetailedSalesInvoiceReports1'); 
            CurrPage."Power BI Report FactBox 2".PAGE.SetPageContext('DetailedSalesInvoiceReports2'); 

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage."Power BI Report FactBox 1".PAGE.SetCurrentListSelection(Rec."No.");
        CurrPage."Power BI Report FactBox 2".PAGE.SetCurrentListSelection(Rec."No.");
    end;
}
```

## Display same set of Power BI reports on different pages

Suppose you want set up **Power BI Report** parts on different pages, where the parts have the following behavior:

- They show the same report selected by the user on all pages. When the user switches to another report on one page, it will switch on all pages.
- When a report is enabled or disabled in the **Power BI Report** part on one page, it's also enabled or disabled in the parts on other pages.

To configure this functionality, you give each **Power BI Report** part on the different pages the same context keyword. In other words, use the same values for the SubPageView property for the parts on all pages:

```al
SubPageView = where(Context = const('<context_keyword>'))
```

### Example 2

Suppose you want to display the same reports on the **Sales Invoices** page and **Sales Orders** page. In this case, you could use the following line of code in both the **Sales Invoices** and **Sales Orders** pages, where `Sales` is the common context identifier:

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {         
            part("Power BI Report FactBox"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
                SubPageView = where(Context = const('sales'));
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection(Rec."No.");
    end;
}

pageextension 50101 SalesOrdersPwrBiExt extends "Sales Orders"
{
    layout
    {
        addfirst(factboxes)
        {         
            part("Power BI Report FactBox"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
                SubPageView = where(Context = const('sales'));
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection(Rec."No.");
    end;
}
```

## Limitations and behavior notes

- The `SubPageView` property for the Power BI parts only supports constant values, not filters.
- If you use both the `SubPageView` property and the `SetPageContext` method for specifying a context at the same time, the `SetPageContext` value will overwrite the value specified in the `SubPageView` property.
- Dynamically changing the context (for example, by calling `SetPageContext` in the `OnAfterGetCurrRecord`) isn't recommended and could lead to unexpected results.
- Role center pages have no triggers, which means there's no way to call the `SetPageContext` method. As a consequence, any Power BI part in the role center would have the same context: the current user's profile/role.

## See Also

[Get Started with AL](devenv-get-started.md)  
[Adding a FactBox to a Page](devenv-adding-a-factbox-to-page.md)  
[Pages Overview](devenv-pages-overview.md)  
[Publishing and Installing an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
