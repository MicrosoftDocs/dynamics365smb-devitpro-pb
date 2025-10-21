---
title: Report Customer Outages
description: Learn about how to report a suspected service outage on behalf of your Business Central online customers as the delegated administrator.
author: jswymer
ms.topic: how-to
ms.devlang: al
ms.date: 10/14/2025
ms.author: jswymer
ms.reviewer: jswymer
---

# Report customer outages

When a customer has a situation where no users can sign in to [!INCLUDE [prod_short](../developer/includes/prod_short.md)], the admin must take immediate action. Outages are frustrating but rare. Make sure that the users aren't unable to sign in due to problems with their network connection, for example. Learn more in the Power Platform admin documentation at [How do I check my online service health?](/power-platform/admin/check-online-service-health).  

Internal and delegated administrators can report this outage to Microsoft by using the **Report Production Outage** action for the relevant production environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. This action creates a support ticket for Microsoft with all the information that is needed to begin steps to resolve the issue.  

> [!NOTE]
> This option isn't available in sandbox environments.  

## Report an outage

1. On the **Environments** tab of the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], select the relevant environment to open the environment details.
1. In the action ribbon, choose **Support**, and then select **Report Production Outage**.
1. In the **Report Production Outage** pane, choose the outage type:

    - Unable to sign in (all users)
    - Can't access API/Web Service

1. Enter your name, email address, and phone number. This information is included in the support ticket.  
1. Select **Next**.
1. In the next pane, provide details about the outage, including which browsers users tried to sign in with, any companies that you can sign into, and errors and correlation IDs. This information is included in the support ticket.  
1. Finally, add the date and time when the outage began. This information also flows to the support ticket.  
1. Select the consent checkbox, and then Select **Report**.

A support request ticket is then created, and you can see a dialog box with the ticket ID. To monitor its progress, select **Reported Outages** in the navigation pane to open the **Report Production Outages** page. From this page, you can access the tickets in the Partner Center. Learn more in [Microsoft Partner Center](/partner-center/) documentation.  

## Troubleshooting tools and guides

[!INCLUDE [troubleshooting-overview](../includes/include-troubleshooting-overview.md)]

## Related information

[Escalating Support Issues to Microsoft](raise-support-case.md)  
[Managing Technical Support](manage-technical-support.md)  
[Inspecting and Troubleshooting Pages](../developer/devenv-inspecting-pages.md)  
[Troubleshooting tools and guides](../developer/devenv-troubleshooting-overview.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Technical Support for Business Central](../technical-support.md)  
[Provide technical support (Microsoft Partner Center)](/partner-center/provide-technical-support)  
[Deployment Overview](../deployment/Deployment.md)  
[Administration as a partner](tenant-administration.md#administration-as-a-partner)  
[Administration of Business Central Online](tenant-administration.md)  
[Administration of Business Central on-premises](Administration.md)  
