---
title: Simple Role Center Code Example in AL
description: Build a simple Business Central role center in AL with headline and cue parts, navigation actions, and a profile that references the page.
author: SusanneWindfeldPedersen
ms.date: 11/05/2026
ms.reviewer: jswymer
ms.topic: how-to
ms.author: solsen
---

# Simple role center code example

The AL code in this article creates a simple role center for users assigned to a new profile. Defining the profile doesn't assign users or grant data permissions.

:::image type="content" source="media/sample-role-center.png" alt-text="Role center page showing a headline, an Invoices cue tile group, and navigation actions." lightbox="media/sample-role-center.png":::

Learn more about role centers in [Designing role centers](devenv-designing-role-centers.md).

This example uses the `RoleCenterHeadline` page from [Creating a role center headline](devenv-create-role-center-headline.md) and the `SalesInvoiceCuePage` page from [Creating cues and action tiles](devenv-cues-action-tiles.md). Add those objects to the same project. Verify the user's permissions before deploying.

The sales-document entity actions target integration pages. Their navigation behavior needs to suit your users' workflow.

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
                    ApplicationArea = All;
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
                ApplicationArea = All;
                Caption = 'See Sales Invoices';
                RunObject = Page "Posted Sales Invoices";
                ToolTip = 'Open the posted sales invoice list.';
            }

        }

        area(Creation)
        {
            action(AddSalesInvoice)
            {
                ApplicationArea = All;
                Caption = 'Add Sales Invoice';
                Image = NewInvoice;
                RunObject = Page "Sales Invoice";
                RunPageMode = Create;
                ToolTip = 'Create a new sales invoice.';
            }
        }

        area(Reporting)
        {
            action(SalesInvoicesReport)
            {
                ApplicationArea = All;
                Caption = 'Sales Invoices Report';
                Image = "Report";
                RunObject = Report "Standard Sales - Invoice";
                ToolTip = 'Run the sales invoice report.';
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
[Add pages and reports to Tell Me](devenv-al-menusuite-functionality.md)  
[Personalize your workspace](/dynamics365/business-central/ui-personalization-user)  
[Use Designer](devenv-inclient-designer.md)  
