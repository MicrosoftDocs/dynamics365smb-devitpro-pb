---
title: Embed Power BI reports in pages
description: Explains how to display Power BI reports on pages in Business Central
ms.custom: bap-template
ms.date: 09/19/2023
ms.reviewer: na
ms.topic: how-to
ms.search.keywords: Power BI, reports, faq, errors
author: jswymer
ms.author: jswymer
ms.service: dynamics365-business-central
---
# Embed Power BI reports, scorecards, dashboards in pages

> **APPLIES TO:** Business Central 2022 release wave (v21) and later. For earlier versions, see [Adding Power BI Report Parts to Pages (Legacy)](devenv-power-bi-report-parts-legacy.md).

[!INCLUDE [prod_short](includes/prod_short.md)] integrates with Microsoft Power BI, enabling users to create Power BI reports, scorecards, and dashboards based on Business Central data. Users can view these from their Power BI workspaces, but also from the Business Central client. For an overview about Power BI integration, see [Business Central and Power BI](/dynamics365/business-central/admin-powerbi).

The [!INCLUDE [prod_short](includes/prod_short.md)] base application includes several roles centers and pages that display Power BI reports. This article provides an introduction to how you customize the application to display even more reports, scorecards, dashboards by using the Power BI embed framework of Business Central.

In this article, the terms *Power BI element* and *element* are often used as global terms for referring to reports, report visuals, dashboards, dashboard tiles, and scorecards.

<!--With both methods, you can set up  allow users to scroll through one or more selected reports or you can lock the client to only display a specific report. -->

## Power BI embed framework

The Business Central base application has many objects that provide the framework for Power BI integration. The framework enables you to customize pages to include the following Power BI element types:

- Dashboard or individual dashboard tile
- Report or individual report visual.
- Scorecard. In AL, this element type is covered under Report element type. 

### Introduction

There are two ways to embed Power BI reports in pages. One way is to use the **Power BI Report** part in on a page. With this way, reports are readily visible on the page when opened and typically linked to a specific record on the page. You can design parts so that users can scroll through available reports, or set up the part to display a specific report&mdash;essentially locking it in the part.

The other way is to embed a report in a separate page that opens from an action the user selects on the page. This way enables reports to display in a larger screen area because they're not limited by the dimensions of the part. It provides the same experience as when a user selects **Expand** on a report in a page part. 

The following table outlines the most common objects used when adding Power BI elements to pages. 

|Object|Description|
|-|-|
|Page 6325 "Power BI Embedded Report Part"|Used to display Power BI elements in a page part.|
|Page 6323 "Power BI Element Card"|Used to display Power BI elements in expanded mode on a separate page.|
|Page 6327 "Power BI Embed Setup Wizard"|Assisted setup guide for enabling Power BI for the fírst time.|
|Table 6312 "Power BI Displayed Element"|Stores information about Power BI elements to be displayed for a user in each specific context. This table was introduced in 2023 release wave 2 (version 23).|
|Table 6314 "Power BI Context Settings"|Persists user settings for a specific Power BI context (like role center part, page FactBox, and so on) where the settings apply. Different parts in the same main page can have different contexts. This table was introduced in 2023 release wave 2 (version 23).|

> [!TIP]
> If you're working with Business Central on-premises, you find these objects in the **Applications\BaseApp\Source\Base Application.Source.zip\Power BI framework** folder of the installation media (DVD).

### Examples and reference

