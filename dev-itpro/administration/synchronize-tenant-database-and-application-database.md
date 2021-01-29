---
title: "Synchronize the Tenant Database with the Application Database"
description: This article describes how to synchronize the business data (tenant) database schema with the application database in a single tenant or multitenant deployment environment
ms.custom: na
ms.date: 01/29/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Synchronizing the Tenant Database with the Application Database

This article describes how to synchronize the business data \(tenant\) database schema with the application database in either a single tenant (non-multitenant) or multitenant deployment environment. You can synchronize the database from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or by using the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

## Synchronize database from the Dynamics NAV development environment

> **APPLIES TO:** [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019 and earlier.

1. Open [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] as an administrator.

2. On the **Tools** menu, choose **Sync. Schema For All Tables**, and then choose **With Validation** and follow the schema synchronization instructions.

## Synchronize database with the Sync-NAVTenant cmdlet  

1. On the computer that is running the [!INCLUDE[server](../developer/includes/server.md)], run **[!INCLUDE[adminshell](../developer/includes/adminshell.md)]** as an Administrator.  

    1. Choose **Start**, in the **Search** box, type **[!INCLUDE[adminshell](../developer/includes/adminshell.md)]**.  

    2. Right-click the related link, and then choose **Run as Administrator**.  

2. At the command prompt, type one of the following commands:  

    - If the [!INCLUDE[server](../developer/includes/server.md)] instance isn't configured to be a multitenant instance:  

        ```powershell
        Sync-NAVTenant –ServerInstance <ServerInstanceName>  
        ```  

    - If the [!INCLUDE[server](../developer/includes/server.md)] instance is configured to be a multitenant instance:  

        ```powershell
        Sync-NAVTenant –ServerInstance ServerInstanceName -Tenant TenantId  
        ```  

     Change the following parameter values.  

    |Parameter|Description|
    |---------|-----------|
    |ServererInstanceName|Specifies the [!INCLUDE[server](../developer/includes/server.md)] instance.|
    |TenantId|Specifies the ID of the tenant.|

3.  Press Enter to run the cmdlet.  

## See Also  
[Converting a Database.md](../upgrade/Converting-a-Database.md)  
[Upgrading the Database](../upgrade/Upgrading-the-Data.md)  
[Multitenant Deployment Architecture](../deployment/Multitenant-Deployment-Architecture.md)   
