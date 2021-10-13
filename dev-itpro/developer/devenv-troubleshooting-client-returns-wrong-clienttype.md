---
title: "Troubleshooting: Client Returns Wrong CLIENTTYPE"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: troubleshooting
ms.service: "dynamics365-business-central"
author: blrobl
---
# Troubleshooting: Client Returns Wrong CLIENTTYPE
Running, for example, the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] simultaneously in the same browser session will return the same `CLIENTTYPE`.  
  
 If you have implemented code that checks for the `CURRENTCLIENTTYPE`, you must run each of the different clients in separate browser windows to make sure that the correct client type is returned for each of the clients.  
  
## See Also   
 [Designing for Different Screen Sizes on Tablet and Phone](devenv-designing-different-screen-sizes-tablet-and-phone.md)   
 [CurrentClientType Method](methods-auto/session/session-currentclienttype-method.md)   
 [DefaultClientType Method](methods-auto/session/session-defaultclienttype-method.md)