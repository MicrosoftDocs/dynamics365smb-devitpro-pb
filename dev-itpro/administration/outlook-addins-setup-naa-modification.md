---
title: Modifying Outlook add-in setup for Nested App Authentication (NAA).
description: Learn how to modify your Outlook add-in setup in Business Central to support  Nested App Authentication (NAA).
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 01/30/2025
ms.custom: bap-template
---

# Modifying Outlook add-in setup for Nested App Authentication (NAA)

Starting February 1, 2025, Microsoft Exchange Online requires all Outlook add-ins to use Nested App Authentication (NAA).

## Modify the existing Outlook add-in setup

Complete these steps to continue using the Business Central add-in for Outlook after February 01, 2025.

1. Upgrade Business Central to at least version [25.3](https://support.microsoft.com/en-us/topic/released-updates-for-microsoft-dynamics-365-business-central-2024-release-wave-2-a8fc49a4-610e-4123-8bcd-a0aa5f3c9776), [24.9](https://support.microsoft.com/en-us/topic/released-updates-for-microsoft-dynamics-365-business-central-2024-release-wave-1-0b644dfa-2eef-4f3e-9d77-bc92dbaafb65), or [23.15](https://support.microsoft.com/en-us/topic/released-updates-for-microsoft-dynamics-365-business-central-2023-release-wave-2-7a4f98e8-66b9-4484-9bc1-66c466d8a82d) depending on your current version.

1. Expose the API of the registered app in the Microsoft Entra ID used to authenticate users with Business Central.

   If your deployment is set up for the Outlook add-in, you already have an app registration in the Microsoft Entra admin center for authenticating Business Central users with Microsoft Entra ID. You might be using this same app registration for connecting Business Central to Outlook, or you might be using a separate app registration. This step applies to the app registration used for user authentication.

   [!INCLUDE[webserver](../developer/includes/includes_expose_api.md)]

1. Create a new app registration specifically for connecting Outlook with Business Central:

   Follow the instructions in [Register an app that connects Outlook and Business Central](Setting-up-Office-Add-Ins-Outlook-Inbox.md#register-an-app-that-connects-outlook-and-business-central).

1. Configure the Business Central web server instance to work with Exchange Online

   Learn more in [Configure the Business Central web server instance to work with Exchange Online](Setting-up-Office-Add-Ins-Outlook-Inbox.md#configure-the-business-central-web-server-instance-to-work-with-exchange-online).

Learn more details about these steps in [Set up the add-ins for Outlook in Business Central on-premises](Setting-up-Office-Add-Ins-Outlook-Inbox.md).

## Why is this action needed?

The Outlook add-ins previously relied on Exchange Online tokens for authentication, which are deprecated and turned off starting in February 2025. Learn more in [Nested app authentication and Outlook legacy tokens deprecation FAQ](/office/dev/add-ins/outlook/faq-nested-app-auth-outlook-legacy-tokens).

To continue using legacy Exchange Online tokens and delay the automatic switch to NAA, you can turn on the tokens. Learn more in [Turn on legacy Exchange Online tokens](/office/dev/add-ins/outlook/turn-exchange-tokens-on-off). This change affects all add-ins and integrations in your environment.  

## Related information

[Install minor update for version 25](../upgrade/upgrading-cumulative-update-v25.md)  
[Install minor update for version 24](../upgrade/upgrading-cumulative-update-v24.md)  
[Install minor update for version 23](../upgrade/upgrading-cumulative-update-v23.md)  
[Set up the add-ins for Outlook in Business Central on-premises](Setting-up-Office-Add-Ins-Outlook-Inbox.md)  
[Use Business Central as your Business Inbox in Outlook](/dynamics365/business-central/work-outlook-addin)
