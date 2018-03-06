---
title: Server Instance Database Connection
description: This procedure describes how to use the Server Administration tool to change the Dynamics NAV database to which a Server instance connects.
author: edupont04
ms.author: edupont
ms.custom: na
ms.date: 10/27/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: f98926cc-7881-47cf-9ee3-4fd526d4c200
---

# Connecting a Microsoft Dynamics NAV Server Instance to a Database
This procedure describes how to use the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to change the [!INCLUDE[navnow](includes/navnow_md.md)] database to which a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance connects.  

### To connect a database to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance  

1.  Start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)].  

     For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  

2.  Navigate to the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] server instance that you want to connect to the converted database, and then choose the **Edit** button.  

3.  On the **General** FastTab, change the following fields to point at the converted database:  

    -   **Database Instance**  

    -   **Database Name**  

    -   **Database Server**  

    > [!IMPORTANT]  
    >  With a large database, increase the **SQL Command Timeout** setting to avoid timeouts during schema synchronization. The default setting is 30 minutes.  

4.  Choose the **Save** button, and then, in the dialog box that appears, choose the **OK** button.  

5.  In the left pane, choose the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer where the service instance that you modified in the previous step runs.  

     Unless you are administering a remote computer, this is **Microsoft Dynamics NAV \(local\)**.  

6.  In the central pane, right-click the service instance that you modified, and then choose **Restart**.  

     This stops and restarts the service instance, and the service instance now connects to the converted database.  

7.  To verify that the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance accesses the converted database, open the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and connect to the modified [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)  
