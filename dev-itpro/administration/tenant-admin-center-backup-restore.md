---
title: Restoring an Environment in the Admin Center
description: Use the Business Central administration center to restore backups of environments. 
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, restore, backup
ms.date: 04/01/2021
ms.author: jswymer
---

# Restoring an Environment in the Admin Center

> [!IMPORTANT]
> This feature is in preview. It might change or be removed in the future updates.

As an administrator, you can restore an existing environment from a time in the past, within the 30-day retention period that applies to both production and sandbox environments.  

Database backups are an essential part of any business continuity and disaster recovery strategy, because they protect your data from corruption or deletion. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online uses Azure SQL Database as the underlying database backup technology for its environments. All databases are protected by automated backups that are continuously created and maintained by the Azure SQL service. For more information, see [Databases and backups](../service-overview.md#databases-and-backups).  

> [!NOTE]
> An environment can only be restored within the same [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version (minor and major).

## Users who can restore environments

Permission to restore environments is limited to specific types of users: internal and delegated administrators. The following users are allowed to restore environments.

- Delegated administrators from reselling partners
- Administrators from the organization that subscribes to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online

Also, these users must have the **D365 BACKUP/RESTORE** permission set assigned to their user account in the environment they're trying to export.

For more information about permissions sets and user groups, see [Assign Permissions to Users and Groups](/dynamics365/business-central/ui-define-granular-permissions).

## Considerations and limitations

- Environments can only be restored if the customer has a paid [!INCLUDE[prod_short](../developer/includes/prod_short.md)] subscription.
- Each environment can be restored up to 10 times in a calendar month.
- It's not possible to use the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] administration center to restore an environment that was previously deleted.

    If you end up in the situation where you need to restore a deleted environment, contact Microsoft Support for help. In such cases, Microsoft doesn't guarantee a restore operation will succeed or all data and extensions will be available in the restored database. So before you decide to delete an environment, it's important to ensure that the environment is no longer needed.
- An environment can only be restored within the same Azure region and country ([!INCLUDE[prod_short](../developer/includes/prod_short.md)] localization) as the original environment.
- A production environment can be restored to an environment of type **Production** or **Sandbox**. A sandbox environment can only be restored to a **Sandbox** environment.
- When restoring a sandbox environment, all development extensions (that is, extensions published directly from Visual Studio Code) won't be available in the restored environment&mdash;even if they were present at the point-in-time you're restoring to). Additionally, any per-tenant extensions that depend on such development extensions will also not be available.
- Per-tenant extensions you may have uploaded that target the **next** version of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] won't be available in the restored environment&mdash;even if they were uploaded at the point-in-time you're restoring to. Per-tenant extensions that were already installed will be available in the restored environment.
- Every AppSource and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] app in the restored environment will have the latest available hotfix installed automatically&mdash;even if the hotfix was introduced after the point-in-time you're restoring to.

## Before you restore an environment

Here are a few important things to do when you're planning to restore an environment:

- Make sure you communicate the plan to restore an environment within your organization upfront, in good time.

- Typically, you want to stop users and external integrations from using the environment during restoration. Consider doing the following actions in the environment you're planning to restore:

  - Remove access to the environment for non-essential users, but make sure required users, like administrators, keep access. For more information, see [Remove a user's access to the system](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system).

  - Put all job queues to on hold. For more information, see [Use Job Queues to Schedule Task](/dynamics365/business-central/admin-job-queues-schedule-tasks).

- Consider renaming the environment. The users and external integrations won't be able to access it by its old name.  

  When restoring an environment, you'll create a new environment that the database backup will be restored to. You can't use the same name for two environments of the same customer. So if you want the restored environment to have the same name as the original environment, rename the original environment before you run the restore operation. For example, you could change the name to include **DONOTUSE**.

  For more information, see [Rename Environments in the Admin Center](tenant-admin-center-environments-rename.md).

## Restore an environment

To restore an environment, you'll have to provide a name for the environment and a date/time from which to restore the database.

1. Select **Environments** and then open the environment you want to restore.
2. Select **Restore**.
3. In the **Restore Environment** pane, specify the date and time in the past to which you want to restore the environment.  
4. Select the type to be used for the restored environment.
5. Specify a name for the restored environment.
6. Select **Restore**.

    If there's no backup available for date and time you chose, select the available nearest backup, when prompted. This situation can occur, for example, if the environment was being updated to a new minor or major version during the specified time.  

    > [!NOTE]
    > For newly created environments it may take up to 30 min for the backups to be initialized, so you may not be able to restore an environment if you have just created it. 

7. When the process starts, you can go to the list of your environments and see the status of the restored environment. At first, you'll see the new environment with state **Preparing**. The original environment state remains as **Active**. 

    The restore operation duration is affected by several factors. For large or highly active databases, the restore might take several hours. You can find more details about the factors that affect the recovery time at [Recovery time](/azure/azure-sql/database/recovery-using-backups#recovery-time).  

    Once the restore is completed, the environment state will change to **Active**.  If the restore operation fails, you can find the failure details on the **Operations** page. In this case, delete the failed environment, and then try to restore again. Contact Microsoft Support if the issue persists.

## After you restore an environment

After restoring an environment, you should inspect and adjust data to prepare it for users. Consider enforcing these steps during this period:

- Remove access to the environment for non-essential users, but make sure required users, like administrators, keep access.
- Put all job queues in the restored environment to on hold immediately after restore.
- If needed, you can upload the per-tenant extensions targeting the next version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] again.

The original environment will remain available and isn't affected by the restore operation. You can then get back to the original environment if you need to look up data. Or maybe you'll have to migrate some data to the restored environment. You can, for example, migrate data by using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] RapidStart services. For more information, see [Migrate Customer Data](/dynamics365/business-central/admin-migrate-customer-data).

> [!IMPORTANT]
> You can restore your production environment into a new production environment even if doing so results in exceeding your number of environments or database capacity quotas. You can however only exceed this quota by one extra production environment, regardless of how many production environments you have available for your subscription. This capability is provided as an exception, to ensure that you can always restore your production environment in critical situations. You must return within your quota within 30 days following the restore by either removing the original production environment or by purchasing an additional production environment. Before removing the environment, we recommend you [export the environment to an Azure storage container](tenant-admin-center-database-export.md) in case you need to access some data at a later point. This exception isn't available for restoring from and to sandbox environments.

When you're satisfied with the data in the restored database, enable the users, start the job queues, and let your organization know that the restore process is now completed and they can again use the environment.

## See also

[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Azure Active Directory organization](tenant-admin-center-environments-move.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Service Overview for Business Central Online](../service-overview.md)  
