---
title: "LOCKTABLE Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: dd38a304-eb98-4100-8561-b04d8c0aa1f7
caps.latest.revision: 9
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# LOCKTABLE Method
Ordinarily, when you are developing applications, you do not want to consider transactions and table locking. However, there are some situations in which you must lock a table explicitly. To do this, use the [LOCKTABLE Method \(Record\)](devenv-LOCKTABLE-Method-Record.md).  

 For example, in the beginning of a method, you inspect data in a table and then use this data to perform various checks and calculations. Finally, you want to insert a record based on the result of these calculations. To make sure that your calculations make sense, you must be certain that the values that you retrieved at the beginning of the transaction are consistent with the data that is in the table now. You cannot allow other users to update the table when your method is performing its calculations.  

## LOCKTABLE Method  
 You can use the LOCKTABLE method to lock the table at the start of your method.  

 LOCKTABLE has the following syntax.  

```  
Record.LOCKTABLE  
```
