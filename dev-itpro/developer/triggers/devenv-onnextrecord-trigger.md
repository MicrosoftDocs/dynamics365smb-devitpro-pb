---
title: "OnNextRecord Trigger"
ms.custom: na
ms.date: 06/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 2e946369-2c8b-47f2-8f3e-0bd805f5c94a
author: SusanneWindfeldPedersen
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
 [Triggers](devenv-triggers.md)  
 [Page and Action Triggers](devenv-page-and-action-triggers.md)  
 [Page Properties](../properties/devenv-page-properties.md)  
