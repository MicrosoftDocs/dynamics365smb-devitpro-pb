---
title: "CalcFormula Property"
ms.author: solsen
ms.custom: na
ms.date: 11/24/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CalcFormula Property
> **Version**: _Available from runtime version 1.0._

Sets the Calculation formula for a FlowField.
The following syntax is valid for the CalculationFormula property:

```
CalculationFormula =
Exist(<DestinationTable> [WHERE (<TableFilters>)]) |
Count(<DestinationTable> [WHERE (<TableFilters>)]) |
[-]Sum(<DestinationTable>.<DestinationFieldName> [WHERE(<TableFilters>)])|
[-]Average(<DestinationTable>.<DestinationFieldName> [WHERE(<TableFilters>)]) |
Min(<DestinationTable>.<DestinationFieldName> [WHERE(<TableFilters>)]) |
Max(<DestinationTable>.<DestinationFieldName> [WHERE(<TableFilters>)]) |
Lookup(<DestinationTable>.<DestinationFieldName> [WHERE(<TableFilters>)])
<TableFilters> ::= <TableFilter> {,<TableFilter>}
<TableFilter> ::=
<DestinationFieldName> = CONST(<FieldConst>) | FILTER(<Filter>) | FIELD(<SourceFieldName>) | FIELD(UPPERLIMIT(<SourceFieldName>)) |
FIELD(FILTER(<SourceFieldName>)) | FIELD(UPPERLIMIT(FILTER(<SourceFieldName>)))
```


## Applies to
-   Table Field


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Syntax

```AL
CalcFormula = Count(RecordCalcFields);
```
  
## Remarks  
 You can choose from several methods of calculations including sum (total), average, maximum value, minimum value, record count, lookup, and whether a record exists.  

## See Also  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)  
[Calculation Formulas and the CalcFormula Property](../devenv-calculation-formulas-and-the-calcformula-property.md)