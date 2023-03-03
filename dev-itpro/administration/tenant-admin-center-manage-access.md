---
title: Manage Access to Environment
description: This article describes features in the admin center that help controlling user access to environments.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.topic: how-to
ms.date: 11/03/2022
ms.custom: bap-template
---
# Manage Access to Environments

This article describes admin center features that you use for controlling user access to environments. In addition to what you do in the admin center, these features typically require configuration and set up in either Business Central or another product or service.

## Manage access using Azure Active Directory groups

To manage access at the environment level, you can assign an Azure Active Directory (Azure AD) group to the environment. By assigning an Azure AD group to an environment, only direct and indirect members of the group are granted access to the environment. Indirect members are users in another group, which itself is a member of the group assigned to the environment. Although all licensed users in Azure AD will be added to the environment when it's synchronized with Microsoft 365, only group members can sign in.

From the **Environments** page, you'll see the currently assigned group in the **Security Group** column. **Not set** indicates that no group has been assigned. **Not available** indicates that the group that was assigned is no longer available in the Azure AD.

> [!NOTE]
> The restrictions imposed by a security group don't apply to administrators. Local and delegated admins can freely sign in to all environments, regardless of the assigned group.
 
### Assign, change, or remove a group

Before you can assign an Azure AD group to an environment, the group must be created in your Azure AD tenant. For more information, see [Create a basic group and add members using Azure Active Directory](/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal) in the Azure documentation.

1. Select **Environments**, then select the environment on which you want to assign, change, or remove the group.
2. On the **Environment Details** page, the currently assigned group is shown under **Security Group**.

    - To assign a group, select **(Define)**.
    - To change or remove the currently assigned group, select **Modify**.
3. The **Edit Security Group** pane shows the current security group, if any, followed by all the available groups in Azure AD.

   - To assign or change a group, search for and select the group from the list.
   - To remove a group, select ![Unassign a group.](../developer/media/admin/admin-center-delete-group.png) under **Current Security Group**.

    > [!NOTE]
    > If there are more than 10,000 groups in Azure AD, they can't all be retrieved and displayed in the admin center. Instead, you'll see the message **You have too many groups to display them all**. In this case, you'll have to enter the object ID of the group that you want to assign. You get the object ID from the [Azure portal](https://portal.azure.com).

4. Select **Save** when done.

> [!NOTE]
> If you change or remove a group, it can take a while before the changes to take effect or access is revoked from users.

## Manage access with Microsoft 365 licenses

To help [!INCLUDE [prod_short](../developer/includes/prod_short.md)] users easily share and collaborate on business data with their coworkers, you can enable access with Microsoft 365 licenses. When enabled, users within the same organization who have an applicable Microsoft 365 license will be able to read (but not write) Business Central data that is shared with them in Microsoft Team&mdash;without needing a Business Central license.

> [!NOTE]
> This setting is only available for environments of platform version 21.1 or later.

Enabling access to an environment is one of multiple steps required to configure this capability. We recommend that you complete all other setup steps before enabling access for an environment from the Business Central admin center. Learn more at [Set Up Access with Microsoft 365 licenses](/dynamics365/business-central/admin-access-with-m365-license). 

To turn access on or off, complete the following steps:

1. Select **Environments**, then select the environment on which you want to change license access.
2. On the environment details page, select **Modify** for the **Access with Microsoft 365 licenses** setting. 
3. In the **Microsoft 365 licenses** pane, turn the switch on or off.
4. Select **Save** and accept the confirmation dialog. The change takes effect immediately.

## See also

[Managing Environments](tenant-admin-center-environments.md)  