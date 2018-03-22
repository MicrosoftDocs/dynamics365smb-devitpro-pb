---
title: "CALCSUMS Method (Record)"
ms.custom: na
ms.date: 07/03/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: ca75fb36-869e-468b-a9e1-ea73ec7c5ed0
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CALCSUMS Method (Record)
Calculates the total of a column in a table. You specify which fields to calculate by using parameters.  

## Syntax  

```  

[Ok :=] Record.CALCSUMS (Field1, [Field2],...)  
```  

#### Parameters  
 *Record*  
 Type: Record  

 The record that contains the SumIndexFields that you want to calculate.  

 *Field1*, *Field2*, …  
 Type: Decimal, Integer, BigInteger, or Duration  

 The fields that you want to calculate. Each field must be defined as a SumIndexField, in the current key. The field class of the field must be **Normal**. For more information about field class, see [FieldClass Property](../properties/devenv-fieldclass-property.md).  

## Property Value/Return Value  
 Type: Boolean  

 If you omit this optional return value and if one of the fields is not a SumIndexField, a run-time error occurs. If you include a return value, you must handle any errors.  

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
 <!--[SumIndexField Technology \(SIFT\)](devenv-SumIndexField-Technology--SIFT.md) -->   
 [SumIndexFields Property](../properties/devenv-SumIndexFields-Property.md)
