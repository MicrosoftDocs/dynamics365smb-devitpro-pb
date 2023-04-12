---
title: "Using the PingPong Add-in"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ed66301c-cdff-4992-9ef1-60fd744097e5
caps.latest.revision: 3
---
# Using the PingPong Add-in
The [!INCLUDE[navnow](includes/navnow_md.md)] PingPong add-in can be invoked to request a callback after a specified timeout. The PingPong add-in does one callback on request. The callback is requested from C/AL code by specifying the time to wait in milliseconds.  
  
Using the PingPong add-in instead of a timer is recommended, because you can run all of the C/AL code on the trigger. If you use a server timer, you cannot trigger events on the client.

> [!NOTE]   
> The PingPong add-in is only supported in the [!INCLUDE[nav_windows_md](includes/nav_windows_md.md)] 
  
## Using PingPong Events  
  
```  
PingPong::AddInReady()  
      CurrPage.PingPong.Ping(500);  
```  
  
```  
PingPong::Pong()  
      CurrPage.PingPong.Ping(1000);  
```
