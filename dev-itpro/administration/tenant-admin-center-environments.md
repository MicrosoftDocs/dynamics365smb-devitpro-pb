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
ms.date: 09/24/2019
ms.author: jaredha
---

# Managing Environments

The **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides you with an overview of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production and sandbox environments for the tenant, and you can manage updates for each environment.

> [!div class="mx-imgBorder"]
> ![Business Central Admin Center](../developer/media/admin/business_central_admin_center.png)

## Viewing details for an environment

In the list of environments, you can open a page with more details for an environment by choosing the link in the **Name** column of the list for the environment.

> [!div class="mx-imgBorder"]
> ![View details about an environment](../developer/media/admin/business_central_admin_center_details.png)

## Create a new production environment

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides an easy method for creating environments for the tenant. For example, if you have been using a production environment for training purposes, and you have decided to start using [!INCLUDE [prodshort](../developer/includes/prodshort.md)] to run the business, you can delete the original production environment and then create a new production environment.  

> [!NOTE]
> Each [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant is limited to three production environments.

To create a production environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **New** action on the action ribbon.
2. In the **Create Environment** pane, in the **Environment Type** list, choose **Production**.
3. In the **Country** list, select the country for the environment. The selected country determines the localization for the environment, as well as the Azure region in which the environment is created and stored.
4. Select **Create**.

When the new production environment is created, it will be on the latest production version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## <a name="create-a-sandbox-environment"></a>Create a new sandbox environment

A sandbox environment is a non-production instance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Isolated from production, a sandbox environment is the place to safely explore, learn, demo, develop, and test the service without the risk of affecting the data and settings of your production environment.

> [!NOTE]
> Each [!INCLUDE[prodshort](../developer/includes/prodshort.md)] tenant is limited to three sandbox environments.

To create a sandbox environment:

1. On the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], choose the **New** action on the action ribbon.
2. In the **Create Environment** pane, specify a name for the new environment.
3. In the **Create Environment** pane, in the **Environment Type** list, choose **Sandbox**.
4. Specify if you want the sandbox environment to contain a copy of another environment. Ifyou choose this option, you must specify the environment to copy.
    > [!NOTE]
    > When you create a sandbox environment as a copy of another environment, the new environment is created on the same application version as the environment that you are copying. The new environment will also contain all the per-tenant extensions and AppSource extensions that are installed and published in the original environment that is being copied.
5. In the **Country** list, select the country for the environment. The selected country determines the localization for the environment, as well as the Azure region in which the environment is created and stored.
6. Select the relevant application version for the new sandbox environment from the **Version** list.
7. Select **Create**.
    > [!NOTE]
    > The sandbox environment will not be accessible until the **State** shows *Active*.

A single, default sandbox environment can also be created from within a page in the production environment of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application. For more information, see [How to: Create a Sandbox Environment](/dynamics365/business-central/across-how-create-sandbox-environment?toc=/dynamics365/business-central/dev-itpro/toc.json).  

To delete a sandbox environment, choose the environment on the **Environments** tab of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], and then Select **Delete** on the action ribbon.

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

## Sending telemetry to Microsoft Azure Application Insights

You can set up your environments to send telemetry to Application Insights. Application Insights is a service hosted within Azure that gathers telemetry data for analysis and presentation. To read more about Application Insights, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview).

Currently, the only telemetry that [!INCLUDE[prodshort](../developer/includes/prodshort.md)] emits to Application Insights pertains to long running SQL queries. We expect to add more telemetry in future updates.

Identifying long running SQL queries on a tenant database can be a good starting point when doing performance analysis, and Application Insights provides tools that can help you in this task.

### Enable sending telemetry to Application Insights

1. If you don't already have one, get a subscription to [Microsoft Azure](https://azure.microsoft.com).
2. Create an Application Insights resource in Azure.

    The Application Insights resource will be assigned an instrumentation key. Copy this key because you will need it to enable Application Insights in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].

    For more information, see [Create an Application Insights resource](https://docs.microsoft.com/en-us/azure/azure-monitor/app/create-new-resource).

3. In the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], on the **Environments** tab, select **Application Insights Key**.
4. On the **Application Insights Key** page, enter the instrumentation key in the **Instrumentation Key** field.
5. If you want to apply the instrumentation key to all your environments, turn on the **Apply to all environments** switch.
6. Select **Save**.

### Analyze long running SQL queries

Any SQL query that takes longer than 1000 milliseconds to execute will be sent to your Application Insights resource. To get a quick overview, you can go the [Application Insights Overview dashboard](/azure/azure-monitor/app/overview-dashboard).

For details about the long running SQL query telemetry information and dimensions sent from [!INCLUDE[prodshort](../developer/includes/prodshort.md)], see [Dimensions for long running SQL queries](monitor-long-running-sql-queries-event-log.md#LRSQLQuery).

There are multiple reasons that can affect the time it takes SQL queries to run. For example, the database could be waiting for a lock to be released or the database is executing an operation that performs badly because of missing indexes. In some cases, you can see what caused the delay by looking at the SQL statement that was generated by the code. This information can be found in the **CustomDimension** data, specifically the **AL Stack Trace** column.

## See also

[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Updating Environments](tenant-admin-center-update-management.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
