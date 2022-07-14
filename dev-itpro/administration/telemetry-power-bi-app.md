---
title: Monitoring and Analyzing Telemetry with Power BI
description: Learn how to install, configure, and use the Power BI app on Business Central telemetry data.
author: jswymer
ms.topic: overview
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 07/13/2022
ms.author: jswymer
---


# Analyzing Telemetry with Power BI
To make it very simple to analyze Dynamics 365 Business Central telemetry, we have developed a Power BI app available from Microsoft Appsource. The app is free and open source but requires Power BI pro licenses to use.

The app consists of four reports: 
- Usage
- Errors
- Performance 
- Administration

## Getting the report
Use this link to install/update the app: https://aka.ms/bctelemetryreport

Once installed, the app shows sample data in the reports. This enables you to demo it to prospective customers without having to show data from existing customers.

## Connecting to Azure Application Insights
To connect the app to an Azure Application Insights resource, you need one thing: the Application Insights _Application id_ (you can get it from the _API Access menu_ in the Application Insights page on Azure).

NB! If you get a "The OAuth authentication method isn't supported for this data source" error, check if the application id is correct; that's usually the root cause for that error.

## Configuring the app
The app only has two required parameters needed for configuration:
- Application Insights Application id (controls where data is stored)
- Lookback period (the number of days back in time you want to show)

Apart from required parameters, you can also control the following
- AAD Tenant mapping (define which customer names correspond to which AAD tenant ids).
- Timezone (the Business Central platform emits telemetry in the UTC time zone. By setting a Timezone, all visuals that show telemetry by hour of day will adjust to show data in the configured time zone).
- The app refresh rate (the default is every night around midnight); this option is hidden under Advanced.

## Changing parameters after initial configuration
Once you've completed the setup of the app, you can change parameters by going to the Power BI portal, opening the workspace for the installed app, going to settings, and then choosing Parameters.

## Sharing the app with coworkers and others
Once installed, it is possible to share the app with coworkers and others (such as customers).

Do this:
- Share the Power BI workspace with the person. This will make the app appear under Workspaces in their Power BI portal.
- Provide the URL to the person and ask them to open it in a browser. This will make the app appear under Apps in their Power BI portal.

Read more here: [Share Power BI reports and dashboards with coworkers and others](https://docs.microsoft.com/en-us/power-bi/collaborate-share/service-share-dashboards)


## Using the app
Once installed and configured, how can you use the different reports in the app? We identified four different personas as described in this table:

| Persona | Description |
| ------- | ----------- | 
| Account Manager | Person making sales to new and existing customers. | 
| Product Owner | Person responsible for an extension/app. |
| Project manager | Person responsible for the implementation of a Business Central environment for a customer. |
| Supporter | Person performing triage, investigation, and mitigation of customer issues. | 


In the table below you will find examples of scenarios for each persona where the app might be of help.

| Persona | Scenario | How the Power BI app can help |
| ------- | ---------| -------------------- |
| Account Manager | Prospective customer has concerns that SaaS solutions are a blackbox.| The Power BI app comes with sample data when you install it. If the questions pops up, show them what kind of insights the app offers and that they can get access to the app if they find it useful. Focus on the Usage report unless the customer wants to see some of the more technical reports (that is, Errors, Performance, or Administration). If the customer has a representative from IT, then show them the Administration report. |
| Account Manager | Plan new activities with an existing customer. | Most of the pages in the Usage report can help drive conversations with the customer on how to get more value from their Busienss Central investment. For example, look at the  _Page views_, _Reports_, and _Feature Usage_ pages to check if the customer is using the functionality they set out to when starting the project. Lack of data typically means lack of usage.  |
| Account Manager | Get existing customers excited about reporting with Excel layouts. | Go to the Usage report and open the _Reports_ page to check if the customer is using the Excel layouts (you can filter on this). If they are, great. Maybe you can follow up with training or PoCs on Power Query and maybe also start working differently with the customer on reporting. With Excel layouts, some reports only need a developer for the AL report object, then the customer/end users can do most/all of the layout in Excel. If the customer is not using Excel layouts yet, show them the power of Business Central reports with Excel layouts and a bit of Power Query in Excel. |
| Product Owner | Which features in our app(s)/per-tenant extensions are being used and how often? | Make sure that apps/extensions have enabled telemetry in the app manifest (app.json). Use the _Feature Telemetry_ AL system module to equip your app with usage telemetry. Consider having separate Power BI apps for apps/extensions and environments. Once you have data in telemetry, then go to the Usage report and visit the _Feature Usage_ page. You can filter the results down to publisher/app. |
| Project manager | We need a way to track progress on User Acceptance Testing (UAT) efforts | Go to the Usage report and visit the _Page views_, _Reports_, and _Feature Usage_ pages to see what users are doing in Business Central. Consider sharing the app with the customer to enable them to do the follow-ups internally based on data. |
| Project manager | We want a smooth go-live for the customer. | Use the Error dashbord in the Error report to drive errors to zero before go-live. Monitor the dashboard in the first weeks after go-live. Consider sharing the app with the customer so status meetings and follow-ups can be based on data. |
| Project manager | Only for SaaS: We want to check if the customer will get broken integrations when upgrading to version 20.0/21.0 | Look at the _Deprecated features_ page in the Usage report to see if the customer is still using web service keys (basic auth) for integrations. If you see any data here, work with the customer on a mitigation plan to move integrations to OAuth.|
| Supporter | Customer calls and says that "something changed since Friday of last week." | Go to the Administration report, find the _All changes_ page and filter to a period in time that overlaps with "Friday of last week." Depending on what the customer reported had changed (such as data, UI, business logic, performance, stability, and so on), you might get lucky that one of the lifecycle events for environments, extensions, companies, or indexes can explain the root cause of the changed behavior. Otherwise, you can dig further into the issue with the app using KQL queries, or simply by reaching out to the code owner. |
| Supporter | Customer complains that some users cannot login. | Go to the Error report and investigate the _Login Errors_ page. |
| Supporter | Customer complains that users gets lots of errors when using the system. | Go to the Error report and investigate the _Error Dialogs_, _Permission Errors_, and _Feature Errors_ pages. You can filter pages by Extension Publisher to learn which code path the error is coming from. |
| Supporter | Customer experiences a lot of locking issues. | Use the _Database Deadlocks_ page in the Error report to examine deadlocks. Use the _Database Lock Timeouts_ page in the Performance report to examine lock time-outs. Use the _Long running SQL queries_ page (filter SQL Statement to "UPDLOCK") to investigate SQL queries that take locks. | 

## See also
[Telemetry overview](telemetry-overview.md)
[Enabling telemetry](telemetry-enable-application-insights.md)
[Available telemetry](telemetry-available-telemetry.md) 
