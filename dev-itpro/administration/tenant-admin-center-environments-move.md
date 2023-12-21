---
title: Transfer an environment to another Microsoft Entra organization
description: You can transfer a Business Central environment to another Microsoft Entra tenant. Start in the Business Central admin center.
author: jobulsin
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, move
ms.date: 12/21/2023
ms.author: jobulsin
---

# Transfer environments

Environments can be transferred between Microsoft Entra tenants, for example when multiple Entra tenants are consolidated, when a business is acquired by or merging with another business, or when a partner prepares a demo environment in their tenant that needs to be transferred to the customer tenant for the customer to evaluate.

## About transferring environments

An environment transfer is initiated by an internal administrator in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] for the source tenant and must be accepted by an internal administrator in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] for the destination tenant before the transfer will execute. Once the transfer starts, all users in the source tenant will be disconnected and the environment will no longer be available in the source tenant. There is some post-transfer setup required in the environment from the destination tenant before the environment can be used again, so plan the environment transfer carefully to avoid unneccessary downtime.

> [!IMPORTANT]
> All environment transfer operations must be executed by internal administrators; this feature cannot be used by delegated administrators.

## Create transfer on source tenant

1. Authenicated as an internal administrator, navigate to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] in the source Entra tenant
2. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments** > **Transfer Environments**
3. Select **Transfer Environments**
4. Select the environments to be transferred, specify the Entra tenant ID of the destination tenant, optionally select a date and time at which the chosen environment(s) should transfer to the destination, and confirm

> [!IMPORTANT]
> An environment transfer must be accepted in the destination Entra tenant before the transfer can start. If you do not specify a transfer time when initiating a transfer on the source tenant, the transfer will start immediately upon acceptance of the transfer in the destination tenant. If you do specify a time when initiating a transfer on the source tenant the transfer will not start before the chosen time even if the transfer is accepted on the destination tenant before the chosen time. If the transfer is accepted on the destination tenant after the time chosen on the source tenant the transfer will run immediately upon acceptance in the destination tenant.
>
> Transfer requests are valid for two weeks. It is not possible to choose a date and time on the source tenant that is more than two weeks in the future, and it is not possible to accept a transfer on the destination tenant more than two weeks after the transfer was initiated on the source tenant.

## Accept transfer on destination tenant

1. Ensure the destination tenant has at least one paid user license and sufficient environment and storage quota available to receive the new environments
2. Authenicated as an internal administrator, navigate to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] in the source Entra tenant
3. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments** > **Transfer Environments**
4. Select **Receive Environments**
5. Specify the Entra tenant ID of the source tenant you're accepting an environment transfer from
6. Select the environment(s) for which you want to accept a transfer and confirm. If a selected environment has a name that already exists in the destination tenant you will be prompted to enter a new name to avoid duplicate environment names. If you are prompted to rename multiple selected environments, you must enter unique names for each selected environment. 
7. Accepted environments for which no transfer time was specified and environments with a transfer time in the past will transfer immediately; environments with a transfer time in the future will transfer at the specified time.

> [!IMPORTANT]
> You can only transfer environments if you have environment quota available for the environments you're transferring in the destination tenant and if the destination tenant has at least one paid user license. Ensure there is sufficient available environment quota before accepting a transfer.
>
> If a transfer is scheduled to take place at a time in the future you must ensure that the destination tenant has environment quota available at the time for which the transfer is scheduled; accepting a transfer does not reserve the quota for the accepted environment(s) and the transfer will fail if quota is no longer available when the transfer starts.

## After the environment has been moved

- Users may have been added to the environment prior to the move operation, while it was still connected to the old Microsoft Entra tenant. If so, these users won't be migrated to the new Microsoft Entra tenant. You'll need to recreate the users on the target tenant if you still want them. You can add multiple user accounts at once [using Excel spreadsheet or other file saved in CSV format](/microsoft-365/enterprise/add-several-users-at-the-same-time). After the users are created on the target Microsoft Entra tenant, assign them the required roles or licenses and [import these users into the moved environment](/dynamics365/business-central/ui-how-users-permissions).

  > [!NOTE] 
  > User personalizations will be lost.
- You might need to reconfigure some add-ins, external applications, and settings after the tenant-to-tenant migration. Some examples include the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Outlook add-in, Excel add-in, Power BI, Power Apps, Power Automate connectors, Dataverse, user personalizations, and more.

## Cancel a pending transfer from source tenant

1. Authenicated as an internal administrator, navigate to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] in the source Entra tenant
2. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments** > **Transfer Environments**
3. Select the pending outgoing transfers which you would like to cancel and confirm

> [!IMPORTANT]
> Pending transfers can be cancelled by internal administrators until the transfer starts, i.e. as long as the transfer has not been accepted on the destination tenant or the scheduled time for the transfer is in the future.

## Considerations

- Environment data will remain unchanged during the move operation. The exact same environment will be linked to a specified Microsoft Entra tenant.
- The country, Azure region, and type of the environment (Production or Sandbox) will remain the same, and can't be changed during this operation.
- The operation will involve a downtime period for the environment being transferred (typically not exceeding 2 hours).
- The operation does not move subscriptions, domains, and other resources between the Microsoft Entra tenants. Ensure the destination tenant has a paid Business Central user subscription and sufficient environment quota before accepting the transfer.

## See also

[Managing Tenant Notifications](tenant-admin-center-notifications.md)
[Managing Apps](tenant-admin-center-manage-apps.md)
[Updating Environments](tenant-admin-center-update-management.md)
[Rename Environments](tenant-admin-center-environments-rename.md)
[Restoring an Environment](tenant-admin-center-backup-restore.md)
[Managing Production and Sandbox Environments](tenant-admin-center-environments.md)
[The Business Central Administration Center](tenant-admin-center.md)
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
