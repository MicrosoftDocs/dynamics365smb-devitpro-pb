---
title: "DefaultLayout Property"
description: "Specifies whether the report uses the built-in Excel, Word, or RDL report layout by default."
ms.author: solsen
ms.custom: na
ms.date: 10/11/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# DefaultLayout Property
> **Version**: _Available or changed with runtime version 1.0._

Specifies whether the report uses the built-in RDL or Word report layout by default.

## Applies to
-   Report

## Property Value

|Value|Available or changed with|Description|
|-----------|-----------|---------------------------------------|
|**RDLC**|runtime version 1.0|Specifies the built-in RDL layout as the default layout.|
|**Word**|runtime version 1.0|Specifies the built-in Word layout as the default layout.|
|**Excel**|runtime version 9.0|Specifies the built-in Excel layout as the default layout.|

[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
report 50124 MyExcelReport
{
    DefaultLayout = Excel;

    // more report code here
}
``` 

Allowed values are defined in the option type [DefaultLayout](../methods-auto/defaultlayout/defaultlayout-option.md).

## Remarks

A report object can include a built-in layout of either an Excel type, Word type, or RDL type. When you set the property to a type, then that layout type is used by default to view, save, and print a report. Users can change a report to use another layout from the [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] client.  


[!INCLUDE[single_layouts](../includes/include-single-layout-obsolete.md)]

## See also

[Developing reports](../devenv-reports.md)  
[Defining multiple report layouts](../devenv-multiple-report-layouts.md)  
[Creating an RDL Layout Report](../devenv-howto-rdl-report-layout.md)  
[Creating an Excel layout report](../devenv-howto-excel-report-layout.md)   
[Creating a Word Layout Report](../devenv-howto-report-layout.md)  