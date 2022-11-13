---
title: Alerting on Telemetry
description: Learn how to alert on Business Central telemetry.  
author: kepontop
ms.topic: overview
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/13/2022
ms.author: kepontop
---

# Alerting on Telemetry
If something happens in your environment or app that you need to take action on, you might want to have a system that sends you an alert. Azure Application Insights makes it easy to define such alerts.

You can use the following tools to define and set up alerts on telemetry events
 1. Azure Application Insights Alerts,
 2. Azure Logic Apps, or
 3. Power Automate

All three approaches need a Kusto (KQL) query to define the alerting condition. 

## Alerting condition queries
When defining an alert based on telemetry, you need to define two things:
1. A Kusto (KQL) query that defines the alerting condition. It's considered good practice to add a `where` clause that limits the timestamp of events in the query, e.g. **| where timestamp > ago(1h)**. 
2. How often you want to run the alerting query. Typically the recurrence follows the `where` clause in the alerting query. E.g. if the query looks back 1 hour, then you set your recurrence to 1 hour as well.

> Samples of alerting queries are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your alerting queries with the community on GitHub.

## How to create alerts in Azure Application Insights?
If you want to create alerts in Azure Application Insights, then do as follows:
 1. Open the Azure portal and locate your Application Insights resource
 2. Click "Alerts" in the navigation pane on the left
 3. Add a KQL alerting condition query in the condition for a custom log search 

Please read more in the documentation for [Azure Application Insights](/azure/azure-monitor/platform/alerts-unified-log)

## How to create alerts using Azure Logic Apps and Power Automate
Azure Logic Apps and Power Automate have built-in connectors to query telemetry in Application Insights that you can use to set up custom notifications or to automate certain actions triggered by an environment lifecycle event.

> [!NOTE]
> Samples of custom notifications and automations are shared by Microsoft and third parties on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/Alerts). You can also share your Application Insights Alerts and Automations with the community on GitHub.

The samples below can help getting started with customization and automation using Application Insights.

> [!IMPORTANT]
> Deploying a Logic App to Azure also creates the API Connection Resources necessary to authenticate certain actions in the Logic Apps.
>
> After deploying the Logic App, navigate to the created API Connection Resources in the Azure Portal to authenticate them. The Application Insights API Connection Resource can be authenticated using the Application ID and an API Key. These can be found and generated on the API Access page of the Application Insights Resource in the Azure Portal.
>
> If you have already have API Connection Resources deployed in the selected Resource Group for the connections needed to run the Logic App you can reuse them by entering the same resource name before deploying the Logic App.

### Example - run an alerting query every n days and send an email
This Logic App runs every number of days (specified in deployment) and lists all updates made available to environments that emit telemetry to the specified Application Insights resource for the specified period. Administrators can use this to replace the many email notifications they would receive for each individual enviroment when set up as notification recipient.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAvailableUpdatesNotification.json)

### Example - run an alerting query every m minutes and send a message to Teams
This Logic App queries Application Insights every number of minutes (specified in deployment) and notifies a user (also specified in deployment) of any deleted environments in Microsoft Teams. The action that sends the notification in Teams can be updated to notify a Channel or Group Chat instead.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FDeletedEnvironmentNotification.json)




## See also
[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
