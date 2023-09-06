---
title: Complete cloud migration
description: This article describes the task you do to complete the data migration from on-premises to online. 
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer 
ms.topic: how-to 
ms.date: 02/16/2023
ms.custom: bap-template 
ms-service: dynamics365-business-central
---

# Complete cloud migration to Business Central online

This article explains tasks you do in the final phase of cloud migration&mdash;that is, after you complete replication and upgraded data in the online environment.

> [!TIP]
> To keep track of which of task you've done, use the [Post Migration Checklist](https://businesscentral.dynamics.com/?page=4020) page to check off tasks as you go along. To open the checklist, go to **Cloud Migration Setup** page then select **Actions** > **Setup checklist**.

1. Test the result of the cloud migration.
1. Disable the cloud migration

    Once you've migrated the data that you want to migrate to [!INCLUDE [prod_short](../includes/prod_short.md)] online, you end the migration by disabling cloud migration in the **Cloud Migration Setup** page. This step is important because each time someone runs the migration, outstanding documents (like for vendors and inventory items) and other changes made in the online target company are overwritten.

    When you disable the cloud migration, the cloud migration setup for the environment is deleted. But integration runtime remains. So if you want to migrate data again, you have to first go through the cloud migration setup.

    To disable cloud migration, complete the following steps:

    1. Go to the **Cloud Migration Setup** page and select **[Complete Cloud](https://businesscentral.dynamics.com/?page=40063)**.
    2. On the **Cloud Ready Checklist** page, read the information.
    3. If you agree, turn on the **I have read and understand the recommended step** switch.
    4. Select the **Disable Cloud Migration** > **Yes**.

    > [!NOTE]
    > The integration runtime remains installed on your on-premise machine. However, if it's not used for cloud migration within a couple of weeks, its cloud registration is automatically cleaned up. If you want to migrate data again, you must go through the cloud migration setup again and may also need to re-install the Self-hosted Integration Runtime.

1. Set up users and permissions in Business Central.

   User accounts and permissions in Business Central on-premises aren't migrated to the online. To give on-premises users access to the new online tenant, each user needs the following permissions:

   1. An account in the Microsoft 365 tenant with a Business Central license.

      For more information, go to [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users).

   2. An account in Business Central that's associated with their Microsoft 365 account email and assigned the proper permissions to data in Business Central.

      For more information, go to [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions). 

      > [!TIP]
      > You can go directly to setting up permission sets from the **Cloud Ready Checklist** page by selecting **Permission Sets**.
1. Define user mappings.

   If any data or transactions are dependent on a specific on-premises user account, then you must map the on-premises user account to an online user account. To map users, go to the **Cloud Migration Setup** page and select **Define user mappings**.  
1. Reconfigure the Dynamics 365 Sales connection.

   If you're integrating with Dynamics 365 Sales, you have to set up the connection again. For more information, see [Integrating with Dynamics 365 Sales](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration).

