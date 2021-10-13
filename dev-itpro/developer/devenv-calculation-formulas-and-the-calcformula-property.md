---
title: "Calculation Formulas and the CalcFormula Property"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: SusanneWindfeldPedersen
---

# Calculation Formulas and the CalcFormula Property

A FlowField is always associated with a calculation formula that determines how the FlowField is calculated. The following syntax is valid for the CalcFormula property.  

```AL
<CalculationFormula> ::=  
    [-]Exist(<TableNo> [Where (<TableFilters>)]) |  
    Count(<TableNo> [Where (<TableFilters>)]) |  
    [-]Sum(<TableNo>.<FieldNo> [Where(<TableFilters>)])|  
    [-]Average(<TableNo>.<FieldNo> [Where (<TableFilters>)]) |  
    Min(<TableNo>.<FieldNo> [Where (<TableFilters>)]) |  
    Max(<TableNo>.<FieldNo> [Where (<TableFilters>)]) |  
    Lookup(<TableNo>.<FieldNo> [Where (<TableFilters>)])  
<TableFilters> ::=  
    [<TableFilter> {,<TableFilter>}]  
<TableFilter> ::=  
    <DstFieldNo>=Const(<FieldConst>) |  
    <DstFieldNo>=Filter(<Filter>) |  
    <DstFieldNo>=Field(<SrcFieldNo>) |  
    <DstFieldNo>=Field(UpperLimit(<SrcFieldNo>)) |  
    <DstFieldNo>=Field(Filter(<SrcFieldNo>)) |  
    <DstFieldNo>=Field(UpperLimit(Filter(<SrcFieldNo>)))  
```  

Parts of the formula are described in the following table.  

|Symbol|Description|  
|------|-----------|  
|`<TableNo>`|Specifies the table holding the information to be used in the FlowField.|  
|`<FieldNo>`|Specifies the column from which you want to compute values.|  
|`<TableFilters>`|A list of filters to be used in the computation of the FlowField.|  
|`<TableFilter>`|A table filter can be one of the following: a constant expression, a filter expression, a value from ordinary fields, or a FlowFilter field. A key for the other table must exist and include the fields used in the filters.|  
|`<DstFieldNo>`|Specifies the destination field number.|  
|`<SrcFieldNo>`|Specifies the source field number.|  
|`<Filter>`|A filter expression such as 10&#124;20..30.|  

## See Also  

[FlowFields](devenv-flowfields.md)   
[FlowFilter Overview](devenv-flowfilter-overview.md)   