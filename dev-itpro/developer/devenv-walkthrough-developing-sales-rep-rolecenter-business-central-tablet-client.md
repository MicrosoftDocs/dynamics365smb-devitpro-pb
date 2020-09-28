---
title: "Example: Developing a Sales Rep Role Center for the Business Central Tablet Client"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
# Example: Developing a Sales Rep Role Center for the Business Central Tablet Client
In this example, you will learn how to create a new Role Center for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)]. Developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] occurs in the [!INCLUDE[d365_dev_long](includes/d365_dev_long_md.md)] and is not much different from developing for one of the other [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] clients. This example will concentrate on how to build a Role Center for a sales representative, which links to already existing page objects, but combined in a way so that it works well on the tablet.  

## About this example 
 This example illustrates the following tasks:  

-   Creating a Role Center page  
-   Adding existing pages to the Role Center
-   Adding actions to pages from the Role Center
-   Testing the Role Center page

## Prerequisites  
 To complete this example, you will need:  

-   [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] installed with a developer license  
-   [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]  
-   [!INCLUDE[demolong](includes/demolong_md.md)]  
-   A supported browser. For more information, see [System Requirements for Dynamics 365 Business Central 2020 Release Wave 1](../deployment/system-requirement-business-central-v16.md)  

## Story  
Simon is a partner developer working for CRONUS International Ltd. Nancy is a Sales Representative at Contoso Consulting. Simon has to build a new Role Center to support Nancy in her job. When at work, Nancy spends part of her time on the road with only her tablet available on customer visits. Nancy needs access to KPIs on the front page. She needs easy access to filter for the customers who she will visit. When at the customer site, she creates sales quotes. Simon wants to build a Role Center that can be used on a tablet and he wants to reuse as much code and as many page objects as possible.  

The following code illustrates how Simon implements the Role Center.

```
page 50106 "Sales Rep Role Center"
{
    PageType = RoleCenter;

    layout
    {
        // Add already existing pages to help Nancy access activities, customers, and charts to the Role Center.
        area(RoleCenter)
        {
            part("O365 Activities"; "O365 Activities")
            {
            }

            part("My Customers"; "My Customers")
            {
            }

            part("Generic Chart"; "Generic Chart")
            {
            }

            part("Trial Balance"; "Trial Balance")
            {
            }
        }
    }

    // Add actions that link to other pages, which Nancy uses in her daily work on the tablet.
    actions
    {
        area(Creation)
        {
            action("Sales Quote")
            {
                Caption = 'New';
                RunObject = Page "Sales Quote";
                Image = Quote;
                Promoted = true;
            }

            action("Customer List")
            {
                Caption = 'Customers';
                RunObject = Page "Customer List";
                Promoted = true;
                //  Sales Quote as an action item available from the action pane in the New group
                PromotedCategory = New;
            }

            action("Item List")
            {
                Caption = 'Items';
                RunObject = Page "Item List";
                Promoted = true;
                PromotedCategory = New;
            }
        }
    }
}
```  

For more information about the specifics of Role Center structure and design, see [Designing Role Centers](devenv-designing-role-centers.md).

Simon now wants to test the Sales Rep Role Center that he created, and for testing purposes he uses a browser window. He enters a URL that specifically opens the page 50006 from tablet.aspx. His URL now resembles this: *https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet.aspx?page=50006*. For more information, see [Opening the Business Central Tablet or Phone Client from a Browser](devenv-Opening-Business-Central-Tablet-or-Phone-Client-from-Browser.md).  

## Next steps  
Nancy now has a Role Center that gives her access to most of the information that she needs when she is on the road. The next step for Simon is to refine the Sales Rep Role Center by adding more functionality, for example, the ability to retrieve more lists or making sure that Nancy can smoothly continue to work when she is back at the office on her desktop computer.  

## See Also  
 [Designing for Different Screen Sizes on Tablet and Phone](devenv-Designing-Different-Screen-Sizes-Tablet-and-Phone.md)   
 [Differences and Limitations When Developing Pages for the Business Central Mobile App](devenv-Differences-and-Limitations-Developing-Pages-business-central-Mobile-App.md)   
 [Designing Role Centers](devenv-designing-role-centers.md)  
 [Role Center Behaviors](devenv-role-center-behaviors.md)   
