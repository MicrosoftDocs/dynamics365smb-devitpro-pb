---
title: DefaultHeaderFooterPart Property for Reports
description: Learn how the DefaultHeaderFooterPart property sets the header and footer part that the Body Word layouts of a report use in Business Central.
ms.author: solsen
ms.date: 10/01/2026
ms.topic: reference
author: SusanneWindfeldPedersen
ms.reviewer: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DefaultHeaderFooterPart Property
> **Version**: _Available or changed with runtime version 18.0._

Sets the default header/footer part, defined as a layout with the HeaderFooter subtype, that should be used for the Word layouts of this report.

## Applies to
-   Report

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

[!INCLUDE [2026-releasewave2-later](../../includes/2026-releasewave2-later.md)]

## Remarks

`DefaultHeaderFooterPart` sets the header and footer part for the Word layouts of the report that have `SubType = Body`. The value is the name of a layout declared in the `rendering` section of the report, in the same way as the [DefaultRenderingLayout property](devenv-defaultrenderinglayout-property.md).

The referenced layout must be a Word layout that has `SubType = HeaderFooter`, and it must point to a `.docx` file. If it references a layout that has another type or subtype, the compiler reports an error.

Use this property when all `Body` Word layouts in the report share one header and footer. To set the part for a single layout, use the [HeaderFooterPart property](devenv-headerfooterpart-property.md) on that layout.

## Example

The following example sets a header and footer part and a theme part for the whole report. The `Body` layout doesn't repeat these references.

```al
report 50102 "Customer List Report"
{
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = CustomerBody;
    DefaultHeaderFooterPart = CorporateHeaderFooter;
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
        layout(CustomerBody)
        {
            Type = Word;
            SubType = Body;
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
[DefaultThemePart property](devenv-defaultthemepart-property.md)  
[HeaderFooterPart property](devenv-headerfooterpart-property.md)  
[ThemePart property](devenv-themepart-property.md)  
[DefaultRenderingLayout property](devenv-defaultrenderinglayout-property.md)  
[Defining multiple report layouts](../devenv-multiple-report-layouts.md)  
[Getting started with AL](../devenv-get-started.md)  
[Developing extensions](../devenv-dev-overview.md)  