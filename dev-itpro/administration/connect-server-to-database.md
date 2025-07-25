---
title: Server Instance Database Connection
description: This procedure describes how to use the Server Administration tool to change the Dynamics NAV database to which a Server instance connects.
author: jswymer
ms.author: jswymer
ms.custom:
  - bap-template
  - evergreen
ms.date: 04/16/2024
ms.update-cycle: 1095-days
ms.reviewer: jswymer
ms.service: dynamics-365-op
ms.topic: how-to
---

# Connecting a Business Central Server Instance to a Database

This procedure describes how to use the [!INCLUDE[admintool](../developer/includes/admintool.md)] to change the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database to which a [!INCLUDE[server](../developer/includes/server.md)] instance connects.  

### To connect a database to a [!INCLUDE[server](../developer/includes/server.md)] instance  

1.  Start the [!INCLUDE[admintool](../developer/includes/admintool.md)].  

     For more information, see [Business Central Server Administration Tool](Administration-Tool.md).  

2.  Navigate to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] server instance that you want to connect the database to, and then choose the **Edit** button.  

3.  On the **Database** section, change the following fields to point at the converted database:  

    -   **Database Instance**  

    -   **Database Name**  

    -   **Database Server**  

    > [!IMPORTANT]  
    >  With a large database, increase the **SQL Command Timeout** setting to avoid timeouts during schema synchronization. The default setting is 30 minutes.  

4.  Choose the **Save** button, and then, in the dialog box that appears, choose the **OK** button.  

5.  In the left pane, choose the [!INCLUDE[server](../developer/includes/server.md)] computer where the service instance that you modified in the previous step runs.  

     Unless you are administering a remote computer, this is **Microsoft Dynamics 365 Business Central \(local\)**.  

6.  In the central pane, right-click the service instance that you modified, and then choose **Restart**.  

     This stops and restarts the service instance, and the service instance now connects to the converted database.  

## Related information
  
[Upgrading the Data](../upgrade/Upgrading-the-Data.md)  
[Converting a Database](../upgrade/converting-a-database.md)  
[Configuring the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Database](configure-sql-server-authentication.md)  
[Optimizing SQL Server Performance with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]](optimize-sql-server-performance.md)  
[Configuring [!INCLUDE[server](../developer/includes/server.md)] (Database Settings)](configure-server-instance.md#Database)  
