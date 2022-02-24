---
title: "Defining multiple report layouts"
description: "Describes how to define multiple layouts for one report in Business Central using AL."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/10/2022
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Defining multiple report layouts

In AL you have the option of defining multiple layouts for one report in code. This means that you can offer multiple versions of a layout for different purposes. It applies to both report objects, and report extension objects. The layouts can be of different types, meaning that you can have, for example, a Word layout and an Excel layout for one report, or multiple Excel layouts for one report.

## Enabling multiple layouts

To enable multiple layouts, you must use the `rendering` section of a report object. Inside the `rendering` section, you define one or more `layout` sections. In each of the `layout` sections, you specify details about the layout file path and name, you provide a [Caption Property](properties/devenv-caption-property.md) and a [Summary Property](properties/devenv-summary-property.md) <!--new --> which will be displayed to the user in the **Report Layout Selection** page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. If you do not specify a caption, the layout name will be displayed to the user. If the extensions is translated, these properties will be included in the .xliff file and translated as well. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).

## Layout definition in AL

The following example illustrates how the `EmpReportExt` report extends the `"Employee - Phone Nos."` list by adding three report layouts as options for printing this report. The report extension only adds the layouts, the dataset is the same as the existing report, which gives the possibility to package report layouts as extensions.

```al
reportextension 50102 EmpReportExt extends "Employee - Phone Nos."
{
    rendering
    {
        layout(LayoutExcel)
        {

            Type = Excel;
            Summary = 'Employee list sorted by last name in Excel';
            LayoutFile = 'EmpSortedByLastName.xlsx';
        }

        layout(LayoutExcelPivot)
        {
            Type = Excel;
            Summary = 'Employee list shown in Pivot table in Excel';
            LayoutFile = 'EmpShownAsPivot.xlsx';
        }

        layout(LayoutWord)
        {
            Type = Word;
            Summary = 'Employee list sorted by last name in Word';
            LayoutFile = 'EmpSortedByLastName.docx';
        }

    }
}
```

## See also

[Creating an Excel Layout Report](devenv-howto-excel-layout.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)
