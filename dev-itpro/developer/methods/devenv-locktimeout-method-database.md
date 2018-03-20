---
title: "LOCKTIMEOUT Method (Database)"
author: edupont04
ms.custom: na
ms.date: 10/14/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: dynamics365-financials
ms.assetid: a11adeb8-faf1-41bc-9742-5039c3621335
caps.latest.revision: 7
manager: edupont04
---

 

# LOCKTIMEOUT Method (Database)
Determines whether the lock time-out setting is set to **On**. You can also use this method to override the default setting.  

## Syntax  

```  

[LockTimeout :=] LOCKTIMEOUT([LockTimeout])  
```  

#### Parameters  
 *LockTimeout*  
 Type: Boolean  

 The new setting for whether the lock time-out is on.  

## Property Value/Return Value  
 Type: Boolean  

 This value shows whether to use a lock time-out.  

## Remarks  
 This method has been designed specifically for use in long-running processes that should not be terminated because of a lock time-out, for example batch jobs that run overnight.  

When the AL code has finished running, the default setting is used again. This method does not change the duration of a lock time-out.  

## See Also  
 [Database Methods](devenv-database-methods.md)
