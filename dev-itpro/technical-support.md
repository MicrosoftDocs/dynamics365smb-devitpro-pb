---
title: Technical support overview
description: Learn about how to support your Business Central customers, online and on-premises, troubleshoot issues, and when to escalate problems to Microsoft.
author: SusanneWindfeldPedersen
ms.topic: overview
ms.author: solsen
ms.date: 01/21/2026
ms.reviewer: v-soumramani
---

# Technical support for [!INCLUDE[prod_long](developer/includes/prod_long.md)]

Each customer of [!INCLUDE [prod_short](developer/includes/prod_short.md)] has a partner who assists with technical support. As a [!INCLUDE[prod_short](developer/includes/prod_short.md)] reselling partner, you're an administrator of your customers' [!INCLUDE[prod_short](developer/includes/prod_short.md)] tenants, and you're the first line of support. You get requests for support from your customers that you must triage, investigate, and either resolve or escalate to Microsoft.  

In this section, learn about the tools that are available to you to help you troubleshoot your customers' [!INCLUDE [prod_short](developer/includes/prod_short.md)].  

## Configuring the support experience

Because you're the first line of support for your customers, you must make it easy for them to contact you. They can find your contact information in the [Help and Support](/dynamics365/business-central/product-help-and-support?toc=/dynamics365/business-central/dev-itpro/toc.json) page.  

> [!IMPORTANT]
> You must have set up users in your own tenant in Partner Center as either *Admin agent* or *Helpdesk agent*, and they must have *delegated administration* privileges in your customer's [!INCLUDE [prod_short](developer/includes/prod_short.md)] to support the customer. Learn more in [Delegated Administrator Access to Business Central Online](administration/delegated-admin.md).

### To supply your support contact information in the administration center

1. In the [!INCLUDE [prodadmincenter](developer/includes/prodadmincenter.md)], choose the environment that you want to specify your contact details for, such as *Production*, and then, in the **Support** menu, choose **Manage Support Contact**.
2. Fill in the **Name**, **Email address**, and the **Website** fields, so that your users know how to contact you for technical support.
3. Optionally, choose the **Apply to all environments** checkbox if you want to add the same details to all related environments for this tenant.

Your customer can now contact you if they experience problems and need help. If you also can't resolve a reported issue, escalate the issue to Microsoft. Learn more in [Managing Technical Support](administration/manage-technical-support.md).  

### On-premises deployments

In on-premises deployments of [!INCLUDE[prod_short](developer/includes/prod_short.md)], the **Help and Support** page doesn't contain the section for contacting technical support. Instead, you can enter an agreement with your customer's administrator about how and when to contact you.  

There are two other links in the **Help and Support** page that you can customize:

- Blog

    Specifies a link to where your customers can access a blog about their solution  
- Coming soon

    Specifies a link to where your customers can access a roadmap for future changes

If you choose to not modify these settings, then the links go to Microsoft's blog and release notes.

Learn more in [Configuring [!INCLUDE[webserver](developer/includes/webserver.md)] Instances](administration/configure-web-server.md).

## Technical support overview

Technical support involves break-fix issues, which are technical problems you experience while using services. Break-fix refers to the work involved in supporting technology when it fails during normal use in a standard Cronus database environment and requires intervention by the Dynamics support team to restore it to working order.

Understanding how functionality works isn’t a break-fix issue, but rather relates to training. These how-to questions, or advisory services, involve knowledge transfer and can often be answered by reviewing product documentation, asking questions in online forums, or contacting a knowledgeable partner. While there may be some elements of knowledge transfer involved in solving a break-fix issue, in general, assisted training isn't included in support plans.

### How is support provided for performance issues?

Depending on the situation, performance issues may be handled through a normal reactive break-fix support case or may require an advisory service at the discretion of the Microsoft Dynamics support team. For performance issues that impact multiple areas of the business, an advisory service is required to investigate at a broader level. For isolated performance issues affecting a specific business function, such as posting sales orders, these scenarios start as a break-fix support case to troubleshoot and determine the cause. 

The Microsoft Dynamics support team invests its best effort on a break-fix case to assist. If, after that, the issue isn't resolved, consult a partner or the community forums for further investigation. The technical support incident is then closed. Premier and Unified Support customers may be able to continue via an advisory case. If, at any point, it's determined that the cause points to custom code, partner or ISV software, environmental factors, or anything else outside of core Microsoft code, the Microsoft Dynamics Support team provides evidence to support this in order for the customer or partner to proceed with further investigation and resolution of the problem.

### Does Microsoft provide support for data corruption?

Data may become corrupted for various reasons, such as malfunctioning software, custom code, partner or ISV software, or power outages. Microsoft doesn’t help correcting damaged data. According to the Service Provider License Agreement (SPLA), Microsoft doesn’t have a legal obligation to change or correct data that is corrupted due to malfunctioning software.

### What happens if the issue can't be reproduced or is related to customized databases or customizations?

In scenarios where a problem can't be reproduced in a standard Cronus sandbox environment, the Microsoft Dynamics support team provides best-effort support for break-fix cases to assist. If the root cause of the issue isn't identified after this effort, it's recommended to consult a partner or the community forums for further investigation, and the technical support incident will be closed.

## Troubleshooting and support

The [!INCLUDE [prodadmincenter](developer/includes/prodadmincenter.md)] is your primary tool to support your customers. However, you can also sign in to the customer's [!INCLUDE [prod_short](developer/includes/prod_short.md)] as the delegated admin for troubleshooting.  

Learn more in [Managing Technical Support](administration/manage-technical-support.md).  

## Monitor service health

[!INCLUDE [admin-service-health](includes/admin-service-health.md)]

### Summary of where to file bugs and issues

As a partner, you have different support channels depending on what type of issue you want support for. The following list outlines the various channels.  

[!INCLUDE [prod_support](includes/prodsupport.md)]

> [!TIP]
> When you submit your first support ticket as a partner, you must specify details about your company's support plan. If you or your colleagues don't know these details, contact your Microsoft rep.

#### Non-product related questions

On occasion, as a partner, you run into questions that aren't directly related to the product. The following list outlines how to get answers to those questions.

[!INCLUDE [nonprodsupport](includes/nonprodsupport.md)]

## Related information

[Inspecting and troubleshooting pages](developer/devenv-inspecting-pages.md)  
[The Business Central Administration Center](administration/tenant-admin-center.md)  
[Managing technical support](administration/manage-technical-support.md)  
[Deployment overview](deployment/Deployment.md)  
[Administration of Business Central online](administration/tenant-administration.md)  
[Administration of Business Central on-premises](administration/Administration.md)  
[Provide technical support (Microsoft Partner Center)](/partner-center/provide-technical-support)  
[Providing support to your customers (Microsoft Partner Center)](/partner-center/customer-support)  

[!INCLUDE [footer-banner](includes/footer-banner.md)]
