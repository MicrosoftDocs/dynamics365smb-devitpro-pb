---
title: Define Report Layouts in AL for Business Central
description: Learn how to declare report layouts in AL, use portable layout file paths, and create Word layouts with subtypes for header/footer and theme parts.
ms.date: 09/03/2026
ms.reviewer: solsen
ms.topic: how-to
author: nhsejth
---

# Declare report layouts in AL

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

When you create a new report, complete two main tasks. First, define the report dataset of data items and columns. Then, design the report layout. Use the [Report Object](devenv-report-object.md) and [Report Extension Object](devenv-report-ext-object.md) to define reports in AL. When you define the layout section of a report, you have two options.

1. In versions prior to [!INCLUDE[prod_short](../includes/prod_short.md)] release wave 1, layout definitions support the use of one RDL layout and one Microsoft Word layout per AL object. You then specify which report layout type is the default. This article refers to this syntax as the *legacy layout*.
2. From version [!INCLUDE[prod_short](../includes/prod_short.md)] release wave 1, the `rendering` section within the AL object allows you to specify multiple named layouts in the object and you specify the default layout by name and not by type. **Note:** The `rendering` syntax is the recommended syntax to use.

The development environment contains a code action that can convert the *legacy layout* definition into the new `rendering` section for easy update during application update. To use this code action, you must enable code actions in Visual Studio Code. Learn more about enabling code actions in [AL Language Extension Configuration](devenv-al-extension-configuration.md).

## Use portable layout file paths

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

