---
title: Delete and recover environments
description: Learn how to delete and recover deleted environments using the Business Central admin center.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to 
ms.date: 02/24/2023
ms.custom: bap-template
---

# Delete and recover environments

When an environment is no longer needed, like a sandbox environment, you can delete it from the admin center. If you regret the deletion, you can recover the environment within a specific number of days.

## About deleting and recovering environments

Deleting an environment makes it inaccessible to Business Central users and deletes all application and business data. However, when you delete an environment, it's not permanently deleted immediately. First, it's kept as a backup or snapshot and enters a retention period that lasts seven days. This initial deletion phase is referred to as *soft delete*. During the retention period, you can fully recover the environment and its data if needed. After seven days, the environment and data are permanently deleted and can't be recovered. This final deletion phase is often referred to as *hard delete*.

Here's some important information about deleted environments and their recovery:  

- If you delete an environment that has the status `Creating Failed` or `Removing Failed`, the environment won't be retained for seven days and will be permanently deleted immediately.
- Your Azure Active Directory tenant has a limit of 10 soft-deleted environments that can be in the retention period at any given time. If this limit is exceeded, the environment that has been in retention the longest will be permanently deleted to make room for the newly deleted environment.
- Environment names must be unique among all environments of the same application family. Soft-deleted environments can be renamed from the **Recently deleted environments** page, so you can reuse the name of the deleted environment on a new environment.
- Soft-deleted environments don't get applied with updates, but they remain part of the update schedule until they're permanently deleted.

   When you recover an environment, any updates scheduled for the environment while it was in retention will be applied as part of recovery. If you don't want to apply an update during recovery, you can reschedule it to a later date before starting the recovery.
- Deleted environments are removed from the **Recently deleted environments** page seven days after the environment has been deleted. If you need to recover an environment that was deleted more than seven days ago, open a service request.

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
