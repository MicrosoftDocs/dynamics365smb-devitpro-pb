---
title: Complete cloud migration
description: This article describes the task you do to complete the data migration from on-premises to online. 
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer 
ms.topic: how-to 
ms.date: 12/15/2023
ms.custom: bap-template 
ms-service: dynamics365-business-central
---

# Complete cloud migration to Business Central online

This article explains tasks you do in the final phase of cloud migration&mdash;that is, after completing replication, upgrading the data in the online environment, and testing the result of the cloud migration.

> [!TIP]
> To keep track of which of task you've done, use the [Post Migration Checklist](https://businesscentral.dynamics.com/?page=4020) page to check off tasks as you go along. To open the checklist, go to **Cloud Migration Setup** page then select **Actions** > **Setup checklist**.


## Step 1 Disable the cloud migration

Once you migrate the desired data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, you end the migration by disabling cloud migration in the **Cloud Migration Setup** page. This step is important because each time someone runs the migration, outstanding documents (like for vendors and inventory items) and other changes made in the online target company are overwritten.

When you disable the cloud migration, the cloud migration setup for the environment is deleted. But integration runtime remains. So if you want to migrate data again, you have to first go through the cloud migration setup.

To disable cloud migration, complete the following steps:

1. Go to the **Cloud Migration Management** page and select **[Complete Cloud](https://businesscentral.dynamics.com/?page=40063)**.
1. On the **Cloud Ready Checklist** page, read the information.
1. If you agree, turn on the **I have read and understand the recommended step** switch.
1. Select the **Disable Cloud Migration** > **Yes**.

> [!NOTE]
> The integration runtime remains installed on your on-premise machine. However, if it's not used for cloud migration within a couple of weeks, its cloud registration is automatically cleaned up. If you want to migrate data again, you must go through the cloud migration setup again and may also need to re-install the Self-hosted Integration Runtime.

## Step 2 Set up users and permissions

User accounts and permissions in Business Central on-premises aren't migrated to the online. To give on-premises users access to the new online tenant, each user needs the following permissions:

1. An account in the Microsoft 365 tenant with a Business Central license.

   For more information, go to [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users).

1. An account in Business Central that's associated with their Microsoft 365 account email and assigned the proper permissions to data in Business Central.

   For more information, go to [Create Users According to Licenses](/dynamics365/business-central/ui-how-users-permissions). 

   > [!TIP]
   > You can go directly to setting up permission sets from the **Cloud Ready Checklist** page by selecting **Permission Sets**.

## Step 3 Define user mappings

If any data or transactions are dependent on a specific on-premises user account, then you must map the on-premises user account to an online user account. 

> [!IMPORTANT]
> User mappings can only be done once per environment, so it's recommended to do this task as a one of the last step. You can copy to a sandbox and test the changes there so it doesn't affect the production environment.

### Map on-premises users to online accounts

1. Go to the **Cloud Migration Management** page and select the **Define user mappings** action. 
1. Use the **Define User Mappings** page to match on-premises user accounts, shown in the **On-premises User** field, with online user accounts by filling in the **Cloud User** field. 
1. When ready, select **OK** to start the update. 

### Technical details

- The users are copied from the on-premises database from both **User** and **User Property** tables to the buffer table. If you're using custom SQL scripts to move the data, be sure to include **User Property** table. If this table isn't included, then no data is copied.
- Not all tables are included in the rename process. Codeunit 418 **User Management** is used to rename the records that don't have the table relationship property set. Some tables, like **Change Log Entry**, aren't supported for this functionality, because they're too large. These tables are excluded from the rename process. 

## Step 4 Reconfigure the Dynamics 365 Sales connection

If you're integrating with Dynamics 365 Sales, you have to set up the connection again. For more information, see [Integrating with Dynamics 365 Sales](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration).



