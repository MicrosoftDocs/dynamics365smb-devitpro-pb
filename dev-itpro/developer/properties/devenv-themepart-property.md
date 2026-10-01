---
title: ThemePart Property for Report Layouts
description: Learn how the ThemePart property sets the theme part that gives a Body Word report layout its fonts, colors, and styles in Business Central.
ms.author: solsen
ms.date: 09/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# ThemePart Property
> **Version**: _Available or changed with runtime version 18.0._

Sets the layout with the Theme subtype that should be used by this Body layout.

## Applies to
-   Report Layout

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

[!INCLUDE [2026-releasewave2-later](../../includes/2026-releasewave2-later.md)]

## Remarks

Set `ThemePart` on a Word layout that has `SubType = Body`. The value is the name of another layout in the same `rendering` section of the report. The referenced layout must be a Word layout that has `SubType = Theme`, and it must point to a `.dotx` template file.

A theme part supplies the fonts, colors, and styles that the `Body` layout uses when the report renders. Keep your brand formatting in one template, and reference that template from every `Body` layout that needs it.

If `ThemePart` references a layout that has another type or subtype, the compiler reports an error.

To use one theme part across all `Body` layouts in a report, set the [DefaultThemePart property](devenv-defaultthemepart-property.md) on the report instead.

## Example

The following example declares a `Body` layout that gets its fonts, colors, and styles from a separate theme template.

```al
report 50101 "Customer List Themed"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = ThemedBody;

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
        layout(ThemedBody)
        {
            Type = Word;
            SubType = Body;
            ThemePart = CorporateTheme;
            LayoutFile = 'Reports/Layouts/ThemedBody.docx';
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
[HeaderFooterPart property](devenv-headerfooterpart-property.md)  
[DefaultRenderingLayout property](devenv-defaultrenderinglayout-property.md)  
[Defining multiple report layouts](../devenv-multiple-report-layouts.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  