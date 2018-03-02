---
title: "CLEARLASTERROR Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 808e5173-2e31-4f8c-8b13-38c948b3690c
caps.latest.revision: 10
---
# CLEARLASTERROR Function
Removes the last error message from memory.  
  
## Syntax  
  
```  
  
CLEARLASTERROR  
```  
  
## Remarks  
 You can use the [GETLASTERRORTEXT Function](GETLASTERRORTEXT-Function.md) to determine whether an error has occurred and to see the text in the last error message that was generated. You can then use the CLEARLASTERROR function to remove the last error message from memory. If you subsequently call the GETLASTERRORTEXT function, an empty string is returned.  
  
## See Also  
<!-- [Error Handling](Error-Handling.md) -->