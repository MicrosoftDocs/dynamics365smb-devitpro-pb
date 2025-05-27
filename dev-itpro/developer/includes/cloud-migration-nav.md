---
author: jswymer
ms.topic: include
ms.date: 05/19/2025
ms.author: jswymer
ms.reviewer: jswymer
---
You can upgrade to [!INCLUDE[prod_short](prod_short.md)] online from supported versions of [!INCLUDE[navnow_md](navnow_md.md)] on-premises, provided that your application customization is handled by extensions. Any data from tables with code customizations cannot be carried forward from [!INCLUDE[navnow_md](navnow_md.md)].  

> [!NOTE]
> Upgrade your solution to Business Central Spring 2019 (version 14) or later, and then migrate to [!INCLUDE [prod_short](prod_short.md)] online.

The process consists of three parts:

1. Upgrade from [!INCLUDE[navnow_md](navnow_md.md)] to [!INCLUDE[prod_short](prod_short.md)] version 14. Learn more in [Upgrading to Business Central on-premises (version 14)](../../upgrade/upgrading-to-business-central-on-premises.md).

   Convert non-standard functionality and customizations to apps and per-tenant extensions. Learn more in [Deploying a Tenant Customization](../devenv-deploy-tenant-customization.md).
1. Upgrade to at least [!INCLUDE[prod_short](prod_short.md)] version 25.0.
1. Migrate to [!INCLUDE[prod_short](prod_short.md)] online and then switch to use it going forward. Learn more in [Migrate On-Premises Data to Business Central Online](../../administration/migrate-data.md).
