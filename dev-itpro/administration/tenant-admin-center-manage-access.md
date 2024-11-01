---
title: Manage Access to Environment
description: This article describes features in the admin center that help controlling user access to environments.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 11/01/2022
ms.custom: bap-template
---
# Manage Access to Environments

This article describes [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] features that you use for controlling user access to environments. In addition to what you do in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], these features typically require configuration and set up in either [!INCLUDE[prod_short](../developer/includes/prod_short.md)] or another product or service.

## Manage access for internal users

To manage access at the environment level, you can assign a Microsoft Entra group to the environment. By assigning a Microsoft Entra group to an environment, only direct and indirect members of the group are granted access to the environment. Indirect members are users in another group, which itself is a member of the group assigned to the environment. Although all licensed users in Microsoft Entra ID will be added to the environment when it's synchronized with Microsoft 365, only group members can sign in.

From the **Environments** page, you see the currently assigned group in the **Security Group** column. **Not set** indicates that no group is assigned. **Not available** indicates that the group that was assigned is no longer available in the Microsoft Entra ID.

> [!NOTE]
> The restrictions imposed by a security group assigned to an environment don't apply to administrators. Internal administrators can freely sign in to all environments, regardless of the assigned group. Access for delegated administrators is determined by the **Partner access** setting on the environment.

### Assign, change, or remove a group

Before you can assign a Microsoft Entra group to an environment, the group must be created in your Microsoft Entra tenant. Learn more at [Create a basic group and add members using Microsoft Entra ID](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) in the Azure documentation.

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

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] customers working with multiple partners might want to control which partners and [multitenant applications](administration-center-api.md#authenticate-using-service-to-service-microsoft-entra-apps-client-credentials-flow) can access and administer which environments. Internal global administrators can use the **Partner access** setting in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to control whether an environment is accessible and administrable by delegated administrators and multitenant applications, and if so, control from which Entra tenants these delegated administrators and multitenant applications should come to do so.

> [!IMPORTANT]
> Up to ten Entra tenants can be allowlisted per environment to enable them to access and administer the environment.

Environments that aren't set up to allow access and administration by the authenticating entity, either because no partner access is allowed at all or because the home Entra tenant of the delegated administrator or multitenant app isn't allowlisted, aren't visible or administrable in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] and the admin center API. Delegated administrators are also blocked from accessing the environment itself through any client or API. Multitenant apps are only blocked from using the admin center API. To control app access to other [!INCLUDE[prod_short](../developer/includes/prod_short.md)] APIs for the environment remove its permissions in the environment. Learn more at [Assign permissions to users and groups](/dynamics365/business-central/ui-define-granular-permissions).

The **Partner access** setting doesn't override the tenant-level prerequisites for any delegated administrator or multitenant application to authenticate to a customer tenant. It only allows for more granular access controls on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment-level after tenant-level prerequisites are in place. Delegated administrators that don't have an Entra role that allows for administration and access of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments assigned in the customer tenant as part of an active [GDAP relationship](/partner-center/customers/gdap-introduction) can't access the customer tenant even if their home Entra tenant is allowlisted in the **Partner access** settings for the environment. Multitenant applications that aren't registered in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] or environment itself, or for which no [consent](/entra/identity/enterprise-apps/grant-admin-consent) has been granted in the customer tenant, can't access the customer tenant even if their home Entra tenant is allowlisted in the **Partner access** settings for the environment.

### Set up partner access

To turn access on or off or limit access to selected home Entra tenants, complete the following steps:

> [!IMPORTANT]
> Only internal global administrators can control the **Partner access** settings.

1. Select **Environments**, and then select the environment for which you want to change partner access.
2. On the environments details page, select **Modify** for the **Partner access** setting.
3. In the **Partner access** pane, turn the **Allow partner access** switch on or off. If off, delegated administrators or multitenant apps that aren't homed in the customer tenant can't administer or access the environment.
4. Use the **Allow access to all partner tenants** switch to control whether all partners with tenant-level access can access the environment. If off, a list of partners with current tenant-level access appears. Use the switches on each row in the list to allow or deny access for a specific partner. You can allow up to 10 partner tenants per environment.
5. Select **Save** and accept the confirmation dialog. The change takes effect immediately.

### Considerations

- By default, environments are set up to allow all partner access. To ensure partners that get access to your tenant in the future don't automatically gain access to an environment, set up the environment not to allow access to all partner tenants, then explicitly grant the partners (who currently have access to your tenant) access to the environment.
- The **Partner access** settings on an environment are preserved if tenant-level access is removed, for example, when a GDAP relationship has ended or application consent to the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] API has been revoked. If the tenant-level access is reenabled, the partner automatically gets access to the environment again. To avoid this situation, change the **Partner access** setting on the environment after the tenant-level access is removed.
- The **Partner access** settings on an environment are preserved during environment lifecycle operations, such as [copy](tenant-admin-center-environments-copy.md), [restore](tenant-admin-center-backup-restore.md), and [transfer](tenant-admin-center-environments-move.md).
  - During a restore operation, the setting is restored to what it was at the point-in-time the environment is being restored to.
  - After an environment transfer, the partner access setting is transferred to the destination tenant. If the destination tenant has different partners, the setting should be updated after the environment transfer completes.
- For partners that don't have access to all environments in a customer tenant, the [capacity](tenant-admin-center-capacity.md) page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] shows tenant totals for consumption (storage and environments), but only shows environment-level consumption for environments to which the partner has access.
- For partners that don't have access to all environments in a customer tenant, the [operations](tenant-admin-center-environments.md#opslog) page in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] only shows operations for environments to which the partner has access to at the time the operations page is opened. Operations related to environments that no longer exist in the tenant, for example operations for environment deletion or completing an environment transfer, show for all partners.
  
  The same applies for the [Database export history](tenant-admin-center-database-export.md) page. Entries on this page are filtered by environment name. Partners can only see entries if the environment name for which the database export was run matches with an environment to which they have access.
- The [Reported outages](report-outage.md) page shows all reported outages in the tenant and isn't filtered to show only outages reported for environments to which a partner has access.
- The Partner access setting doesn't affect email notifications sent to [notification recipients](tenant-admin-center-notifications.md) set up for the tenant in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Notifications regarding all environments in the tenant are sent to all notification recipients. To avoid partners receiving notifications regarding environments to which they don't have access, notify using [environment lifecycle telemetry](telemetry-environment-lifecycle-trace.md) instead.

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
