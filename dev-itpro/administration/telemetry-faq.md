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

## What does it cost?

[!INCLUDE[telemetryCost](../includes/include-telemetry-cost.md)]


## Can I control telemetry cost?

[!INCLUDE[telemetryControlCost](../includes/include-telemetry-control-cost.md)]


## How can I see what telemetry Business Central emits?

See an overview here [Telemetry overview](telemetry-overview.md). 


## How can I see which telemetry events are most common in my Application Insights?

[!INCLUDE[telemetryEventDistribution](../includes/include-telemetry-event-distribution.md)]


## Should each customer/app have their own Application Insights resource, rather than one insight for multiple customers/apps?
Partitioning of [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources across multiple customers or apps depends on what you use telemetry for. The benefit of having a 1-1 relationship between customers/apps and [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources is that you can also use the Usage features in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] portal to monitor how a particular customer is using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and you can setup and share the Power BI app with the customer directly without having to fear that one customer can see data from another customer. It also makes it easy to separate the cost of telemetry per customer/app. Downside of a 1-1 relationship between customers/apps and [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources is that you have more Azure resources to manage, including any cross-customer alerting/monitoring that you might want to setup.

Also, it is recommended to separate per-environment telemetry from per-app telemetry into separate [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resources.


## What is the data retention policy in Azure Application Insights?
You can set the workspace default retention policy in the Azure portal to 30, 31, 60, 90, 120, 180, 270, 365, 550, and 730 days. It is also possible to set a different policy for specific tables.

See [Configure the default workspace retention policy](https://learn.microsoft.com/en-us/azure/azure-monitor/logs/data-retention-archive?tabs=portal-1%2Cportal-2#configure-the-default-workspace-retention-policy)

## How do I delete data from Azure Application Insights?
You can purge data in an [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] resource by using the _purge_ REST API and set a set of user-defined filters.

See [Application Insights purge API](https://docs.microsoft.com/en-us/rest/api/application-insights/components/purge#examples)


## Can I grant read-only access to Azure Application Insights?
Yes. To grant a person read-only access to [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], go to the Access control (IAM) page in the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] portal, and then add the role assignment "Reader" to the person. 

You might also need to add the role assignment "Reader" to the person on the Resource Group for the [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] subscription.


## What about Privacy regulations such as GDPR?
The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] service does not emit any End User Identifiable Information (EUII) to Application Insights. So the telemetry is born privacy compliant. The service only emits data that is classified as either System Metadata or Organization Identifiable Information (OII). The meaning of these classifications are described here: [DataClassification Option Type](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/developer/methods-auto/dataclassification/dataclassification-option)


## Can I get telemetry in Azure Application Insights for on-premises installations?
Yes, telemetry also work for on-premises installations (private or public cloud). A few events are not emitted when running [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises (see an overview here [Telemetry overview](telemetry-overview.md). 

See here how to enable telemetry on-premises: [Enable telemetry on tenants](https://docs.microsoft.com/en-us/dynamics365/business-central/dev-itpro/administration/telemetry-enable-application-insights#enable-on-tenants)


## Will you backport the Application Insights instrumentation to versions prior to 15.0?
It took a lot of refactoring in the server and client to make this happen. So it is unlikely that we will backport the Application Insights instrumentation to versions prior to version 15.0.

For each new signal type we add, we try to backport to the current major release, if possible.


## See also
[Telemetry overview](telemetry-overview.md)  
