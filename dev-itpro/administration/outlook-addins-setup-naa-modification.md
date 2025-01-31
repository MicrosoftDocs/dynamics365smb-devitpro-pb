---
title: How-to topic template #Required; page title displayed in search results. Don't enclose in quotation marks.
description: How-to description #Required; article description that's displayed in search results. Don't enclose in quotation marks. Do end with a period.
author: rhanajoy #Required; your GitHub user alias, with correct capitalization.
ms.author: rhcassid #Required; your Microsoft alias; optional team alias.
ms.reviewer: kfend #Required; Microsoft alias of content publishing team member.
ms.topic: how-to #Required; don't change.
ms.collection: get-started #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 01/30/2025
ms.custom: bap-template #Required; don't change.
---

# Modifying Outlook add-in setup to support Nested App Authentication (NAA)

Starting February 1, 2025, Microsoft Exchange Online requires all Outlook add-ins to use Nested App Authentication (NAA).

## Modify the existing Outlook add-in setup

Complete these steps to continue using the Business Central add-in for Outlook after 1st February 2025.

1. Upgrade Business Central to at least version [25.3](https://support.microsoft.com/en-us/topic/released-updates-for-microsoft-dynamics-365-business-central-2024-release-wave-2-a8fc49a4-610e-4123-8bcd-a0aa5f3c9776), [24.9](https://support.microsoft.com/en-us/topic/released-updates-for-microsoft-dynamics-365-business-central-2024-release-wave-1-0b644dfa-2eef-4f3e-9d77-bc92dbaafb65), or [23.15](https://support.microsoft.com/en-us/topic/released-updates-for-microsoft-dynamics-365-business-central-2023-release-wave-2-7a4f98e8-66b9-4484-9bc1-66c466d8a82d) depending on your current version.

1. Expose the API of the registered app in the Microsoft Azure portal used to authenticate Microsoft Entra users with Business Central.

   [!INCLUDE[webserver](../developer/includes/includes_expose_api.md)]

1. Create a new app registration specifically for connecting Outlook with Business Central:

   Follow the instructions in [Register an app that connects Outlook and Business Central](Setting-up-Office-Add-Ins-Outlook-Inbox.md#register-an-app-that-connects-outlook-and-business-central).

1. Configure the Business Central web server instance to work with Exchange Online

   Learn more in [Configure the Business Central web server instance to work with Exchange Online](Setting-up-Office-Add-Ins-Outlook-Inbox.md#configure-the-business-central-web-server-instance-to-work-with-exchange-online).

Learn more details aboout these step in [Set up the add-ins for Outlook in Business Central on-premises](Setting-up-Office-Add-Ins-Outlook-Inbox.md).

## Why is this action needed?

The Outlook add-ins previously relied on Exchange Online tokens for authentication, which are deprecated and turned off starting in February 2025. Learn more in [Nested app authentication and Outlook legacy tokens deprecation FAQ](/office/dev/add-ins/outlook/faq-nested-app-auth-outlook-legacy-tokens).

To continue using legacy Exchange Online tokens and delay the automatic switch to NAA, you can turn on the tokens. Learn more in [Turn on legacy Exchange Online tokens](/office/dev/add-ins/outlook/turn-exchange-tokens-on-off). This change affects all add-ins and integrations in your environment.  

## Related information

[Installing a minor update for version 25](upgrade/upgrading-cumulative-update-v25.md)  
[Installing a minor update for version 24](upgrade/upgrading-cumulative-update-v24.md)  
[Installing a minor update for version 23](upgrade/upgrading-cumulative-update-v23.md)
[Set up the add-ins for Outlook in Business Central on-premises](Setting-up-Office-Add-Ins-Outlook-Inbox.md)  
[Using Business Central as your Business Inbox in Outlook](/dynamics365/business-central/work-outlook-addin)  
[]
