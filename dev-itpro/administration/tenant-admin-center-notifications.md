---
title: Manage Tenant-Specific Notifications
description: Learn about how an internal admin and a delegated admin can get notified of changes for Business Central tenants. 
author: edupont04

ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.search.keywords: administration, tenant, admin, environment, notifications
ms.date: 08/01/2022
ms.author: edupont

---

# Manage Tenant-Specific Notifications

You can get notified of administrative events that occur on environments in a [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant. For example, we send notifications when a major update is available for environments, when an environment update has succeeded or failed, or when extensions require changes to be compatible with an upcoming update. When these and other similar events occur on the tenant, an email is sent to the notification recipients for the tenant.  

> [!NOTE]
> If a prospect has signed up for a trial of [!INCLUDE [prod_short](../includes/prod_short.md)], make sure that they understand that they must sign up for notifications. This is especially important if the prospect moves to My Company so that the tenant will expire after 30 days. For more information, see [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for Business Central.

## Communication channels

Environment lifecycle events are communicated through various channels, each with their own benefits.  

### Email notification

Notifications are sent to all email addresses that are listed in the **Notification recipients** list of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. Manage the list manually by adding and removing recipients to ensure the right individuals are notified of the event.

> [!NOTE]
> It is important that *at least* one administrator's email address has been entered as a notification recipient to ensure proper awareness of events requiring administrative attention.

> [!IMPORTANT]
> [!INCLUDE [admin-notifications](../includes/admin-notifications.md)]

### Microsoft 365 Message Center

Most environment lifecycle events that emails are sent for will soon also be posted to Microsoft 365 Message Center. Over time, emails that are sent to the specified notification recipients will be a subset of the messages that are posted in Message Center. Eventually, emails sent to notification recipients will be deprecated.  

Already now, we warmly recommend that you make sure that the relevant people [sign up to receive email notifications from the Message center](/microsoft-365/admin/manage/message-center#preferences). For more information, see the article [Message center](/microsoft-365/admin/manage/message-center) in the Microsoft 365 admin content.

If you're a delegated admin, you might not be able to sign up yourself. In those cases, ask the internal admin to add you or a group email account as recipients. Also, in some scenarios where your organization manages multiple tenants, you might want to use the service communications API in Microsoft Graph to access the health status and message center posts about [!INCLUDE [prod_short](../includes/prod_short.md)]. For more information, see [Access service health and communications in Microsoft Graph](/graph/service-communications-concept-overview).  

### Microsoft 365 Service Health Dashboard

[!INCLUDE [admin-service-health](../includes/admin-service-health.md)]

### Application Insights

Application Insights telemetry includes the most complete list of Environment Lifecycle events, and can better be used for automation and reporting purposes than the other communication channels.

Learn more about Environment Lifecycle trace telemetry [here](telemetry-environment-lifecycle-trace.md).

#### Customize notifications and automation

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

##### Grouped notification for available updates

This Logic App runs every number of days (specified in deployment) and lists all updates made available to environments that emit telemetry to the specified Application Insights resource for the specified period. Administrators can use this to replace the many email notifications they would receive for each individual enviroment when set up as notification recipient.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FAvailableUpdatesNotification.json)

##### Notification for deleted environment

This Logic App queries Application Insights every number of minutes (specified in deployment) and notifies a user (also specified in deployment) of any deleted environments in Microsoft Teams. The action that sends the notification in Teams can be updated to notify a Channel or Group Chat instead.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FDeletedEnvironmentNotification.json)

##### Action each failed environment update

This Logic App runs a query that returns any failed environment updates ever number of hours (specified in deployment). Customize the Logic App after deploying to action the failed update, for example by opening a case in Dynamics 365 Customer Service using the Dataverse connector.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FActionFailedEnvironmentUpdate.json)

##### Action available updates from an Adaptive Card in Teams
This Logic App queries Application Insights regularly to get any new updates made available to environments for which AppInsights has been set up and posts an Adaptive Card to Teams from which the update can be started immediately or rescheduled, all without having to navigate to the Admin Center.

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FActionFailedEnvironmentUpdate.json)


#### Reporting

To help you analyze Business Central telemetry, find the [Power BI app](https://aka.ms/bctelemetryreport) in Microsoft AppSource. This app includes an Administration report which shows an inventory of environments including various environment operations details built with the environment lifecycle telemetry in Application Insights. Learn more [here](telemetry-power-bi-app.md) or get it immediately from [Microsoft AppSource](https://aka.ms/bctelemetryreport).

> [!NOTE]
> The Power BI reports and dataset that make up this app are available on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/PowerBI/Reports/AppSource/enrironment-app-pbix). You can customize those resources for your own needs and publish from Power BI desktop.

### Admin center operations page

