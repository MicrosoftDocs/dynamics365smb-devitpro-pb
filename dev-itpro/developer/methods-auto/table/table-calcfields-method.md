---
title: "CalcFields Method"
ms.author: solsen
ms.custom: na
ms.date: 11/02/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: solsen
---
[//]: # (START>DO_NOT_EDIT)
[//]: # (IMPORTANT:Do not edit any of the content between here and the END>DO_NOT_EDIT.)
[//]: # (Any modifications should be made in the .xml files in the ModernDev repo.)
# CalcFields Method
Calculates the FlowFields in a record. You specify which fields to calculate by using parameters.

## Syntax
```
[Ok := ]  Table.CalcFields(Field1: Any, [Field2: Any,...])
```
## Parameters
*Table*  
&emsp;Type: [Table](table-data-type.md)  
An instance of the [Table](table-data-type.md) data type.  

*Field1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  
*Field2*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.  If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.    


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks  
 FlowFields are virtual fields. The values in these fields are not saved in the table. This means that you must use either the **CALCFIELDS** method or the [SETAUTOCALCFIELDS Method \(Record\)](../../methods/devenv-setautocalcfields-method-record.md) to update them. For example, if you retrieve a record using the [FIND Method \(Record\)](../../methods/devenv-find-method-record.md) and [NEXT Method \(Record\)](../../methods/devenv-next-method-record.md), the FlowFields in those records are set to zero \(0\). Then, when you call **CALCFIELDS**, their values are updated.  

 When a FlowField is a direct source expression on a page or a report, the calculation is performed automatically.  

 You can also use the **CALCFIELDS** method to retrieve binary large objects \(BLOBs\). For more information, see [BLOB Data Type](../../datatypes/devenv-blob-data-type.md).  

 If possible, the **CALCFIELDS** method uses SumIndexField Technology \(SIFT\). SIFT is used only if the following conditions are true:  

-   The [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] key contains the fields that are used in the filters that are defined for the FlowField.  

-   The SumIndexFields on the [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] key contain the fields that are provided as parameters for calculation.  

-   The [MaintainSIFTIndex Property](../../properties/devenv-maintainsift-index-property.md) is set to **true**.  

    > [!NOTE]  
    >  By default this property is set to **true** for all keys.  

> [!NOTE]  
>  [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)] automatically maintains a count for all SIFT indexes. Therefore, if the calculation method for a FlowField is COUNT or AVERAGE, then the condition that the SumIndexFields on the [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] key contain the fields that are provided as parameters for calculation is not required.  

 For [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], **CALCFIELDS** execution is decoupled from [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] SIFT index definitions. This means that if the conditions for using SIFT indexes are not true, then [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)] traverses all records in the base table to perform the calculation instead of using SIFT. This can reduce the number of required SIFT indexes, which can improve performance. In earlier versions of [!INCLUDE[d365fin_md](../../includes/d365fin_md.md)], if the conditions for using SIFT indexes were not true and the **MaintainSIFTIndex** property was enabled, then you received an error when you called the **CALCFIELDS** method. This provided a degree of protection in earlier versions against accidentally requesting a sorting for which no index existed. In [!INCLUDE[d365fin_long_md](../../includes/d365fin_long_md.md)], an index is not required to support a certain sorting, but sorting without an index could lead to bad performance if a search returns a large result set, which would then have to be sorted before the first row is returned.  

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
[Table Data Type](table-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)