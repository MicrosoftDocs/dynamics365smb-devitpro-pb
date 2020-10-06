---
title: The FieldTopicTextExtractor tool 
description: Learn about the FieldTopicTextExtractor tool in the custom Help toolkit for Business Central and how it can help you convert field-level Help from Dynamics NAV to the Business Central format. 
author: jowilco

ms.reviewer: edupont
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/02/2020
ms.author: jowilco
---

# Custom Help Toolkit: The FieldTopicTextExtractor tool

If you are migrating a solution from Dynamics NAV to [!INCLUDE [prodshort](../developer/includes/prodshort.md)], you can use this tool to export the text contained in the first paragraph of field-level Help topics for Microsoft Dynamics NAV 2018 or earlier versions. You can then use these paragraphs as tooltip text in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution.  

> [!NOTE]
> The tool does not import the tooltip text directly into your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] page objects. Instead it creates a spreadsheet that will make it easier to reuse the text from field-level Help topics in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution.

## Use the FieldTopicTextExtractor tool to extract content Excel

Use the **FieldTopicTextExtractor** tool to populate an Excel workbook with the field IDs and the corresponding first paragraph from a set of HTML topics from the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] field-level Help. The Dynamics NAV field topics have a name in the format `T_10_20.html` for field 20 on table 10. The name of the resulting Excel spreadsheet will be in the format Field_topic_summaries\*.xlsx.

Here is the syntax for FieldTopicTextExtractor.exe:  

```cmd
FieldTopicTextExtractor.exe --n --o
```

Here is an explanation of the parameters:

|Parameter   |Description  |
|------------|-------------|
|n|Specifies the path to the HTML files with Dynamics NAV field topics. |
|o|Specifies the path where the Excel spreadsheet must be created.|

## Examples

The following example extracts the introductory paragraph from T_\*.htm files in D:\NAV to an Excel spreadsheet with the name Field_topic_summaries\*.xlsx in D:\BC:

```cmd
NavFieldsTooltips.exe --n D:\NAV --o D:\BC
```

## After extracting the Dynamics NAV field topic text

Excel makes it easy to bulk-apply and bulk-edit strings because you can sort and filter data. If you work with dedicated technical writers, then they are probably more efficient if they can work with tooltip text in Excel prior to adding tooltip text to your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution. You can also take the opportunity to revise the text. For more information, see [Guidelines for tooltip text](../user-assistance.md#guidelines-for-tooltip-text).  

Before you import the tooltips into your solution, map the original field IDs to page control IDs in your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] solution. It requires knowledge of the actual solution to determine which tooltips are relevant for which pages, and Excel is very handy to help you in this process.  

## See also

[Custom Help Toolkit](custom-help-toolkit.md)  
[Custom Help Toolkit: The HtmlFromRepoGenerator tool](custom-help-toolkit-HtmlFromRepoGenerator.md)  
[Migrate Legacy Help to the Business Central Format](../upgrade/migrate-help.md)  
