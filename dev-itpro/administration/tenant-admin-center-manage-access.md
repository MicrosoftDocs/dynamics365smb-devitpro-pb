---
title: Manage Access to Environment
description: This article describes features in the admin center that help controlling user access to environments.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer

ms.topic: how-to
ms.date: 11/03/2022
ms.custom: bap-template
---
# Manage Access to Environments

This article describes [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] features that you use for controlling user access to environments. In addition to what you do in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], these features typically require configuration and set up in either [!INCLUDE[prod_short](../developer/includes/prod_short.md)] or another product or service.

## Manage access for internal users

To manage access at the environment level, you can assign a Microsoft Entra group to the environment. By assigning a Microsoft Entra group to an environment, only direct and indirect members of the group are granted access to the environment. Indirect members are users in another group, which itself is a member of the group assigned to the environment. Although all licensed users in Microsoft Entra ID will be added to the environment when it's synchronized with Microsoft 365, only group members can sign in.

From the **Environments** page, you'll see the currently assigned group in the **Security Group** column. **Not set** indicates that no group has been assigned. **Not available** indicates that the group that was assigned is no longer available in the Microsoft Entra ID.

> [!NOTE]
> The restrictions imposed by a security group assigned to an environment don't apply to administrators. Internal administrators can freely sign in to all environments, regardless of the assigned group. Access for delegated administrators is determined by the Partner access setting on the environment.

### Assign, change, or remove a group

Before you can assign a Microsoft Entra group to an environment, the group must be created in your Microsoft Entra tenant. For more information, see [Create a basic group and add members using Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) in the Azure documentation.

1. Select **Environments**, then select the environment on which you want to assign, change, or remove the group.
2. On the **Environment Details** page, the currently assigned group is shown under **Security Group**.

    - To assign a group, select **(Define)**.
    - To change or remove the currently assigned group, select **Modify**.
3. The **Edit Security Group** pane shows the current security group, if any, followed by all the available groups in Microsoft Entra ID.

   - To assign or change a group, search for and select the group from the list.
   - To remove a group, select ![Unassign a group.](../developer/media/admin/admin-center-delete-group.png) under **Current Security Group**.

    > [!NOTE]
    > If there are more than 10,000 groups in Microsoft Entra ID, they can't all be retrieved and displayed in the admin center. Instead, you'll see the message **You have too many groups to display them all**. In this case, you'll have to enter the object ID of the group that you want to assign. You get the object ID from the [Azure portal](https://portal.azure.com).

4. Select **Save** when done.

> [!NOTE]
> If you change or remove a group, it can take a while before the changes to take effect or access is revoked from users.

## Manage access for delegated administrators and multitenant applications

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] customers working with multiple partners may want to control which partner(s) and [multitenant application(s)](administration-center-api.md#authenticate-using-service-to-service-microsoft-entra-apps-client-credentials-flow) can access and administer which environment(s). Internal global administrators can use the **Partner access** setting in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to control whether an environment is accessible and administrable by delegated administrators and multitenant applications, and, if so, to control from which Entra tenant(s) these delegated administrators and multitenant applications should come to do so.

> [!IMPORTANT]
> Up to ten Entra tenants can be allowlisted per environment to enable them to access and administer the environment.

Environments that are set up not to allow access and administration by the authenticating entity, either because no partner access is allowed at all or because the home Entra tenant of the delegated administrator or multitenant app is not allowlisted, are not visible or administrable in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] and the Admin Center API. Delegated administrators are also blocked from accessing the environment itself through any client or API. Multitenant apps are only blocked from using the Admin Center API; to control app access to other [!INCLUDE[prod_short](../developer/includes/prod_short.md)] APIs for the environment, [remove its permissions in the environment](/dynamics365/business-central/ui-define-granular-permissions).

The Partner access setting does not override the tenant-level prerequisites for any delegated administrator or multitenant application to authenticate to a customer tenant; it only allows for more granular access controls on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment level after tenant-level prerequisites are in place. Delegated administrators that do not have a Entra role that allows for administration and access of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments assigned in the customer tenant as part of an active [GDAP relationship](/partner-center/customers/gdap-introduction) cannot access the customer tenant even if their home Entra tenant is allowlisted in the Partner access settings for the environment. Multitenant applications that are not registered in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] and/or in the environment itself, or for which no [consent](/entra/identity/enterprise-apps/grant-admin-consent) has been granted in the customer tenant, cannot access the customer tenant even if their home Entra tenant is allowlisted in the Partner access settings for the environment.

