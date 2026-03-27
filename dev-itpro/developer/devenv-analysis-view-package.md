---
title: Export and package analysis views
description: Learn how to export analysis views from Analysis Mode and package them as part of AL extensions in Business Central.
author: SusanneWindfeldPedersen
ms.date: 02/27/2026
ms.topic: how-to
ms.author: solsen
ms.reviewer: solsen
---

# Export and package analysis views

[!INCLUDE [2026-releasewave1-later](../includes/2026-releasewave1-later.md)]

[!INCLUDE [prod_short](includes/prod_short.md)] allows you to export analysis views that are created in Analysis Mode for list and worksheet pages, package them, and deliver them as part of your AL extensions. This article describes how to export a view definition, add it to your AL project, and define it on a page, page extension, or page customization.

The end-to-end process for delivering analysis views with your extension is:

1. [Design and export](#export-an-analysis-view-definition) the analysis view definition from the client.
2. Add the exported JSON file to your AL extension project.
3. [Reference the file](#define-analysis-views-on-pages) from a `page`, `pageextension`, or `pagecustomization` object using the `analysisviews` construct.
4. Compile and publish the extension.

Learn more about *using* the analysis view in [Analysis views](/dynamics365/business-central/analysis-mode).

## Export an analysis view definition

Analysis Mode in the [!INCLUDE [prod_short](includes/prod_short.md)] client acts as the editor for designing analysis views; you use it to define columns, grouping, filtering, and other data layout settings. Once you have the view you want, you can export it by following these steps:

1. Open the list or worksheet page with the analysis view that you want to export.
2. Enter **Analysis Mode**.
3. On the analysis view tab, open the tab menu and choose **Export Definition**.

This action downloads a JSON file that contains the serialized definition of the analysis view. Add this file to your AL extension project. 

> [!TIP]
> Avoid using data filters (filters on specific data values) in analysis views that you package in extensions. The data values you filter on, such as specific customer numbers or posting groups, might not exist on the environment or company where the extension is installed. Instead, limit the view definition to column layout, grouping, and aggregation settings.

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
            DefinitionFile = 'BasePage/Base.analysis.json';
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

## Handle table structure changes

An analysis view definition references columns from the underlying page source table. If the table structure changes after the analysis view is exported, for example, if a field is removed, renamed, or has its type changed, the affected columns are ignored at runtime. The analysis view still loads, but any columns that no longer match a field on the page are silently dropped from the view.

To avoid broken or incomplete views, update and re-export the analysis view definition whenever you make changes to the source table or page layout that affect the columns used in the view.

## Packaged analysis views in Analysis Mode

When a user installs an app that includes analysis views, the views appear as tabs when the user enters Analysis Mode. Packaged analysis views are visually distinguished from user-defined views by a **Locked** icon on the tab. This icon signals that the view is read-only: sorting, filtering, grouping, and other data manipulation is blocked on the view. To do further data analysis based on a packaged view, users can create a copy of it and modify the copy freely.

Unlike user-defined analysis views, packaged views:

- Can't be deleted or moved by the user.
- Are consistent across users—every user who has the extension installed sees the same set of packaged views.
- Survive user personalization resets, because they're defined in AL code rather than stored as user data.

Packaged analysis views can't be deleted or moved. However, you can hide and unhide them by using:

- [Designer](devenv-inclient-designer.md), which applies to all users
- [Personalization](/dynamics365/business-central/ui-personalization-user), for the current user
- [Page customizations for profiles](devenv-page-customization-object.md), for a specific role

You can also rename the tab and change its description through the tab menu by choosing **Rename**.

## Related information

[Analysis views](/dynamics365/business-central/analysis-mode)  
[Pages overview](devenv-pages-overview.md)  
[Page extension object](devenv-page-ext-object.md)  
[Page customization object](devenv-page-customization-object.md)  
[Profile object](devenv-profile-object.md)  
[Developing extensions in AL](devenv-dev-overview.md)