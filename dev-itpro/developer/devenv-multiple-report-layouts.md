---
title: "Defining Multiple Report Layouts"
description: "Describes how to define multiple layouts for one report in Business Central using AL."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 02/10/2022
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Defining Multiple Report Layouts

In AL you have the option of defining multiple layouts for one report in code. This means that you can offer multiple versions of a layout for different purposes. Defining multiple layouts applies to both report objects, and report extension objects. The layouts can be of different types, meaning that you can have, for example, a Word layout and an Excel layout for one report, or multiple Excel layouts for one report. This enables creating report extensions that only add layouts to an existing report and packaging it as an extension .al file.

Read more about enabling multiple report layouts and implementing rendering differentiation in extensions, see [Enabling the Microsoft Word rendering engine](devenv-howto-report-layout.md#enabling-the-microsoft-word-rendering-engine).

## Enabling multiple layouts

To enable multiple layouts, you must use the `rendering` section of a report object. Inside the `rendering` section, you define one or more `layout` sections. In each of the `layout` sections, you specify details about the layout file path and name, you provide a [Caption Property](properties/devenv-caption-property.md) and a [Summary Property](properties/devenv-summary-property.md) which will be displayed to the user in the **Report Layouts** page in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. 

The default layout can be specified with the [DefaultRenderingLayout Property](properties/devenv-defaultrenderinglayout-property.md) report property. This property *cannot* be set on report extension objects, only on report objects.

> [!NOTE]  
> If you do not specify a caption, the layout name will be displayed to the user. 

If the extension is translated, the `Caption` and `Summary` properties are included in the .xliff file and translated as well. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).

> [!TIP]  
> Reports using the previous property-based layout specification can be converted to use the `rendering` section by using a code action. To use this, ensure code that actions are switched on in your AL extension settings and place the cursor on any of the old layout properties to use the action. Layouts of type RDLC, Word, Excel, and Custom can be specified with the new rendering syntax. For more information, see [AL Language Extension Configuration](devenv-al-extension-configuration.md).

## Layout definition in AL

The following example illustrates how the `EmpReportExt` report extends the `"Employee - List"` list by adding four report layouts as options for printing this report. The report extension only adds the layouts, the dataset remains the same as the existing Employee List report.

```al
reportextension 50102 EmpReportExt extends "Employee - List"
{
    rendering
    {
        layout(LayoutExcelPivot)
        {

            Type = Excel;
            Caption = 'ExcelPivot';
            Summary = 'Employee list shown in Pivot table in Excel';
            LayoutFile = 'EmpShownAsPivot.xlsx';
        }

        layout(LayoutExcel)
        {
            Type = Excel;
            Caption = 'ExcelColumns';
            Summary = 'Employee list sorted by last name in Excel';
            LayoutFile = 'EmpSortedByLastName.xlsx';
        }

        layout(LayoutWord)
        {
            Type = Word;
            Caption = 'WordList';
            Summary = 'Employee list sorted by last name in Word';
            LayoutFile = 'EmpSortedByLastName.docx';
        }
    }
}
```

If one or more of the layouts do not exist, they will be generated when pressing **Ctrl+Shift+P**, and then choosing **AL: Package**. The layouts will appear in your project in the right pane of Visual Studio Code. The generated reports contain the dataset from the report, and you can modify and model the reports in each of the layout types as you want.

Creating layouts in Excel, RDL, or Word is further described in the topics shown under [See also](devenv-multiple-report-layouts.md#see-also).

## See also

[Creating an Excel Layout Report](devenv-howto-excel-report-layout.md)  
[Creating an RDL Layout Report](devenv-howto-rdl-report-layout.md)  
[Creating a Word Layout Report](devenv-howto-report-layout.md)  
