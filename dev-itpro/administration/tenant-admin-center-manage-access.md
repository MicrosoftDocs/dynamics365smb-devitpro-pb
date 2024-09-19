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
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] customers working with multiple partners may want to control which partner(s) and [multitenant application(s)](administration-center-api.md#authenticate-using-service-to-service-microsoft-entra-apps-client-credentials-flow) can access and administer which environment(s). Internal administrators can use the **Partner access** setting in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] to control whether an environment is accessible and administrable by delegated administrators and multitenant applications, and, if so, to control from which Entra tenant(s) these delegated administrators and multitenant applications should come to do so.

> [!IMPORTANT]
> Up to ten Entra tenants can be allowlisted per environment to enable them to access and administer the environment.

Environments that are set up not to allow access and administration by the authenticating entity, either because no partner access is allowed at all or because the home Entra tenant of the delegated administrator or multitenant app is not allowlisted, are not visible or administrable in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] and the Admin Center API, and cannot be accessed using any client or API.

The Partner access setting does not override the tenant-level prerequisites for any delegated administrator or multitenant application to authenticate to a customer tenant; it only allows for more granular access controls on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment level after tenant-level prerequisites are in place. Delegated administrators that do not have a Entra role that allows for administration and access of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments assigned in the customer tenant as part of an active [GDAP relationship](partner-center/customers/gdap-introduction) cannot access the customer tenant even if their home Entra tenant is allowlisted in the Partner access settings for the environment. Multitenant applications that are not registered in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] and/or in the environment itself, or for which no [consent](/entra/identity/enterprise-apps/grant-admin-consent) has been granted in the customer tenant, cannot access the customer tenant even if their home Entra tenant is allowlisted in the Partner access settings for the environment.

To turn access on or off or to limit access to selected home Entra tenants, complete the following steps:

> [!IMPORTANT]
> The Partner access setting can only be controlled by internal administrators.

1. Select **Environments**, then select the environment for which you want to change partner access.
2. On the environments details page, select **Modify** for the **Partner access** setting.
3. In the **Partner access** pane, turn the switch on or off. If off, no delegated administrators or multitenant apps not homed in the customer tenant can administer or access the environment.
4. Optionally, if on, up to 10 environments can be allowlisted to only allow administration and access from selected tenants.
5. Select **Save** and accept the confirmation dialog. The change takes effect immediately.

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