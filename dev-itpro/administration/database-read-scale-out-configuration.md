---
title: Configuring a Database for Read Scale-Out
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Configuring a [!INCLUDE[prodshort.md](../developer/includes/prodshort.md)] Database for Read Scale-Out

[!INCLUDE[2020_releasewave1.md](../includes/2020_releasewave1.md)]

In the [!INCLUDE[prodshort.md](../developer/includes/prodshort.md)] Online service, read scale-out is readily available and automatically enabled on the databases.

For [!INCLUDE[prodshort.md](../developer/includes/prodshort.md)] on-premises, you must do the following steps: 

1. Check whether your database supports read scale-out.
2. Enable read scale-out.

If the [!INCLUDE[prodshort.md](../developer/includes/prodshort.md)] database runs on Azure SQL Database, determine whether the performance tier of the database supports read scale-out and how to enable the feature. For more information, see [Use read-only replicas to load-balance read-only query workloads](https://docs.microsoft.com/en-us/azure/sql-database/sql-database-read-scale-out) in the Azure SQL Database documentation.

If the [!INCLUDE[prodshort.md](../developer/includes/prodshort.md)] database runs on SQL Server, determine whether your installation supports read scale-out and how to enable the feature. For more information, see [Configure read-only routing for an Always On availability group](https://docs.microsoft.com/en-us/sql/database-engine/availability-groups/windows/configure-read-only-routing-for-an-availability-group-sql-server) in the SQL Server documentation.

## See also

[Using Read Scale-Out for Better Performance](../administration/database-read-scale-out-overview.md)  
[Optimizing SQL Server Performance](../administration/optimize-sql-server-performance.md)  
[DataAccessIntent Property](../developer/properties/devenv-dataaccessintent-property.md)  
