---
title: Managing Environments | Microsoft Docs
description: Use the Business Central administration center to manage your tenant environments.  
author: jaredha

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.reviewer: edupont
ms.search.keywords: administration, tenant, admin, environment, sandbox
ms.date: 04/01/2019
ms.author: jaredha
---

# Managing Environments

The **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides you with an overview of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production and sandbox environments for the tenant, and you can manage upgrades for each environment.

> [!div class="mx-imgBorder"]
> ![Business Central Admin Center](../developer/media/admin/business_central_admin_center.png)

## Viewing details for an environment

In the Environments list, you can open a page with more details for an environment by choosing  the link in the **Name** column of the list for the environment.

> [!div class="mx-imgBorder"]
> ![View details about an environment](../developer/media/admin/business_central_admin_center_details.png)

## Create a new production environment

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides an easy method for creating environments for the tenant. For example, if you have been using a production environment for training purposes, and you have decided to start using [!INCLUDE [nav_prov_short_md](../developer/includes/nav_prov_short_md.md)] to run the business, you can delete the original production environment and then create a new production environment.  

> [!NOTE]
> Each [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant is limited to one production environment.

To create a production environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select the **New** action on the action ribbon.
2. In the **Create Environment** pane, select **Production** in the **Environment Type** list.
3. Select **Create**.

When the new production environment is created, it will be on the latest production version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## <a name="create-a-sandbox-environment"></a>Create a new sandbox environment

A sandbox environment is a non-production instance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Isolated from production, a sandbox environment is the place to safely explore, learn, demo, develop, and test the service without the risk of affecting the data and settings of your production environment.

> [!NOTE]
> Each [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant is limited to three sandbox environments.

To create a sandbox environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select the **New** action on the action ribbon.
2. In the **Create Environment** pane, provide a name for the new environment.
3. Select **Sandbox** in the **Environment Type** list.
4. Specify if you want the sandbox environment to contain a copy of another environment. If this option is selected, select the environment to copy.
    > [!NOTE]
    > When you create a sandbox environment as a copy of another environment, the new environment is created on the same application version as the environment that you are copying. The new environment will also contain all the per-tenant extensions and AppSource extensions that are installed and published in the original environment that is being copied.
5. Select the application version for the new sandbox environment from the **Version** list.
6. Select **Create**.
    > [!NOTE]
    > The sandbox environment will not be accessible until the **State** shows *Active*.

A single, default sandbox environment can also be created from within a page in the production environment of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. For more information, see [How to: Create a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/toc.json).  

To delete a sandbox environment, choose the environment on the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and then Select **Delete** on the action ribbon.

### Precautions for sandbox environments with production data

If a sandbox is created with a copy of a production environment, a number of precautions are taken for that sandbox:

- The job queue is automatically stopped.
- Any base application integration settings are cleared.
- Outbound HTTP calls from extensions are blocked by default and must be approved per extension.
- Any General Data Protection Regulation (GDPR) action must be handled separately and repeated for the sandbox. There is no synchronization with the production environment after the sandbox has been created.

To enable outbound HTTP calls, go to the **Extension Management** page in Business Central, and choose **Configure**. Then, on the **Extension Settings** page, make sure that **Allow HttpClient Requests** is turned on. This setting must be enabled per extension.

### Selecting a version for a new sandbox environment

If, when creating a new sandbox environment, the environment is not a copy of an existing environment, you have the option to select the application version for the new environment. The version list will show the latest Production version, which is the version used for new production environments.

The version list may also have one or more Preview versions. Preview versions are early release candidates of upcoming releases of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] that are made available specifically for sandbox environments. This allows for reviewing new functionality, validating extension compatibility, and other general testing of the upcoming release.

When a sandbox environment is created on a Preview version, the environment will automatically be updated to new Preview versions when they become available. However, the environment will not be updated to the Production version. Once a sandbox environment is on a Preview version, it must stay on a Preview version until it is deleted. The environment may also be deleted if an update between Preview versions fails. It is recommended that Preview versions be used only for temporary testing of an upcoming release.

## Updating environments

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] environments are upgraded according to the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] roadmap with two annual major updates and monthly service updates. For more information, see [Dynamics 365 and Power Platform Release Notes](https://docs.microsoft.com/en-us/business-applications-release-notes/).

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] gives you a level of control over the timing of upgrades for each environment.

### Set the update window

The update window for an environment defines a window of time during the day in which the environment can be updated. When an update is rolling out to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, regardless of whether it's the monthly service update or a major update, the update will be applied to an environment within the time frame that the update window defines. This helps to ensure that updates are applied outside of the customer's normal business hours, for example.

The upgrade window must be a minimum of six hours.

> [!NOTE]
> Desktop users who are signed in during the update will receive an alert in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

To set the update window for an environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], Select the **Name** of the relevant environment to open the environment details.
2. Select the **Set update window** action on the **Update** list on the action ribbon.
3. In the **Set update window** pane, specify the start time and the end time for the update window for the environment.
   > [!NOTE]
   > The update window must be a minimum of six hours.
4. Select **Save**.

### Schedule an update date

For major updates only, you have the option to select a specific date on which the environment is updated. When a major update version is available, a notification is sent to the notification recipients listed on the **Notification recipients** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] (See [Managing Tenant Notifications](tenant-admin-center-notifications.md) for more information). The **Update version** field in the **Version Management** section of the environment details also displays the version number of the available update version.

> [!div class="mx-imgBorder"]
> ![Schedule Business Central Upgrade](../developer/media/admin/business_central_admin_center_upgrade.png)

To schedule an update date:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], Select the **Name** of the relevant environment to open the environment details.
2. Select the **Schedule Upgrade** action on the **Upgrade** list on the action ribbon.
3. In the **Schedule Environment Upgrade** pane, select the desired upgrade date.
    > [!NOTE]
    > The selected date must be within a given date range displayed in the pane.

4. Select **Schedule Upgrade**.

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
