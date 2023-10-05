---
author: jswymer
ms.topic: include
ms.date: 10/05/2023
ms.author: jswymer
---
You can upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online from supported versions of [!INCLUDE[navnow_md](navnow_md.md)] on-premises, provided that your application customization is handled by extensions. Any data from tables with code customizations cannot be carried forward from [!INCLUDE[navnow_md](navnow_md.md)].  

> [!NOTE]
> Upgrade your solution to Business Central Spring 2019 (version 14) or later, and then migrate to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online.

The process consists of two parts:

- Upgrade from [!INCLUDE[navnow_md](navnow_md.md)] to [!INCLUDE[prod_short](prod_short.md)] using the tools described in [Upgrading to Business Central on-premises (version 14)](upgrading-to-business-central-on-premises.md). For more information, see [Supported Upgrade Paths to [!INCLUDE[prod_long](prod_long.md)] Releases](upgrade-paths.md).  
- Convert non-standard functionality and customizations to apps and per-tenant extensions. For more information, see [Deploying a Tenant Customization](../developer/devenv-deploy-tenant-customization.md).
- Run the cloud migration tool as described in [Migrate On-Premises Data to Business Central Online](../../administration/migrate-data.md), and then switch to use [!INCLUDE[prod_short](prod_short.md)] online going forward.