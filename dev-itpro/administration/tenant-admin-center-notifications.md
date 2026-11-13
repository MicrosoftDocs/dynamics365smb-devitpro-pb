---
title: Manage Tenant-Specific Notifications
description: Set up recipients for Business Central tenant notifications and use email, Microsoft 365, and telemetry to monitor environment events.
author: jswymer
ms.topic: concept-article
ms.devlang: al
ms.search.keywords: administration, tenant, admin, environment, notifications
ms.date: 11/13/2026
ms.author: solsen
ms.reviewer: solsen
ai-usage: ai-assisted
---

# Manage tenant-specific notifications

You can get notified of administrative events that occur on environments in a [!INCLUDE [prod_short](../includes/prod_short.md)] online tenant. For example, we send notifications when:

- A major update is available for environments.
- An environment update succeeds or fails
- Extensions require changes to be compatible with an upcoming update.

When these and other similar events occur on the tenant, an email is sent to the notification recipients for the tenant.  

> [!NOTE]  
> If a prospect signed up for a trial of [!INCLUDE [prod_short](../includes/prod_short.md)], make sure that they understand that they must sign up for notifications. This step is especially important if the prospect moves to **My Company** so that the tenant will expire after 30 days. Learn more in [Dynamics 365 Business Central Trials and Subscriptions](/dynamics365/business-central/across-preview) in the business functionality content for Business Central.

## Choose notification and monitoring channels

Environment lifecycle events are communicated through various channels, each with their own benefits.  

### Email notification

Notifications are sent to all email addresses that are listed in the **Notification recipients** list of the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]. To ensure the right individuals are notified of the event, manage the list manually by adding and removing recipients.

1. In the admin center, select **Notification Recipients**.
1. Select **Add recipient**.
1. Enter the recipient's **Name** and **Email**.
1. Select **Save**.

To remove a recipient, select **Remove recipient** for that recipient and confirm the removal.

> [!NOTE]
>
> - It's important that *at least* one administrator's email address is entered as a notification recipient to ensure proper awareness of events requiring administrative attention.
> - You can add up to 100 notification recipients. To support more recipients, create a distribution list and add it as a recipient instead.

> [!IMPORTANT]
> [!INCLUDE [admin-notifications](../includes/admin-notifications.md)]

### Microsoft 365 Message center

Most environment lifecycle events that emails are sent for are also soon posted to Microsoft 365 Message Center. Over time, emails that are sent to the specified notification recipients will be a subset of the messages that are posted in Message Center. Eventually, emails sent to notification recipients are deprecated.  

