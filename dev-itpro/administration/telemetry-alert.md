---
title: Alert on Telemetry
description: Learn how to alert on Business Central telemetry.  
author: kepontop
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2022
ms.author: kepontop
ms.reviewer: jswymer
ms.service: dynamics365-business-central
ms.custom: bac-template
---
# Alert on Telemetry

If something happens in your environment or app that you need to act on, you can set up a system that sends you an alert. Azure Application Insights makes it easy to define such alerts.

You can use the following tools to define and set up alerts on telemetry events:

- Azure Application Insights Alerts
- Azure Logic Apps
- Power Automate

All three approaches need a Kusto (KQL) query to define the alerting condition.

## Define alerting condition queries

When defining an alert based on telemetry, you need to define two things:

1. A Kusto (KQL) query that defines the alerting condition. It's considered good practice to add a `where` clause that limits the timestamp of events in the query, for example, `| where timestamp > ago(1h)`. 
2. How often you want to run the alerting query. Typically, the recurrence follows the `where` clause in the alerting query. For example, if the query looks back 1 hour, then you set your recurrence to 1 hour as well.

> [!TIP]
> Samples of alerting queries are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your alerting queries with the community on GitHub.

## Create alerts in Azure Application Insights

If you want to create alerts in Azure Application Insights, then do as follows:

1. Open the [Azure portal](https://portal.azure.com) and locate your Application Insights resource.
2. In the navigation pane on the left, select **Alerts**.
3. Add a KQL alerting condition query in the condition for a custom log search.

To read more about Azure Monitor alerts, go to [Azure Application Insights](/azure/azure-monitor/alerts/alerts-overview) in the Azure documentation. <!-- /azure/azure-monitor/platform/alerts-unified-log-->

## Create alerts using Azure Logic Apps and Power Automate

Azure Logic Apps and Power Automate have built-in connectors to query telemetry in Application Insights you can use to set up custom notifications or to automate certain actions triggered by an environment lifecycle event.

> [!NOTE]
> Samples of custom notifications and automations are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your Application Insights Alerts and Automations with the community on GitHub.

The samples below can help getting started with customization and automation using Application Insights.

> [!IMPORTANT]
> Deploying a Logic App to Azure also creates the API Connection Resources necessary to authenticate certain actions in the Logic Apps.
>
> After deploying the Logic App, navigate to the created API Connection Resources in the Azure Portal to authenticate them. The Application Insights API Connection Resource can be authenticated using the Application ID and an API Key. These can be found and generated on the API Access page of the Application Insights Resource in the Azure Portal.
>
> If you have already have API Connection Resources deployed in the selected Resource Group for the connections needed to run the Logic App you can reuse them by entering the same resource name before deploying the Logic App.

### Example - Run an alerting query every "n" days and send an email

This Logic App runs every number of days (specified in app deployment). It lists all updates made available to environments that emit telemetry to the specified Application Insights resource during the period. Administrators can use this app to replace email notifications they'd receive for environments when set up as notification recipient.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAvailableUpdatesNotification.json)

### Example - Run an alerting query every "n" minutes and send a message to Teams

This Logic App queries Application Insights every number of minutes (specified in app deployment). It notifies a user (also specified in deployment) of any deleted environments in Microsoft Teams. The action that sends the notification in Teams can be updated to notify a Channel or Group Chat instead.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FDeletedEnvironmentNotification.json)




## See also
[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
