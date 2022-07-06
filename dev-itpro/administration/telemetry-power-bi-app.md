---
title: Monitoring and Analyzing Telemetry
description: Learn how to install, configure, and use the Power BI app on Business Central telemetry data.
author: jswymer
ms.topic: overview
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/06/2022
ms.author: jswymer
---


# Analyzing Telemetry with Power BI
To make it very simple to analyze Dynamics 365 Business Central telemetry, we have developed a Power BI app available from Microsoft Appsource. The app is free and open source (requires Power BI pro licenses for usage).

The app consists of four reports: 
- Usage
- Errors
- Performance 
- Administration

# Getting the report
Use this link to install/update the app: https://aka.ms/bctelemetryreport

Once installed, the app shows sample data in the reports. This enables you to demo it to prospective customers without having to show data for existing customers.

# Connecting to Azure Application Insights
To connect the app to an Azure Application Insights resource, you need one thing: the Application Insights _Application id_ (get it from the _API Access menu_ in the Application Insights page on Azure).

NB! If you get this error "The OAuth authentication method isn't supported for this data source", then please check if the application id is correct. This usually is the root cause for that error.

# Configuring the app
The app only has two required parameters needed for configuration:
- Application Insights Application id (controls where data is stored)
- Lookback period (how many days back in time do you want to show?)

Apart from required parameters, you can also control the following
- AAD Tenant mapping (define which customer names corresponds to which AAD tenant ids.)
- Timezone (the Business Central platform emits telemetry in UTC timezone. By setting a Timezone, all visuals that show telemetry by hour of day will adjust to show data in the configured timezone.)
- If the app should refresh every night around midnight (hidden under Advanced)

## Changing parameters after initial configuration
Once you completed the setup of the app, you can change parameters by going to the Power BI portal, open the workspace for the installed app, go to settings, and then choose Parameters.

# Sharing the app with coworkers and others
Once installed, it is possible to share the app with coworkers and others (e.g. customers).

Do this:
- Share the Power BI workspace with the person. This will make the app appear under Workspaces in their Power BI portal.
- Provide the url to the person and ask them to open it in a browser. This will make the app appear under Apps in their Power BI portal.

Read more here: [Share Power BI reports and dashboards with coworkers and others](https://docs.microsoft.com/en-us/power-bi/collaborate-share/service-share-dashboards)


# Using the app
Once installed and configured, how can you use the different reports in the app? We identified four different personas as described in this table:

| Persona | Description |
| ------- | ----------- | 
| Account Manager | Person working with sales to new and existing customers. | 
| Product Owner | Person responsible for an extension/app. |
| Project manager | Person responsible for the implementation of a Business Central environment for a customer. |
| Supporter | Person working with triage, investigation, and mitigation of customer issues. | 


For each persona, in the table below you can find examples of scenarios, where the app might be of help.

| Persona | Scenario | How the Power BI app can help |
| ------- | ---------| -------------------- |
| Account Manager | Prospective customer have concerns that SaaS solutions are a blackbox.| The Power BI app comes with sample data when you install it. If the questions pops up, show them what kind of insights the app offers and that they can get access to the app if they find it useful. Focus on the Usage report unless the customer wants to see some of the more technical reports (Errors, Performance, or Administration). If the customer has a representative from IT, then show them the Administration report. |
| Account Manager | Plan new activities with existing customer. | Most of the pages in the Usage report can help drive conversations with customer on how to get more value with their Busienss Central investment. E.g. look at the pages _Page views_, _Reports_, and _Feature Usage_ to check if the customer is using the functionality that they set out to when starting the project. Lack of data means lack of usage.  |
| Account Manager | Get existing customers excited about reporting with Excel layouts. | Go to the Usage report and open the _Reports_ page to check if the customer is using the Excel layouts (you can filter on this). If they do so, great. Maybe you can follow up with training or PoCs on Power Query and maybe also start working differently with the customer on reporting. With Excel layouts, some reports only need a developer for the AL report object, then the customer/end users can do most/all of the layout in Excel. If the customer is not using Excel layouts yet, maybe show them the power of Business Central reports with Excel layouts and show them a bit of Power Query in Excel. |
| Product Owner | Which features in our app(s)/per-tenant extensions are being used and how often? | Make sure that apps/extensions have enabled telemetry in the app manifest (app.json). Use the AL system module _Feature Telemetry_ to instrument your app with usage telemetry. Consider having separate Power BI apps for apps/extensions and environments. Once you have data in telemetry, then go to the Usage report. Visit the _Feature Usage_ page. You can filter the results down to publisher/app. |
| Project manager | We need a way to track progress on User Acceptance Testing (UAT) efforts | Go to the Usage report. Visit the pages _Page views_, _Reports_, and _Feature Usage_ to see what users are doing in Business Central. Consider sharing the app with the customer. Then they can do the follow-ups internally based on data. |
| Project manager | We want a smooth go-live for the customer. | Use the Error dashbord in the Error report to drive errors to zero before go-live. Monitor the dashboard in the first weeks after go-live. Consider sharing the app with the customer. Then status meetings and follow-ups can be based on data. |
| Project manager | Only for SaaS: We want to check if the customer will get broken integrations when upgrading to version 20.0/21.0 | Use the _Deprecated features_ page in the Usage report to see if the customer is still using web service keys (basic auth) for integrations. If you see any data here, then work on a mitigation plan with the customer to move integrations to OAuth.|
| Supporter | Customer calls and says that "something changed since Friday last week." | Go to the Administration report, find the _All changes_ page and filter to a period in time that overlaps "Friday last week." Depending on what the customer reported that changed (data, UI, business logic, performance, stability, ...), you might get lucky that one of the lifecycle events for environments, extensions, companies, or indexes can explain the root cause of the changed behavior. You can now dig further into the issue with the app, with KQL queries, or simply by reaching out to the code owner. |
| Supporter | Customer complains that some users cannot login. | Go to the Error report, investigate the _Login Errors_ page. |
| Supporter | Customer complains that users gets lots of errors when using the system. | Go to the Error report, investigate pages _Error Dialogs_, _Permission Errors_, and _Feature Errors_. You can filter pages by Extension Publisher to learn in which code path the error is coming from. |
| Supporter | Customer experience a lot of locking issues. | Use the _Database Deadlocks_ page in the Error report to examine deadlocks. Use the _Database Lock Timeouts_ page in the Performance report to examine lock timeouts. Use the _Long running SQL queries_ page (filter SQL Statement to "UPDLOCK") to investigate SQL queries that take locks. | 

## See also
[Telemetry overview](telemetry-overview.md)
[Enabling telemetry](telemetry-enable-application-insights.md)
[Available telemetry](telemetry-available-telemetry.md) 