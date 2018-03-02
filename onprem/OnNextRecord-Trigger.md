---
title: "OnNextRecord Trigger"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 2e946369-2c8b-47f2-8f3e-0bd805f5c94a
caps.latest.revision: 7
manager: edupont
---
# OnNextRecord Trigger
Determines the next record to be displayed.  
  
## Syntax  
  
```  
  
[ActualSteps]:=OnNextRecord(Steps)  
```  
  
#### Parameters  
 *Steps*  
  
 \(Integer\) The number of records stepped through before displaying another record. A negative value indicates steps backwards.  
  
## Return Value  
 *ActualSteps*  
  
 \(Integer\) This return value contains the actual number of steps or records cycled through. The default value is zero \(0\).  
  
## Applies To  
  
-   Pages  
  
## Remarks  
 This trigger is executed in place of the default next record behavior.  
  
 If an error occurs in the trigger code, the page is closed.  
  
## See Also  
 [Triggers](Triggers.md)