Already now, we warmly recommend that you make sure that the relevant people [sign up to receive email notifications from the Message center](/microsoft-365/admin/manage/message-center#preferences). Learn more in the [Message center](/microsoft-365/admin/manage/message-center) in the Microsoft 365 admin content.

If you're a delegated admin, you might not be able to sign up yourself. In those cases, ask the internal admin to add you or a group email account as recipients. Also, in some scenarios where your organization manages multiple tenants, you might want to use the service communications API in Microsoft Graph to access the health status and message center posts about [!INCLUDE [prod_short](../includes/prod_short.md)]. Learn more in [Access service health and communications in Microsoft Graph](/graph/service-communications-concept-overview).  

### Microsoft 365 Service health dashboard

[!INCLUDE [admin-service-health](../includes/admin-service-health.md)]

### Telemetry in Application Insights

Application Insights telemetry includes the most complete list of Environment Lifecycle events, and can better be used for automation and reporting purposes than the other communication channels.

Learn more in [Environment lifecycle trace telemetry](telemetry-environment-lifecycle-trace.md).

#### Customize notifications and automation

Azure Logic Apps and Power Automate have connectors, such as the [Azure Monitor Logs connector](/connectors/azuremonitorlogs/), to query telemetry in Application Insights. Use these connectors to set up custom notifications or automate actions triggered by an environment lifecycle event.

Learn more in [Monitoring and analyzing telemetry](telemetry-overview.md).

##### Example: grouped notification for available updates

This Logic App runs every number of days (specified in deployment) and lists all updates made available to environments that emit telemetry to the specified Application Insights resource for the specified period. Administrators can use this information to replace the many email notifications they would receive for each individual environment when set up as notification recipient.

[:::image type="content" source="https://aka.ms/deploytoazurebutton" alt-text="Button to deploy the available updates notification to Azure.":::](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FAvailableUpdatesNotification.json)

##### Example: notification for a deleted environment

This Logic App queries Application Insights every number of minutes (specified in deployment) and notifies a user (also specified in deployment) of any deleted environments in Microsoft Teams. The action that sends the notification in Teams can be updated to notify a Channel or Group Chat instead.

[:::image type="content" source="https://aka.ms/deploytoazurebutton" alt-text="Button to deploy the deleted environment notification to Azure.":::](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FDeletedEnvironmentNotification.json)

##### Example: take action on failed environment updates

This Logic App runs a query that returns failed environment updates every number of hours specified during deployment. Customize the Logic App after deployment to act on a failed update, for example, by opening a case in Dynamics 365 Customer Service using the Dataverse connector.

[:::image type="content" source="https://aka.ms/deploytoazurebutton" alt-text="Button to deploy automation for failed environment updates to Azure.":::](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FActionFailedEnvironmentUpdate.json)

##### Example: post adaptive cards in Teams for each available environment update

This Logic App queries Application Insights every number of minutes (specified in the deployment). It posts an adaptive card to a specified Microsoft Teams channel for each environment that has an update available. Based on the user's choice, the Logic App calls the Business Central admin center API using an authorized service-to-service Microsoft Entra app (configuration details specified in the deployment). The adaptive card gives the user four choices:  

- Schedule the update as soon as possible ("Run Now"), and allow the update to start outside of the update window for the environment  
- Reschedule the update to a specified other day  
- Ignore information about the update and close the card  
- Open the admin center  

[:::image type="content" source="https://aka.ms/deploytoazurebutton" alt-text="Button to deploy Teams cards for available environment updates to Azure.":::](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FAlertingLogicAppTemplates%2FS2SAppsEnvironmentUpdateAdaptiveCard.json)

##### Example: post adaptive cards in Teams for user permission errors

This Logic App queries Application Insights every number of minutes (specified in the deployment). It posts adaptive cards to a specified Microsoft Teams channel for each permission error encountered by users in environments that emit telemetry to the specified Application Insights resource. Administrators can use the adaptive card to open Business Central to assign the needed permissions to the user.

[:::image type="content" source="https://aka.ms/deploytoazurebutton" alt-text="Button to deploy Teams cards for user permission errors to Azure.":::](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2FBCTech%2Fmaster%2Fsamples%2FAppInsights%2FAlerts%2FPermissionError.json)

#### Report on environment lifecycle events

To help you analyze Business Central telemetry, find the [Power BI app](https://aka.ms/bctelemetryreport) in Microsoft Marketplace. This app includes an Administration report that shows an inventory of environments including various environment operations details built with the environment lifecycle telemetry in Application Insights. Learn more in [Power BI apps for telemetry](telemetry-power-bi-app.md), or get the app from [Microsoft Marketplace](https://aka.ms/bctelemetryreport).

> [!NOTE]
> The Power BI reports and dataset that make up this app are available on the [Business Central BCTech repository on GitHub](https://github.com/microsoft/BCTech/tree/master/samples/AppInsights/PowerBI/Reports/AppSource/enrironment-app-pbix). You can customize those resources for your own needs and publish from Power BI desktop.

### Admin center operations page

The operations page doesn't notify you of environment lifecycle events. However, it does provide some details on these operations that aren't available in other channels, like the email address of the user that executed an operation. Learn more in [Log of administrative operations](tenant-admin-center-environments.md#opslog).

### Overview of communication channels

The following table illustrates how we communicate about the different environment lifecycle events and other communication scenarios on the different channels.  

|-|Application Insights|Email Notification|Microsoft 365 Message Center<sup>[\[1\]](#1)</sup>|Microsoft 365 Service Health Dashboard|Tenant Admin Center Operations Page|
|---------|---------|---------|---------|---------|---------|
|Environment Created| | | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Update Available|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | |
|Update Scheduled|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**| |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Updates Postponed/Resumed|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | |
|Update Started|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Update Succeeded/Failed<sup>[\[2\]](#2)</sup>|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**| |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Environment Hotfix|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | | |
|Environment Restart|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Environment Started/Stopped|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | | |
|Environment Copy|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Environment Restore|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Environment Microsoft Entra tenant Move|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Cancel Session|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | | |
|Database Export|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |Export History Page|
|Environment Setting Change <sup>[\[3\]](#3)</sup>|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Environment Deleted|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Environment Renamed|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Marketplace App Install/Update Scheduling|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Marketplace App/PTE Install/Update|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Marketplace App Uninstall Scheduling|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | | |
|Marketplace App/PTE Uninstall|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**|
|Marketplace App/PTE Dependency Install & Update Orchestration|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | | |
|Installed PTE incompatible with next version|:::image type="icon" source="../developer/media/check.png"::: **Yes**|:::image type="icon" source="../developer/media/check.png"::: **Yes**| | | |
|Service Incidents and Advisories| | | |:::image type="icon" source="../developer/media/check.png"::: **Yes**| |
|Feature Change and Deprecation Announcements| | |:::image type="icon" source="../developer/media/check.png"::: **Yes**| | |

<sup>1</sup><a name="1"></a>Messages for environment lifecycle events are coming to Microsoft 365 Message Center soon.

<sup>2</sup><a name="2"></a>Application Insights and Operations page include full failure details. Email notification and Message Center cover fewer failure reasons but include mitigation steps.

<sup>3</sup><a name="3"></a>Examples of setting changes include changes to the environment update window, assigned security groups, and Application Insights settings.

## Notification of blocked updates

Microsoft updates environments according to the update windows defined for each environment. These windows are set in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. If the environment includes an app that isn't compatible with the next version, Microsoft pauses the update and sends a notification of the issue.  

After a while, all users see an in-product notification, which might confuse some people. But Microsoft wants to update the environment, so an admin must disable and remove the problematic app so that the update can continue. After more than a month of waiting, Microsoft sends a more strongly worded notification. If the environment is still blocked from getting the update after more than 4-5 months, Microsoft uninstalls the problematic app, but doesn't delete any data. The environment is updated with the latest security and other updates.  

The following list illustrates a typical timeline:

- 10 weeks of emails sent to the registered notification recipients.  

    If the update fails, Microsoft reschedules automatically. The notification recipients receive multiple emails. If no notification recipient is set up, then no email is sent.
- Six weeks with in-product notifications that encourage users to contact their admin.  

    This notification currently indicates that the environment will expire, prompting users to contact their admin to resolve the issue.
- One month of more explicit in-product notifications

    This notification currently indicates that the environment is missing an important update and is blocked. The wording was chosen to make it clearer what the issue is and what the user must do as quickly as possible.  

If the problematic app isn't uninstalled at this point, Microsoft typically starts the process of force-uninstalling apps, including per-tenant extensions. Data isn't deleted.  

Learn more in [Major updates and minor updates for Business Central online](update-rollout-timeline.md). To keep your [!INCLUDE [prod_short](../includes/prod_short.md)] apps compatible with upcoming updates, learn more in [Maintain Marketplace apps and per-tenant extensions in Business Central online](../developer/app-maintain.md).

## Remove recipients when ending a customer relationship

If you end your relationship with a customer where your email address is set as a notification recipient, remove your email address while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)].

## Related information

[Managing Updates in the Business Central Admin Center](tenant-admin-center-update-management.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Managing Environments](tenant-admin-center-environments.md)  
[Introduction to automation APIs](itpro-introduction-to-automation-apis.md)  
[Working with Administration Tools](administration.md)  
