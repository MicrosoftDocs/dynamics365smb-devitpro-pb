---
title: "DELETEALL Function (Record)"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1d09ddc8-5638-4292-977b-be6a39f9d8f1
caps.latest.revision: 10
manager: edupont
---
# DELETEALL Function (Record)
Deletes all records in a table that fall within a specified range.  
  
## Syntax  
  
```  
  
Record.DELETEALL([RunTrigger])  
```  
  
#### Parameters  
 *Record*  
 Type: Record  
  
 Identifies the table in which the deletion will occur. Only those records selected by the filters set for *Record* are deleted.  
  
 *RunTrigger*  
 Type: Boolean  
  
 Specifies whether to run the C/AL code in the [OnDelete Trigger](OnDelete-Trigger.md).  
  
 If this parameter is **true**, then the code in the **OnDelete** trigger will be executed. If this parameter is **false**, then the code in the **OnDelete** trigger will not be executed.  
  
 The default value is **false**.  
  
## Example  
 This example requires that you create a Record variable for the **Customer** table named CustomerRec.  
  
```  
// This C/AL code:  
WHILE CustomerRec.FIND('-') DO  
  CustomerRec.DELETE;  
// Performs the same operation as:  
CustomerRec.DELETEALL;  
```  
  
 When *RunTrigger* is **false** \(the default\), the **DELETEALL** function in this example is much faster than the **DELETE** function because it requires only one call to the server, while the first method requires multiple calls. If *RunTrigger* is **true**, then there will not be any gain in performance because each record needs to be loaded to the client anyway in order to execute the **OnDelete** trigger.  
  
## See Also  
 [DELETE Function \(Record\)](DELETE-Function--Record-.md)   
 [Record Data Type](Record-Data-Type.md)