---
title: Analyze and Monitor Telemetry with Power BI
description: Learn how to install, configure, and use the Power BI app on Business Central telemetry data.
author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.search.keywords: administration, tenant, admin, environment, sandbox, telemetry
ms.date: 11/17/2022
ms.author: jswymer
ms.custom: bac-template
ms.service: dynamics365-business-central
---

# Analyze and Monitor Telemetry with Power BI

To make it simple to analyze Business Central telemetry, we've developed two Power BI apps available from Microsoft Appsource. One app is for telemetry on environments. The other one is for telemetry on apps/extensions (the telemetry defined in app.json). Both apps are free and open source but requires Power BI pro licenses to use.

Each app consists of four reports: 
- Usage
- Errors
- Performance 
- Administration

## Get the apps

### App on Environment Telemetry
To install or update the app for _environment telemetry_, go to [https://aka.ms/bctelemetryreport](https://aka.ms/bctelemetryreport) and select **Get it now**.

You'll first have to sign in to Microsoft AppSource using your Power BI account name and password, if you aren't already signed in. Follow the online instructions to get the app installed in Power BI.

Once installed, the **Dynamics 365 Business Central Usage** app appears under **Apps** in Power BI. A workspace with the same name is also installed for configuring the app.

:::image type="content" source="../developer/media/bc-usage-pwr-bi-app-open.png" alt-text="Diagram showing the Dynamics 365 Business Central Usage installed in the Apps section of Power BI" border="false":::

To open the app, from the navigation pane, select **Apps** > **Dynamics 365 Business Central Usage**.

:::image type="content" source="../developer/media/bc-usage-pwr-bi-app.png" alt-text="Shows the start page of Business Central usage app in Power BI." border="false":::

By default, the app shows sample data in the reports. This sample data enables you to demo the app to prospective customers without having to show data from existing customers.

### App on Environment Telemetry
To install or update the app for _app telemetry_, go to [https://aka.ms/bctelemetry-isv-app](https://aka.ms/bctelemetry-isv-app) and select **Get it now**.

You'll first have to sign in to Microsoft AppSource using your Power BI account name and password, if you aren't already signed in. Follow the online instructions to get the app installed in Power BI.

Once installed, the **Dynamics 365 Business Central App Usage** app appears under **Apps** in Power BI. A workspace with the same name is also installed for configuring the app.

To open the app, from the navigation pane, select **Apps** > **Dynamics 365 Business Central App Usage**. 

By default, the app shows sample data in the reports. This sample data enables you to demo the app to prospective customers without having to show data from existing customers.

> [!TIP]
> You can install the Power BI apps more than once. Just go to the install link for the app and select **Get it now** again. When prompted, choose **Install another copy of the app into a new workspace**.

## Connect to Azure Application Insights for the first time

After the app is installed, you can connect it to an Azure Application Insights resource to view actual data instead of the sample data.

1. Get the Application Insights resource's application ID.

   To connect the app to an Azure Application Insights resource, you'll need its _Application ID_. You can get this ID from the Azure portal as follows:

    1. Sign in to [Azure portal](https://portal.azure.com).
    2. Open the Application Insights resource, then select **API Access**.
    3. In the API Access page, copy **Application ID** to the clipboard.
2. In Power BI, open the **Dynamics 365 Business Central Usage** app, the select **Connect your data**.

   :::image type="content" source="../developer/media/bc-usage-pwr-bi-app-connect-data.png" alt-text="Diagram showing the action to connect the Business Central usage app to an Application Insights resource" border="false":::
3. On the **Connect to Dynamics 365 Business Central Usage** page, fill in the **Application Insights application id** with the ID you copied from the previous step. In the **Lookback period** box, select the number of days back in time you want to show.

   :::image type="content" source="../developer/media/bc-usage-pwr-bi-app-connect-data-id.png" alt-text="Diagram showing the parameters to connect the Business Central usage app to an Application Insights resource" border="false":::

   Other information on the page is optional. For more information, see [Configure the app](#configure-an-app-after-initial-setup).
4. Select **Next** and wait while your credentials are checked.
5. Select **Sign in and connect**, then enter a valid name and password for accessing the Application Insights resource, if asked.

    > [!NOTE]  
    > Keep the **Authentication method** set to **OAuth2**. If you get the error *The OAuth authentication method isn't supported for this data source*, check if the application ID is correct; that's usually the root cause for that error.

## Configure an app after initial setup

Once the app is installed, you can use the **Dynamics 365 Business Central Usage** workspace to change the app configuration, for example, to connect to a different Application Insights resource or change how many days back the data goes. Follow these steps:

1. From the navigation pane in the Power BI, select **Workspaces** > **Dynamics 365 Business Central Usage** to open the workspace.
2. On the **Dynamics 365 Business Central Usage** page, next to **Dataset**, select **More options (...)** > **Settings**.

   :::image type="content" source="../developer/media/bc-usage-pwr-bi-app-dataset.png" alt-text="Diagram showing the settings action to configure the Application Insights connection in the Business Central usage " border="false":::

3. On the **Dataset** page, go to **Parameters** and make your changes.

   :::image type="content" source="../developer/media/bc-usage-pwr-bi-app-dataset-parameters.png" alt-text="Diagram showing the dataset parameters section to configure the Application Insights connection in the Business Central usage " border="false":::

   The app only has two required parameters needed for configuration:

   - Application Insights Application ID (controls where data is stored)
   - Lookback period (the number of days back in time you want to show)

   Apart from required parameters, you can also control the following options:

   - Azure Active Directory (Azure AD) tenant mapping (define which customer names correspond to which Azure AD tenant IDs).
   - Timezone (the Business Central platform emits telemetry in the UTC time zone. By setting a Timezone, all visuals that show telemetry by hour of day will adjust to show data in the configured time zone).
   - The app refresh rate (the default is every night around midnight); this option is hidden under **Advanced**.
4. When done making changes, you have to refresh the dataset to update the data shown in the app.

   A quick way is to select **Refresh now** for the dataset on the workspace.

   :::image type="content" source="../developer/media/bc-usage-pwr-bi-app-dataset-refresh.png" alt-text="Diagram showing the refresh action for a dataset in the Business Central usage " border="false"::: 

   Or, you can schedule the refresh from the **Settings** page. For more information, see [Configure scheduled refresh](/power-bi/connect-data/refresh-scheduled-refresh).

> [!NOTE]
> Once you connect to an Application Insights resource, You can't change the app back to show the sample data. If you want to see the sample data, install the app again.

> [!NOTE]
> If you turn off scheduled refresh and go back to the app, it will remove the Application ID and you have to enter it again.

## Share the app with coworkers and others

Once installed, it's possible to share the app with coworkers and others (such as customers). You can:

- Share the Power BI workspace with the person. The app will appear under **Workspaces** in their Power BI portal.
- Provide the URL to the person and ask them to open it in a browser. The app will appear under **Apps** in their Power BI portal.

For more information, see [Share Power BI reports and dashboards with coworkers and others](/power-bi/collaborate-share/service-share-dashboards)

## Use the app

Once installed and configured, how can you use the different reports in the app? We identified four different personas as described in this table:

| Persona | Description |
| ------- | ----------- |
| Account Manager | Person making sales to new and existing customers. |
| Product Owner | Person responsible for an extension/app. |
| Project manager | Person responsible for the implementation of a Business Central environment for a customer. |
| Supporter | Person performing triage, investigation, and mitigation of customer issues. |

In the following table, you'll find examples of scenarios for each persona where the app might be of help.

| Persona | Scenario | How the Power BI app can help |
| ------- | ---------| -------------------- |
| Account Manager | Prospective customer has concerns that online solutions are a blackbox.| The Power BI app comes with sample data when you install it. If questions pop up, show them what kind of insights the app offers and that they can get access to the app if they find it useful. Focus on the Usage report unless the customer wants to see some of the more technical reports (that is, Errors, Performance, or Administration). If the customer has a representative from IT, then show them the Administration report. |
| Account Manager | Plan new activities with an existing customer. | Most of the pages in the Usage report can help drive conversations with the customer on how to get more value from their Business Central investment. For example, look at the _Page views_, _Reports_, and _Feature Usage_ pages to check whether the customer is using the functionality they set out to when starting the project. Lack of data typically means lack of usage.  |
| Account Manager | Get existing customers excited about reporting with Excel layouts. | Go to the **Usage** report and open the _Reports_ page to check whether the customer is using the Excel layouts (you can filter on the layout type). If they are, then it's good. Maybe you can follow up with training or PoCs on Power Query and maybe also start working differently with the customer on reporting. With Excel layouts, some reports only need a developer for the AL report object, then the customer/end users can do most/all of the layout in Excel. If the customer isn't using Excel layouts yet, show them the power of Business Central reports with Excel layouts and a bit of Power Query in Excel. |
| Product Owner | Which features in our apps or per-tenant extensions are being used and how often? | Make sure that apps/extensions have enabled telemetry in the app manifest (app.json). Use the _Feature Telemetry_ AL system module to equip your app with usage telemetry. Consider having separate Power BI apps for apps/extensions and environments. Once you have data in telemetry, then go to the Usage report and visit the _Feature Usage_ page. You can filter the results down to publisher/app. |
| Project manager | We need a way to track progress on User Acceptance Testing (UAT) efforts | Go to the Usage report and visit the _Page views_, _Reports_, and _Feature Usage_ pages to see what users are doing in Business Central. Consider sharing the app with the customer to enable them to do the follow-ups internally based on data. |
| Project manager | We want a smooth go-live for the customer. | Use the Error dashboard in the Error report to drive errors to zero before go-live. Monitor the dashboard in the first weeks after go-live. Consider sharing the app with the customer so status meetings and follow-ups can be based on data. |
| Project manager | Business Central online only: We want to check if the customer will get broken integrations when they get updated to version 20.0 or 21.0 | Look at the _Deprecated features_ page in the Usage report to see if the customer is still using web service keys (basic auth) for integrations. If you see any data here, work with the customer on a mitigation plan to move integrations to OAuth.|
| Supporter | Customer calls and says that "something changed since Friday of last week." | Go to the Administration report, find the _All changes_ page and filter to a period in time that overlaps with "Friday of last week." There are various changes that a customer can report, such as data, UI, business logic, performance, stability, and so on. Depending on the reported change, you might get lucky that one of the lifecycle events for environments, extensions, companies, or indexes can explain the root cause of the changed behavior. Otherwise, you can dig further into the issue with the app using KQL queries, or simply by reaching out to the code owner. |
| Supporter | Customer complains that some users can't sign in. | Go to the Error report and investigate the *Login Errors* page. |
| Supporter | Customer complains that users get lots of errors when using the system. | Go to the Error report and investigate the _Error Dialogs_, _Permission Errors_, and _Feature Errors_ pages. You can filter pages by Extension Publisher to learn which code path the error is coming from. |
| Supporter | Customer experiences many locking issues. | Use the _Database Deadlocks_ page in the Error report to examine deadlocks. Use the _Database Lock Timeouts_ page in the Performance report to examine lock time-outs. Use the _Long running SQL queries_ page (filter SQL Statement to "UPDLOCK") to investigate SQL queries that take locks. | 

## See also
[Telemetry overview](telemetry-overview.md)  
[Enabling telemetry](telemetry-enable-application-insights.md)  
[Available telemetry](telemetry-available-telemetry.md)  
[Analyze Telemetry with KQL](telemetry-analyze-with-kql.md)
