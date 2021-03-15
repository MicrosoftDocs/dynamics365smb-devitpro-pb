---
title: "Report Extension Object"
description: "Reports are used to print or display information from a database."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 01/20/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Report Extension Object

[!INCLUDE [2021_releasewave1](../includes/2021_releasewave1.md)]

With the report extension object, you can extend existing report objects, similar to how you extend tables and pages. With report extensions, you can extend an existing report by:

- Adding fields to the existing report dataset
- Adding new datasets
- Adding to request pages
- Modifying columns
- Modifying the report layout to reflect the new fields that are added with an extension
- Changing the layout of an existing report to add a custom report layout to the extension

For a report to be extended, the `Extensible` property must be set to `true`. This is the default value, which means that reports by default can be extended, unless they explicitly have the `Extensible` property set to `false`. For more information, see [Extensible Property](properties/devenv-extensible-property.md).

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

## Snippet support

Typing the shortcut `treportext` will create the basic layout for a report extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Report extension example

The following example illustrates a simplified table extension which adds a new field to the `Customer` table, `MyField`. The report extension `MyExtension` then adds `MyField` as well as an additional field in original `Customer` table to the **Customer - Top 10 List** report. For a more advanced example, see [Report Extension Example](devenv-report-ext-example.md).

> [!NOTE]  
> Inside the `dataset` element, syntax for modifying data is not supported, meaning that you cannot add new triggers to existing dataitems, nor can you modify existing dataitem or column properties.

> [!NOTE]  
> Inside the `requestpage` element, you cannot modify any properties.

> [!NOTE]  
> Using the `OnInitReport` trigger is not supported for report extensions.

```AL
tableextension 50110 CustomerTableExt extends Customer
{
    fields
    {
        field(50100; MyField; Integer)
        {
            DataClassification = ToBeClassified;

        }
    }
}

reportextension 50110 MyExtension extends "Customer - Top 10 List"
{
    dataset
    {
        add(Integer)
        {
            // add existing field from base table to dataset
            column(fromBaseTable; Customer.GLN) { }
            // add field from table extending Customer
            column(fromBaseTableExt; Customer.MyField) { }
        }
    }

    requestpage
    {
        layout
        {
            addafter(Show)
            {
                // add field from table extension to request page
                field(fromBaseTableExt; Customer.myField) { }
            }
        }
    }

    trigger OnPreReport()
    begin
    end;

    trigger OnPostReport()
    begin
    end;
}

```

## See Also

[Report Extension Example](devenv-report-ext-example.md)  
[Request Pages](devenv-request-pages.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Adding Help Links from Pages, Reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  