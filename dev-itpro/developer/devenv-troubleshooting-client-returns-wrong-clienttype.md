---
title: Troubleshooting client returns wrong CLIENTTYPE
description: Learn how to ensure that the correct client type is returned for each client.
ms.custom: na
ms.date: 12/22/2023
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: troubleshooting
author: blrobl
---

# Troubleshooting client returns wrong CLIENTTYPE

Running, for example, the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] simultaneously in the same browser session will return the same `CLIENTTYPE`.

If you have implemented code that checks for the `CURRENTCLIENTTYPE`, you must run each of the different clients in separate browser windows to make sure that the correct client type is returned for each of the clients.  
  
## See also

[Designing for Different Screen Sizes on Tablet and Phone](devenv-designing-different-screen-sizes-tablet-and-phone.md)   
[CurrentClientType Method](methods-auto/session/session-currentclienttype-method.md)   
[DefaultClientType Method](methods-auto/session/session-defaultclienttype-method.md)