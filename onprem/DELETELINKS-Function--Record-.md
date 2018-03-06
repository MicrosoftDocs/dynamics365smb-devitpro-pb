---
title: "DELETELINKS Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 84041383-ddd5-4762-8298-5ebbee2ac562
caps.latest.revision: 9
manager: edupont
---
# DELETELINKS Function (Record)
Deletes all of the links that have been added to a record.  
  
## Syntax  
  
```  
  
Record.DELETELINKS  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 The record that contains the links to delete.  
  
## Example  
 The following example removes all the links from the specified record \(number 30000\) in the Vendor table. This example requires that you create the following variable in the **C/AL Globals** window.  
  
|Variable name|DataType|Subtype|  
|-------------------|--------------|-------------|  
|MyRecord|Record|Vendor|  
  
```  
  
MyRecord.GET('30000');  
MyRecord.DELETELINKS;  
  
```  
  
## See Also  
 [DELETELINKS Function \(RecordRef\)](DELETELINKS-Function--RecordRef-.md)   
 [Record Data Type](Record-Data-Type.md)