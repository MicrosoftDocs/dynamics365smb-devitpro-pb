---
title: Complete cloud migration for Dynamics GP
description: This article describes the task you do to complete the data migration from Dynamics GP to online. 
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer 
ms.topic: how-to 
ms.date: 02/29/2024
ms.custom: bap-template 
---

# Complete Dynamics GP cloud migration to Business Central online

This article explains tasks you do in the final phase of cloud migration&mdash;that is, after completing replication, upgrading the data in the online environment, and testing the result of the cloud migration.

> [!TIP]
> To keep track of which of task you've done, use the [Post Migration Checklist](https://businesscentral.dynamics.com/?page=4020) page to check off tasks as you go along. To open the checklist, go to **Cloud Migration Setup** page then select **Actions** > **Setup checklist**.

[!INCLUDE [migrate-e2e-process](../developer/includes/migrate-e2e-process-gp.md)]

## Step 1: Disable the cloud migration

Once you migrate the desired data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, you end the migration by disabling cloud migration in the **Cloud Migration Setup** page. This step is important because each time someone runs the migration, outstanding documents (like for vendors and inventory items), and other changes made in the online target company are overwritten.

When you disable the cloud migration, the cloud migration setup for the environment is deleted. But integration runtime remains. So if you want to migrate data again, you have to first go through the cloud migration setup.

To disable cloud migration, complete the following steps:

1. Go to the **Cloud Migration Management** page and select **[Complete Cloud](https://businesscentral.dynamics.com/?page=40063)**.
1. On the **Cloud Ready Checklist** page, read the information.
1. If you agree, turn on the **I have read and understand the recommended step** switch.
1. Select the **Disable Cloud Migration** > **Yes**.

> [!NOTE]
> The integration runtime remains installed on your on-premise machine. However, if it's not used for cloud migration within a couple of weeks, its cloud registration is automatically cleaned up. If you want to migrate data again, you must go through the cloud migration setup again and may also need to re-install the Self-hosted Integration Runtime.

## Step 2: Set up users and permissions

User accounts and permissions in Business Central on-premises aren't migrated to the online. To give on-premises users access to the new online tenant, each user needs the following permissions:

1. An account in the Microsoft 365 tenant with a Business Central license.

   For more information, go to [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users).

1. An account in Business Central that's associated with their Microsoft 365 account email and assigned the proper permissions to data in Business Central.

   For more information, go to [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions). 

   > [!TIP]
   > You can go directly to setting up permission sets from the **Cloud Ready Checklist** page by selecting **Permission Sets**.