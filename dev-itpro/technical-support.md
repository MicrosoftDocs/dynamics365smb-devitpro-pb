---
title: "Configuring Technical Support"
description: Learn about how to support your Business Central customers, online and on-premises.
author: edupont04
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 07/09/2019
---
# Configuring Technical Support for [!INCLUDE[prodlong](developer/includes/prodlong.md)]

As a [!INCLUDE[prodshort](developer/includes/prodshort.md)] reselling partner, you are an administrator of your customers' [!INCLUDE[prodshort](developer/includes/prodshort.md)] tenants, and you are the first line of support. This means that you will get requests for support from your customers that you must triage, investigate, and either resolve or escalate to Microsoft.  

In this section, you can learn about the tools that are available to you to help you troubleshoot your customers' [!INCLUDE [prodshort](developer/includes/prodshort.md)].  

## Configuring the support experience

In your customers' [!INCLUDE[prodshort](developer/includes/prodshort.md)] tenants, the [Help and Support](/dynamics365/business-central/product-help-and-support?toc=/dynamics365/business-central/dev-itpro/toc.json) page gives them access to resources that can help unblock them. You can customize the page to include the email address that your customers must use to contact you.

<!--Temporary setup-->
### To supply your support contact information

1. In your customer's tenant, choose the ![Lightbulb that opens the Tell Me feature](developer/media/search_small.png "Tell me what you want to do") icon, enter **Support Contact Information**, and then choose the related link.
2. In the **Support website address**, specify the URL to where your customer can learn about your technical support.
3. In the **Support email address**, specify the email address if this is how your customer can reach your technical support.

    To use the email account that you are logged in with, choose the *Use my authentication email* link; otherwise, enter the relevant email address.  

<!--TODO: Set this up in the tenant admin center-->

### On-premises deployments

In on-premises deployments of [!INCLUDE[prodshort](developer/includes/prodshort.md)], the **Help and Support** page does not contain the section for contacting technical support. Instead, you can enter an agreement with your customer's administrator about how and when to contact you.  

There are two other links in the **Help and Support** page that you can customize:

- Blog

    Specifies a link to where your customers can access a blog about their solution  
- Coming soon

    Specifies a link to where your customers can access a roadmap for future changes

If you choose to not modify these settings, then the links go to Microsoft's blog and release notes.

For more information, see [Configuring [!INCLUDE[webserver](developer/includes/webserver.md)] Instances](administration/configure-web-server.md).

> [!NOTE]
> The **Help and Support** page is available only in the browser.  

## Finding technical information

The **Help and Support** page is a powerful tool for you to find technical information about your customers' [!INCLUDE [prodshort](developer/includes/prodshort.md)], both online and on-premises. It gives easy access to the most recent error message, and it has a link to inspect pages for further troubleshooting. This is also where you can find information about which version of [!INCLUDE [prodshort](developer/includes/prodshort.md)], your online customers are on.  

> [!div class="mx-imgBorder"]
> ![Help and Support page with links to troubleshooting](developer/media/admin/helpsupport_managed.png)

You can use the [!INCLUDE [prodadmincenter](developer/includes/prodadmincenter.md)] to easily navigate to your customers' tenants, and you can create sandbox environments that can help troubleshoot any issues reported by your customers. For more information, see [The Business Central Administration Center](administration/tenant-admin-center.md).  

### Azure Active Directory tenant

If you have configured the support email address, and your customer uses that to contact you, then the **Help and Support** page encourages them to include information about their Azure Active Directory tenant ID in the email. This information is shown at the bottom of the **Help and Support** page. You can use that to identify the tenant in the administration center, and you can use it to log into their tenant.  

### Version

You can use the information about which version the tenant is on to help you troubleshoot the issue that the customer has reported, for example. This information is listed in the **Troubleshooting** section of the **Help and Support** page in the following format:

|Version  |Example      |Description                                 |
|---------|-------------|--------------------------------------------|
|Platform \<major>.\<minor>.\<build>.\<revision>|14.0.29537.0  | Specifies the full platform version, which includes client and server components. |
|Application \<build> (\<country> \<name> \<major>.\<minor>)|29537 (US Business Central 14.0)| Specifies the build number for the application, including the major version number. |

However, if you use the online administration center, the version information is rendered differently:

|Version  |Example      |Description                                 |
|---------|-------------|--------------------------------------------|
|Platform |14.0 | Specifies the platform version, which includes client and server components. |
|Application \<major>.\<minor>.\<build>.\<revision>|14.0.29537.0 | Specifies the full version number for the application. |

The numbers are updated based on Microsoft's builds. In the default version of [!INCLUDE [prodshort](developer/includes/prodshort.md)] online, platform and application have the same major version number but different build numbers. If you perform a technical upgrade of [!INCLUDE [prodshort](developer/includes/prodshort.md)] on-premises, then platform and application will have different versions. The October'18 update was major update 13, and the April'19 update is major version 14.  

For more information about build versions, see the blog post by our technical evangelist at [Business Central Build Numbers](https://freddysblog.com/2018/12/05/business-central-build-numbers/).  

### Last known error

The link behind the sentence *View the last known error* will find and show the most recent error message that was was generated by the application code. This includes errors from field validation, posting routines, and other code behind business functionality.  

The information that you can get from this link includes the following:

- Text

    This is the error message that the user sees, either in a dialog window or next to a user interface element that cannot render, for example.
- Code

    This is the code snippet that threw the error.
- Callstack

    This shows how the error was triggered.
- Object

    This shows information about the runtime objects.

The link cannot open errors that were generated by the platform. So if you suspect that the issue is caused by the platform, you can try to reproduce the error in a sandbox environment before you contact Microsoft for support. For more information, see [Create a sandbox environment](administration/tenant-admin-center-environments.md#create-a-sandbox-environment).

## Escalating your customer's support issues

Sometimes your customer's tenant has run into a problem that you cannot resolve. In those cases, use the [!INCLUDE [prodshort](developer/includes/prodshort.md)] Administration Center to easily submit a support request to Microsoft.  

<!--For more information, see [Submitting support requests on behalf of your customer](administration/tenant-admin-center.md#submitting-support-requests-on-behalf-of-your-customer).  -->
<!-- TODO: How to manage your customers' support issues -->

## See Also

[Inspecting and Troubleshooting Pages](developer/devenv-inspecting-pages.md)  
[The Business Central Administration Center](administration/tenant-admin-center.md)  
[Deployment](deployment/Deployment.md)  
[Working with Administration Tools](administration/Administration.md)  
[Blog post: Business Central Build Numbers](https://freddysblog.com/2018/12/05/business-central-build-numbers/)
