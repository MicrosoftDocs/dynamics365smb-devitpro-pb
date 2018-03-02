---
title: "COUNT Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e2e057d8-66c9-4d0d-be47-07d5047f072b
caps.latest.revision: 16
manager: edupont
---
# COUNT Function (Record)
Counts the number of records in a table.  
  
## Syntax  
  
```  
  
Number := Record.COUNT  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 Refers to the table to be counted.  
  
## Property Value/Return Value  
 Type: Integer  
  
 The number of records in the table.  
  
## Remarks  
 This function returns the number of records that meet the conditions of any filters associated with the records. If no filters are set, then the function shows the total number of records in the table. 

> [!IMPORTANT]
> If you use the COUNT function to return the number of records in a CRM integration table, a maximum count of 5000 is returned. The software development kit for Dynamics CRM does not include support for counting large entity collections. As a result, if a CRM integration table contains thousands of records, COUNT returns a maximum count of 5000.  
> 
>  The **COUNT** function does not lock the table before retrieving the number of records in the table. This means that the function reads both uncommitted and committed data, which could cause the number of records that are returned to be inaccurate. To ensure that the count is accurate, use the [LOCKTABLE Function \(Record\)](LOCKTABLE-Function--Record-.md) before you use the **COUNT** function.  
 
 In previous versions of [!INCLUDE[navnow](includes/navnow_md.md)], the **COUNT** function ignored security filters and always returned the total number of records unless you called the **SETPERMISSIONFILTER** function to get a filtered count. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the **COUNT** function adheres to the [SecurityFiltering Property](SecurityFiltering-Property.md). For more information, see [Security Filter Modes](Security-Filter-Modes.md).  
  
## Example  
 This example requires that you create the following variables.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|CustomerCount|Integer|Not applicable|  
|CustomerRec|Record|Customer|  
  
```  
CustomerCount := CustomerRec.COUNT;  
// This statement assigns the number of records in the Customer table  
// to the CustomerCount variable. This statement is the same as:  
CustomerCount := 0;  
IF CustomerRec.FIND('-') THEN  
  REPEAT  
    CustomerCount := CustomerCount + 1;  
  UNTIL CustomerRec.NEXT = 0;  
```  
  
 Retrieving the count by using the first statement in the example is much faster because only one command to the Database Management System \(DBMS\) is needed.  
  
## See Also  
 [Record Data Type](Record-Data-Type.md)