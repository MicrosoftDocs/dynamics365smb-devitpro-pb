---
author: edupont04
ms.topic: include
ms.date: 11/30/2022
ms.author: jswymer
---
To help you test the migration, you can migrate data to the target production environment, and then create a sandbox environment based on this production environment. For [!INCLUDE[prod_short](prod_short.md)] on-premises, first use the data replication step in the production environment, and then run the data upgrade step in the sandbox environment for safe testing before you run the data upgrade step in the production environment.  

> [!IMPORTANT]
> Only run the data migration into a single environment. Don't reuse the same on-premises database for multiple data migrations&mdash;restore a fresh backup of the database. You have the option of migrating to a sandbox, copying to another sandbox, and testing upgrade there. If successful, you can then copy the upgraded sandbox to the production environment and delete all other environments. <!--If you create a sandbox environment that is a copy of the production environment, don't run the replication in the sandbox. Always run the data replication in the environment that you plan to use for production, and then create a new sandbox copy.-->

<!--For Dynamics GP, you can create a diagnostics run from the **Cloud Migration Management** page to do more data validation/verification before the migration is run so that you can decrease the risk of a failed migration. --> 
