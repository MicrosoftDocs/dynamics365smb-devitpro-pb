---
title: "CHECKLICENSEFILE Function (Database)"
ms.custom: na
ms.date: 06/04/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 75a44f18-76d3-4768-82fc-b1de595d7e6b
caps.latest.revision: 7
manager: edupont
---
# CHECKLICENSEFILE Function (Database)
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
 The license file turns on or off different system capabilities. Use this function to check a key in the file for the current user. If the user has no access rights to the object, a message is displayed and the process is terminated.  
  
 If you omit this function, the user will have the ability to continue regardless of whether the appropriate license file is open.  
  
## See Also  
 [Database](Database.md)