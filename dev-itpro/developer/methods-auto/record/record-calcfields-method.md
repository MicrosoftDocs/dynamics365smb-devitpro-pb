---
title: "Record.CalcFields Method"
description: "Calculates the FlowFields in a record."
ms.author: solsen
ms.custom: na
ms.date: 06/23/2021
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
# Record.CalcFields Method
> **Version**: _Available or changed with runtime version 1.0._

Calculates the FlowFields in a record. You specify which fields to calculate by using parameters.


## Syntax
```AL
[Ok := ]  Record.CalcFields(Field1: Any [, Field2: Any,...])
```
## Parameters
*Record*  
&emsp;Type: [Record](record-data-type.md)  
An instance of the [Record](record-data-type.md) data type.  

*Field1*  
&emsp;Type: [Any](../any/any-data-type.md)  
  
*[Optional] Field2*  
&emsp;Type: [Any](../any/any-data-type.md)  
  


## Return Value
*[Optional] Ok*  
&emsp;Type: [Boolean](../boolean/boolean-data-type.md)  
**true** if the operation was successful; otherwise **false**.   If you omit this optional return value and the operation does not execute successfully, a runtime error will occur.  


[//]: # (IMPORTANT: END>DO_NOT_EDIT)

## Remarks

 FlowFields are virtual fields. The values in these fields are not saved in the table. This means that you must use either the **CalcFields** method or the [SetAutoCalcFields Method \(Record\)](record-SetAutoCalcFields-method.md) to update them. For example, if you retrieve a record using the [Find Method \(Record\)](record-Find-method.md) and [Next Method \(Record\)](record-next-method.md), the FlowFields in those records are set to zero \(0\). Then, when you call **CalcFields**, their values are updated.  
  
 When a FlowField is a direct source expression on a page or a report, the calculation is performed automatically.  
  
 You can also use the **CalcFields** method to retrieve binary large objects \(BLOBs\). For more information, see [BLOB Data Type](../blob/BLOB-Data-Type.md).  
  
[!INCLUDE[prod_long](../../includes/prod_long.md)] automatically maintains a count for all SIFT indexes. Therefore, SumIndexField Technology (SIFT) is used by default when the calculation method for a FlowField is **Count** or **Average**.

 You can prevent the SIFT indexes from being updated by setting the [MaintainSIFTIndex Property](../../properties/devenv-maintainsiftindex-property.md) of the index in the base table to **False**. Then [!INCLUDE[prod_short](../../includes/prod_short.md)] will traverse all records in the base table to perform the calculation instead of using SIFT. This can reduce the number of required SIFT indexes, which can improve performance. For more information, see [SIFT and Performance](../../devenv-sift-performance.md).
 
 In [!INCLUDE[prod_long](../../includes/prod_long.md)], an index is not required to support a certain sorting, but sorting without an index could lead to bad performance if a search returns a large result set, which would then have to be sorted before the first row is returned.  
  
## Example  
 This example shows how to use the **CalcFields** method to find the balance on December 31, 2008 and the net change for a customer in 2008.  
  
```al
var
    CustomerRec: Record Customer;
begin
    CustomerRec.SetRange("Date Filter",20080101D,20081231D);  
    CustomerRec.CalcFields(Balance, "Net Change");  
end;
```  
  
The first line sets up a filter for the Date Filter field in the Customer record. This field is a FlowFilter field which is used in the filter definition for several FlowFields in the Customer record. In the second line, the FlowFields are calculated.  

## See Also
[Record Data Type](record-data-type.md)  
[Getting Started with AL](../../devenv-get-started.md)  
[Developing Extensions](../../devenv-dev-overview.md)  
[AL Database Methods and Performance on SQL Server](../../../administration/optimize-sql-al-Database-methods-and-performance-on-server.md)
