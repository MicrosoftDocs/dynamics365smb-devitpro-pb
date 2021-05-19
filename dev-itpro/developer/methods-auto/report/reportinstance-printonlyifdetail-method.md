---
title: "Report.PrintOnlyIfDetail Method"
description: "Gets or sets the current settings of the PrintOnlyIfDetail property."
ms.author: solsen
ms.custom: na
ms.date: 05/11/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: reference
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# Report.PrintOnlyIfDetail Method
> **Version**: _Available or changed with runtime version 1.0._

Gets or sets the current settings of the PrintOnlyIfDetail property.

> [!NOTE]
> This method is supported only in Business Central on-premises.

## Syntax
```
[IsPrintOnlyIfDetail := ]  Report.PrintOnlyIfDetail([SetPrintOnlyIfDetail: Boolean])
```
> [!NOTE]
> This method can be invoked using property access syntax.
## Parameters
*Report*  
&emsp;Type: [Report](report-data-type.md)  
An instance of the [Report](report-data-type.md) data type.

*SetPrintOnlyIfDetail*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The new setting of PrintOnlyIfDetail property.  


## Return Value
*IsPrintOnlyIfDetail*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
The current settings of the PrintOnlyIfDetail property.


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Example 1

 The following example is from the OnAfterGetRecord trigger of a report. If the PrintOnlyIfDetail property is true and if a GLEntryPage record exists, given the current filters, then the PageGroupNo is incremented.
 
```  
var
    GLEntryPage: Record "G/L Entry";
    PageGroupNo: Integer;
begin
    if CurrReport.PrintONLYifDETAIL and GLEntryPage.Find('-') then  
      PageGroupNo := PageGroupNo + 1;  
end;
```  
  
## Example 2

 The following example sets the value of the [PrintOnlyIfDetail Property](../../properties/devenv-printonlyifdetail-property.md) to true. It requires that you create a Report variable named Report111. The Subtype of the variable is report 111, Customer - Top 10 List.  
  
```  
IsPrintOnlyIfDetail := Report111.PrintONLYifDETAIL(true);  
```  
  

## See Also
[Report Data Type](report-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)