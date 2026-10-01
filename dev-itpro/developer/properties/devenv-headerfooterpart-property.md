---
title: HeaderFooterPart Property for Report Layouts
description: Learn how the HeaderFooterPart property sets the header and footer part that a Body Word report layout uses when Business Central renders the report.
ms.author: solsen
ms.date: 09/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# HeaderFooterPart Property
> **Version**: _Available or changed with runtime version 18.0._

Sets the layout with the HeaderFooter subtype that should be used by this Body layout.

## Applies to
-   Report Layout

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

[!INCLUDE [2026-releasewave2-later](../../includes/2026-releasewave2-later.md)]

## Remarks

Set `HeaderFooterPart` on a Word layout that has `SubType = Body`. The value is the name of another layout in the same `rendering` section of the report. The referenced layout must be a Word layout that has `SubType = HeaderFooter`, and it must point to a `.docx` file.

A `Body` layout holds only the document body. The header and footer content comes from the layout that `HeaderFooterPart` references. Several `Body` layouts can reference the same part, so you can maintain the header and footer in one file.

If `HeaderFooterPart` references a layout that has another type or subtype, the compiler reports an error.

To use one header and footer part across all `Body` layouts in a report, set the [DefaultHeaderFooterPart property](devenv-defaultheaderfooterpart-property.md) on the report instead.

## Example

The following example declares a `Body` layout that gets its header and footer from one part, and its fonts and colors from a theme part.

```al
report 50100 "Customer List With Parts"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = CustomerBody;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            {
            }
        }
    }

    rendering
    {
        layout(CustomerBody)
        {
            Type = Word;
            SubType = Body;
            HeaderFooterPart = CorporateHeaderFooter;
            ThemePart = CorporateTheme;
            LayoutFile = 'Reports/Layouts/CustomerBody.docx';
        }
        layout(CorporateHeaderFooter)
        {
            Type = Word;
            SubType = HeaderFooter;
            LayoutFile = 'Reports/Layouts/CorporateHeaderFooter.docx';
        }
        layout(CorporateTheme)
        {
            Type = Word;
            SubType = Theme;
            LayoutFile = 'Reports/Layouts/CorporateTheme.dotx';
        }
    }
}
```

## Related information

[Declare report layouts in AL](../devenv-report-layout-declaration.md)  
[DefaultHeaderFooterPart property](devenv-defaultheaderfooterpart-property.md)  
[DefaultThemePart property](devenv-defaultthemepart-property.md)  
[ThemePart property](devenv-themepart-property.md)  
[DefaultRenderingLayout property](devenv-defaultrenderinglayout-property.md)  
[Defining multiple report layouts](../devenv-multiple-report-layouts.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  