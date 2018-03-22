---
title: "CLEARLASTERROR Method"
ms.custom: na
ms.date: 07/04/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: 808e5173-2e31-4f8c-8b13-38c948b3690c
author: SusanneWindfeldPedersen
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# CLEARLASTERROR Method
Removes the last error message from memory.  
  
## Syntax  
  
```  
  
CLEARLASTERROR  
```  
  
## Remarks  
 You can use the [GETLASTERRORTEXT Method](devenv-GETLASTERRORTEXT-Method.md) to determine whether an error has occurred and to see the text in the last error message that was generated. You can then use the CLEARLASTERROR method to remove the last error message from memory. If you subsequently call the GETLASTERRORTEXT method, an empty string is returned.  
  
## See Also  
 [Error Handling Methods](devenv-error-handling-methods.md)