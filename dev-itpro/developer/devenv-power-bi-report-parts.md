---
title: "Adding Power BI Report Parts to Pages"
description: Explains how to add a page on a page that displays Power BI reports
ms.custom: na
ms.date: 05/12/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.search.keywords: Power BI, reports, faq, errors
author: jswymer
---
# Adding Power BI Report Parts to Pages

[!INCLUDE [prod_short](includes/prod_short.md)] integrates with Microsoft Power BI, enabling users to create Power BI reports based on Business Central data. Users can view the reports from their Power BI workspaces, but also from the Business Central client. For an overview about Power BI integration, see [Business Central and Power BI](/dynamics365/business-central/admin-powerbi).

Displaying a Power BI report in a Business Central page requires the page includes a **Power BI Report** part. This part makes the connection to the Power BI Service, and lets users choose which report to display. Business Central comes equipped with several pages that already include the **Power BI Report** part. For a list of these pages, see [Power BI FAQ](/dynamics365/business-central/power-bi-faq?tabs=designer#which-pages-in-business-central-have-the-power-bi-report-part).

## Power BI Report part framework 

The Business Central base application has many objects that provide the framework for Power BI integration. You'll find these objects in the **Applications\BaseApp\Source\Base Application.Source.zip\Power BI framework** folder of the installation media (DVD). But specifically, there are two page objects that you use to display the **Power BI Report** part on other pages:

|Page|Usage|
|----|-----------|
|6306 "Power BI Report FactBox" |This page is designed for use in FactBoxes. You typically use it on list type pages to show reports related to selected records.|
|6303 "Power BI Report Spinner Part"|This page is designed for use in role centers, to display reports related to the user's role and daily activities.|

These objects expose methods for controlling when the **Power BI Report** part appears and the data it contains. The next sections include code examples of how to extend pages with the **Power BI Report** part.

## Add the Power BI Report part to a FactBox

The **Power BI Report** part in a FactBox is intended for list pages to display reports that are related to records. You then design reports so that data updates as users select different records in the list. The Business Central base application comes ready with a **Power BI Report** part on many key list pages.

You add a **Power BI Report** part to a page's FactBox area like other parts, either in a page object or page extension object. Except you set the part control to page 6306 "Power BI Report FactBox". After you've added the part, you add code to control the behavior using the available methods. Page 6306 "Power BI Report FactBox" includes two main methods for setting up a Power BI Report part in a FactBox: `InitFactBox` and `SetCurrentListSelection`.

> [!NOTE]
> For information about how to create reports that display data for records in a list, see [Creating Power BI Reports for Displaying List Data](/dynamics365/business-central/across-how-use-powerbi-reports-factbox).

### InitFactBox method

`InitFactBox` initializes and loads the part in the FactBox, making it visible only if the user has a valid Power BI license. The method has the following signature:

```al
Page."Power BI Report FactBox Part".PAGE.InitFactBox(PageId: Text[30], PageCaption: Text, var PowerBIVisible: Boolean)
```

|Parameter|Description|
|---------|-----------|
|PageId|Specifies a context identifier for the part in the FactBox. This parameter is primarily used for displaying multiple Power BI Report parts in the same page. Or to display the same set of Power BI Report reports on different pages. In other cases, like when there's only one part, the `PageId` isn't so important. In these cases, it's common to set the `PageId` to the ID of the page that displays the FactBox, for example, by using `CurrPage.ObjectId(false)`.<br><br> For more information, see the [examples](#examples) in this article.|
|PageCaption|Specifies the value of the text filter that's applied to the **Power BI Report Selection** page of the **Power BI Report** part. This parameter is typically set to the caption of list page that contains the FactBox, for example, by setting the parameter to `CurrPage.Caption`. By default, users can only select from reports whose name includes the `PageCaption`; unless they clear the filter on **Power BI Report Selection** page. 
|PowerBIVisible|Specifies whether the Power BI Report part should be shown.|

### SetCurrentListSelection method

The `SetCurrentListSelection` method updates the report to display data for the record that's selected in the main page, based on the source table's primary key. The method has the following signature:

```al
Page."Power BI Report FactBox Part".PAGE.SetCurrentListSelection(CurrentSelection: Text, IsValueIntInput: Boolean, PowerBIVisible: Boolean)
```

|Parameter|Description|
|---------|-----------|
|CurrentSelection|Specifies the table field that uniquely identifies records in the list page. This field is the primary key of the source table, like `No.`. The parameter is used to update the Power BI report with the data that pertains to the record selected in the list page.|
|IsValueIntInput|Specifies whether the value in `CurrentSelection` is an integer type. The `CurrentSelection` value will be used to filter the Power BI report, and integer filters need special handling.|
|PowerBIVisible|Specifies whether the Power BI Report part should be shown.|

### <a name="examples"></a>Example - Add Power BI part to a FactBox

The following example adds the **Power BI Report** part to the **Sales Invoice List** page using a page extension object.

The **Power BI Report FactBox** page applies a filter on the **Power BI Report Selection** page to list only reports that contain the caption of the page. In this case, the caption is **Sales Invoices**.  If users want to, they can clear this filter, so they can select from all reports in their Power BI workspace.

The `SetCurrentListSelection` method updates the report to display data for the record that's selected in the **Sales Invoice List** page, based on the primary key `No.`.

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {
            // Add the Power BI Report FactBox page as the first part in the FactBox area on the Sales Invoice List page                  
            part("Power BI Report FactBox"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
        }
    }

    trigger OnOpenPage()
    begin
        // Initializes the part and make it visible only if the user has a Power BI license
        // Applies a filter on the part to display reports that include the caption of the page, in this case "sales invoices".
        CurrPage."Power BI Report FactBox".PAGE.InitFactBox(CurrPage.ObjectId(false), CurrPage.Caption, PowerBIVisible);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        PowerBIVisible := true;
        // Gets data from Power BI to display data for the selected record in the list based on the primary key, in this case the "No." field.
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection("No.", false, PowerBIVisible);
    end;

    var
        PowerBIVisible: Boolean;
}
```

### Example - Add multiple Power BI Report parts to same FactBox

This example shows how to add two **Power BI Report** parts to a FactBox, so users can show different Power BI reports simultaneously. The example modifies the code in the previous example for the **Sales Invoice List** page. It adds the two **Power BI Report** parts by calling the `InitFactBox` method with the `PageId` parameter set to different values for each part, like:

```al
CurrPage."Power BI Report FactBox 1".PAGE.InitFactBox('First', CurrPage.Caption, PowerBIVisible); 
CurrPage.""Power BI Report FactBox 2".PAGE.InitFactBox('Second', CurrPage.Caption, PowerBIVisible);
```

Here's the full example: 

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {   
            part("Power BI Report FactBox - First"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
            part("Power BI Report FactBox - Second"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
        }
    }

    trigger OnOpenPage()
    begin
        CurrPage."Power BI Report FactBox".PAGE.InitFactBox('First', CurrPage.Caption, PowerBIVisible);
        CurrPage."Power BI Report FactBox".PAGE.InitFactBox('Second', CurrPage.Caption, PowerBIVisible);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        PowerBIVisible := true;
        CurrPage."Power BI Report FactBox - First".PAGE.SetCurrentListSelection("No.", false, PowerBIVisible);
        CurrPage."Power BI Report FactBox - Second".PAGE.SetCurrentListSelection("No.", false, PowerBIVisible);
    end;

    var
        PowerBIVisible: Boolean;
}
```

