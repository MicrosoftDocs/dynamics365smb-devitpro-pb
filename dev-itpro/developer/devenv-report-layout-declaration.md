---
title: "Report Layout Definition"
description: Report layout definitions in AL for Business Central.
ms.custom: na
ms.date: 04/03/2022
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: nhsejth
---

# Report Layout Definitions

[!INCLUDE[2022_releasewave1](../includes/2022_releasewave1.md)]

When you create a new report, there are two tasks main tasks. First, you define the report dataset of data items and columns. Then, you design the report layout. You can use the [Report Object](devenv-report-object-md) and [Report Extension Object](devenv-report-ext-object.md) to define reports in AL. When you define the layout section of a report, there are two ways to do that.

1. In versions prior to [!INCLUDE[prod_short](../includes/prod_short.md)] release wave 1, layout definitions support the use of one RDL layout and one Microsoft Word layout per AL object and then you can specify which report layout type is the default.
2. The rendering section within the AL object allows you to specify a number of named layouts in the object and yoy specify the default layout by name and not by type. This is the recommended syntax to use.

The development environment contains a code action that can convert the legacy layout definition into the new rendering section for easy update during application update (AL codeactions must be enabled in the VS Code settings file).

## Rendering section

The rendering section consists of one or more named layout declarations.

### Layout declaration

Properties Type and LayoutFile are mandatory, whereas the Caption and Summary properties are optional, but strongly recommended. The application will show the translated caption and summaries to the end-user, with fallback to the layout name in case the caption is undefined.
The MimeType property is only supported if the Type is declared as Custom, and is a free text string. It's recommended that it follows the standard naming for mime types or follows this path Application/Report/ExtensionName (replace ExtenasionName with a shortform that identifies the ownning extension). When custom render layouts are being copied by users (for customization), the mimetype follows the layout and can be verified during selection.

```al
layout(name)
{
    Type = RDLC | Word | Excel | Custom;
    LayoutFile = <file name>;
    Caption = <string>;
    Summary = <string>;
    MimeType = <string>;
}
```

## Sample code

### Sample code for the traditional layout declaration

The traditional layout declaration consists of three report properties as shown in the sample below. The report must specify at least one of the supported formats unless it's a processing only report. The sample define both a RDLC and a Microsoft Word report layout and set the default type to Word.

```al
report 50000 "Standard Report Layout"
{
    RDLCLayout = './StandardReportLayout.rdlc';
    WordLayout = './StandardReportLayout.docx';
    DefaultLayout = Word;
}
```

### Sample code for the modern layout declaration

The modern layout declaration moves the layouts to a rendering section which must be declared just after the request page section in the report object. The default layout is speficied by name with the *DefaultRenderingLayout* property. 

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

## See Also

[Multiple Report Layouts](devenv-multiple-report-layouts.md)
[Default Rrendering Layout Property](properties/devenv-defaultrenderinglayout-property.md)
[RDLC Layout Property](properties/devenv-rdlclayout-property.md)
[Word Layout Property](properties/devenv-wordlayout-property.md)
[Default Layout](properties/devenv-defaultlayout-property.md)
