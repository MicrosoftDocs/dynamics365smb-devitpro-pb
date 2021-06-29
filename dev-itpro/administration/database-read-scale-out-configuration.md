---
title: Configuring a Database for Read Scale-Out
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Configuring a [!INCLUDE[prod_short.md](../developer/includes/prod_short.md)] Database for Read Scale-Out

[!INCLUDE[2020_releasewave1.md](../includes/2020_releasewave1.md)]

In the [!INCLUDE[prod_short.md](../developer/includes/prod_short.md)] Online service, read scale-out is readily available and automatically enabled on the databases.

For [!INCLUDE[prod_short.md](../developer/includes/prod_short.md)] on-premises, you must do the following steps: 

1. Check whether your database supports read scale-out.
2. Enable read scale-out on the database.

    If the [!INCLUDE[prod_short.md](../developer/includes/prod_short.md)] database runs on Azure SQL Database, determine whether the performance tier of the database supports read scale-out. You can then enable it if it's supported. For more information, see [Use read-only replicas to load-balance read-only query workloads](/azure/sql-database/sql-database-read-scale-out) in the Azure SQL Database documentation.
    
    If the [!INCLUDE[prod_short.md](../developer/includes/prod_short.md)] database runs on SQL Server, determine whether your installation supports read scale-out and how to enable the feature. For more information, see [Configure read-only routing for an Always On availability group](/sql/database-engine/availability-groups/windows/configure-read-only-routing-for-an-availability-group-sql-server) in the SQL Server documentation.
3. Enable SQL read-only replica support on the [!INCLUDE[server.md](../developer/includes/server.md)] instance.

    [!INCLUDE[server.md](../developer/includes/server.md)] includes the **Enable SQL Read-Only Replica Support** (EnableSqlReadOnlyReplicaSupport) setting. This setting isn't enabled by default. For more information, see [Configuring Business Central Server](configure-server-instance.md#Database).
    
## See also

[Using Read Scale-Out for Better Performance](../administration/database-read-scale-out-overview.md)  
[Optimizing SQL Server Performance](../administration/optimize-sql-server-performance.md)  
[DataAccessIntent Property](../developer/properties/devenv-dataaccessintent-property.md)  
