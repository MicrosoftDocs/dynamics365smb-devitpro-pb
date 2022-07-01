---
title: Managing technical support
description: Learn about how to support your Business Central users, both online and on-premises, as the internal or delegated administrator.
author: edupont04

ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 01/25/2022
ms.author: edupont

---

# Managing Technical Support

When users report a problem with [!INCLUDE [prod_short](../developer/includes/prod_short.md)], superusers or the internal administrator can often find a solution. The internal administrator can find technical information in the **Help and Support** page, and they can then escalate relevant issues to the reselling partner.  

The reselling partner can sign in to their customer's [!INCLUDE [prod_short](../developer/includes/prod_short.md)] as the delegated admin for troubleshooting. Sometimes, they create a sandbox environment based on production data or troubleshooting.  

Both internal administrators and their partner can use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to manage environments, updates, and troubleshooting.  

## Internal administrators

The internal administrator can work with users to identify solutions or workarounds, such as missing setup, missing permissions, and other issues. If users are not sure if things are not working as intended, they can check the [Help and Learn content](../user-assistance.md) for the intended behavior. For more technical problems, administrators can find information in the **Help and Support** page to help with this investigation. For more information, see the [Finding technical information](#finding-technical-information) section.  

As the tenant admin, you can check the Microsoft 365 admin center for incidents. For more information, see the [Monitor service health](#monitor-service-health) section.  

Internal administrators can also [create sandbox environments](environment-types.md#sandbox-environments) for deeper troubleshooting, for example, before they decide to contact their partner for technical support. The partner must have specified their support contact details in the **Help and Support** page.  

## Delegated administrators

Each [!INCLUDE [prod_short](../developer/includes/prod_short.md)] customer has a partner who assists with technical support when requested by the internal administrator. As the partner, you must have specified support contact details in the **Help and Support** page. For more information, see [Configuring the support experience](../technical-support.md#configuring-the-support-experience).  

> [!IMPORTANT]
> You must have set up users in your own tenant in Partner Center as either *Admin agent* or *Helpdesk agent*, and they must have *delegated administration* privileges in your customer's [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to support the customer. For more information, see [Delegated Administrator Access to Business Central Online](delegated-admin.md).

The delegated administrator can access the customer's [!INCLUDE [prod_short](../developer/includes/prod_short.md)] for further troubleshooting. They can also use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to [analyze telemetry](telemetry-overview.md), [create a sandbox environment](environment-types.md#sandbox-environments) for debugging or step-by-step reproduction, for example.  

If the partner cannot find a solution, they can request support from Microsoft. For more information, see the [Escalating support issues to Microsoft](#escalating-support-issues-to-microsoft) section.  

### Extend trials

Another task for a delegated admin is to help with extending trials. For more information, see [Business Central Trials and Subscriptions](trials-subscriptions.md).  

### Cleaning up settings

If you end the relationship with a customer, you must remove certain settings while you still have access to that customer's [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. Consider the following settings:

- Support contact details

  For more information, see [To supply your support contact information in the administration center](../technical-support.md#to-supply-your-support-contact-information-in-the-administration-center).  

- Notification recipients

  For more information, see [Tenant Notifications](tenant-admin-center-notifications.md).  

- Application Insights key (if the partner had set up Application Insights)

  For more information, see [Environment Telemetry in the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]](tenant-admin-center-telemetry.md).  

## Finding technical information

For [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, administrators have access to a range of tools for troubleshooting. Depending on the type of problem, administrators
can troubleshoot in [!INCLUDE [prod_short](../developer/includes/prod_short.md)], or they can use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to analyze telemetry, for example.

This section provides an overview of the most useful tools for troubleshooting the problems that users are reporting. Often, you'll want to create a sandbox environment based on the production environment where users are reporting problems. That way, the administrators can troubleshoot without disturbing normal work.  

- The **Help and Support** page  

    Each company in any [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment has a **Help and Support** page that can be accessed from the question mark in the top-right corner. Here you can access the latest error message, which, for example, is useful if your users complain of a confusing error message such as *Sorry, we just updated this page. Please close and reopen.*. For more information, see [The Help and Support page](#helpsupport) section.  
- Page inspection  

    [!INCLUDE [prod_short](../developer/includes/prod_short.md)] includes a page inspection feature that lets you get details about a page. You can get insight into the page design, the different elements that form the page, and the source behind the data that it shows. For more information, see [Inspecting and Troubleshooting Pages](../developer/devenv-inspecting-pages.md).  
- Environment telemetry in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]  

    In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], you can view telemetry of top-level AL events, and any errors resulting from calls through the telemetry stack. For more information, see [Environment telemetry](tenant-admin-center-telemetry.md).  
- Troubleshoot in a sandbox environment  

    In the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], you can create sandbox environments for safe debugging and troubleshooting. For more information, see [Sandbox environments](environment-types.md#sandbox-environments).  
- Use the Event Recorder  

    Using the Event Recorder, you can record the events that are published and raised while performing the actions of your scenario. For more information, see [Discoverability of Events](../developer/devenv-events-discoverability.md).  
- Check the data in the database  

    You can view table objects in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. This way, you see the data in all rows and columns of a specific table, including any columns that are added by table extensions. From the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], you can also launch a list of all tables, sorted by storage size. For more information, see [Viewing Table Data](../developer/devenv-view-table-data.md).  
- Analyze long running operations in Application Insights  

    Set up Application Insights so that any SQL query that takes longer than 1000 milliseconds to execute will be sent to your Application Insights resource. For more information, see [Analyzing long-running operations in Application Insights](telemetry-long-running-sql-query-trace.md).  
- Database locks

    Open the **Database Locks** page in [!INCLUDE [prod_short](../includes/prod_short.md)] to view existing locks in this tenant's database. You can often see which where the code is tht caused the problem.  
- Additional logging per session

    You can enable more logging that can help you troubleshoot in the current session. For example, if you're concerned if a specific report or other process might be the reason for database locks, go to the **Help and Support** page and enable more logging. Then, run the process that you're concerned about, and then analyze the logs. For more information, see [Analyzing long running operations in Application Insights](telemetry-long-running-sql-query-trace.md).
- Debug your app or pre-tenant extension  

    With Visual Studio Code and the AL Language extension, you get an integrated debugger to help you inspect your code to verify that your application can run as expected. For more information, see [Debugging in AL](../developer/devenv-debugging.md).

### <a name="helpsupport"></a>The **Help and Support** page in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] company

The **Help and Support** page is a powerful tool for administrators to find technical information about [!INCLUDE [prod_short](../developer/includes/prod_short.md)], both online and on-premises. The **Troubleshooting** section gives easy access to the [most recent error message](#last-known-error), and it has a link to [inspect pages](../developer/devenv-inspecting-pages.md) for further troubleshooting.  

> [!div class="mx-imgBorder"]
> ![Links for troubleshooting and support from the Help and Support page.](../developer/media/admin/helpsupport_managed.png)

Also in the **Help and Support** page, users can see support contact information, if the partner has provided this information. For more information, see [To supply your support contact information in the administration center](../technical-support.md#to-supply-your-support-contact-information-in-the-administration-center). The **Help and Support** page also shows [which version](#version) of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], the specific environment is on.  

For [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, a user can enable more logging and then perform the operation that is causing problems. The more telemetry is sent to Application Insights where you can do further troubleshooting, either as part of a support case, or before you submit a support request. In both scenarios, the more details about the problematic operation will lead to a quicker resolution.  

For [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online, internal and delegated administrators also have access to this information in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. You can use the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to easily navigate to the different environments in a tenant, and you can create sandbox environments that can help troubleshoot any issues reported by users. For more information, see [The Business Central Administration Center](tenant-admin-center.md).  

#### Azure Active Directory tenant

When the internal administrator wants to contact the partner for support, then the **Help and Support** page encourages them to include information about their Azure Active Directory tenant ID in the email. This information is shown in the **Troubleshooting** section at the bottom of the **Help and Support** page.  

The delegated administrator can use that to identify the tenant in the Partner Center and in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] for troubleshooting.  

#### Version

You can use the information about which version the tenant is on to help you troubleshoot the issue that the customer has reported, for example. This information is also listed in the **Troubleshooting** section of the **Help and Support** page. For more information, see [Version numbers in Business Central](version-numbers.md).  

#### Last known error

The link behind the sentence *View the last known error* will find and show the most recent error message that was generated by the application code. This includes errors from field validation, posting routines, and other code behind business functionality.  

The information that you can get from this link includes the following:

- Text

    This is the error message that the user sees, either in a dialog window or next to a user interface element that cannot render, for example.
- Code

    This is the code snippet that threw the error.
- Callstack

    This shows how the error was triggered.
- Object

    This shows information about the runtime objects.

The link cannot open errors that were generated by the platform. If you suspect that the issue is caused by the platform, try to reproduce the error in a sandbox environment before you contact Microsoft for support. For more information, see [Create a new environment](tenant-admin-center-environments.md#create-a-new-environment).

> [!TIP]
> If your users complain of a confusing error message such as *Sorry, we just updated this page. Please close and reopen.*, then you can often find the underlying problem either in this last known error, or by analyzing telemetry in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. For example, in the case of the *Sorry, we just updated this page. Please close and reopen.* message, the underlying problem is often that two users are trying to modify the same data. So if both users open the same sales order, and both change a field, then one of them will see the *Sorry, we just updated this page. Please close and reopen.* message, because [!INCLUDE [prod_short](../developer/includes/prod_short.md)] saves changes as soon as you move to the next field or close the page.

## Monitor service health

[!INCLUDE [admin-service-health](../includes/admin-service-health.md)]

## Escalating support issues to Microsoft

Sometimes the tenant has run into a problem that the partner cannot resolve. In those cases, the delegated admin can use the Partner Center or the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)] to submit a support request to Microsoft.  

Both internal and delegated administrators can access [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], and then, in the **Support** menu, choose the **New Support Request** button. This link signs you in to the Power Platform Admin Center. Here, you can launch the **New Support Request** guide that will help you identify potential solutions or workarounds based on how you fill in the various fields.  

> [!TIP]
> In the Power Platform Admin Center, use the **See solutions** button to find potential guidance or workarounds. Based on your search keywords, links to suggested content are shown on the **Solutions** tab.

> [!NOTE]
> The internal administrator cannot contact Microsoft directly. If you are an internal admin and suspect that something is wrong with your [!INCLUDE [prod_short](../developer/includes/prod_short.md)], you must contact your partner for next steps.

### <a name="submitsupportrequest"></a>Submitting support requests on behalf of your customer

[!INCLUDE [admin-supportplan](../includes/admin-supportplan.md)]

[!INCLUDE [admin-escalate](../includes/admin-escalate.md)]

> [!NOTE]
> Outages are frustrating but rare. If your customer reports that they cannot access [!INCLUDE [prod_short](../includes/prod_short.md)] at all, help them test their connection and other potential local problems. For more information, see the [Report Customer Outages](report-outage.md) section here, and also bookmark the article [How do I check my online service health?](/power-platform/admin/check-online-service-health) in the Power Platform administration content.  

#### To start the process of submitting a new support request from the [!INCLUDE[prodadmincenter](../developer/includes/prodadmincenter.md)]

[!INCLUDE [admin-escalate-submitTAC](../includes/admin-escalate-submitTAC.md)]

#### To start the process of submitting a new support request from the Partner Center

[!INCLUDE [admin-escalate-submitPC](../includes/admin-escalate-submitPC.md)]

<!-- TODO: How to manage your customers' support issues -->

## See Also

[How to check service health](/microsoft-365/enterprise/view-service-health?view=o365-worldwide&preserve-view=true#how-to-check-service-health)  
[Inspecting and Troubleshooting Pages](../developer/devenv-inspecting-pages.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Technical Support for Business Central](../technical-support.md)  
[Provide technical support (Microsoft Partner Center)](/partner-center/provide-technical-support)  
[Escalate Support Issues to Microsoft](raise-support-case.md)  
[Deployment Overview](../deployment/Deployment.md)  
[Administration as a partner](tenant-administration.md#administration-as-a-partner)  
[Administration of Business Central Online](tenant-administration.md)  
[Administration of Business Central On-Premises](Administration.md)  
