---
title: Report customer outages
description: Learn about how to report a suspected service outage on behalf of your Business Central online customers as the delegated administrator.
author: edupont04

ms.topic: conceptual
ms.devlang: na
ms.tgt_pltfrm: na
ms.workload: na
ms.date: 12/28/2021
ms.author: edupont

---

# Report Customer Outages

When a customer has a situation where no users can sign in to [!INCLUDE [prod_short](../developer/includes/prod_short.md)], the admin must take immediate action. Outages are frustrating but rare. Make sure that the users are not unable to sign in due to problems with their network connection, for example. For more information, see [How do I check my online service health?](/power-platform/admin/check-online-service-health) in the Power Platform administration content.  

Internal and delegated administrators can report this outage to Microsoft by using the **Report Production Outage** action for the relevant production environment in the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)]. This action creates a support ticket for Microsoft with all the information that is needed to begin steps to resolve the issue.  

> [!NOTE]
> This option is not available in sandbox environments.  

## To report an outage

1. On the **Environments** tab of the [!INCLUDE [prodadmincenter](../developer/includes/prodadmincenter.md)], choose the relevant environment to open the environment details.
2. In the action ribbon, choose **Support**, and then choose **Report Production Outage**.
3. In the **Report Production Outage** pane, choose the outage type:

    - Unable to sign in (all users)
    - Cannot access API/Web Service

4. Enter your name, email address, and phone number. This information will be included in the support ticket.  
5. Choose **Next**.
6. In the next pane, provide details about the outage, including which browsers users have tried to sign in with, any companies that you can sign into, and errors and correlation IDs. This information will be included in the support ticket.  
7. Finally, add the date and time when the outage began. This information will also flow to the support ticket.  
8. Choose the consent checkbox, and then choose **Report**.

A support request ticket is then created, and you will see a dialog box with the ticket ID. You can then monitor progress in the **Reported Outages** section. From there, you can access the tickets in the Partner Center. For more information, see the [Microsoft Partner Center](/partner-center/) documentation.  

## See Also

[Escalating Support Issues to Microsoft](raise-support-case.md)  
[Managing Technical Support](manage-technical-support.md)  
[Inspecting and Troubleshooting Pages](../developer/devenv-inspecting-pages.md)  
[The Business Central Administration Center](tenant-admin-center.md)  
[Technical Support for Business Central](../technical-support.md)  
[Provide technical support (Microsoft Partner Center)](/partner-center/provide-technical-support)  
[Deployment Overview](../deployment/Deployment.md)  
[Administration as a partner](tenant-administration.md#administration-as-a-partner)  
[Administration of Business Central Online](tenant-administration.md)  
[Administration of Business Central On-Premises](Administration.md)  
