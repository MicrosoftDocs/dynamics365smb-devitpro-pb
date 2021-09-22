---
title: Managing Production and Sandbox Environments
description: Use the Business Central administration center to manage your tenant environments, both sandbox and production environments. Create new environments, or restore point-in-time backups.
author: jswymer
ms.service: dynamics365-business-central
ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, restore, backup
ms.date: 10/01/2021
ms.author: jswymer
---

# Managing Production and Sandbox Environments in the Admin Center

The **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides you with an overview of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] production and sandbox environments for the tenant, and you can manage updates for each environment.

> [!div class="mx-imgBorder"]
> ![Business Central Admin Center.](../developer/media/admin/business_central_admin_center.png)

## Viewing details for an environment

In the environments list, you can view more details by choosing the link in the **Name** column.

> [!div class="mx-imgBorder"]
> ![View details about an environment.](../developer/media/admin/business_central_admin_center_details.png)

## Types of environments

You can create environments of different types. Which type of environment to choose depends on what you need it for. For more information, see [Production and Sandbox Environments](environment-types.md).  

### Production environments

[!INCLUDE [admin-env-prod](../developer/includes/admin-env-prod.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### Sandbox environments

[!INCLUDE [admin-env-sandbox](../developer/includes/admin-env-sandbox.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### Pre-sales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

## Create a new environment

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides an easy method for creating environments for the tenant. For example, if you have been using a production environment for training purposes, and you've decided to start using [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to run the business, you can delete the original production environment and then create a new production environment.  

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

You can create new environments that are either production environments or sandboxes. You can also copy an existing environment. For more information, see the [Copy an environment](#copy-an-environment) section.  

### To create a new environment that is not a copy of an existing environment

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **New** action on the action ribbon.
2. In the **Create Environment** pane, in the **Environment Type** list, choose **Production** or **Sandbox**.
3. In the **Country** list, select the country for the environment. The specified country determines the localization for the environment and the Azure region in which the environment is created and stored.
4. Specifically for sandbox environments, you must also specify the relevant application version for the new sandbox environment from the **Version** list if more than one version is available.
5. Select **Create**.

> [!NOTE]
> The new environment won't be accessible until the **State** shows *Active*.

New production environments are based on the latest production version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. New sandboxes are based on the specified version.

> [!IMPORTANT]
> Make sure that you understand the limitations of a sandbox before you create a new sandbox environment. For more information, see the [Sandbox environments](#sandbox-environments) section.

To delete an environment, choose the environment on the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and then choose **Delete** on the action ribbon.

### Selecting a version for a new sandbox environment

If you create a sandbox that isn't a copy of an existing environment, you must specify an application version for the new environment. The version list will show the latest *production* version, which is the version used for new production environments.

The version list may also have one or more *preview* versions. Preview versions are early release candidates of upcoming releases of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that are made available specifically for sandbox environments. This list gives you access to review new functionality, validate extension compatibility, and other general testing of the upcoming release.

When you create a sandbox environment on a preview version, the environment will automatically be updated to new preview versions when they become available. However, the environment won't be updated to the production version. Once a sandbox environment is on a preview version, it must stay on a preview version until it's deleted. The environment can also be deleted if an update between preview versions fails. We recommend that preview versions are used only for temporary testing of an upcoming release.

## Copy an environment

[!INCLUDE [2021_releasewave2](../includes/2021_releasewave2.md)]

You can create an environment that is a copy of an existing environment, such as a sandbox that is based on production for troubleshooting, or a production environment that is based on a sandbox, for example. When you create an environment as a copy of another environment, the new environment is created on the same application version as the environment that you are copying. The new environment will contain all per-tenant extensions and AppSource extensions that are installed and published in the original environment that is being copied.

### To copy an environment

1. Select **Environments**, then select the environment you want to rename.
2. On the **Environment Details** page, choose the **Copy** action.
3. In the **Copy environment** pane, specify the type of environment that you want to created based on the current environment.
4. Specify a name for the new environment.
5. Choose the **Create** action.

When the process starts, you can go to the list of your environments and see the status of the new environment. At first, you'll see the new environment with the state **Copy queued**, which changes to **Copying**, and then **Active** once the new environment is fully up and running. The original environment that this new environment is based on remains active.  

### Sandboxes based on production environments

[!INCLUDE [admin-env-sandbox-precautions](../developer/includes/admin-env-sandbox-precautions.md)]

## <a name="opslog"></a>Log of administrative operations

The **Operations** section of [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] provides a log of operations that internal administrators and delegated administrators from the partner have made in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] or through the admin center API. Use this log to see which operations were created and when. You can also access detailed error messages in this log, should any operation fail.

### Operations

Currently, the log includes the following operations:

|Type|Description|More information|
|----|-----------|----------------|
|Rename environment|Environment was renamed by using the Admin Center.|[Rename an Environment](tenant-admin-center-environments-rename.md)|
|Restore environment|Environment was restored by using the Admin Center.|[Restoring an Environment](tenant-admin-center-backup-restore.md)|
|Move environment|An environment was moved to another Azure Active Directory organization.|[Move an Environment](tenant-admin-center-environments-move.md)
|Environment app hotfix|App was hotfixed by using the App Management API.|[App Management API](appmanagement/app-management-api.md#schedule-environment-hotfix)
|Environment app install|App was installed by using the tenant's **Extension Management** page or the API install endpoint.|[Extension Management Page](/dynamics365/business-central/ui-extensions-install-uninstall#installing-an-extension)<br><br>[Install Endpoint](administration-center-api.md#install-an-app)|
|Environment app uninstall|App was uninstalled by using the tenant's **Extension Management** page or the API uninstall endpoint.|[Extension Management Page](/dynamics365/business-central/ui-extensions-install-uninstall#uninstalling-an-extension)<br><br>[Uninstall Endpoint](administration-center-api.md#uninstall-an-app)|
|Environment app update |App was updated either by the Admin Center or API update endpoint.| [Update an App in Admin Center](tenant-admin-center-manage-apps.md#install-an-app-update---the-flow)<br><br>[Update Endpoint](administration-center-api.md#update-an-app)|

### Retention period

The operations are kept for 365 days, after which they're deleted.

## Delete an environment

You can delete environments in the admin center, such as when a sandbox environment is not longer needed.  

> [!IMPORTANT]
> Make sure no user is using the environment before you delete it.
>
> Also, be very careful before you choose the *Delete* action for the environment. The action is irreversible.

## See also

[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Sessions](tenant-admin-center-manage-sessions.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Azure Active Directory organization](tenant-admin-center-environments-move.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
[The Business Central Administration Center](tenant-admin-center.md)  
