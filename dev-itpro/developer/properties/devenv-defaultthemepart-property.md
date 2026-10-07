---
title: DefaultThemePart Property for Reports
description: Learn how the DefaultThemePart property sets the fonts, colors, and styles that the Body Word layouts of a report use in Business Central.
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DefaultThemePart Property
> **Version**: _Available or changed with runtime version 18.0._

Sets the default theme part, defined as a layout with the Theme subtype, that should be used for the Word layouts of this report.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

[!INCLUDE [2026-releasewave2-later](../../includes/2026-releasewave2-later.md)]

## Remarks

`DefaultThemePart` sets the theme part for the Word layouts of the report that have `SubType = Body`. The value is the name of a layout declared in the `rendering` section of the report, in the same way as the [DefaultRenderingLayout property](devenv-defaultrenderinglayout-property.md).

The referenced layout must be a Word layout that has `SubType = Theme`, and it must point to a `.dotx` template file. If it references a layout that has another type or subtype, the compiler reports an error.

Use this property when all `Body` Word layouts in the report share the same fonts, colors, and styles. To set the theme for a single layout, use the [ThemePart property](devenv-themepart-property.md) on that layout.

## Example

The following example gives both `Body` layouts of the report the same theme, without repeating the reference on each layout.

```al
report 50103 "Customer List Branded"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = ShortBody;
    DefaultThemePart = CorporateTheme;

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
        layout(ShortBody)
        {
            Type = Word;
            SubType = Body;
            LayoutFile = 'Reports/Layouts/ShortBody.docx';
        }
        layout(DetailedBody)
        {
            Type = Word;
            SubType = Body;
            LayoutFile = 'Reports/Layouts/DetailedBody.docx';
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
[HeaderFooterPart property](devenv-headerfooterpart-property.md)  
[ThemePart property](devenv-themepart-property.md)  
[DefaultRenderingLayout property](devenv-defaultrenderinglayout-property.md)  
[Defining multiple report layouts](../devenv-multiple-report-layouts.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  