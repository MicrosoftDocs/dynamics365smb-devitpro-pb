---
title: "Get the Outlook add-ins for the business inbox"
description: Learn about the technical aspects of the Outlook add-ins so that users can use Outlook as their business inbox and manage Business Central data in Outlook.
ms.custom: na
ms.date: 08/31/2021
ms.reviewer: edupont
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: jswymer
---
# Get the Outlook add-ins for the business inbox

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports integration with Outlook so that users can complete [!INCLUDE[prod_short](../developer/includes/prod_short.md)] business tasks from their Outlook inbox.  

## Overview

The two add-ins for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] provide the following capabilities:

- Contact insights

    The add-in provides users with information from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] about their contacts in Outlook emails and calendar appointments. It also enables users to create and send [!INCLUDE[prod_short](../developer/includes/prod_short.md)] business documents, such sales quotes and invoices to a contact. To support these tasks, the add-in adds actions to the Outlook ribbon, in the **Business Central** group.  

- Create and view documents

    When a business document is sent as an email, the add-in provides a direct link from email to the actual business document in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The add-in adds a **Document Links** action in the email header, which a user can select to display the document.  

<!--    ![Office Add-ins for Outlook.](../media/OutlookAddinsCallouts.png "Office Add-ins for Outlook")-->

The processes for deploying the add-ins are different for [!INCLUDE [prod_short](../includes/prod_short.md)] online and on-premises, though the add-ins are the same. So choose the right section to read from here on - use the links to the right to easily navigate between the main sections.

## Business Central online

For [!INCLUDE [prod_short](../includes/prod_short.md)], the admin must configure the Microsoft 365 tenant to accept the two add-ins. You can configure the tenant in two ways:

- Centralized deployment of the add-ins  

    Centralized Deployment is a feature in Microsoft 365 admin center that you use to automatically install add-ins in users' Office apps, like Outlook. It's the recommended way for admins to deploy for Office add-ins to users and groups within your organization.

- Automatic deployment of the add-ins  

    The automatic deployment requires you to register the add-ins as an app in Microsoft 365. This effectively deploys the add-ins so that users can connect to [!INCLUDE [prod_short](../includes/prod_short.md)] from the Outlook app and Outlook on the web.

For more information, see [Get the Business Central Add-in for Outlook](/dynamics365/business-central/admin-outlook) in the business functionality help.

## Business Central on-premises

Setting up the add-ins for [!INCLUDE [prod_short](../includes/prod_short.md)] on-premises involves two procedures:  

- Configure the [!INCLUDE[server](../developer/includes/server.md)] instance to work with the add-ins.  
- Then, you deploy the add-ins from the [!INCLUDE[prod_short](../includes/prod_short.md)] client and Microsoft 365 admin center to users' Outlook.  

For more information, see [Set Up the Business Central Add-In for Outlook with Business Central On-premises](Setting-up-Office-Add-Ins-Outlook-Inbox.md).  

## Individual user deployment

If the add-ins aren't set up for deploy automatically, users can run the **Get the Outlook Add-in** assisted setup in their [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to install both the **Contact Insight** and **Document View** add-ins.

For more information, see [Install the add-in for your own use](/dynamics365/business-central/admin-outlook#install).

## See Also  
[Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/work-outlook-addin)  
[Set Up the Add-Ins for Outlook with Business Central on-premises](Setting-up-Office-Add-Ins-Outlook-Inbox.md)  
[Deployment of Business Central on-premises](../deployment/deployment.md)  
[Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/admin-outlook?toc=/dynamics365/business-central/dev-itpro/toc.json)  
