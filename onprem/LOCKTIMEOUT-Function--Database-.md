---
title: "LOCKTIMEOUT Function (Database)"
author: edupont04
ms.custom: na
ms.date: 10/14/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a11adeb8-faf1-41bc-9742-5039c3621335
caps.latest.revision: 7
manager: edupont04
---
# LOCKTIMEOUT Function (Database)
Determines whether the lock time-out setting is set to **On**. You can also use this function to override the default setting.  

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
 This function has been designed specifically for use in long-running processes that should not be terminated because of a lock time-out, for example batch jobs that run overnight.  

 When the C/AL code has finished running, the default setting is used again. This function does not change the duration of a lock time-out.  

 To change the default setting in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **File** menu, choose **Database**, and then choose **Alter** to open the **Alter Database** window. Choose the **Advanced** tab and select or clear the **Lock time-out** field.  

## See Also  
 [Database](Database.md)
