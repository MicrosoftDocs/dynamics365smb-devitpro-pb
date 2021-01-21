---
title: "Report Extemsopm Object"
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

With the report extension object, you can extend existing report objects, for example, by adding fields to the report dataset and modifying the report layout to reflect the new fields. Or, you can simply change the layout of an existing report by adding an extension object that provides a new layout.



> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters. 

## Snippet support

Typing the shortcut `treportext` will create the basic layout for a report extension object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.

[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Report extension example

The following example illustrates a table extension which adds a new field to the `Customer` table, `MyField`. The report extension `MyExtension` then adds `MyField` as well as an additional field in original `Customer` table to the **Customer - Top 10 List** report.

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
```

```al
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
}

```

## See Also

[Request Pages](devenv-request-pages.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
[Adding Help Links from Pages, Reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Page Extension Object](devenv-page-ext-object.md)  
[Page Properties](properties/devenv-page-property-overview.md)  
[Developing Extensions](devenv-dev-overview.md)  
[AL Development Environment](devenv-reference-overview.md)  