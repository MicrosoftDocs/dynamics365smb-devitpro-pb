---
title: Convert field topics to tooltip text 
description: This article describes the NavFieldsTooltips tool in the custom help toolkit for Business Central. 

author: edupont04
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 08/31/2020
ms.author: edupont
---

# Custom Help Toolkit: The NavFieldsTooltips tool

If you are migrating a solution from Dynamics NAV to [!INCLUDE [prodshort](../developer/includes/prodshort.md)], you can use the toolkit's script to convert the field Help to tooltip-type text that you can then apply to your solution's page objects. The custom help toolkit includes the **NavFieldsTooltips** tool that can process HTML files with field-level Help content for [!INCLUDE [nav2018_md](../developer/includes/nav2018_md.md)] or earlier versions and prepare them to be imported as tooltip text in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution.  

> [!NOTE]
> The tool does not import the tooltip text into your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] page objects because the tool does not now how table fields map to page controls in your solution. Only you have that insight.  

## <a name="htmllocale"></a>Use the NavFieldsTooltips tool to content Excel

Use the **NavFieldsTooltips** tool to extract the first paragraph in an HTML topic and populate an Excel workbook with the field IDs and the corresponding introduction from the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] field-level Help.

Here is the syntax for NavFieldsTooltips.exe:  

```cmd
NavFieldsTooltips.exe h --v <true|false>
```

Here is an explanation of the parameters:

|Parameter   |Description  |
|------------|-------------|
|h|Specifies the path to the HTML files that you want to process. |
|v|True to enable verbose logging; otherwise false.|

## Examples

The following example changes the original locale to *de-at* with verbose logging:

```cmd
NavFieldsTooltips.exe --h D:\BC\de --v
```

In the example, the `D:\BC\de` folder contains HTML files.  

## See also

[Custom Help Toolkit](custom-help-toolkit.md)  
[Custom Help Toolkit: The HtmlFromRepoGenerator tool](custom-help-toolkit-HtmlFromRepoGenerator.md)  
