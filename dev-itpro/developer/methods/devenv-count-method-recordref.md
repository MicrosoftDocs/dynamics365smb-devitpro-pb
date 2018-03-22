---
title: "COUNT Method (RecordRef)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 0c799170-86f6-4cba-8982-4c4af850bf94
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# COUNT Method (RecordRef)
Counts the number of records that are in the filters that are currently applied to the table referred to by the RecordRef.  
  
## Syntax  
  
```  
  
Number := RecordRef.COUNT  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 The RecordRef that refers to the table.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of records in the table.  
  
## Remarks  
 This method returns the number of records that meet the conditions of any filters associated with the records. If no filters are set, the method shows the total number of records in the table.  
  
> [!NOTE]  
>  The COUNT method does not lock the table before it retrieves the number of records in the table. This means that the method reads both uncommitted and committed data, which could cause the number of records that is returned to be inaccurate. To make sure that the count is accurate, use the [LOCKTABLE Method \(RecordRef\)](devenv-LOCKTABLE-Method-RecordRef.md) before you use the COUNT method.  
  
 In previous versions of [!INCLUDE[d365fin_md](../includes/d365fin_md.md)], the COUNT method ignored security filters and always returned the total number of records unless you called the SETPERMISSIONFILTER method to get a filtered count. In [!INCLUDE[d365fin_long_md](../includes/d365fin_long_md.md)], the COUNT method adheres to the [SecurityFiltering Property](../properties/devenv-SecurityFiltering-Property.md). <!--Links For more information, see [Security Filter Modes](Security-Filter-Modes.md)-->.  
  
 This method works just like the [COUNT Method \(Record\)](devenv-COUNT-Method-Record.md).  
  
## Example  
 The following example opens table number 18 \(Customer\) as a RecordRef that is named MyRecordRef. The [LOCKTABLE Method \(RecordRef\)](devenv-LOCKTABLE-Method-RecordRef.md) locks the table. The COUNT method then retrieves the number of records in the table. The number of records is stored in the Count variable. The name of the table and the number of records in the table is displayed in a message box. The varTableNo variable can be used to open any table and get the number of records in that table by changing the value of the varTableNo variable. This example requires that you create the following global variables and text constant.  
  
|Variable name|DataType|  
|-------------------|--------------|  
|MyRecordRef|RecordRef|  
|Count|Integer|  
|varTableNo|Integer|  
  
|Text constant name|DataType|ENU value|  
|------------------------|--------------|---------------|  
|Text000|Text|The number of records in the %1 table is: %2.|  
  
```  
varTableNo := 18;  
MyRecordRef.OPEN(varTableNo);  
MyRecordRef.LOCKTABLE;  
Count := MyRecordRef.COUNT;  
MESSAGE(Text000, MyRecordRef.NAME, Count);  
```  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)