---
title: "Troubleshooting: Tenant 'default' is not accessible"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Troubleshooting: Tenant 'default' is not accessible
When you start a [!INCLUDE[navnow_md](includes/navnow_md.md)] client, you get the following error.  
  
 **Tenant 'default' is not accessible**  
  
In a multitenant deployment, `default` will be replaced by the ID of the tenant that the client is trying to connect to. 
 
## Resolution  
This error is most likely caused by the tenant having the state `OperationalWithSyncPending`. A tenant will have the `OperationalWithSyncPending` state if changes have been made to one or more application tables, but the schema changes have not been synchronized with the tenant.

To verify the state of the tenant, run the [Get-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/get-navtenant). 

If the state is `OperationalWithSyncPending`, you must synchronize the tenant with the application in order for clients to be able to connect. For more information, see [How to: Synchronize the Tenant Database with the Application Database](How-to--Synchronize-the-Tenant-Database-with-the-Application-Database.md).

>[!TIP]
>The [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance has a configuration setting, called **Allow Session While Sync Pending**, that you can change to allow client connections when the tenant is in this state. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md#General).  
  
  
## See Also 
[Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)  