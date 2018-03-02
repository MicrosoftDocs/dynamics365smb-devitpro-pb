---
title: "INIT Method (Record)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 210b187f-76ff-4835-9ada-a682fcf93a34
caps.latest.revision: 11
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# INIT Method (Record)
Initializes a record in a table.  
  
## Syntax  
  
```  
  
Record.INIT  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that you want to initialize.  
  
## Remarks  
 This method assigns default values to each field in the record. The values that are assigned in the record correspond to those defined when the table was created. If no value was assigned when the table was created, the values are assigned based on the data type, as shown in the following table.  
  
|Data type|Default value|  
|---------------|-------------------|  
|BigInteger|0|  
|BigText|\<Empty>|  
|BLOB|\<Empty>|  
|Boolean|No|  
|Code|'' \(empty string\)|  
|Date|0d \(Undefined date\)|  
|DateFormula|'' \(empty string\)|  
|DateTime|0DT \(Undefined datetime\)|  
|Decimal|0.0|  
|Duration|0|  
|GUID|00000000-0000-0000-0000-000000000000|  
|Integer|0|  
|Option|0|  
|RecordID|\<Empty>|  
|TableFilter|\<Empty>|  
|Text|'' \(empty string\)|  
|Time|0T \(Undefined time\)|  
  
 Primary key and timestamp fields are not initialized.  
  
 After the method executes, you can change the values in any of the fields before you call the [INSERT Method \(Record\)](devenv-INSERT-Method-Record.md) to enter the record in the table. Be sure that the fields that make up the primary key contain values that make the total primary key unique. If the primary key is not unique \(such as the record already exists\), then the record is rejected.  
  
## Example  
 In this example, assume that the primary key includes the "No." field. This example requires that you create a Record variable named CustomerRec for the **Customer** table.  
  
```  
// Scenario 1  
CustomerRec.INIT;  
CustomerRec."No." := '1120';  
CustomerRec.INSERT;  
// Scenario 2  
CustomerRec."No." := '1120';  
CustomerRec.INIT;  
CustomerRec.INSERT;  
```  
  
 Since **INIT** does not initialize the primary key fields, the order of the statements in this example is not important. Scenario 1 causes the same result as scenario 2.  
  
## See Also  
 [Record Data Type](../datatypes/devenv-Record-Data-Type.md)