The operations page does not notify you of environment lifecycle events, but does provide some details on these operations that are not available in other channels, like the email address of the user that executed an operation. Learn more [here](tenant-admin-center-environments.md#opslog).

### Overview of communication channels

The following table illustrates how we communicate about the different environment lifecycle events and other communication scenarios on the different channels.  

|-|Application Insights|Email Notification|Microsoft 365 Message Center<sup>[\[1\]](#1)|Microsoft 365 Service Health Dashboard|Tenant Admin Center Operations Page|
|---------|---------|---------|---------|---------|---------|
|Environment Created|         |         |         |         |![check mark for feature](../developer/media/check.png)|
|Update Available|![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |         |
|Update Scheduled|![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |         |![check mark for feature](../developer/media/check.png)
|Updates Postponed/Resumed|![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |         |
|Update Started |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|Update Succeeded/Failed<sup>[\[2\]](#2) |![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |![check mark for feature](../developer/media/check.png) |         |![check mark for feature](../developer/media/check.png)
|Environment Hotfix |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|Environment Restart |![check mark for feature](../developer/media/check.png)|         |         |         |![check mark for feature](../developer/media/check.png)
|Environment Started/Stopped|![check mark for feature](../developer/media/check.png)|         |         |         |
|Environment Copy |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|Environment Restore |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|Environment AAD Tenant Move |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|Cancel Session |![check mark for feature](../developer/media/check.png) |         |         |         |
|Database Export |![check mark for feature](../developer/media/check.png) |         |         |         |Export History Page
|Environment Setting Change <sup>[\[3\]](#3) |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|Environment Deleted |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|Environment Renamed |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|AppSource App Install/Update Scheduling |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|AppSource App/PTE Install/Update |![check mark for feature](../developer/media/check.png) |         |         |         |![check mark for feature](../developer/media/check.png)
|AppSource App Uninstall Scheduling |![check mark for feature](../developer/media/check.png) |         |         |         |
|AppSource App/PTE Uninstall | ![check mark for feature](../developer/media/check.png)        |         |         |         | ![check mark for feature](../developer/media/check.png)
|AppSource App/PTE Dependency Install & Update Orchestration |![check mark for feature](../developer/media/check.png) |         |         |         |
|Installed PTE incompatible with next version |         |![check mark for feature](../developer/media/check.png) |         |         |
|Service Incidents and Advisories |         |         |         |![check mark for feature](../developer/media/check.png) |
|Feature Change and Deprecation Announcements |         |         |![check mark for feature](../developer/media/check.png) |         |

<sup>1</sup><a name="1"></a>Messages for environment lifecycle events are coming to Microsoft 365 Message Center soon.

<sup>2</sup><a name="2"></a>Application Insights and Operations page include full failure details, email notification and Message Center cover fewer failure reasons but include mitigation steps.

<sup>3</sup><a name="3"></a>Examples of setting changes include changes to the environment update window, assigned security groups, and Application Insights settings.

## Notification of blocked updates

Microsoft updates environments according to the update windows that are defined for the environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. However, if the environment includes an app that isn't compatible with the next version, Microsoft pauses the update and sends a notification of the issue.  

After a while, all users see an in-product notification, which may confuse some people. But Microsoft wants to update the environment, so an admin must disable and remove the problematic app so that the update can continue. After more than a month of waiting, Microsoft sends a more strongly worded notification. If the environment is still blocked from getting the update after more than 4-5 months, Microsoft uninstalls the problematic app, but doesn't delete any data. The environment is updated with the latest security and other updates.  

The following list illustrates a typical timeline:

* 10 weeks of emails sent to the registered notification recipients.  

    If the update fails, Microsoft reschedules automatically. The notification recipients will receive multiple emails. If no notification recipient has been set up, then no email is sent.
* Six weeks with in-product notifications that encourage users to contact their admin.  

    This notification currently indicates that the environment will expire to worry users so they try to find their admin to sort out things.
* One month of more explicit in-product notifications

    This notification currently indicates that the environment is missing an important update and is blocked. The wording has been chosen to make it clearer what the issue is and what the user must do as quickly as possible.  

If the problematic app hasn't been uninstalled at this point, Microsoft typically starts the process of force-uninstalling apps, including per-tenant extensions. Data isn't deleted.  

For more information about updates, see [Major Updates and Minor Updates for Business Central Online](update-rollout-timeline.md). For more information about how to keep your [!INCLUDE [prod_short](../includes/prod_short.md)] compliant with upcoming updates, see [Maintain AppSource Apps and Per-Tenant Extensions in Business Central Online](../developer/app-maintain.md).  

## Cleaning up settings

If you end the relationship with a customer where you have set up your email address as a notification recipient, you must remove the email address while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].  

## See also

[Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Working with Administration Tools](administration.md)  
