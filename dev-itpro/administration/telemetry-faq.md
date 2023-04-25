---
title: Telemetry FAQ (Frequently Asked Questions)
description: See frequently asked questions we get on telemetry in Business Central
author: kennie
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 04/16/2023
ms.author: kepontop
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.custom: bac-template
---
# Telemetry FAQ (Frequently Asked Questions)

This article addresses some of the most frequently asked questions around [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)].

## How do I enable telemetry on environments?

<!--[!INCLUDE[enableTelemetryEnvironment](../includes/include-telemetry-enable-environment.md)]-->

You do two things:

1. Set up and Application Insights resource in Azure. The resource is given an instrumentation key that [!INCLUDE[prod_short](../developer/includes/prod_short.md)] will use to connect to it.  
2. Configure the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] environment to use the resource's instrumentation key.

For details, go to [Enable Application Insights](telemetry-enable-application-insights.md).

## How do I enable telemetry for apps/extensions?

To set up an app/extension to send telemetry data to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], you need to add the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] connection string to the extension's app.json.

For more information, see [Sending Extension Telemetry to Azure Application Insights](../developer/devenv-application-insights-for-extensions.md).

## What does it cost?

[!INCLUDE[telemetryCost](../includes/include-telemetry-cost.md)]

## Can I control telemetry cost?

[!INCLUDE[telemetryControlCost](../includes/include-telemetry-control-cost.md)]

## How can I see what telemetry Business Central emits?

See an overview at [Telemetry overview](telemetry-overview.md).

## How can I see which telemetry events are most common in my Application Insights?

[!INCLUDE[telemetryEventDistribution](../includes/include-telemetry-event-distribution.md)]

## Should each customer/app have their own Application Insights resource, rather than one insight for multiple customers/apps?

Partitioning of [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources across multiple customers or apps depends on what you use telemetry for. The benefit of having a one-to-one relationship between customers/apps and [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources is that you can also use the Usage features in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] portal to monitor how a particular customer is using [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. And you can set up and share the Power BI app with the customer directly without having to fear that one customer can see data from another customer. It also makes it easy to separate the cost of telemetry per customer/app. Downside of a one-to-one relationship between customers/apps and [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources is that you have more Azure resources to manage, including any cross-customer alerting/monitoring you might want to set up.

Also, it's recommended to separate per-environment telemetry from per-app telemetry into separate [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources.

## What is the data retention policy in Azure Application Insights?

You can set the workspace default retention policy in the Azure portal to 30, 31, 60, 90, 120, 180, 270, 365, 550, and 730 days. It's also possible to set a different policy for specific tables.

See [Configure the default workspace retention policy](/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2#configure-the-default-workspace-retention-policy)

## How do I delete data from Azure Application Insights?

You can purge data in an [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource by using the _purge_ REST API and set a set of user-defined filters.

See [Application Insights purge API](/rest/api/application-insights/components/purge#examples).

## Can I grant read-only access to Azure Application Insights?

Yes. To grant a person read-only access to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], go to the Access control (IAM) page in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] portal, and then add the role assignment "Reader" to the person. 

You might also need to add the role assignment "Reader" to the person on the Resource Group for the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] subscription.

## What about privacy laws and regulations?

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service doesn't emit any personal or customer data to Application Insights. So the telemetry is born privacy compliant. The service only emits data generated while running the service or program and data that identifies a tenant, generally config or usage data. This data isn't linkable to a user and doesn't contain customer data. <!--The meanings of these classifications are described here: [DataClassification Option Type](../developer/methods-auto/dataclassification/dataclassification-option)-->

## Can I get telemetry in Azure Application Insights for on-premises installations?

Yes, telemetry also works for on-premises installations (private or public cloud). A few events aren't emitted with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises. For an overview of events not emitted, see [Telemetry overview](telemetry-overview.md).

For information about how to enable telemetry on-premises, see [Enable environment telemetry] (telemetry-enable-application-insights.md#enable-telemetry-on-environments).

## Will you backport the Application Insights instrumentation to versions prior to 15.0?

It took much refactoring in the server and client to make this capability happen. So it's unlikely that we'll backport the Application Insights instrumentation to versions prior to version 15.0.

For each new signal type we add, we try to backport to the current major release, if possible.

## How can I get the Power BI reports on telemetry?
To make it simple to analyze [!INCLUDE[prod_short](../developer/includes/prod_short.md)] telemetry, we've developed two Power BI apps available from Microsoft AppSource. One app is for telemetry on environments. The other one is for telemetry on apps/extensions (the telemetry defined in app.json). Both apps are free and open source but requires Power BI pro licenses to use.

Read more here: [Analyze telemetry with Power BI](telemetry-power-bi-app.md)

## Where can I learn more about KQL?

[!INCLUDE[LearnKQL](../includes/include-telemetry-learn-kql.md)]

## I know SQL. How do I do that in KQL?
If you're familiar with SQL and want to learn KQL, you can use Azure Data Explorer to translate SQL queries into KQL. To translate an SQL query, preface the SQL query with a comment line, --, and the keyword explain. The output will show the KQL version of the query, which can help you understand the KQL syntax and concepts. You can also use the SQL to Kusto cheat sheet from the Azure Data Explorer documentation.

Read more in the article [I know SQL. How do I do that in KQL?](/azure/data-explorer/kusto/query/sqlcheatsheet).

## Which tools can I use (KQL editors and clients)?

[!INCLUDE[KQLTools](../includes/include-telemetry-kql-tool.md)]

## Where can I find telemetry sample code?

[!INCLUDE[telemetrySamples](../includes/include-telemetry-samples.md)]


## See also
[Telemetry overview](telemetry-overview.md)  