Learn more about the Power BI embed framework in the [BCTech repo](https://github.com/microsoft/BCTech/tree/master/samples/PowerBi/). This BCTech repo is a Microsoft open source repo that includes detailed code examples and guidelines that supplement this article.

To get an overview of all Power BI objects in the base application, visit [Base-Application Reference for Dynamics 365 Business Central](/dynamics365/business-central/application/base-application/) and search for *Power BI*.


## Embed Power BI reports in page parts

**Power BI Report** part is designed to display a Power BI element inside the hosting page, like in the page's FactBox area or field group. This part makes the connection to the Power BI Service, and lets users choose which report to display. Business Central comes equipped with several pages that already include the **Power BI Report** part. For a list of these pages, see [Power BI FAQ](/dynamics365/business-central/power-bi-faq?tabs=designer#which-pages-in-business-central-have-the-power-bi-report-part). The main object for displaying **Power BI Report** part on role centers and other pages is page 6325 "Power BI Embedded Report Part".

On roles centers, you'd typically use the part to display reports related to the user's role and daily activities. In FactBoxes, you'd typically use it on list type pages to show reports related to selected records. A page can include more than one Power BI Report part.

The "Power BI Embedded Report Part" page exposes several methods for controlling when the **Power BI Report** part appears and the data it contains. The next sections include code examples of how to extend pages with the **Power BI Report** part. You can also read more in the [BCTech repo](https://github.com/microsoft/BCTech/tree/master/samples/PowerBi/MultipleReportsOnRoleCenter).

### Add a Power BI Report part

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

### Add a Power BI Report part that updates data based on selected record

With Power BI Report parts in FactBoxes of list and card pages, in many cases you want the report to update to display data that pertains to selected record on the page. You can implement this capability by using the `SetCurrentListSelection` method of page 6325 "Power BI Embedded Report Part". The method has the following signature:

```al
Page."Power BI Report FactBox Part".PAGE.SetCurrentListSelection(InputSelection: Variant)
```

The `InputSelection` variant specifies the table field that uniquely identifies records in the list page. This field should resolve to the primary key of the source table.

#### <a name="examples"></a>Example 1

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

### Add multiple Power BI Report parts

If you want to add more than one Power BI Report part to a page, where each part can display different reports, you have to assign each part a context keyword. There are two ways to assign a context keyword, depending on the page type. 

#### Use SubPageView property

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
{Al
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

#### Use SetPageContext method 

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

### Display same set of Power BI reports on different pages

Suppose you want set up **Power BI Report** parts on different pages, where the parts have the following behavior:

- They show the same report selected by the user on all pages. When the user switches to another report on one page, it switches on all pages.
- When a report is enabled or disabled in the **Power BI Report** part on one page, it's also enabled or disabled in the parts on other pages.

To configure this functionality, you give each **Power BI Report** part on the different pages the same context keyword. In other words, use the same values for the SubPageView property for the parts on all pages:

```al
SubPageView = where(Context = const('<context_keyword>'))
```

#### Example 2

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

## Pin a specific Power BI element to page part

The framework enables you to display a specific report, report visual, scorecard, dashboard, or dashboard tile, preventing users from switching to other elements or modifying visuals. For example, you can add a part that displays a single report visual, like the one shown in the following figure. Notice that the menu doesn't include the **Select reports**, **Next**, and **Previous** actions, which helps prevent users from accessing other reports:

:::image type="content" source="../developer/media/pwr-bi-part-report-visual.svg" alt-text="Shows the action menu on a Power BI report part.":::

To implement this scenario, you'll need to use some key objects, such as the **Power BI Displayed Element** and **Power BI Context Settings** tables. The **Power BI Displayed Element** table stores information about the elements that you want to display for users in specific contexts, while the **Power BI Context Settings** table persists the user settings for a specific Power BI context.

For a detailed code example that demonstrates how to pin a specific Power BI report to a page part in Business Central, go to [https://github.com/microsoft/BCTech/blob/master/samples/PowerBi/PBI23samples/AddCustomerCardLockedPart.PageExt.al](https://github.com/microsoft/BCTech/blob/master/samples/PowerBi/PBI23samples/AddCustomerCardLockedPart.PageExt.al). 



<!--
```al

pageextension 50127 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {
            // Add the Power BI Report FactBox page as the first part in FactBox
            part("Power BI Report FactBox"; "Power BI Embedded Report Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
                SubPageView = where(Context = const('LockedCustomerReport'));
            }
        }
    }

    trigger OnOpenPage()
    var
        PowerBIContextSettings: Record "Power BI Context Settings";
        PowerBIDisplayedElement: Record "Power BI Displayed Element";
    begin
        PowerBIContextSettings.SetRange(UserSID, UserSecurityId());
        if PowerBIContextSettings.IsEmpty() then
            exit; // User has not set up the Power BI integration

        if not PowerBIDisplayedElement.Get(UserSecurityId(), 'LockedCustomerReport', PowerBIDisplayedElement.MakeReportVisualKey('8c723e3b-0dbd-4757-8aee-b81daf5aec4c', 'ReportSection1', 'ab1fcfce118c0d14d565'), PowerBIDisplayedElement.ElementType::"Report Visual") then begin
            PowerBIDisplayedElement.Init();
            PowerBIDisplayedElement.ElementType := PowerBIDisplayedElement.ElementType::"Report Visual";
            PowerBIDisplayedElement.ElementId := PowerBIDisplayedElement.MakeReportVisualKey('8c723e3b-0dbd-4757-8aee-b81daf5aec4c', 'ReportSection1', 'ab1fcfce118c0d14d565');
            PowerBIDisplayedElement.ElementEmbedUrl := 'https://app.powerbi.com/reportEmbed?reportId=8c723e3b-0dbd-4757-8aee-b81daf5aec4c&config=eyJjbHVzdGVyVXJsIjoiaHR0cHM6Ly9XQUJJLVVTLVdFU1QyLXJlZGlyZWN0LmFuYWx5c2lzLndpbmRvd3MubmV0IiwiZW1iZWRGZWF0dXJlcyI6eyJ1c2FnZU1ldHJpY3NWTmV4dCI6dHJ1ZSwiZGlzYWJsZUFuZ3VsYXJKU0Jvb3RzdHJhcFJkbEVtYmVkIjp0cnVlfX0%3d';
            PowerBIDisplayedElement.Context := 'LockedCustomerReport'; // Use here the same context that you specified in the SubPageView of the part;
            PowerBIDisplayedElement.UserSID := UserSecurityId();
            PowerBIDisplayedElement.Insert();
        end;

        // Ensure that the controls to change report are disabled for this context.
        PowerBIContextSettings.CreateOrReadForCurrentUser('LockedCustomerReport'); // Use here the same context that you specified in the SubPageView of the part
        if not PowerBIContextSettings.LockToSelectedElement then begin
            PowerBIContextSettings.LockToSelectedElement := true;
            PowerBIContextSettings.Modify();
        end;

    end;
}

```
-->

## Open a Power BI element expanded in its own page 

From the Power BI Embedded Report Part, users can select the **Expand** action to open the report expanded in a separate page. You can provide a similar experience by using AL code to add an action on page that opens a specific element in the expanded mode. To achieve this, you use the **Power BI Displayed Element** and **Power BI Context Settings** tables, just like when pinning a specific element to a page part. However, instead of using the **Power BI Embedded Report Part**, you embed the element in the **Power BI Element Card** page.

For detailed code examples that demonstrate this scenario for all element types, go to [https://github.com/microsoft/BCTech/blob/master/samples/PowerBi/PBI23samples/PowerBi/PBI23samples/AddActionToOpenReportExpanded.PageExt.al](https://github.com/microsoft/BCTech/blob/master/samples/PowerBi/PBI23samples/PowerBi/PBI23samples/AddActionToOpenReportExpanded.PageExt.al). 

## Getting information about element types

To display a specific Power BI element, such as a report, visual, or dashboard, you need to obtain some information about the element. Here are some tips to help you get this information:

- For any element you want to display, you need its `embedUrl` and ID. You can get this information by using the Power BI REST API for the element and selecting **Try it**:

   - [Get reports](/rest/api/power-bi/reports/get-reports) - Typically, the embedURL has the format `https://app.powerbi.com/reportEmbed?reportId=<id>&config=<config>`. 
   - [Get dashboards](/rest/api/power-bi/dashboards/get-dashboards) - Typically, the embedURL has the format `https://app.powerbi.com/dashboardEmbed?dashboardId=<id>&config=<config`. 
   - [Get scorecards](/rest/api/power-bi/scorecards_(preview)/get)

- For report visuals, you also need the page name and the visual name.

   To get this information, open the report in Power BI. Hover over the visualization to reveal and select **More options** (...) > **Share** > **Link to visual** > **Copy**.  The link has the following format:
   
   `https://app.powerbi.com/groups/me/reports/<reportID>/<page_name>?ctid=<ctid>&pbi_source=shareVisual&visual=<visual_name>&height=nnnn&width=nnnn&bookmarkGuid=<guid>`

- For dashboard tiles, you also need the tile ID, which you can get with Power BI REST API.

   - [Get tiles](/rest/api/power-bi/dashboards/get-tiles) - You need to provide the dashboard ID to run the request.

## Limitations and behavior notes

- The `SubPageView` property for the Power BI parts only supports constant values, not filters.
- If you use both the `SubPageView` property and the `SetPageContext` method for specifying a context at the same time, the `SetPageContext` value overwrites the value specified in the `SubPageView` property.
- Dynamically changing the context (for example, by calling `SetPageContext` in the `OnAfterGetCurrRecord`) isn't recommended and could lead to unexpected results.
- Role center pages have no triggers, which means there's no way to call the `SetPageContext` method. As a consequence, any Power BI part in the role center would have the same context: the current user's profile/role.

## See also

[Get Started with AL](devenv-get-started.md)  
[Adding a FactBox to a Page](devenv-adding-a-factbox-to-page.md)  
[Pages Overview](devenv-pages-overview.md)  
[Publishing and Installing an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
[Extract data from Business Central](devenv-extract-data.md)   
