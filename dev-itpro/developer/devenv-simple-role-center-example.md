---
title: Simple Role Center Code Example in AL
description: Learn from a complete AL code example that builds a simple Role Center page and a profile that assigns the Role Center to users in Business Central.
author: SusanneWindfeldPedersen
ms.date: 08/24/2026
ms.reviewer: jswymer
ms.topic: concept-article
ms.author: solsen
---

# Simple Role Center code example

The AL code in this article creates a simple Role Center customized for users assigned to a new profile. 

:::image type="content" source="media/sample-role-center.png" alt-text="Role Center page showing a headline, an Invoices cue tile group, and navigation actions." lightbox="media/sample-role-center.png":::

Learn more about Role Centers in [Designing Role Centers](devenv-designing-role-centers.md).

This example uses the **RoleCenterHeadline** page from [Creating a Role Center headline](devenv-create-role-center-headline.md) to display the headline, and the **SalesInvoiceCuePage** page from [Creating cues and action tiles](devenv-cues-action-tiles.md) for the cue and action tile.

```al
page 50125 MyRoleCenter
{
    PageType = RoleCenter;
    Caption = 'My Role Center';

    layout
    {
        area(RoleCenter)
        {
            group(Group1)
            {
                part(Part1; RoleCenterHeadline)
                {
                    ApplicationArea = All;
                }

                part(Part2; SalesInvoiceCuePage)
                {
                    Caption = 'Invoices';
                }
            }
        }
    }


    actions
    {
        area(Sections)
        {
            group(PostedInvoices)
            {
                Caption = 'Posted Invoices';
                Image = RegisteredDocs;
                action(PostedServiceInvoices)
                {
                    Caption = 'Posted Service Invoices';
                    RunObject = Page "Posted Service Invoices";
                    ApplicationArea = All;
                }

                action(PostedSalesInvoices)
                {
                    Caption = 'Posted Sales Invoices';
                    RunObject = Page "Posted Sales Invoices";
                    ApplicationArea = All;
                }

                group(SalesDocuments)
                {
                    Caption = 'Sales Documents';
                    action("Sales Document Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Entity";
                    }
                    action("Sales Document Line Entity")
                    {
                        ApplicationArea = All;
                        RunObject = page "Sales Document Line Entity";
                    }
                }
            }
        }

        area(Embedding)
        {

            action(Sales)
            {
                Caption = 'Sales lists';
                RunObject = Page "Sales list";
                ApplicationArea = All;
            }

            action(Services)
            {
                Caption = 'Service lists';
                RunObject = Page "Service list";
                ApplicationArea = All;

            }


        }

        area(Processing)
        {
            action(SeeSalesInvoices)
            {
                Caption = 'See Sales Invoices';
                RunObject = Page "Posted Sales Invoices";
            }

        }

        area(Creation)
        {
            action(AddSalesInvoice)
            {
                Caption = 'Add Sales Invoice';
                Image = NewInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
            }
        }

        area(Reporting)
        {
            action(SalesInvoicesReport)
            {
                Caption = 'Sales Invoices Report';
                Image = "Report";
                RunObject = Report "Standard Sales - Invoice";
            }
        }
    }
}

// Creates a profile that uses the Role Center
profile MyProfile
{
    ProfileDescription = 'Sample Profile';
    RoleCenter = MyRoleCenter;
    Caption = 'My profile';
}
```

## Related information

[AL development environment](devenv-reference-overview.md)  
[Page extension object](devenv-page-ext-object.md)  
[Actions overview](devenv-actions-overview.md)  
[Add pages and reports to Tell me](devenv-al-menusuite-functionality.md)  
[Personalize your workspace](/dynamics365/business-central/ui-personalization-user)  
[Use Designer](devenv-inclient-designer.md) 
