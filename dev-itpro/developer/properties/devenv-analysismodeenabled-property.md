---
title: "AnalysisModeEnabled Property"
description: "Sets a value that specifies whether analysis mode on the page is allowed."
ms.author: solsen
ms.custom: na
ms.date: 09/25/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# AnalysisModeEnabled Property
> **Version**: _Available or changed with runtime version 12.0._

Sets a value that specifies whether analysis mode on the page is allowed.

## Applies to
-   Page

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Property Value  

**true** enables the analysis mode on the page. When enabled, the **Analyze** switch is available at the top of the page; **false** disables the analysis mode on the page. The default is **true**.  

## Syntax

```AL
AnalysisModeEnabled = true|false;
```

## Remarks

The analysis mode enables users to analyze data directly from the page, without having to run a report or switch another application like Excel. It provides an interactive and versatile way to calculate, summarize, and examine data. [Learn more about the analysis mode](/dynamics365/business-central/analysis-mode) in the business functionality help.

## See also
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  