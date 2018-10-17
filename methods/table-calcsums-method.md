---
title: "CalcSums Method"
ms.author: solsen
ms.custom: na
ms.date: 09/28/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .resx files in the ModernDev repo.)
# CalcSums Method
Calculates the total of a column in a table. You specify which fields to calculate by using parameters.

## Syntax
```
[Ok := ]  Table.CalcSums(Field1: Any, [Field2: Any,...])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field1*  
&emsp;Type: [Any](any-data-type.md)  
  
*Field2*  
&emsp;Type: [Any](any-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](boolean-data-type.md)  
**True** if the operation was successful; otherwise, **false**.  
  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 Use this method to total columns in a table. This method operates only on records that meet the conditions of any filters associated with the record.  

 If possible, the **CALCSUMS** method uses SumIndexField Technology \(SIFT\). SIFT is used only if the following conditions are true:  

-   The [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] key contains the fields that are used in the filters that are defined for the FlowField.  

-   The SumIndexFields on the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] key contain the fields that are provided as parameters for calculation.  

-   The [MaintainSIFTIndex Property](../properties/devenv-maintainsift-index-property.md) is set to **true**.  

    > [!NOTE]  
    >  By default this property is set to **true** for all keys.  

 For [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], **CALCSUMS** execution is decoupled from [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] SIFT index definitions. This means that if any of the conditions for using SIFT indexes are not true, then [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] traverses all records in the base table to perform the calculation instead of using SIFT. This can reduce the number of required SIFT indexes, which can improve performance. In earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], if the conditions for using SIFT indexes were not true and the **MaintainSIFTIndex** property was enabled, then you received an error when you called the **CALCSUMS** method. This provided a degree of protection in earlier versions against accidentally requesting a sorting for which no index existed. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], an index is not required to support a certain sorting, but sorting without an index could lead to bad performance if a search returns a large result set, which would then have to be sorted before the first row is returned.  

 The **CALCSUMS** method adheres to the [SecurityFiltering Property](../properties/devenv-securityfiltering-property.md). <!-- For more information about security filters, see [Record-Level Security](Record-Level-Security.md). -->

## Example  
 This example shows how to use the **CALCSUMS** method. It requires that you create a Record variable named WhseEntry for the **Warehouse Entry** table.  

```  
WhseEntry.SETFILTER("Item No.", 'LS-*');  
WhseEntry.SETRANGE("Bin Code", 'W-11-0001');  
WhseEntry.SETRANGE("Location Code", 'WHITE');  
WhseEntry.CALCSUMS("Qty. (Base)");  
```  

 The first three lines set filters on fields in the Warehouse Entry record so the total that is calculated in the last line of code uses records only in the specified range.  


## See Also
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../devenv-get-started.md)  
[Developing Extensions](../devenv-dev-overview.md)