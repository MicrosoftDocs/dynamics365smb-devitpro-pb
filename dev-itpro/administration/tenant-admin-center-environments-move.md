---
title: Transfer Environments
description: You can transfer a Business Central environment to another Microsoft Entra tenant. Start in the Business Central admin center.
author: jobulsin
ms.topic: how-to
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, move
ms.date: 10/08/2025
ms.author: jobulsin
ms.reviewer: jswymer
---
# Transfer environments

Environments can be transferred between Microsoft Entra tenants. Some examples include:

- When multiple Microsoft Entra tenants are consolidated
- When a business is acquired by or merging with another business
- When a partner prepares a demo environment in their tenant that needs to be transferred to the customer tenant for the customer to evaluate.

## About transferring environments

An environment transfer is initiated by an internal administrator in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] for the source tenant. An internal administrator in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] for the destination tenant must accept the transfer before it executes.

Once the transfer starts, all users in the source tenant are disconnected and the environment is no longer available in the source tenant. There's some post-transfer setup required in the environment from the destination tenant before the environment can be used again, so plan the environment transfer carefully to avoid unnecessary downtime.

> [!IMPORTANT]
> Internal admin must execute all environment transfer operations; delegated admins can't use this feature.

> [!VIDEO https://learn-video.azurefd.net/vod/player?id=714cc34d-b904-427d-9231-afc074cace10 ]

## Create transfer on source tenant

1. Sign in to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] as an internal admin in the source Microsoft Entra tenant.
1. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments** > **Environment Transfers**.
1. Select **Transfer Environments**.
1. Select the environments to transfer, specify the Microsoft Entra tenant ID of the destination tenant, choose a date and time on which to transfer the chosen environments to the destination.
1. Select confirm to create the transfer.

After you create a transfer on the source tenant, review the status on the **Pending outgoing transfers** list.

> [!IMPORTANT]
> An environment transfer must be accepted in the destination Microsoft Entra tenant **within 8 hours** of creating the transfer on the source tenant:
>
> - If you specify a time when initiating a transfer on the source tenant, the transfer doesn't start until the chosen time&mdash;even if the transfer is accepted on the destination tenant before the chosen time.
> - If the transfer is accepted on the destination tenant after the time chosen on the source tenant, the transfer runs immediately upon acceptance in the destination tenant.
> - If a transfer isn't accepted in the destination tenant within 8 hours of its creation, the transfer operation has the status 'Skipped' on the **Operations** page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].
>
> Transfer requests are valid for two weeks if accepted on the destination tenant within 8 hours. It isn't possible to choose a date and time on the source tenant that's more than two weeks in the future.

## Accept transfer on destination tenant

To confirm the transfer, it has to be accepted on the destination tenant **within 8 hours** of creating the request on the source tenant.

1. Ensure the destination tenant has at least one paid user license and sufficient environment and storage quota available to receive the new environments
1. Sign in to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] as an internal admin in the source Microsoft Entra tenant.
1. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments** > **Transfer Environments**.
1. Select **Receive Environments**.
1. Specify the Microsoft Entra tenant ID of the source tenant you're accepting an environment transfer from.
1. Select the environments for which you want to accept a transfer and confirm.

   If a selected environment has a name that already exists in the destination tenant, you're prompted to enter a new name to avoid duplicate environment names. If you're prompted to rename multiple selected environments, you must enter unique names for each selected environment.

   Some accepted environments might have a transfer time, which was set when the request was created in the source tenant. If the transfer time is in the past, then the transfer happens  immediately. Environments with a transfer time in the future transfer at the specified time.

> [!IMPORTANT]
> You can only transfer environments if you have environment quota available for the environments you're transferring in the destination tenant. The destination tenant must also have at least one paid user license. Ensure there's sufficient available environment quota before accepting a transfer.
>
> If a transfer is scheduled to take place later, ensure that the destination tenant has environment quota available at the time of the scheduled transfer. Accepting a transfer doesn't reserve the quota for the accepted environments, and the transfer fails if environment quota is no longer available when the transfer starts.

## Cancel a pending transfer from source tenant

