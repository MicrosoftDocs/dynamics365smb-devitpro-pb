---
title: "SLEEP Function"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e4610f5e-a86b-4994-a6d6-05922716565d
caps.latest.revision: 8
manager: edupont
---
# SLEEP Function
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
 When you use the SLEEP function, control is guaranteed to return to the operating system for at least *Duration* milliseconds.  
  
> [!NOTE]  
>  The period may be longer than *Duration* milliseconds, depending on what the operating system is doing at the time that control is to return to the caller.  
  
## See Also  
 [APPLICATIONPATH Function](APPLICATIONPATH-Function.md)   
 [GUIALLOWED Function](GUIALLOWED-Function.md)   
 [HYPERLINK Function](HYPERLINK-Function.md)   
 [TEMPORARYPATH Function](TEMPORARYPATH-Function.md)