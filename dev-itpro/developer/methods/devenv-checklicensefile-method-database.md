---
title: "CHECKLICENSEFILE Method (Database)"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 75a44f18-76d3-4768-82fc-b1de595d7e6b
author: SusanneWindfeldPedersen
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CHECKLICENSEFILE Method (Database)
Checks a key in the license file of the system.  
  
## Syntax  
  
```  
  
CHECKLICENSEFILE(KeyNumber)  
```  
  
#### Parameters  
 *KeyNumber*  
 Type: Integer  
  
 The number of the key you want to check.  
  
## Remarks  
 The license file turns on or off different system capabilities. Use this method to check a key in the file for the current user. If the user has no access rights to the object, a message is displayed and the process is terminated.  
  
 If you omit this method, the user will have the ability to continue regardless of whether the appropriate license file is open.  
  
## See Also  
 [Database Methods](devenv-database-methods.md)