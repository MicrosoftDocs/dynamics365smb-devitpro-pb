---
title: Delete and recover environments
description: Learn how to delete and recover deleted environments using the Business Central admin center.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 03/21/2023
ms.custom: bap-template
---

# Delete and recover environments

When an environment is no longer needed, like a sandbox environment, you can delete it from the admin center. If you regret the deletion, you can recover the environment within a specific number of days.

## About deleting and recovering environments

Deleting an environment makes it inaccessible to Business Central users and deletes all application and business data. However, when you delete an environment, it's not permanently deleted immediately. First, it's kept as a backup or snapshot and enters a retention period that lasts seven days. This initial deletion phase is referred to as *soft delete*. During the retention period, you can fully recover the environment and its data if needed. After seven days, the environment and data are permanently deleted and can't be recovered. This final deletion phase is often referred to as *hard delete*.

Here's some important information about deleted environments and their recovery:  

- If you delete an environment that has the status `Creating Failed` or `Removing Failed`, the environment won't be retained for seven days and will be permanently deleted immediately.

- Deleted environments are removed from the **Recently deleted environments** page seven days after the environment has been deleted.

   If you need to recover an environment that was deleted more than seven days ago, open a service request.

- When you delete environment, it's automatically renamed to include a suffix with the format `-yyyyMMddHHmm`.

   The reason for this renaming is that environment names must be unique among all environments of the same application family. This requirement also includes soft-deleted environments. However, in some cases, you may want to reuse the name of a soft-deleted environment. Automatically renaming a soft-deleted environment avoids naming conflicts and lets you quickly create a new environment with the same name. 

   If the environment name is too long, it will be truncated to allow using the full suffix in the specified format. When the environment is recovered, it isn't automatically renamed back to the original name.

   You can also manually rename soft-deleted environments from the **Recently deleted environments** page.
- Soft-deleted environments don't get applied with updates, but they remain part of the update schedule until they're permanently deleted.

   When you recover an environment, any updates scheduled for the environment while it was in retention will be applied as part of recovery. If you don't want to apply an update during recovery, you can reschedule it to a later date before starting the recovery.

- Soft-deleted environments, or any environments listed on **Recently deleted environments** page, aren't counted towards the environment quota on your tenant.  
- You can recover a soft-deleted product environment even if doing so results in exceeding your number of environments allowed by your quota.

   However, you can only exceed this quota by one extra production environment, regardless of how many production environments you have available for your subscription.

   This capability is provided as an exception, to ensure that you can always recover your production environment in critical situations. You must return within your quota within 30 days following the recovery by either deleting a production environment or by purchasing an extra production environment.
  
## Delete an environment

1. Before you delete an environment, make sure no users are using the environment, they'll be disconnected.
2. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments**, then select environment you want to delete.
3. In the action ribbon at the top of the page, select **Delete** > **Yes**.

## Recover an environment

1. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments** > **Recently deleted environments**.
2. Select the environment you want to recover.

   The environment details page opens.
3. If you notice the environment has pending updates but you don't want to run them as part of the recovery, select **Update Settings** > **Set Update Date** to postpone the update until a later date.

   For more information about setting the update date, go to [Schedule an update date](tenant-admin-center-update-management.md#schedule).
4. When ready to recover the environment, select **Recover**.

## See also

[Managing Production and Sandbox Environments in the Admin Center](tenant-admin-center-environments.md)  
[Managing Capacity](tenant-admin-center-capacity.md)  
