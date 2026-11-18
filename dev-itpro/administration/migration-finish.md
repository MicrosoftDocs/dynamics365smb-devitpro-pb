---
title: Complete Cloud Migration to Business Central Online
description: Learn how to complete Business Central cloud migration, migrate record links and notes, disable migration, and set up users and integrations.
author: jswymer
ms.author: jswymer 
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 11/17/2026
ms.custom: bap-template 
ai-usage: ai-assisted
---

# Complete your cloud migration to Business Central online

> **APPLIES TO:** Migration from Business Central on-premises only

This article explains tasks you do in the final phase of cloud migration&mdash;that is, after completing replication, upgrading the data in the online environment, and testing the result of the cloud migration.

> [!TIP]
> To keep track of which tasks you did so far, use the **Post Migration Checklist** page to check off tasks as you go along. To open the checklist, go to the **Cloud Migration Management** page in a migrated company, then select **Setup checklist**.

## Step 1 Migrate record links and notes

Record links and notes aren't automatically migrated to the target environment. Instead, they're stored in a buffer table during replication. To ensure they're properly transferred to the actual record link table, you must manually trigger the migration.

1. Open the **Cloud Migration Management** page.
1. Select the **Migrate record links and notes** action after the final data replication. The action is enabled when the record-link buffer contains data and isn't blocked.

This action moves record links and notes from the buffer table to the actual table. If new replication runs are completed after completing this action, a warning to rerun this action appears in the **Cloud Migration Management** page. If you run the action again, previously migrated records can be updated from the buffer. The action warns that repeating the migration might cause unwanted results.

Complete this step before defining user mappings because user mappings also update the users associated with the record links and notes.

## Step 2 Disable the cloud migration

Once you migrate the desired data to [!INCLUDE [prod_short](../includes/prod_short.md)] online, you end the migration by disabling cloud migration from the **Cloud Migration Management** page. This step is important because subsequent replications can overwrite outstanding documents for vendors and inventory items and other changes made in the online target company.

When you disable cloud migration, the environment is no longer enabled for replication. But the integration runtime remains installed. So if you want to migrate data again, you have to first go through the cloud migration setup.

To disable cloud migration, complete the following steps:

1. Go to the **Cloud Migration Management** page and select **Complete migration**. You must have the **SUPER** permission set. Resolve failed tables, finish data repair, and complete any required data upgrade first.
1. On the **Cloud Ready Checklist** page, read the information.
1. If you agree, select **I have read and understand the recommended steps**.
1. Select **Disable Cloud Migration** > **Yes**.

> [!NOTE]
> The integration runtime remains installed on your on-premises machine. However, if it's not used for cloud migration within a couple of weeks, its cloud registration is automatically cleaned up. If you want to migrate data again, you must go through the cloud migration setup again and might also need to reinstall the Self-hosted Integration Runtime.

<a name="API"></a>

## Step 3 Run API data upgrade

This step is only required if you skipped the API data upgrade during the cloud migration. Learn more in [Skip API data upgrade in cloud migration](migration-skip-api-data-upgrade.md).

1. Sign in to [Business Central online](https://businesscentral.dynamics.com).
1. Search for and open the **Cloud Migration Management** page.
1. Select the **Manage API Upgrade** action to open the **API Upgrade Overview** page.

   Companies that weren't upgraded have the **API Upgrade Status** of **Disabled**.

1. To run the API data upgrade for a company, do the following steps:

   1. On the **API Upgrade Overview** page, select the company name.

      The **API Data Upgrade List** opens in a new browser tab.
   1. On the **API Data Upgrade List** page, select an entity and select **Reset** if its status needs to be cleared. Repeat for each entity you want to reset.
   1. Select all entities you want to upgrade, then select **Schedule Upgrades** > **Yes** to open the job queue entry.

      A job queue entry is created or an existing entry is reused.
   1. Schedule the job queue entry to run. Learn more in [Use job queues to schedule tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks).
  
1. Repeat the previous step for each company you want to run the API data upgrade.

The **API Upgrade Overview** page shows whether API data upgrade is enabled or disabled for each company, not the status of job queue entries. Check entity progress on the company's **API Data Upgrade List** page and check the job queue entry for failures. When you restart the job queue entry, it processes entities that are still scheduled.

## Step 4 Set up users and permissions

User accounts and permissions in Business Central on-premises aren't migrated to the online environment. To give on-premises users access to the new online tenant, each user needs the following:

1. An account in the Microsoft 365 tenant with a Business Central license.

   Learn more in [Add users and assign licenses at the same time](/microsoft-365/admin/add-users/add-users).

1. An account in Business Central associated with their Microsoft 365 account email and assigned the proper permissions to data in Business Central.

   Learn more in [Create users according to licenses](/dynamics365/business-central/ui-how-users-permissions).

   > [!TIP]
   > Before disabling cloud migration, you can open permission sets from the **Cloud Ready Checklist** page by selecting **Permission Sets**. After disabling migration, search for and open the **Permission Sets** page instead.

## Step 5 Define user mappings

If any data or transactions are dependent on a specific on-premises user account, then you must map the on-premises user account to an online user account. 

> [!IMPORTANT]
> Define user mappings only once, as one of the last steps. Repeating the mapping displays a warning that it might cause unwanted results. You can copy to a sandbox and test the changes there so it doesn't affect the production environment.

### Map on-premises users to online accounts

1. Go to the **Cloud Migration Management** page and select the **Define user mappings** action. 
1. Use the **Define User Mappings** page to match on-premises user accounts, shown in the **On-premises User** field, with online user accounts by filling in the **Cloud User** field. 
1. When ready, select **OK** to start the update. 

### Technical details

- The users are copied from the on-premises database from both `User` and `User Property` tables to the buffer table. If you're using custom SQL scripts to move the data, be sure to include the `User Property` table. If this table isn't included, then no data is copied.
- The mapping renames the online account's `User Name` to the on-premises user name and calls the `User` codeunit's `RenameUser` procedure to update dependent data. Not all tables are included in the rename process. Some tables, like `Change Log Entry`, are excluded.

## Step 6 Reconfigure the Dynamics 365 Sales connection

If you're integrating with Dynamics 365 Sales, you have to set up the connection again. Learn more in [Integrating with Dynamics 365 Sales](/dynamics365/business-central/admin-prepare-dynamics-365-for-sales-for-integration).

## Step 7 Reconnect integrations

Re-establish connections to external services, APIs, Power Platform flows, and any third-party integrations that were running against the on-premises system:

- Update connection strings, endpoints, and authentication credentials to point to the new online environment.
- Reconfigure Power Automate flows that interact with [!INCLUDE[prod_short](../includes/prod_short.md)] data.
- Test each integration end-to-end in the new environment before going live.

## Step 8 Monitor and validate

After you complete the migration and go live, monitor the environment closely during the stabilization period:

- **Review telemetry**: Use Application Insights to track errors, performance, and usage patterns. Cloud migration emits telemetry that you can use to verify the migration completed successfully. Learn more in [Cloud migration telemetry](telemetry-cloud-migration-trace.md).
- **Set up alerts**: Configure alerts for key performance indicators and error patterns so you can respond to issues quickly.
- **Validate with users**: Have business users verify that key processes work correctly and that migrated data is accurate.
- **Monitor performance**: Watch for slow queries or unexpected load patterns during the first few weeks of operation.

Learn more in [Enable sending telemetry to Application Insights](telemetry-enable-application-insights.md).