#### Example - Display same set of Power BI reports on different pages

This example explains how to set up **Power BI Report** parts on different pages, where the parts have the following behavior:

- They show the same reports for selection by the user.
- When a report is enabled or disabled in the **Power BI Report** part on one page, it's also enabled or disabled in the parts on other pages.

To configure this functionality, you give each **Power BI Report** part on the different pages the same context identifier. In other words, use the same `PageId` in the `InitFactBox` method calls that add the **Power BI Report** parts. For example, suppose you want to display the same reports on the **Sales Invoices** page and **Sales Orders** page. In this case, you could use the following line of code in both the **Sales Invoices** and **Sales Orders** pages, where `Sales` is the common context identifier:

```al
CurrPage."Power BI Report FactBox".PAGE.InitFactBox('Sales', CurrPage.Caption, PowerBIVisible);
```

Here's the full example:

```al
pageextension 50100 SalesInvoicesListPwrBiExt extends "Sales Invoice List"
{
    layout
    {
        addfirst(factboxes)
        {         
            part("Power BI Report FactBox"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
        }
    }

    trigger OnOpenPage()
    begin
        CurrPage."Power BI Report FactBox".PAGE.InitFactBox('Sales', CurrPage.Caption, PowerBIVisible);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        PowerBIVisible := true;
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection("No.", false, PowerBIVisible);
    end;

    var
        PowerBIVisible: Boolean;
}

pageextension 50102 SalesOrdersPwrBiExt extends "Sales Orders"
{
    layout
    {
        addfirst(factboxes)
        {         
            part("Power BI Report FactBox"; "Power BI Report FactBox")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
        }
    }

    trigger OnOpenPage()
    begin
        CurrPage."Power BI Report FactBox".PAGE.InitFactBox('Sales', CurrPage.Caption, PowerBIVisible);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        PowerBIVisible := true;
        CurrPage."Power BI Report FactBox".PAGE.SetCurrentListSelection("No.", false, PowerBIVisible);
    end;

    var
        PowerBIVisible: Boolean;
}
```

## Add the Power BI Report part to a role center

The following example adds the **Power BI Report** part to the **Team Member Role Center**:

```al
pageextension 50101 TeamMemberRCPwrBiExt extends "Team Member Role Center"
{
    layout
    {
        addfirst(rolecenter)
        {
            // Add the Power BI Report part on the role center page   
            part("Power BI Report Spinner Part"; "Power BI Report Spinner Part")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Power BI Reports';
            }
        }
    }
}
```

## See Also

[Getting Started with AL](devenv-get-started.md)  
[Adding a FactBox to a Page](devenv-adding-a-factbox-to-page.md)  
[Pages Overview](devenv-pages-overview.md)  
[Publishing and Installing an Extension](devenv-how-publish-and-install-an-extension-v2.md)  
