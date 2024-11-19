---
title: Managing Production and Sandbox Environments
description: Use the Business Central administration center to manage your tenant environments, both sandbox and production environments. Create new environments, or restore point-in-time backups.
author: jswymer
ms.topic: conceptual
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, sandbox, restore, backup
ms.date: 11/19/2024
ms.author: jswymer
ms.reviewer: jswymer
---

# Managing production and sandbox environments in the admin center

[!INCLUDE[azure-ad-to-microsoft-entra-id](~/../shared-content/shared/azure-ad-to-microsoft-entra-id.md)]

The **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides you with an overview of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] production and sandbox environments for the tenant, and you can manage updates for each environment.

> [!div class="mx-imgBorder"]
> [ ![Business Central Admin Center.](../developer/media/admin/business_central_admin_center.png)](../developer/media/admin/business_central_admin_center.png)

## Viewing details for an environment

In the environments list, you can view more details by choosing the link in the **Name** column.

> [!div class="mx-imgBorder"]
> ![View details about an environment.](../developer/media/admin/business_central_admin_center_details-V3.png)

### Linked Power Platform environment

A [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment can be linked to a Power Platform environment of the same type (production or sandbox) in the same Azure Geo. Setting up a link to a Power Platform environment lets the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment inherit selected settings from the Power Platform environment. It also provides a default target environment when setting up features that integrate [!INCLUDE[prod_short](../developer/includes/prod_short.md)] with Power Platform and other Dynamics 365 products. Links between [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments and Power Platform environments are exclusive; it isn't possible to simultaneously link multiple [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environments to a single Power Platform environment or vice versa. Only users that have permissions allowing them to update the properties of the targeted Power Platform environment can link a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to it.

> [!NOTE]
> Currently, the only setting administered in the Power Platform Admin Center that can be inherited on the linked [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment is [Customer Lockbox](../security/security-online.md#customer-lockbox).

When a link exists between a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment and a Power Platform environment, several environment lifecycle operations are blocked on the Power Platform environment. The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment can't be deleted if it's linked to a Power Platform environment. For environment lifecycle operations on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment that create a new environment, such as [Copy](tenant-admin-center-environments-copy.md) and [Restore](tenant-admin-center-backup-restore.md), the target environment isn't linked to a Power Platform environment as part of the operation. The target environment can be linked to a different Power Platform environment after the operation that creates the environment completes.

It's possible to unlink the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment from the Power Platform environment from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Unlinking an environment disables any settings the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment inherits from the Power Platform environment, but doesn't disable any integrations set up between the two environments (for example Power Automate flows created from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment or data integration with Dynamics 365 Sales or Dynamics 365 Field Service). Environments that are unlinked can be relinked to the same or different environments from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].

## Types of environments

You can create environments of different types. Choose the type of environment based on what you need it for. Learn more in [Production and Sandbox Environments](environment-types.md).  

### Production environments

[!INCLUDE [admin-env-prod](../developer/includes/admin-env-prod.md)]

[!INCLUDE [admin-suspended](../includes/admin-suspended.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### Sandbox environments

[!INCLUDE [admin-env-sandbox](../developer/includes/admin-env-sandbox.md)]

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

### Pre-sales performance evaluation

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

## Create a new environment

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides an easy method for creating environments for the tenant. For example, you've been using a production environment for training purposes, and you've decided to start using [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to run the business. You can, in this case, delete the original production environment and then create a new production environment.  

[!INCLUDE [admin-env-quota](../developer/includes/admin-env-quota.md)]

You can create new environments that are either production environments or sandboxes. You can also copy an existing environment. Learn more in [Copy a Production or Sandbox Environment](tenant-admin-center-environments-copy.md).  

> [!IMPORTANT]
> Make sure that you understand the limitations of a sandbox before you create a new sandbox environment. Learn more in the [Sandbox environments](#sandbox-environments) section.

### Create a new environment that isn't a copy of an existing environment

1. In the navigation pane on the left side of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments**, then select the **New** action on the action ribbon.
1. In the **Create Environment** pane, specify a name for the new environment.
1. In the **Environment Type** list, choose **Production** or **Sandbox**.
1. In the **Application family** field, specify the type of solution that this environment is based on if it isn't [!INCLUDE [prod_short](../includes/prod_short.md)].  
1. In the **Country** list, select the country for the environment. The specified country determines the localization for the environment and the Azure region in which the environment is created and stored.

   > [!TIP]
   > To create a sandbox environment that's based on the Business Central W1 (non-localized) version, choose a country that uses the W1 BaseApp, as indicated in the [Country/regional availability and supported languages](../compliance/apptest-countries-and-translations.md) article.

1. In the **Version** list, specify the relevant application version for the new environment if more than one version is available.

   New production environments are based on the latest production version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. New sandboxes are based on the specified version.
 
1. Choose the **Create** action.  

   The new environment isn't accessible until the **State** becomes **Active**.

> [!NOTE]
> The new environment has a default update window that guarantees future updates won't run between 8:00 PM and 6:00 AM local time for the environment country. This update window can be changed after the environment has been created. Learn more in [Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md#set-the-update-window-for-each-environment).

To delete an environment, choose the environment on the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and then choose **Delete** on the action ribbon.

### Selecting a version for a new sandbox environment

If you create a sandbox that isn't a copy of an existing environment, you must specify an application version for the new environment. The version list shows the latest *production* version, which is the version used for new production environments.

The version list might also have one or more *preview* versions. Preview versions are early release candidates of upcoming releases of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that are made available specifically for sandbox environments. This list gives you access to review new functionality, validate extension compatibility, and other general testing of the upcoming release.

When you create a sandbox environment on a preview version, the environment will automatically be updated to new preview versions when they become available. However, the environment won't be updated to the production version. Once a sandbox environment is on a preview version, it must stay on a preview version until it's deleted. The environment can also be deleted if an update between preview versions fails. We recommend that preview versions are used only for temporary testing of an upcoming release.

## <a name="opslog"></a>Log of administrative operations

The **Operations** section of [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] provides a log of operations that internal administrators and delegated administrators from the partner have made in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] or through the admin center API. Use this log to see which operations were created and when. You can also access detailed error messages in this log, should any operation fail.

### Operations

Currently, the log includes the following operations:

|Type|Description|Admin center|API|Extension Management Page|
|----|-----------|------------|---|-------------------------|
|Copy environment|An environment was created from a copy of another environment.|[See...](tenant-admin-center-environments-copy.md)|[See...](administration-center-api_environments.md#copy-environment)||
|Create environment |A new environment was created|[See...](#create-a-new-environment)|[See...](administration-center-api_environments.md#create-new-environment)||
|Soft delete environment|An environment was soft deleted.|[See...](tenant-admin-center-environments-delete.md#delete-an-environment)|[See...](administration-center-api_environments.md#delete-environment)||
|Recovered environment|A deleted environment was recovered.|[See...](tenant-admin-center-environments-delete.md#recover-an-environment)|[See...](administration-center-api_environments.md#recover-environment)||
|Delete environment|An environment was permanently deleted.|[See...](tenant-admin-center-environments-delete.md)|[See...](administration-center-api_environments.md#delete-environment)||
|Modify environment|One of the following operations was done on an environment: <ul><li>Set update window</li><li>Set Application Insights connection string</li><li>Set security group</li><li>Clear security group</li><li>Reschedule update </li><li>Set access with Microsoft 365 licenses.</li></ul>|[See update management...](tenant-admin-center-update-management.md)<br /><br />[See telemetry...](tenant-admin-center-telemetry.md)<br /><br />[See manage access...](tenant-admin-center-manage-access.md)|[See environment settings...](administration-center-api_environment_settings.md)||
|Move environment|An environment was moved to another Microsoft Entra organization.|[See...](tenant-admin-center-environments-move.md)|||
|Rename environment|Environment was renamed.|[See...](tenant-admin-center-environments-rename.md)|[See...](administration-center-api_environments.md#rename-environment)||
|Restart environment|Environment was restarted|[See...](tenant-admin-center-manage-sessions.md#restart-environment)||
|Update environment|An environment is updated to a newer version.|[See...](tenant-admin-center-update-management.md)|[See...](administration-center-api_environment_settings.md)|
|Environment app hotfix|A hotfix was applied to the app by using the App Management API.||[See...](appmanagement/app-management-api.md#schedule-environment-hotfix)||
|Environment app install|App was installed by using the tenant's **Extension Management** page or the API install endpoint.||[See...](administration-center-api_app_management.md#install-an-app)|[See...](/dynamics365/business-central/ui-extensions-install-uninstall#installing-an-extension)|
|Environment app uninstall|App was uninstalled by using the tenant's **Extension Management** page or the API uninstall endpoint.||[See...](administration-center-api_app_management.md#uninstall-an-app)|[See...](/dynamics365/business-central/ui-extensions-install-uninstall#uninstalling-an-extension)|
|Environment app update |App was updated either by the Admin Center or API update endpoint.|[See...](tenant-admin-center-manage-apps.md#install-an-app-update---the-flow)|[See...](administration-center-api_app_management.md#update-an-app)||

### Retention period

The operations are kept for 180 days, after which they're deleted.

## Related information

[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Managing Apps](tenant-admin-center-manage-apps.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Sessions](tenant-admin-center-manage-sessions.md)  
[Copy a Production or Sandbox Environment](tenant-admin-center-environments-copy.md)  
[Rename Environments](tenant-admin-center-environments-rename.md)  
[Restoring an Environment](tenant-admin-center-backup-restore.md)  
[Move an Environment to another Microsoft Entra organization](tenant-admin-center-environments-move.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)
[The Business Central Administration Center](tenant-admin-center.md)  
