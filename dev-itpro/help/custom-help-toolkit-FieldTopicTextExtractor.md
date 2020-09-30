---
title: Convert field topics to tooltip text 
description: This article describes the FieldTopicTextExtractor tool in the custom help toolkit for Business Central. 

author: edupont04
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 08/31/2020
ms.author: edupont
---

# Custom Help Toolkit: The FieldTopicTextExtractor tool

If you are migrating a solution from Dynamics NAV to [!INCLUDE [prodshort](../developer/includes/prodshort.md)], you can use this tool to export the text contained in the first paragraph of field-level Help topics for Microsoft Dynamics NAV 2018 or earlier versions. These paragraphs can be used as tooltip text in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution.  

> [!NOTE]
> The tool does not import the tooltip text directly into your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] page objects. Instead it creates a spreadsheet that will make it easier to reuse the text from field-level Help topics in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution. 

## <a name="htmllocale"></a>Use the FieldTopicTextExtractor tool to extract content Excel

Use the **FieldTopicTextExtractor** tool to populate an Excel workbook with the field IDs and the corresponding first paragraph from a set of HTML topics from the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] field-level Help. The NAV field topics have a name in the format T_*.html. The name of the resulting Excel spreadsheet will be in the format Field_topic_summaries*.xlsx.

Here is the syntax for FieldTopicTextExtractor.exe:  

```cmd
FieldTopicTextExtractor.exe --n --o
```

Here is an explanation of the parameters:

|Parameter   |Description  |
|------------|-------------|
|n|Specifies the path to the NAV field topic HTML files. |
|o|Specifies the path where the Excel spreadsheet should be created.|

## Examples

The following example extracts the introductory paragraph from T_*.htm files in D:\NAV to an Excel spreadsheet with the name Field_topic_summaries*.xlsx in D:\BC:

```cmd
NavFieldsTooltips.exe --n D:\NAV --o D:\BC
```

## After extracting the NAV field topic text

Excel makes it easy to bulk-apply and bulk-edit strings because you can sort and filter data. If you work with dedicated technical writers, then they are probably more efficient if they can work with tooltip text in Excel prior to adding tooltip text to your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution.

To import the tooltips into your solution, you should map the original field IDs to page control IDs in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution.

## See also

[Custom Help Toolkit](custom-help-toolkit.md)  
[Custom Help Toolkit: The HtmlFromRepoGenerator tool](custom-help-toolkit-HtmlFromRepoGenerator.md)  
[Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format](../upgrade/migrate-help.md)  
