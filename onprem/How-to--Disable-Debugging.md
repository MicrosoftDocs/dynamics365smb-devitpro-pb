---
title: "How to: Disable Debugging"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b068172d-6223-46cc-b743-bcc00cf193ae
caps.latest.revision: 9
---
# How to: Disable Debugging
You can disable debugging for an instance of [!INCLUDE[nav_server](includes/nav_server_md.md)]. If you disable debugging, then you get an error if you choose **Debug Next** or **Debug** on the **Session List** page.  
  
### To disable debugging  
  
1.  Configure [!INCLUDE[nav_server](includes/nav_server_md.md)] by doing one of the following:  
  
    -   Use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
    -   Edit the CustomSettings.config file. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
2.  Set the **DebuggingAllowed** key to **false**.  
  
## See Also  
 [Debugging](Debugging.md)
