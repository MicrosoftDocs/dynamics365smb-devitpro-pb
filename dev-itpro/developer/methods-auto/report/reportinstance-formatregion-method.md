---
title: "Report.FormatRegion([Text]) Method"
description: "Gets or sets the current format region setting for the report."
ms.author: solsen
ms.custom: na
ms.date: 01/23/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.FormatRegion([Text]) Method
> **Version**: _Available or changed with runtime version 11.0._

Gets or sets the current format region setting for the report.


## Syntax
```AL
[CurrentFormatRegion := ]  Report.FormatRegion([FormatRegion: Text])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*[Optional] FormatRegion*  
&emsp;Type: [Text](../text/text-data-type.md)  
The new format region setting for the report.  


## Return Value
*[Optional] CurrentFormatRegion*  
&emsp;Type: [Text](../text/text-data-type.md)  
The current format region setting for the report.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example

If you have reports that you want to print using a format that is aligned with the recepient rather than in your own working region, you can add a few lines of code in the report to handle this. In this example we will take the assumption that the format region will be aligned with the language in the current report run and that the report does not have native support for format region. The document is printed in the language that is specified in the **Language Code** field on the **Customer Card** page.

In reports that need the multiple document format functionality, you can insert the following AL code as the first lines in the `OnAfterGetRecord()` trigger on the data item referencing the **Customer** table (notice that that feature is not limited to the **Customer** table, other data sources provides similiar functionality.):

```AL
trigger OnAfterGetRecord()
var
    LanguageSelection: Record "Language Selection";
    Language: Codeunit Language;
begin
    CurrReport.Language := Language.GetLanguageIdOrDefault("Language Code");

    LanguageSelection.SetFilter("Language ID", format(CurrReport.Language));
    if LanguageSelection.FindFirst() then
        CurrReport.FormatRegion := LanguageSelection."Language Tag";
end;
```

## See Also

[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)
[Report Localization](../../devenv-report-localization.md)  
[Report.Language](./reportinstance-language-method.md)  