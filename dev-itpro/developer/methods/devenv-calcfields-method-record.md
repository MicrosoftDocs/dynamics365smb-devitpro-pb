---
title: "CALCFIELDS Method (Record)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: eb58dea1-05e6-4c11-97cf-75c458c119c5
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CALCFIELDS Method (Record)
Calculates the FlowFields in a record. You specify which fields to calculate by using parameters.  

## Syntax  

```  

[Ok :=] Record.CALCFIELDS(Field1, [Field2],...)  
```  

#### Parameters  
 *Record*  
 Type: Record  

 The record in the table to update.  

 *Field1*, *Field2*, …  
 Type: Field  

 The FlowFields or BLOB fields that you want to calculate or retrieve. Each field must belong to the same record variable.  

## Property Value/Return Value  
 Type: Boolean  

## Remarks  
 FlowFields are virtual fields. The values in these fields are not saved in the table. This means that you must use either the **CALCFIELDS** method or the [SETAUTOCALCFIELDS Method \(Record\)](devenv-SETAUTOCALCFIELDS-Method-Record.md) to update them. For example, if you retrieve a record using the [FIND Method \(Record\)](devenv-FIND-Method-Record.md) and [NEXT Method \(Record\)](devenv-NEXT-Method-Record.md), the FlowFields in those records are set to zero \(0\). Then, when you call **CALCFIELDS**, their values are updated.  

 When a FlowField is a direct source expression on a page or a report, the calculation is performed automatically.  

 You can also use the **CALCFIELDS** method to retrieve binary large objects \(BLOBs\). For more information, see [BLOB Data Type](../datatypes/devenv-BLOB-Data-Type.md).  

 If possible, the **CALCFIELDS** method uses SumIndexField Technology \(SIFT\). SIFT is used only if the following conditions are true:  

-   The [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] key contains the fields that are used in the filters that are defined for the FlowField.  

-   The SumIndexFields on the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] key contain the fields that are provided as parameters for calculation.  

-   The [MaintainSIFTIndex Property](../properties/devenv-MaintainSIFT-Index-Property.md) is set to **true**.  

    > [!NOTE]  
    >  By default this property is set to **true** for all keys.  

> [!NOTE]  
>  [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)] automatically maintains a count for all SIFT indexes. Therefore, if the calculation method for a FlowField is COUNT or AVERAGE, then the condition that the SumIndexFields on the [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] key contain the fields that are provided as parameters for calculation is not required.  

 For [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], **CALCFIELDS** execution is decoupled from [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] SIFT index definitions. This means that if the conditions for using SIFT indexes are not true, then [!INCLUDE[d365fin_md](../includes/d365fin_md.md)] traverses all records in the base table to perform the calculation instead of using SIFT. This can reduce the number of required SIFT indexes, which can improve performance. In earlier versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], if the conditions for using SIFT indexes were not true and the **MaintainSIFTIndex** property was enabled, then you received an error when you called the **CALCFIELDS** method. This provided a degree of protection in earlier versions against accidentally requesting a sorting for which no index existed. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], an index is not required to support a certain sorting, but sorting without an index could lead to bad performance if a search returns a large result set, which would then have to be sorted before the first row is returned.  

## Example  
 This example shows how to use the **CALCFIELDS** method to find the balance on December 31, 2008 and the net change for a customer in 2008.  

 This example requires that you create the following variable.  

|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerRec|Record|Customer|  

```  
CustomerRec.SETRANGE("Date Filter",010108D,123108D);  
CustomerRec.CALCFIELDS(Balance, "Net Change");  
```  

 The first line sets up a filter for the Date Filter field in the Customer record. This field is a FlowFilter field which is used in the filter definition for several FlowFields in the Customer record. In the second line, the FlowFields are calculated.  

## See Also  
 [FlowFields](../devenv-flowfields.md)     
 [FieldClass Property](../properties/devenv-FieldClass-Property.md)
