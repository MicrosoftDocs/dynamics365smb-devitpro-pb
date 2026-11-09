---
title: "Develop a Sales Rep Role Center for the Tablet Client"
description: "Build a sales representative's role center for the Business Central tablet client with existing page parts, quote actions, and profile setup."
ms.date: 04/01/2021
ms.topic: how-to
author: SusanneWindfeldPedersen
---

# Develop a sales rep role center for the tablet client

Create a sales representative role center for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] by combining existing page parts and actions. Use the [!INCLUDE[d365_dev_long](includes/d365_dev_long_md.md)] to develop the page, just as you would for other [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] clients. Check the parts against your target version and test the layout in the tablet client.

This example targets Business Central 2026 release wave 2, version 29. Verify the referenced pages and client requirements if you use another version.

## About this example
 This example illustrates the following tasks:

-   Creating a role center page
-   Adding existing pages to the role center
-   Adding role center actions that open existing pages
-   Testing the role center page

## Prerequisites
To complete this example, you need:

- Access to a [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] development environment with the Base Application and permissions to publish and install your extension. For an on-premises environment, meet its licensing requirements.
- Access to the web client. For an on-premises deployment, configure the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] before testing.
- A test company with sample customers, items, and sales data, such as a [!INCLUDE[demolong](includes/demolong_md.md)].
- A browser supported by your target version. Learn more about version 29 in [System requirements for Business Central 2026 release wave 2](../deployment/system-requirements-business-central-v29.md).

## Story
Simon is a partner developer working for CRONUS International Ltd. Nancy is a sales representative at Contoso Consulting. Nancy uses a tablet during customer visits and needs easy access to sales KPIs and frequently used customers. Nancy also creates sales quotes at customer sites. Simon wants to reuse existing page objects to build a tablet role center. The example displays activities and the current user's favorite customers. Filtering customers by visit status requires additional functionality.

The following code illustrates the parts and page-opening actions. It uses `Help And Chart Wrapper` in place of the historical `Generic Chart` page and opens new sales quotes in create mode.

```AL
namespace Contoso.Sales;

using Microsoft.Finance.FinancialReports;
using Microsoft.Inventory.Item;
using Microsoft.Sales.Customer;
using Microsoft.Sales.Document;
using System.Environment;

page 50106 "Sales Rep Role Center"
{
    PageType = RoleCenter;
    Caption = 'Sales Rep Role Center';

    layout
    {
        // Add already existing pages to help Nancy access activities, customers, and charts to the role center.
        area(RoleCenter)
        {
            part("O365 Activities"; "O365 Activities")
            {
                ApplicationArea = All;
            }

            part("My Customers"; "My Customers")
            {
                ApplicationArea = All;
            }

            part("Generic Chart"; "Help And Chart Wrapper")
            {
                ApplicationArea = All;
            }

            part("Trial Balance"; "Trial Balance")
            {
                ApplicationArea = All;
            }
        }
    }

    // Add actions that link to other pages, which Nancy uses in their daily work on the tablet.
    actions
    {
        area(Creation)
        {
            action("Sales Quote")
            {
                ApplicationArea = All;
                Caption = 'New';
                RunObject = Page "Sales Quote";
                RunPageMode = Create;
                Image = Quote;
                ToolTip = 'Create a new sales quote.';
            }

            action("Customer List")
            {
                ApplicationArea = All;
                Caption = 'Customers';
                RunObject = Page "Customer List";
                ToolTip = 'Open the customer list.';
            }

            action("Item List")
            {
                ApplicationArea = All;
                Caption = 'Items';
                RunObject = Page "Item List";
                ToolTip = 'Open the item list.';
            }
        }
    }
}
```

Learn more about role center structure and design in [Designing role centers](devenv-designing-role-centers.md).

Build the extension, then publish and install it in your development environment. The testing user needs permission to open its pages and access the underlying data.

For an on-premises environment, open page `50106` with your configured web client URL. For example:

```text
https://<WebClientHost>:<Port>/<WebServerInstance>/Tablet?page=50106
```

Replace the host, port, and instance path with your environment's values. Legacy `tablet.aspx` URLs redirect to the tablet route. Learn more in [Opening the Business Central tablet or phone client from a browser](devenv-Opening-Business-Central-Tablet-or-Phone-Client-from-Browser.md).

## Next steps
The preview brings together activities, favorite customers, financial information, and page-opening actions. To make this Nancy's normal workspace, associate the role center with a profile, select that profile for Nancy, and verify Nancy's permissions. Learn more in [Designing profiles](devenv-design-profiles.md).

Simon can then add more list links and test the desktop layout so that Nancy can also use the role center back at the office.

## Related information
[Designing for different screen sizes on tablet and phone](devenv-Designing-Different-Screen-Sizes-Tablet-and-Phone.md)  
[Differences and limitations when developing pages for the Business Central mobile app](devenv-Differences-and-Limitations-Developing-Pages-business-central-Mobile-App.md)  
[Designing role centers](devenv-designing-role-centers.md)  
[Role center behaviors](devenv-role-center-behaviors.md)  
