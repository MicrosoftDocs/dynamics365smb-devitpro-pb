---
title: Operational challenges with many companies per environment
description: Learn about limitations on environment operations when the environment includes many companies.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer 
ms.service: dynamics365-business-central
ms.date: 01/12/2023
ms.custom: bap-template
---
# Operational challenges with many companies per environment

The Premium/Essentials license subscription for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] comes with one production environment and three sandbox environments free of charge.  These environments can be created and used in any countries/regions where [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is available. If you need more productions environments, you can purchase them via your Cloud Solution Provider (CSP) partner and each of them also comes with three additional sandbox environments.  

Each environment can be divided into multiple companies, where each company defines a legal entity/business unit that has separate accounting requirements. The environment, not the company, is the main unit on which admin operations are done, such as creating, updating, deleting, restoring and [more](/dynamics365/business-central/dev-itpro/administration/tenant-admin-center-environments#operations).  Having too many companies per environment will pose significant operational challenges in managing the lifecycle of environments. For example:

- Azure resources can't be efficiently managed at the company level, because all companies in an environment share the same compute cluster and reside in one database. Consequently, operations like throttling, request handling, load balancing, resource tiering/allocations, "noisy neighbor" isolations, and so on, are done at the environment level.

- Targeted service communication/notifications can't be separately done at the company level&mdash;only at the environment level.

- Upgrades to new [!INCLUDE[prod_short](../developer/includes/prod_short.md)] versions can't be separately done at the company level&mdash;only at the environment level.

- As data per company continues to grow, the more companies you have per environment, the longer data upgrades and schema syncs will take when your environment is updated, making it more difficult to schedule and fit an upgrade in an overnight update window.

- Configuring user access at the company level is more complex than doing it at the environment level, which can be done using the standard Azure Active Directory (Azure AD) features.

- To reproduce and debug some issues, you'll need to copy your production environment into your sandbox environment. Consequently, the more companies you have per environment, the longer this will take, which increases the time to mitigate those issues.

- Exporting data can't be separately done at the company level, only at the environment level. In addition, the export operation uses the BACPAC format, which can't handle too many database tables. Because each company contains around 1800 tables, the more companies you have per environment, the more repetitions of steps you’ll need to do to export your data, like:

  1. Copy your environment.
  2. Delete some companies in the copy
  3. Export the copy with fewer companies
  4. Repeat the previous steps.
  
    > [!TIP]
    > You can use the admin enter API for these steps, so the whole process can be scripted. For more information, go to [Admin Center](administration-center-api.md).

- Restoring data can't be separately done at the company level&mdash;only at the environment level. If the data in one company is corrupted by erroneous user actions or app code, the point-in-time restore (PITR) database feature can only be used to restore the whole environment to the pre-corruption state.  Consequently, the more companies you have per environment, the longer this will take, which increases the time to recover from data corruption.

- Deploying/installing extensions and hotfixes can't be separately done at the company level&mdash;only at the environment level. Our DevOps/CICD tools deploy/install them on specific environments and sync changes to relevant tables in all companies. Consequently, the more companies you have per environment, the longer this will take, which increases the time to deploy/install extensions and hotfixes.

- The more companies you have per environment, the more complexities you'll have when integrating [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with other Microsoft services that have no notion of companies, such as Dynamics 365 Sales, Microsoft 365 (M365), and Dataverse/Power Platform.

> [!IMPORTANT]
> To avoid these challenges, starting in 2023 release wave 1, there's a [maximum number](operational-limits-online.md#company-limit-per-environment) of companies that can be contained in one environment. If this limit is exceeded, certain admin operations on the environment will be blocked. If the number of companies in your environment is approaching or already exceeds this limit, distribute them across more environments.