1. Sign in to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] as an internal admin in the source Microsoft Entra tenant.
1. In the navigation pane of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments** > **Transfer Environments**.
1. Select the pending outgoing transfers that you would like to cancel and confirm.

> [!IMPORTANT]
> Internal admins can cancel pending transfers at any time up until the transfer starts. They can cancel as long as the transfer isn't accepted on the destination tenant or the scheduled time for the transfer is in the future.

## After the environment is moved

- Users might have been added to the environment before the move operation, while it was still connected to the old Microsoft Entra tenant. If so, these users aren't migrated to the new Microsoft Entra tenant. You have to  recreate the users on the target tenant if you still want them. You can add multiple user accounts at once [using an Excel spreadsheet or another file saved in CSV format](/microsoft-365/enterprise/add-several-users-at-the-same-time). After the users are created on the target Microsoft Entra tenant, assign them the required roles or licenses and [import these users into the moved environment](/dynamics365/business-central/ui-how-users-permissions).

  > [!NOTE]
  > User personalizations are lost.

- You might need to reconfigure some add-ins, external applications, and settings after the tenant-to-tenant migration. Some examples include the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Outlook add-in, Excel add-in, Power BI, Power Apps, Power Automate connectors, Dataverse, user personalizations, and more.
- External integrations might have to be updated to reflect the new environment URL, including the new Microsoft Entra Tenant ID.

## Transfer auditing

Environment transfers create two distinct operations that can be audited on the Operations page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. The **Transfer Request** operation is created upon initiating a transfer in the source tenant and is only visible in the source tenant. The **Transfer** operation is created once a transfer is accepted in the destination tenant and lives in the tenant where the environment is located. Before the transfer is executed, this operation is found in the source tenant. After the environment transfer, the operation is found in the destination tenant.

Telemetry signals for the environment transfer operation are emitted to the Application Insights resource to which the environment that is transferred is emitting telemetry. Signals related to this operation are emitted from the moment a transfer is accepted on the destination tenant, see [Environment Lifecycle Telemetry](telemetry-environment-lifecycle-trace.md#environment-transfer-to-different-entra-tenant-operation-scheduled).

## Considerations

- Environment data remains unchanged during the move operation. The exact same environment is linked to a specified Microsoft Entra tenant.
- The localization, Azure region, and type of the environment (Production or Sandbox) remain the same, and can't be changed during this operation.
- The operation involves a downtime period for the environment being transferred (typically not exceeding 30 minutes).
- The operation doesn't move subscriptions, domains, security groups, and other resources between the Microsoft Entra tenants.
  - Ensure the destination tenant has a paid [!INCLUDE[prod_short](../developer/includes/prod_short.md)] user subscription and sufficient environment quota before accepting the transfer.
  - If a security group is assigned to the environment to control environment access, assign a security group in the destination tenant after the transfer completes.
- If you rename an environment upon acceptance in the destination tenant for avoiding duplicate environment names in your tenant, no **Rename** operation is created on the **Operations** page in the admin center. Instead, the **Transfer** operation includes the source and destination environment names.
- Environment settings are carried over from the source to the destination tenant. Depending on the nature of the transfer, environment settings such as the Application Insights Connection String or Partner Access set up on the environment might need to be changed or removed.
- Environments that are [linked](tenant-admin-center-environments.md#linked-power-platform-environment) to a Power Platform environment can't be transferred. Unlink the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment before creating a transfer on the source tenant.
- [Early access preview environments](preview-environments.md#early-access-preview) can only be transferred to a destination tenant that has the [Partner Sandbox](environment-types.md#partnersandbox) license.

## Related information

[Managing Tenant Notifications](tenant-admin-center-notifications.md)
[Managing Apps](tenant-admin-center-manage-apps.md)
[Updating Environments](tenant-admin-center-update-management.md)
[Rename Environments](tenant-admin-center-environments-rename.md)
[Restoring an Environment](tenant-admin-center-backup-restore.md)
[Managing Production and Sandbox Environments](tenant-admin-center-environments.md)
[The Business Central Administration Center](tenant-admin-center.md)
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
