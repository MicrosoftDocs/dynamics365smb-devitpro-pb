---
title: "Troubleshooting: Client Returns Wrong CLIENTTYPE"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 703de4b4-115c-4d7e-ae80-57761a996fbf
caps.latest.revision: 3
---
# Troubleshooting: Client Returns Wrong CLIENTTYPE
Running, for example, the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] simultaneously in the same browser session will return the same `CLIENTTYPE`.  
  
 If you have implemented code that checks for the `CURRENTCLIENTTYPE`, you must run each of the different clients in separate browser windows to make sure that the correct client type is returned for each of the clients.  
  
## See Also  
 [Troubleshooting: Client Returns Wrong CLIENTTYPE](Troubleshooting--Client-Returns-Wrong-CLIENTTYPE.md)   
 [Designing for Different Screen Sizes on Tablet and Phone](Designing-for-Different-Screen-Sizes-on-Tablet-and-Phone.md)   
 [CURRENTCLIENTTYPE Function](CURRENTCLIENTTYPE-Function.md)   
 [DEFAULTCLIENTTYPE Function](DEFAULTCLIENTTYPE-Function.md)