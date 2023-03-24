---
title: "Calculation Formulas and the CalcFormula Property"
ms.custom: na
ms.date: 11/16/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
---

# Calculation Formulas and the CalcFormula Property

A FlowField is always associated with a calculation formula that determines how the FlowField is calculated. The following syntax is valid for the CalcFormula property.  

```AL
<CalculationFormula> ::=  
    [-]exist(<TableNo> [where (<TableFilters>)]) |  
    Count(<TableNo> [where (<TableFilters>)]) |  
    [-]sum(<TableNo>.<FieldNo> [where(<TableFilters>)])|  
    [-]average(<TableNo>.<FieldNo> [where (<TableFilters>)]) |  
    min(<TableNo>.<FieldNo> [where (<TableFilters>)]) |  
    max(<TableNo>.<FieldNo> [where (<TableFilters>)]) |  
    lookup(<TableNo>.<FieldNo> [where (<TableFilters>)])  
<TableFilters> ::=  
    [<TableFilter> {,<TableFilter>}]  
<TableFilter> ::=  
    <DstFieldNo>=const(<FieldConst>) |  
    <DstFieldNo>=filter(<Filter>) |  
    <DstFieldNo>=field(<SrcFieldNo>) |  
    <DstFieldNo>=field(upperLimit(<SrcFieldNo>)) |  
    <DstFieldNo>=field(filter(<SrcFieldNo>)) |  
    <DstFieldNo>=field(upperLimit(filter(<SrcFieldNo>)))  
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