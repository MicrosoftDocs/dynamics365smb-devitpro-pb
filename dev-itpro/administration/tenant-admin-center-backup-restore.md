---
title: Restore Business Central Environment Backups
description: Restore a Business Central environment from a backup in the admin center. Review restore limits, extension options, and steps to prepare the restored data.
author: jswymer
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, restore, backup
ms.date: 11/13/2026
ms.author: jswymer
ms.reviewer: jswymer
ai-usage: ai-assisted
---

# Restoring an environment in the admin center

As an administrator, you can restore an existing environment from a time in the past, within the retention period that applies to both production and sandbox environments.  

Database backups are an essential part of any business continuity and disaster recovery strategy, because they protect your data from corruption or deletion. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online uses Azure SQL Database as the underlying database backup technology for its environments. The Azure SQL service continuously creates and maintains automated backups that protect all databases. Learn more in [Business continuity and disaster recovery (BCDR)](../service-overview.md#business-continuity-and-disaster-recovery-bcdr).

## Users who can restore environments

Permission to restore environments is limited to specific types of users: internal and delegated administrators. The following users are allowed to restore environments.

- Delegated administrators. Learn more in [Delegated administrator access to Business Central online](delegated-admin.md).
- Administrators from the organization that subscribes to [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online

Also, these users must have the **D365 BACKUP/RESTORE** permission set assigned to their user account in the environment they're trying to restore.

Learn more in [Assign permissions to users and groups](/dynamics365/business-central/ui-define-granular-permissions).

## Restore considerations and limitations

- Environments can only be restored if the customer has a paid [!INCLUDE[prod_short](../developer/includes/prod_short.md)] subscription.
- Each environment can be restored up to 10 times in a calendar month.
- An environment can be restored to any time up to 28 days ago. It's not possible to restore an environment to a time more than 28 days ago.
- An environment can only be restored within the same Azure region and country/region ([!INCLUDE[prod_short](../developer/includes/prod_short.md)] localization) as the original environment.
- A production environment can be restored to an environment of type **Production** or **Sandbox**. A sandbox environment can only be restored to a **Sandbox** environment.
- The environment is restored to the major/minor version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] it was on at the time the environment is restored to. It's not possible to restore to an environment to a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version that is in its grace or enforced update period. Learn more in [Update cycles](update-rollout-timeline.md).
- When you restore a sandbox environment, development extensions published directly from Visual Studio Code aren't available in the restored environment, even if they were present at the point in time you're restoring to. Also, any per-tenant extensions that depend on such development extensions aren't available.
- Every Marketplace and [!INCLUDE[prod_short](../developer/includes/prod_short.md)] app in the restored environment will have the latest available hotfix installed automatically&mdash;even if the hotfix was introduced after the point-in-time you're restoring to.
- Microsoft Entra app registration, status, and permissions in the environment are restored to their state at the time you're restoring to. Apps that were authorized in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] aren't restored even if their permissions in the restored environment are.
- The update window and application insights connection string specified for the source environment in the admin center at the time when the restore operation started will be retained on the target environment. The target environment won't be restored to the values for these settings that existed on the source environment at the time that the source environment is being restored to.
- Power Platform environments that are [linked](tenant-admin-center-environments.md#linked-power-platform-environment) to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment you're restoring aren't affected by this operation. The Power Platform environment won't be restored, and the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment created as part of the restore operation won't be linked to any Power Platform environment.
- If the environment is encrypted using a [customer-managed encryption key](../security/security-online.md#customer-managed-encryption-key) inherited from a [linked](tenant-admin-center-environments.md#linked-power-platform-environment) Power Platform environment, the new environment created by the restore operation will be encrypted using a Microsoft-managed encryption key. To encrypt the newly created environment using a customer-managed encryption key link it to a Power Platform environment that has the desired customer-managed encryption key applied.
- [Early access preview environments](preview-environments.md#early-access-preview) are automatically updated to a new preview build every Sunday. It's not possible to restore the environment to a previous preview build, limiting the period for which the environment can be restored.

## Clean up environment settings and integration data

When you restore an environment, the admin center cleans up the following environment setups and integration data to avoid unexpected behavior with external integrations. To skip this cleanup, turn on **Skip environment cleanup** under **Advanced options** in the admin center.

[!INCLUDE [create copy-restore-cleanup-operations](../developer/includes/copy-restore-cleanup-operations.md)]

## Before you restore an environment

Here are a few important things to do when you're planning to restore an environment:

- Make sure you communicate the plan to restore an environment within your organization upfront, in good time.

- Typically, you want to stop users and external integrations from using the environment during restoration. Consider doing the following actions in the environment you're planning to restore:

  - Remove access to the environment for nonessential users, but ensure required users, like administrators, keep access. Learn more in [Remove a user's access to the system](/dynamics365/business-central/ui-how-users-permissions#to-remove-a-users-access-to-the-system).

  - Put all job queues on hold. Learn more in [Use job queues to schedule tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks).

- Consider renaming the environment. The users and external integrations won't be able to access it by its old name.  

  When restoring an environment, you'll create a new environment that the database backup will be restored to. You can't use the same name for two environments of the same customer. So if you want the restored environment to have the same name as the original environment, rename the original environment before you run the restore operation. For example, you could change the name to include **DONOTUSE**.

  Learn more in [Rename environments in the admin center](tenant-admin-center-environments-rename.md).

## Restore an environment

To restore an environment, you'll have to provide a name for the environment and a date/time from which to restore the database.

1. Select **Environments** and then open the environment you want to restore.
1. Select **Restore**.
1. In the **Restore Environment** pane, specify the date and time to restore the environment. The pane shows the version that the restored environment uses.
1. Select the type to use for the restored environment.
1. Specify a name for the restored environment.
1. Under **Advanced options**, select whether to uninstall per-tenant extensions or non-Microsoft Marketplace apps, or skip environment cleanup as part of the restore.
1. Select **Restore**.

> [!NOTE]
> For newly created environments, backups can take up to 30 minutes to initialize. You might not be able to restore an environment immediately after creating it.
>
> Extension compilation issues can prevent a restore. If you don't need the installed extensions, uninstall them as part of the restore to avoid compilation errors. By default, environment settings and integration data are cleaned up as described in [Clean up environment settings and integration data](#clean-up-environment-settings-and-integration-data). Turn on **Skip environment cleanup** to override this behavior.

When the process starts, go to the list of environments to see the status of the restored environment. At first, the new environment has the state **Preparing**. The original environment remains **Active**.

Several factors affect the restore duration. For large or highly active databases, the restore might take several hours. Learn more in [Recovery time](/azure/azure-sql/database/recovery-using-backups#recovery-time).

When the restore finishes, the new environment changes to **Active**. If the restore fails, check the **Operations** page for failure details. Delete the failed environment and try the restore again. Contact Microsoft Support if the issue persists.

## After you restore an environment

After restoring an environment, you should inspect and adjust data to prepare it for users. Consider enforcing these steps during this period:

- Remove access to the environment for nonessential users, but make sure required users, like administrators, keep access.
- Put all job queues in the restored environment on hold immediately after restore. Learn more in [View scheduled tasks](/dynamics365/business-central/admin-job-queues-schedule-tasks#view-scheduled-tasks).
- If needed, you can upload the per-tenant extensions targeting the next version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] again.

The original environment remains available and isn't affected by the restore operation. You can then get back to the original environment if you need to look up data. Or maybe you have to migrate some data to the restored environment. You can, for example, migrate data by using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] RapidStart services. Learn more in [Migrate customer data](/dynamics365/business-central/admin-migrate-customer-data).

> [!IMPORTANT]
> You can restore your production environment into a new production environment even if doing so results in exceeding your number of environments or database capacity quotas. You can however only exceed this quota by one extra production environment, regardless of how many production environments you have available for your subscription. This capability is provided as an exception, to ensure that you can always restore your production environment in critical situations. You must return within your quota within 30 days following the restore by either removing the original production environment or by purchasing an additional production environment. Before removing the environment, we recommend you [export the environment to an Azure storage container](tenant-admin-center-database-export.md) in case you need to access some data at a later point. This exception isn't available for restoring from and to sandbox environments.

When you're satisfied with the data in the restored database, enable the users, start the job queues, and let your organization know that the restore process is now completed and they can again use the environment.

## Related information

[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Microsoft Entra organization](tenant-admin-center-environments-move.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Service Overview for Business Central Online](../service-overview.md)  
