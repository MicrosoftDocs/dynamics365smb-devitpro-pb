---
title: "COUNT Function (RecordRef)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0c799170-86f6-4cba-8982-4c4af850bf94
caps.latest.revision: 15
manager: edupont
---
# COUNT Function (RecordRef)
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
 This function returns the number of records that meet the conditions of any filters associated with the records. If no filters are set, the function shows the total number of records in the table.  
  
> [!NOTE]  
>  The COUNT function does not lock the table before it retrieves the number of records in the table. This means that the function reads both uncommitted and committed data, which could cause the number of records that is returned to be inaccurate. To make sure that the count is accurate, use the [LOCKTABLE Function \(RecordRef\)](LOCKTABLE-Function--RecordRef-.md) before you use the COUNT function.  
  
 In previous versions of [!INCLUDE[navnow](includes/navnow_md.md)], the COUNT function ignored security filters and always returned the total number of records unless you called the SETPERMISSIONFILTER function to get a filtered count. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the COUNT function adheres to the [SecurityFiltering Property](SecurityFiltering-Property.md). For more information, see [Security Filter Modes](Security-Filter-Modes.md).  
  
 This function works just like the [COUNT Function \(Record\)](COUNT-Function--Record-.md).  
  
## Example  
 The following example opens table number 18 \(Customer\) as a RecordRef that is named MyRecordRef. The [LOCKTABLE Function \(RecordRef\)](LOCKTABLE-Function--RecordRef-.md) locks the table. The COUNT function then retrieves the number of records in the table. The number of records is stored in the Count variable. The name of the table and the number of records in the table is displayed in a message box. The varTableNo variable can be used to open any table and get the number of records in that table by changing the value of the varTableNo variable. This example requires that you create the following variables and text constant in the **C/AL Globals** window.  
  
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
 [RecordRef Data Type](RecordRef-Data-Type.md)