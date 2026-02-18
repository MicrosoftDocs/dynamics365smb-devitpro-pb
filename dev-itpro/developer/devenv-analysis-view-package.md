---
title: Export and package analysis views
description: Learn how to export analysis views from Analysis Mode and package them as part of AL extensions in Business Central.
author: SusanneWindfeldPedersen
ms.date: 02/18/2026
ms.topic: how-to
ms.author: solsen
ms.reviewer: solsen
---

# Export and package analysis views

[!INCLUDE [prod_short](includes/prod_short.md)] allows you to export analysis views that are created in Analysis Mode for list and worksheet pages, package them, and deliver them as part of your AL extensions. This article describes how to export a view definition, add it to your AL project, and define it on a page, page extension, or page customization.

## Export an analysis view definition

To export an analysis view, follow these steps:

1. Open the list or worksheet page with the analysis view you want to export.
2. Enter Analysis Mode.
3. On the analysis view tab, open the tab menu and choose **Export Definition**.

This action downloads a JSON file that contains the serialized definition of the analysis view. Add this file to your AL extension project.

## Define analysis views on pages

Use the `analysisviews` construct on a page object to add analysis views. Point each view to its exported definition file by using the `DefinitionFile` property.

The following example shows how to define an analysis view on a list page:

```al
page 50100 ListPageWithAnalysisView
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Customer;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Description"; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    analysisviews
    {
        analysisview(MyAnalysisView)
        {
            Caption = 'Customer Analysis View';
            Tooltip = 'My Analysis View description';
            DefinitionFile = 'BasePage\Base.analysis.json';
        }
    }
}
```

## Define analysis views in page extensions

You can also add analysis views through page extension objects. Use the `addlast` keyword to add a new view, or the `modify` keyword to change properties on an existing view.

The following example adds a new analysis view and hides an existing one:

```al
pageextension 50101 MyExtension extends "Sales Order List"
{
    analysisviews
    {
        addlast
        {
            analysisview(SalesAnalysisView)
            {
                Caption = 'Sales Order Analysis';
                DefinitionFile = 'PageExt/SalesOrderExt.analysis.json';
            }
        }

        modify(MyAnalysisView)
        {
            Visible = false;
        }
    }
}
```

## Define analysis views in page customizations

You can add analysis views through page customizations to target specific profiles. This approach lets you provide analysis views that are relevant for specific roles.

The following example defines an analysis view in a page customization and assigns it to a profile through a profile extension:

```al
pagecustomization MyCust customizes "Sales Order List"
{
    analysisviews
    {
        addlast
        {
            analysisview(SalesAnalysisView)
            {
                Caption = 'Sales Order Analysis';
                DefinitionFile = 'PageExt/SalesOrderExt.analysis.json';
            }
        }
    }
}

profileextension MyProfileExt extends "ORDER PROCESSOR"
{
    Customizations = MyCust;
}
```

## Packaged analysis views in Analysis Mode

When a user installs an app that includes analysis views, the views appear when the user enters Analysis Mode. Packaged analysis views are indicated by a **Locked** icon, which means that sorting, filtering, grouping, and other data manipulation is blocked on the view. To do further data analysis based on a packaged view, users can create a copy of it and modify the copy freely.

<!-- TODO: Add screenshot of locked analysis view -->

Packaged analysis views can't be deleted or moved. However, you can hide and unhide them by using:

- [Designer](devenv-inclient-designer.md) (applies to all users)
- [Personalization](/dynamics365/business-central/ui-personalization-user) (applies to the current user)
- [Page customizations for profiles](devenv-page-customization-object.md) (applies to a specific role)

You can also rename the tab and change its description through the tab menu by choosing **Rename**.

<!-- TODO: Add screenshot of Designer with analysis view -->

## Related information

[Pages overview](devenv-pages-overview.md)  
[Page extension object](devenv-page-ext-object.md)  
[Page customization object](devenv-page-customization-object.md)  
[Profile object](devenv-profile-object.md)  
[Developing extensions in AL](devenv-dev-overview.md)