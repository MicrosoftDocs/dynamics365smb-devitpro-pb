---
title: "Technical Support"
description: Learn about how to support your Business Central customers, online and on-premises.
author: edupont04
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: edupont
ms.date: 03/12/2019
---

# Configuring Technical Support for [!INCLUDE[prodlong](developer/includes/prodlong.md)]

As a [!INCLUDE[prodshort](developer/includes/prodshort.md)] reselling partner, you are an administrator of your customers' [!INCLUDE[prodshort](developer/includes/prodshort.md)] tenants, and you are the first line of support.  

## Configuring the support experience

In your customers' [!INCLUDE[prodshort](developer/includes/prodshort.md)] tenants, the **Help and Support** page gives them access to resources that can help unblock them. You can customize the page to include the email address that your customers must use to contact you.

<!--Temporary setup-->
To set up this support email address, run page *9165* in your customer's tenant, and then choose if you want to use the email that you are logged in with, or if you want to specify a different contact email address. For more information on how to run a page, see [Web Client URL](developer/devenv-web-client-urls.md).  
<!--TODO: Set this up in the tenant admin center-->

### On-premises deployments

In on-premises deployments of [!INCLUDE[prodshort](developer/includes/prodshort.md)], the **Help and Support** page does not contain the section for contacting technical support. Instead, you can enter an agreement with your customer's administrator about how and when to contact you.  

There are two other links in the **Help and Support** page that you can customize:

* Blog
  Specifies a link to where your customers can access a blog about their solution  
* Coming soon
  Specifies a link to where your customers can access a roadmap for future changes

If you choose to not modify these settings, then the links go to Microsoft's blog and release notes.

For more information, see [Configuring [!INCLUDE[webserver](developer/includes/webserver.md)] Instances](administration/configure-web-server.md).

> [!NOTE]
> The **Help and Support** page is available only in the browser.  

## Finding technical information

The **Help and Support** page is a powerful tool for you to find technical information about your customers' [!INCLUDE [prodshort](developer/includes/prodshort.md)], both online and on-premises. It gives easy access to the latest error message, and it has a link to inspect pages for further troubleshooting. This is also where you can find information about which version of [!INCLUDE [prodshort](developer/includes/prodshort.md)], your online customers are on.  

## Online administration center

As the administrator, you have access to the [!INCLUDE[prodshort](includes/prodshort.md)] Administration center, where you can create a sandbox environment that can help troubleshoot any issues reported by your customers. For more information, see [The Business Central Administration Center](administration/tenant-admin-center.md).  

<!-- TODO: How to manage your customers' support issues -->

## See Also

[Inspecting and Troubleshooting Pages](developer/devenv-inspecting-pages.md)  
[Deployment](deployment/Deployment.md)  
