---
author: jswymer
ms.topic: include
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---
Once you set up cloud migration for an environment, the environment can't be updated. If you want to update the environment, you must disable cloud migration. If an update is available, and you haven't started migration, then update the target environment first, then migrate. If you've already started the cloud migration process, we recommend that you continue migrating all companies, complete cloud migration, and then update to the next major or minor version. <!--If you want to move more companies, set up cloud migration again once the update is complete.--> Separating updates from cloud migration helps avoid data corruption if the update touches tables with records in both migrated and nonmigrated companies.