Starting with runtime 18.0, the `RDLCLayout`, `WordLayout`, `ExcelLayout`, `LayoutFile`, and `DefinitionFile` properties accept both `/` and `\` as directory separators on all operating systems. `DefinitionFile` specifies an analysis view file. The other properties specify report layout files.

The same AL source therefore compiles on Windows and Linux. You don't need to change path separators for each operating system. The compiler doesn't report an [AL0363](diagnostics/diagnostic-al363.md) for an incompatible directory separator. The AL0363 diagnostic ID remains reserved to preserve backward compatibility for suppression directives.

## Create Word layouts for the Word Add-in

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

Starting with runtime 18.0, the compiler always includes the extended custom XML parts that make Word report layouts compatible with the Word Add-in. You don't need the `WordAddInCompatibleLayouts` compiler feature flag. Treat this flag as deprecated when you target runtime 18.0 or later.

The custom XML parts also include a `CompanyMetadata` element inside the `BCReportInformation` element. Composite Word layouts have `Subtype = Body`. They use the `CompanyMetadata` element to resolve their header/footer and theme parts when the layout renders. You don't need to set or read this element directly. The compiler and the Word Add-in maintain it for you.

## Define layouts in the rendering section

The `rendering` section consists of one or more named layout declarations.

### Layout declaration in AL 

When you declare a layout in AL, you must include the properties [Type](properties/devenv-type-property.md) and [LayoutFile](properties/devenv-layoutfile-property.md). The properties [Caption](properties/devenv-caption-property.md) and [Summary](properties/devenv-summary-property.md) are optional, but recommended. The application shows the translated caption and summaries to the end-user, with fallback to the layout name if the caption is undefined. To learn more about defining multiple report layouts, see [Defining Multiple Report Layouts](devenv-multiple-report-layouts.md).

The [MimeType](properties/devenv-mimetype-property.md) property is only supported if the `Type` is declared as `Custom`, and is a free-text string. 
Set it to follow the standard naming for MIME types or set it to a path equivalent to: `Application/Report/<ExtensionName>` where `<ExtensionName>` is a short-form that identifies the owning extension. When users copy custom-render layouts for customization, the MIME type follows the layout and can be verified during selection.

The syntax is as follows:

```al
layout(name)
{
    Type = RDLC | Word | Excel | Custom;
    Subtype = Default | Body | HeaderFooter | Theme;  // Word layouts only
    LayoutFile = <file name>;
    Caption = <string>;
    Summary = <string>;
    MimeType = <string>;
}
```

### Subtype property for Word layouts

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

The `Subtype` property is available on `Word` layouts and specifies the role of the layout file within a report. The following values are supported:

| Value | Description |
|-------|-------------|
| `Default` | A standalone Word document layout (`.docx`). This value is used when `Subtype` isn't specified. |
| `Body` | A Word document layout (`.docx`) that supports composite rendering. A `Body` layout can use separate header and footer and theme parts set by the report's `DefaultHeaderFooterPart` and `DefaultThemePart` properties. |
| `HeaderFooter` | A Word document (`.docx`) that provides header and footer content for a `Body` layout. |
| `Theme` | A Word template (`.dotx`) that provides theme formatting, such as fonts, colors, and styles, for a `Body` layout. |

> [!NOTE]
> Layouts with `Subtype = Theme` must use a template file with the `.dotx` file extension. Layouts with `Subtype = Default`, `Body`, or `HeaderFooter` use the `.docx` file extension.

Use the [DefaultHeaderFooterPart](properties/devenv-defaultheaderfooterpart-property.md) and [DefaultThemePart](properties/devenv-defaultthemepart-property.md) report properties to reference layouts declared in the same `rendering` section. `DefaultHeaderFooterPart` must reference a layout that has `Subtype = HeaderFooter`, and `DefaultThemePart` must reference a layout that has `Subtype = Theme`.

#### Example

The following example defines a standalone `Default` layout and a composite `Body` layout that references separate header and footer and theme parts.

```al
report 50000 "Report With Parts"
{
    DefaultRenderingLayout = StandaloneLayout;
    DefaultHeaderFooterPart = StandardHeaderFooter;
    DefaultThemePart = StandardTheme;

    dataset
    {
    }

    requestpage
    {
    }

    rendering
    {
        layout(StandaloneLayout)
        {
            Type = Word;
            Subtype = Default;
            LayoutFile = 'Reports\Layouts\StandaloneLayout.docx';
        }
        layout(CompositeBody)
        {
            Type = Word;
            Subtype = Body;
            LayoutFile = 'Reports\Layouts\CompositeBody.docx';
        }
        layout(StandardHeaderFooter)
        {
            Type = Word;
            Subtype = HeaderFooter;
            LayoutFile = 'Reports\Layouts\StandardHeaderFooter.docx';
        }
        layout(StandardTheme)
        {
            Type = Word;
            Subtype = Theme;
            LayoutFile = 'Reports\Layouts\StandardTheme.dotx';
        }
    }
}
```

### Default header/footer and theme parts for composite Word layouts

[!INCLUDE [2026-releasewave2-later](../includes/2026-releasewave2-later.md)]

The `DefaultHeaderFooterPart` and `DefaultThemePart` report properties let a report specify the default header and footer and theme parts used by its `Body` Word layouts. Following the same pattern as [DefaultRenderingLayout](properties/devenv-defaultrenderinglayout-property.md), each property references the name of a layout declared in the report's `rendering` section. `DefaultHeaderFooterPart` must reference a layout that has `Subtype = HeaderFooter`, and `DefaultThemePart` must reference a layout that has `Subtype = Theme`. Referencing a layout with a different subtype results in a compiler error.

```al
report 50000 "Report With Parts"
{
    DefaultRenderingLayout = DefaultPart;
    DefaultHeaderFooterPart = StandardHeaderFooter;
    DefaultThemePart = StandardTheme;

    dataset
    {
    }

    requestpage
    {
    }

    rendering
    {
        layout(DefaultPart)
        {
            Type = Word;
            Subtype = Body;
            LayoutFile = 'Reports\Layouts\DefaultPart.docx';
        }
        layout(StandardHeaderFooter)
        {
            Type = Word;
            Subtype = HeaderFooter;
            LayoutFile = 'Reports\Layouts\StandardHeaderFooter.docx';
        }
        layout(StandardTheme)
        {
            Type = Word;
            Subtype = Theme;
            LayoutFile = 'Reports\Layouts\StandardTheme.dotx';
        }
    }
}
```

## Compare legacy and rendering layout declarations

### Sample code for the legacy layout declaration

The *legacy* layout declaration consists of three report properties as shown in the sample below. The report must specify at least one of the supported formats unless it's a *processing only* report. The sample defines both an RDLC and a Microsoft Word report layout and sets the default type to Word.

```al
report 50000 "Standard Report Layout"
{
    RDLCLayout = './StandardReportLayout.rdlc';
    WordLayout = './StandardReportLayout.docx';
    DefaultLayout = Word;
}
```

### Sample code for the new layout declaration

The new layout declaration moves the layouts to a rendering section, which you must declare just after the request page section in the report object. Specify the default layout by name by using the `DefaultRenderingLayout` property.

```al
report 50000 "Standard Report Layout"
{
    DefaultRenderingLayout = RDLCLayout;
    ...
    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './StandardReportLayout.rdlc';
            Caption = 'Standard Report Layout (RDL)';
            Summary = 'Legacy layout';
        }
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = './StandardReportLayout.docx';
            Caption = 'Standard Report Layout (Word)';
            Summary = 'Standard layout suitable for user facing documents.';
        }
    }
}
```

## Related information

[Multiple report layouts](devenv-multiple-report-layouts.md)  
[Default rendering layout property](properties/devenv-defaultrenderinglayout-property.md)  
[RDLC layout property](properties/devenv-rdlclayout-property.md)  
[Word layout property](properties/devenv-wordlayout-property.md)  
[Default layout](properties/devenv-defaultlayout-property.md)  
[Report properties](properties/devenv-report-property-overview.md)  
[DefaultHeaderFooterPart property](properties/devenv-defaultheaderfooterpart-property.md)  
[DefaultThemePart property](properties/devenv-defaultthemepart-property.md)  
[HeaderFooterPart property](properties/devenv-headerfooterpart-property.md)  
[ThemePart property](properties/devenv-themepart-property.md)  
