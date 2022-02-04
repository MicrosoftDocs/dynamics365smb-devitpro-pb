---
author: edupont04
ms.service: dynamics365-business-central
ms.topic: include
ms.date: 12/22/2021
ms.author: edupont
---
If you set up cloud migration for an environment, the environment cannot be upgraded. If you want to upgrade the environment, you must disable cloud migration. If you want to move more companies, set up cloud migration again once the upgrade is complete. By separating upgrade from cloud migration, we remove the risk of potentially corrupting data if the upgrade touches tables with records in both migrated and non-migrated companies. Upgrade the target environment first, then migrate.