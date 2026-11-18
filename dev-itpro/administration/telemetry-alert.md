---
title: Set Up Business Central Telemetry Alerts
description: Set up alerts on Business Central telemetry with Azure Monitor, Logic Apps, or Power Automate to respond to issues and environment changes.
author: kennieNP
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2026
ms.author: jswymer
ms.reviewer: jswymer

ms.custom: bap-template
ai-usage: ai-assisted
---
# Alert on telemetry

If something happens in your environment or app that you need to act on, you can set up a system that sends you an alert. [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] makes it easy to define such alerts.

You can use the following tools to define and set up alerts on telemetry events:

- [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)] Alerts
- Azure Logic Apps
- Power Automate

If you use the Power BI app on telemetry data, you can also use Power BI goals to track measures against business objectives.

For telemetry alerts, you need a Kusto (KQL) query to define the alerting condition.

## <a name="no-code-alerting-with-power-bi-metrics"></a>Track telemetry with Power BI goals

[!INCLUDE[pbimetrics](../includes/include-telemetry-alerting-powerbi-metrics.md)]


## Low-code alerting with KQL
When defining an alert based directly on telemetry, you need to define two things:

1. A Kusto (KQL) query that defines the alerting condition. It's considered good practice to add a `where` clause that limits the timestamp of events in the query, for example, `| where timestamp > ago(1h)`. 
1. How often you want to run the alerting query. Choose the frequency based on how quickly you need to respond and account for ingestion delay. The frequency can be shorter than the query's lookback period.

> [!TIP]
> Samples of alerting queries are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your alerting queries with the community on GitHub.

### Create alerts in Azure Application Insights

If you want to create alerts in [!INCLUDE[appinsights](../includes/azure-appinsights-name.md)], then do as follows:

1. Open the [Azure portal](https://portal.azure.com) and locate your Application Insights resource.
1. In the navigation pane on the left, select **Alerts**, and then select **Create** > **Alert rule**.
1. On the **Condition** tab, select **Custom log search**, and then enter your KQL alerting query.
1. Configure the threshold and evaluation frequency, select or create an action group for notifications, and create the alert rule.

Learn more in [Create Azure Monitor log search alert rules](/azure/azure-monitor/alerts/alerts-create-log-alert-rule).

### Create alerts using Azure Logic Apps and Power Automate

Azure Logic Apps and Power Automate can use the Azure Monitor Logs connector to query telemetry for custom notifications or actions triggered by an environment's lifecycle event. When querying the linked Log Analytics workspace, use workspace table and column names, such as `AppTraces`, `TimeGenerated`, and `Properties`, instead of `traces`, `timestamp`, and `customDimensions`. Learn more in [Azure Monitor Logs connector](/connectors/azuremonitorlogs/).

> [!NOTE]
> Samples of custom notifications and automations are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your Application Insights Alerts and Automations with the community on GitHub.

The samples below can help you get started with customization and automation using Application Insights.

> [!IMPORTANT]
> These sample templates use the deprecated Azure Application Insights connector and API-key authentication. For new workflows, use the Azure Monitor Logs connector with Microsoft Entra authentication. Adapt the sample queries, connection resources, and result handling before using them with the new connector.
>
> Deploying a Logic App also creates the API connection resources needed by its actions. After deployment, open those resources in the Azure portal to authenticate them.
>
> If the required API connection resources already exist in the selected resource group, you can reuse them by entering the same resource name before deployment.

#### Example - Run an alerting query every "n" days and send an email

This Logic App runs at an interval in days specified during deployment. It lists updates automatically scheduled for environments that emit telemetry to the specified Application Insights resource during that period. It filters on event `LC0101` and excludes schedules selected by a partner. Administrators can use this app to supplement update notifications.

[Deploy the available update notification template to Azure](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAvailableUpdatesNotification.json).

#### Example - Run an alerting query every "n" minutes and send a message to Teams

This Logic App queries Application Insights every number of minutes (specified in app deployment). It notifies a user (also specified in deployment) of any deleted environments in Microsoft Teams. The action that sends the notification in Teams can be updated to notify a Channel or Group Chat instead.

[Deploy the deleted environment notification template to Azure](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FDeletedEnvironmentNotification.json).




## Related information
[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
[Telemetry FAQ](telemetry-faq.md)