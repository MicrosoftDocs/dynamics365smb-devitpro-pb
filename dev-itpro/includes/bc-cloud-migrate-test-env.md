---
author: edupont04
ms.topic: include
ms.date: 02/18/2021
ms.author: edupont
---
To help you test the migration, you can migrate data to the target production environment, and then create a sandbox environment based on this production environment. For [!INCLUDE[prod_short](prod_short.md)] on-premises, first use the data replication step in the production environment, and then run the data upgrade step in the sandbox environment for safe testing before you run the data upgrade step in the production environment.  

> [!IMPORTANT]
> If you create a sandbox environment that is a copy of the production environment, do not run the replication in the sandbox. Always run the data replication in the environment that you plan to use for production, and then create a new sandbox copy.

For Dynamics GP, you can create a diagnostics run from the **Cloud Migration Management** page to do more data validation/verification before the migration is run so that you can decrease the risk of a failed migration.  
