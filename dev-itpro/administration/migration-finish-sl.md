---
title: Complete cloud migration for Dynamics SL
description: Learn how to complete the data migration from Dynamics SL to Business Central online. 
author: lcontreras
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 12/13/2024
ms.custom: bap-template 
---

# Complete Dynamics SL cloud migration to Business Central online

This article explains tasks to complete in the final phase of cloud migration&mdash;after replicating, upgrading data in the online environment, and testing the migration results.

> [!TIP]
> To track completed tasks, use the [Post Migration Checklist](https://businesscentral.dynamics.com/?page=4020) page. Open the checklist by going to the **Cloud Migration Setup** page and selecting **Actions** > **Setup checklist**.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-SL.md)]

## Step 1: Disable the cloud migration

After migrating the desired data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, disable cloud migration in the **Cloud Migration Setup** page. This step is crucial because running the migration again overwrites outstanding documents (like for vendors and inventory items) and other changes made in the online target company.

Disabling cloud migration deletes the setup for the environment, but the integration runtime remains. To migrate data again, you must complete the cloud migration setup.

To disable cloud migration, follow these steps:

1. Open the **Cloud Migration Management** page and select **[Complete Cloud](https://businesscentral.dynamics.com/?page=40063)**.
1. On the **Cloud Ready Checklist** page, read the information.
1. If you agree, turn on the **I have read and understand the recommended step** switch.
1. Select **Disable Cloud Migration** > **Yes**.

> [!NOTE]
> The integration runtime remains installed on your on-premises machine. If not used for cloud migration within a couple of weeks, its cloud registration is automatically cleaned up. To migrate data again, you must go through the cloud migration setup and might need to reinstall the Self-hosted Integration Runtime.

## Step 2: Set up users and permissions

User accounts and permissions in Business Central on-premises aren't migrated online. To give on-premises users access to the new online tenant, each user needs the following permissions:

1. An account in the Microsoft 365 tenant with a Business Central license.

   Learn more in [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users).

1. An account in Business Central associated with their Microsoft 365 account email and assigned the proper permissions to data in Business Central.

   Learn more in [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions). 

   > [!TIP]
   > Go directly to setting up permission sets from the **Cloud Ready Checklist** page by selecting **Permission Sets**.