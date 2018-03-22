---
title: "SLEEP Method"
ms.custom: na
ms.date: 07/13/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: e4610f5e-a86b-4994-a6d6-05922716565d
caps.latest.revision: 8
manager: edupont
---

[!INCLUDE[newdev_dev_preview](../includes/newdev_dev_preview.md)]

# SLEEP Method
Returns control to the operating system for a specified time.  
  
## Syntax  
  
```  
  
SLEEP(Duration)  
```  
  
#### Parameters  
 *Duration*  
 Type: Integer  
  
 The number of milliseconds to return control to the operating system.  
  
## Remarks  
 When you use the SLEEP method, control is guaranteed to return to the operating system for at least *Duration* milliseconds.  
  
> [!NOTE]  
>  The period may be longer than *Duration* milliseconds, depending on what the operating system is doing at the time that control is to return to the caller.  
  
## See Also  
 [APPLICATIONPATH Method](devenv-APPLICATIONPATH-Method.md)   
 [GUIALLOWED Method](devenv-GUIALLOWED-Method.md)   
 [HYPERLINK Method](devenv-HYPERLINK-Method.md)   
 [TEMPORARYPATH Method](devenv-TEMPORARYPATH-Method.md)