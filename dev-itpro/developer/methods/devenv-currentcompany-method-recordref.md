---
title: "CURRENTCOMPANY Method (RecordRef)"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: cb25b6b9-9413-46f8-b5e2-e7d270001124
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CURRENTCOMPANY Method (RecordRef)
Gets the current company of a database table referred to by a RecordRef.  
  
## Syntax  
  
```  
  
CurrentCompany := RecordRef.CURRENTCOMPANY  
```  
  
#### Parameters  
 *RecordRef*  
 Type: RecordRef  
  
 A RecordRef that refers to the table for which you want to find the company that is currently in use.  
  
## Property Value/Return Value  
 Type: Text or code  
  
 The name of the current company of *Record*.  
  
## See Also  
 [RecordRef Data Type](../datatypes/devenv-RecordRef-Data-Type.md)   
 [CURRENTCOMPANY Method \(Record\)](devenv-CURRENTCOMPANY-Method-Record.md)