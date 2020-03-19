---
title: Managing Environments | Microsoft Docs
description: Use the Business Central administration center to manage your tenant environments. 
author: edupont04
ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox
ms.date: 12/10/2019
ms.author: edupont
---

# Managing Environments

The **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides you with an overview of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production and sandbox environments for the tenant, and you can manage updates for each environment.

> [!div class="mx-imgBorder"]
> ![Business Central Admin Center](../developer/media/admin/business_central_admin_center.png)

## Viewing details for an environment

In the list of environments, you can open a page with more details for an environment by choosing the link in the **Name** column of the list for the environment.

> [!div class="mx-imgBorder"]
> ![View details about an environment](../developer/media/admin/business_central_admin_center_details.png)

## Types of environments

You can create environments of different types. Which type of environment to choose depends on what you need it for.  

<!--The following table outlines some of the benefits of each environment type.

|Column1  |Column2  |
|---------|---------|
|Row1     |         |
|Row2     |         |
|Row3     |         |
|Row4     |         |
|Row5     |         |-->

### Production environments

Production environments are meant to be precisely that: Environments that a business can run their daily business in [!INCLUDE [prodshort](../developer/includes/prodshort.md)] in, deployed on performance tiers in Azure with a guaranteed high level of availability and support.  

Production environments are backed up automatically and frequently to help protect business data. For more information, see [How often are production databases backed up?](../faq.md#how-often-are-production-databases-backed-up).  

You can create additional production environments for training or performance testing, for example. However, for training purposes, in many cases organizations will prefer to create a sandbox environment with production data. You can also create additional production environments to support offices in different countries.  

You can have a maximum of three production environments for each [!INCLUDE [prodshort](../developer/includes/prodshort.md)] tenant.

### Sandbox environments

Sandbox environments are meant to be precisely that: Environments that you can play around with, use as a testbed for development, and delete at will. You can deploy apps straight from Visual Studio Code to a sandbox environment, and you can attach a debugging session to a sandbox.  

You can also safely use sandboxes for training, such as for following a learning path from [Microsoft Learn](/learn/browse/?products=dynamics-business-central), because it's a safe environment to experiment with. If anything goes wrong, you just delete the sandbox and start over.  

> [!IMPORTANT]
> The automatic backup that applies to production environments does not apply to sandbox environments. If you want to export data from a sandbox environment, you can use Excel or RapidStart, but you cannot request a database export.

You can create a sandbox environment that includes data from your production environment for debugging purposes, for example. But if you want to run performance tests, or similar benchmarking, the sandbox is not reliable enough for that purpose. This is because sandboxes run in a different performance tier on Azure than production environments. Instead, create a dedicated environment based on the Production environment type - this gives you the exact experience and performance that users will experience in the actual production environment.  

Sandbox environments are handy for certain types of development scenarios because the debugging endpoint is open by default. This means that you can attach Visual Studio Code to a running system and debug through running code. It also allows you to publish directly to the environment from Code.

You can have a maximum of three sandbox environments for each [!INCLUDE [prodshort](../developer/includes/prodshort.md)] tenant.  

[!INCLUDE [perf-demo](../developer/includes/perf-demo.md)]

## Create a new production environment

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides an easy method for creating environments for the tenant. For example, if you have been using a production environment for training purposes, and you have decided to start using [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to run the business, you can delete the original production environment and then create a new production environment.  

> [!NOTE]
> Each [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant is limited to three production environments.

To create a production environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **New** action on the action ribbon.
2. In the **Create Environment** pane, in the **Environment Type** list, choose **Production**.
3. In the **Country** list, select the country for the environment. The specified country determines the localization for the environment, as well as the Azure region in which the environment is created and stored.
4. Select **Create**.

When the new production environment is created, it will be based on the latest production version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## <a name="create-a-sandbox-environment"></a>Create a new sandbox environment

A sandbox environment is a non-production instance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Isolated from production, a sandbox environment is the place to safely explore, learn, demo, develop, and test the service without the risk of affecting the data and settings of your production environment.

> [!IMPORTANT]
> Make sure that you understand the limitations of a sandbox before you create a new sandbox environment. For more information, see the [Sandbox environments](#sandbox-environments) section.

> [!NOTE]
> Each [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant is limited to three sandbox environments.

To create a sandbox environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **New** action on the action ribbon.
2. In the **Create Environment** pane, specify a name for the new environment.
3. In the **Create Environment** pane, in the **Environment Type** list, choose **Sandbox**.
4. Specify if you want the sandbox environment to contain a copy of another environment. If you choose this option, you must specify which environment to copy.
    > [!NOTE]
    > When you create a sandbox environment as a copy of another environment, the new environment is created on the same application version as the environment that you are copying. The new environment will also contain all per-tenant extensions and AppSource extensions that are installed and published in the original environment that is being copied.
5. In the **Country** list, select the country for the environment. The specified country determines the localization for the environment, as well as the Azure region in which the environment is created and stored.
6. Choose the relevant application version for the new sandbox environment from the **Version** list if more than one version is available.
7. Select **Create**.
    > [!NOTE]
    > The sandbox environment will not be accessible until the **State** shows *Active*.

A single, default sandbox environment can also be created in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. For more information, see [How to: Create a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/toc.json).  

To delete a sandbox environment, choose the environment on the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and then choose **Delete** on the action ribbon.

### Precautions for sandbox environments with production data

If a sandbox is created with a copy of a production environment, a number of precautions are taken for that sandbox:

- The job queue is automatically stopped
- Any base application integration settings are cleared
- Outbound HTTP calls from extensions are blocked by default and must be approved for each extension
- Any General Data Protection Regulation (GDPR) action must be handled separately and repeated for the sandbox. There is no synchronization with the production environment after the sandbox has been created

To enable outbound HTTP calls, go to the **Extension Management** page in [!INCLUDE [prodshort](../developer/includes/prodshort.md)], and choose **Configure**. Then, on the **Extension Settings** page, make sure that **Allow HttpClient Requests** is selected. This setting must be enabled for each extension.

### Selecting a version for a new sandbox environment

If you choose to create a sandbox that is not a copy of an existing environment, you must specify an application version for the new environment. The version list will show the latest *production* version, which is the version used for new production environments.

The version list may also have one or more *preview* versions. Preview versions are early release candidates of upcoming releases of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] that are made available specifically for sandbox environments. This gives you access to review new functionality, validate extension compatibility, and other general testing of the upcoming release.

When you create a sandbox environment on a preview version, the environment will automatically be updated to new preview versions when they become available. However, the environment will not be updated to the production version. Once a sandbox environment is on a preview version, it must stay on a preview version until it is deleted. The environment can also be deleted if an update between preview versions fails. We recommend that preview versions are used only for temporary testing of an upcoming release.

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