To turn access on or off or to limit access to selected home Entra tenants, complete the following steps:

> [!IMPORTANT]
> The Partner access setting can only be controlled by internal global administrators.

1. Select **Environments**, then select the environment for which you want to change partner access.
2. On the environments details page, select **Modify** for the **Partner access** setting.
3. In the **Partner access** pane, turn the **Allow partner access** switch on or off. If off, no delegated administrators or multitenant apps not homed in the customer tenant can administer or access the environment.
4. Use the **Allow access to all partner tenants** switch to control if all partners with tenant-level access should be able to access the environment. If off, a list of partners with current tenant-level access will show. Use the switches on each row on the list to allow or deny access for a specific partner. You can allow up to ten partner tenants per environment.
5. Select **Save** and accept the confirmation dialog. The change takes effect immediately.

### Considerations
- By default, environments are set up to allow all partner access. To ensure partners that get access to your tenant in the future do not automatically gain access to an environment, set the environment up not to allow access to all partner tenants and explicitly allow the partner(s) that currently has(have) access to your tenant to have access to the environment.
- The Partner access settings on an environment are preserved if tenant-level access is removed, for example when a GDAP relationship has ended or application consent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API has been revoked. Should the tenant-level access be re-enabled, the partner would automatically have access to the environment again. To avoid this, change the Partner access setting on the environment after the tenant-level access is removed.
- The Partner access settings on an environment are preserved during environment lifecycle operations, such as [copy](tenant-admin-center-environments-copy.md), [restore](tenant-admin-center-backup-restore.md), and [transfer](tenant-admin-center-environments-move.md).
  - During a restore operation, the setting is restored to what it was at the point-in-time the environment is being restored to.
  - After an environment transfer, the partner access setting is transferred to the destination tenant. If the destination tenant has different partners, the setting should be updated after the environment transfer completes.
- For partners that do not have access to all environments in a customer tenant, the [capacity](tenant-admin-center-capacity.md) page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] will show tenant totals for consumption (storage and environments), but will only show environment-level consumption for environments to which the partner has access.
- For partners that do not have access to all environments in a customer tenant, the [operations](tenant-admin-center-environments.md#opslog) page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] will only show operations for environments to which the partner has access at the time the operations page is opened. Operations related to environments that no longer exist in the tenant, for example operations for environment deletion or completing an environment transfer, show for all partners.
- The Partner access setting does not affect email notifications sent to [notification recipients](tenant-admin-center-notifications.md) set up for the tenant in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]; notifications regarding all environments in the tenant are sent to all notification recipients. To avoid partners receiving notifications regarding environments to which they do not have access, notify using [environment lifecycle telemetry](telemetry-environment-lifecycle-trace.md) instead.

## Manage access with Microsoft 365 licenses

To help [!INCLUDE [prod_short](../developer/includes/prod_short.md)] users easily share and collaborate on business data with their coworkers, you can enable access with Microsoft 365 licenses. When enabled, users within the same organization who have an applicable Microsoft 365 license will be able to read (but not write) [!INCLUDE[prod_short](../developer/includes/prod_short.md)] data that is shared with them in Microsoft Team&mdash;without needing a Business Central license.

Enabling access to an environment is one of multiple steps required to configure this capability. We recommend that you complete all other setup steps before enabling access for an environment from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Learn more at [Set Up Access with Microsoft 365 licenses](/dynamics365/business-central/admin-access-with-m365-license). 

To turn access on or off, complete the following steps:

1. Select **Environments**, then select the environment on which you want to change license access.
2. On the environment details page, select **Modify** for the **Access with Microsoft 365 licenses** setting. 
3. In the **Microsoft 365 licenses** pane, turn the switch on or off.
4. Select **Save** and accept the confirmation dialog. The change takes effect immediately.

## See also

[Managing Environments](tenant-admin-center-environments.md)  
