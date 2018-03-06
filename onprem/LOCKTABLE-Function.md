---
title: "LOCKTABLE Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: dd38a304-eb98-4100-8561-b04d8c0aa1f7
caps.latest.revision: 9
manager: edupont
---
# LOCKTABLE Function
Ordinarily, when you are developing applications in [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], you do not want to consider transactions and table locking. However, there are some situations in which you must lock a table explicitly. To do this, use the [LOCKTABLE Function \(Record\)](LOCKTABLE-Function--Record-.md).  
  
 For example, in the beginning of a function, you inspect data in a table and then use this data to perform various checks and calculations. Finally, you want to insert a record based on the result of these calculations. To make sure that your calculations make sense, you must be certain that the values that you retrieved at the beginning of the transaction are consistent with the data that is in the table now. You cannot allow other users to update the table when your function is performing its calculations.  
  
## LOCKTABLE Function  
 You can use the LOCKTABLE function to lock the table at the start of your function.  
  
 LOCKTABLE has the following syntax.  
  
```  
Record.LOCKTABLE  
```