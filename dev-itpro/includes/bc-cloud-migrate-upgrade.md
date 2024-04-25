---
author: edupont04
ms.topic: include
ms.date: 12/22/2021
ms.author: edupont
---
Once you set up cloud migration for an environment, the environment can't be updated. If you want to update the environment, you must disable cloud migration. If an update is available, and you haven't started migration, then update target environment first, then migrate. If you have already started the cloud migration process, we recommend that you continue migrating all companies, complete cloud migration, and then update to the next major/minor. <!--If you want to move more companies, set up cloud migration again once the update is complete.--> By separating update from cloud migration, we remove the risk of potentially corrupting data if the update touches tables with records in both migrated and non-migrated companies. 

