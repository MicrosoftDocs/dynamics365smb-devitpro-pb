---
title: "Report.Language([Integer]) Method"
description: "Gets or sets the current language setting for the report."
ms.author: solsen
ms.date: 05/14/2024
ms.topic: reference
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.Language([Integer]) Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the current language setting for the report.


## Syntax
```AL
[CurrentLanguage := ]  Report.Language([Language: Integer])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.  

*[Optional] Language*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The new language setting for the report.  


## Return Value
*[Optional] CurrentLanguage*  
&emsp;Type: [Integer](../integer/integer-data-type.md)  
The current language setting for the report.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

The `Language` integer parameter must point to a valid Windows Language Code Identifier (LCID). For more information, see [Windows Language Code Identifier (LCID) Reference](/openspecs/windows_protocols/ms-lcid/70feba9f-294e-491e-b6eb-56532684c37f). The `Language` codeunit includes the `GetLanguageId` method that can safely return a valid LCID from a language code in the `Language` table. If you call `Report.Language` with an invalid LCID, then a runtime error occurs.

If you have reports that you want to print in the language of the recipient rather than in your own working language, you can add a single line of code in the report to handle this. This functionality is already enabled for most reports in the standard [!INCLUDE [prod_short](../../includes/prod_short.md)] database. The document is printed in the language that's specified in the **Language Code** field on the **Customer Card** page.

For reports that need the multiple document languages functionality, you must insert the following AL code as the first line in the `OnAfterGetRecord()` trigger on the data item referencing the **Customer** table (notice that the feature isn't limited to the **Customer** table, other data sources provide similar functionality):

`CurrReport.Language := LanguageMgmt.GetLanguageIdOrDefault("Language Code");`

For each of these reports, you must create a new variable, `LanguageMgmt`, with the data type `Codeunit` pointing to the `Language` codeunit. When you have compiled the object, it'll no longer print in the user's working application language if another language has been specified on the **Customer Card** page.

## Example 

The following example illustrates how to use the Language codeunit to set the language defined on the customer card in a report. The example is based on report 10071 "Customer Stmt. (Pre-Printed)" from the base application.

```AL
report 10071 "Customer Stmt. (Pre-Printed)"
{
  // report properties 


  dataset
  {
    dataitem(Customer; Customer)
    {
      // data item fields and nested dataitems here

      trigger OnAfterGetRecord()
      begin
        CurrReport.Language := LanguageMgt.GetLanguageIdOrDefault("Language Code");
        CurrReport.FormatRegion := LanguageMgt.GetFormatRegionOrDefault("Format Region");

        // maybe more code here
      end;
    }

    // requestpage section

    // rendering section

var
    LanguageMgmt: Codeunit Language;
}

```

## See also
[Windows Language Code Identifier (LCID) Reference](https://learn.microsoft.com/openspecs/windows_protocols/ms-lcid/70feba9f-294e-491e-b6eb-56532684c37f)   
[Report.FormatRegion](./reportinstance-formatregion-method.md)   
[Report Localization](../../devenv-report-localization.md)  
[Report Data Type](report-data-type.md)  
[Get Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
