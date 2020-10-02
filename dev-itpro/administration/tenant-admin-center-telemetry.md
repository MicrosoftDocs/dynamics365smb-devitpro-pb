---
title: Environment Telemetry | Microsoft Docs
description: Learn how the Business Central admin center provides telemetry for each environment.  
author: edupont04

ms.service: dynamics365-business-central
ms.topic: article
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 10/01/2020
ms.author: edupont
---

# Environment Telemetry in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]

The [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)] provides telemetry for the tenant environments to enable troubleshooting and support for the tenant. The Telemetry tab provides telemetry of top-level AL events, and any errors resulting from calls through the telemetry stack.

To filter the telemetry for an environment:

1. Select a base point-in-time for the timestamp of the telemetry messages.
2. Enter a number of minutes before or after the base point-in-time to set a range of time for the timestamp. A negative number indicates a number of minutes before the base point-in-time, and a positive number indicates a number of minutes following the base point-in-time. For example, a value of *-15* filters messages to a timestamp range of up to 15 minutes before the base point-in-time.
3. Choose the message type.
4. Choose the environment.
5. Select **Filter**.

> [!TIP]
> If your users complain of a confusing error message such as *Sorry, we just updated this page. Please close and reopen.*, then you can often find the underlying problem by analyzing telemetry in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. For example, in the case of the *Sorry, we just updated this page. Please close and reopen.* message, the underlying problem is often that two users are trying to modify the same data. So if both users open the same sales order, and both change a field, then one of them will see the *Sorry, we just updated this page. Please close and reopen.* message, because [!INCLUDE [prodshort](../developer/includes/prodshort.md)] saves changes as soon as you move to the next field or close the page.

## Sending telemetry to Microsoft Azure Application Insights

[!INCLUDE[2019_releasewave2.md](../includes/2019_releasewave2.md)]

You can set up your environments to send telemetry to Application Insights. Application Insights is a service hosted within Azure that gathers telemetry data for analysis and presentation. For more information, see [What is Application Insights?](/azure/azure-monitor/app/app-insights-overview).

For an overview of the telemetry types that are currently emitted, see [Monitoring and Analyzing with Telemetry](telemetry-overview.md).

### <a name="appinsights"></a>Enable Application Insights

> [!IMPORTANT]  
> This process requires a restart to the environment, which is triggered automatically after step 6. Plan to do this during non-working hours to avoid disruptions.

1. If you don't already have one, get a subscription to [Microsoft Azure](https://azure.microsoft.com).
2. Create an Application Insights resource in Azure.

    The Application Insights resource will be assigned an instrumentation key. Copy this key because you'll need it to enable Application Insights in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)].  

    The Application Insights instrumentation key can be in any Azure tenant that is accessible to your organization. For example, a delegated administrator from the reselling partner is the person analyzing the telemetry. But this person might not have access rights the customer's Azure instance. This scenario enables the partner to send the telemetry to their own Application Insights instance.

    For more information, see [Create an Application Insights resource](/azure/azure-monitor/app/create-new-resource).

3. In the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)], select **Environments**, and then select the environment that you want to change.
4. On the **Environment** page, select **Application Insights Key**.
5. On the **Application Insights Key** page, enter the instrumentation key in the **Instrumentation Key** field.
6. Select **Save**.

<!--
### <a name="lrsql"></a>Analyze long running SQL queries

Any SQL query that takes longer than 1000 milliseconds to execute will be sent to your Application Insights resource. To get a quick overview, you can go the [Application Insights Overview dashboard](/azure/azure-monitor/app/overview-dashboard).

For details about the long running SQL query telemetry information and dimensions sent from [!INCLUDE[prodshort](../developer/includes/prodshort.md)], see [Dimensions for long running SQL queries](monitor-long-running-sql-queries-event-log.md#LRSQLQuery).

There are multiple reasons that can affect the time it takes SQL queries to run. For example, the database could be waiting for a lock to be released or the database is executing an operation that performs badly because of missing indexes. In some cases, you can see what caused the delay by looking at the SQL statement that was generated by the code. This information can be found in the **CustomDimension** data, specifically the **AL Stack Trace** column.
-->

## Cleaning up settings

If the Application Insights resource is tied to your partner account, and you end the relationship with a customer where you have set up telemetry based on your account's instrumentation key, you must remove the instrumentation key while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

## See also

[Monitoring and Analyzing Telemetry](telemetry-overview.md)  
[Working with Administration Tools](administration.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Managing Tenant Notifications](tenant-admin-center-notifications.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Enabling Application Insights for On-Premises](telemetry-enable-application-insights.md)  
