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

# Modify existing Outlook add-in setup to support Nested App Authentication (NAA)

Starting February 1, 2025, Microsoft Exchange Online requires all Outlook add-ins to use Nested App Authentication (NAA).

The following steps are required to continue using the Business Central add-in for Outlook after 1st February 2025.

1. Download and install the Business Central update 25.3, 24.9 or 23.15 depending on your version of Business Central.
1. Find your app registration in the Microsoft Azure portal that you have already set up to authenticate Microsoft Entra users with Business Central, and take note of the Display name, and also the Scope from the Expose an API screen. 
1. Create a new app registration specifically for connecting Outlook with Business Central, with the Redirect URI set to Single-page application (SPA) and insert the root URI to your Business Central Web server instance, such as https://MyBCWebServer. Under API permissions, add Microsoft Graph permissions User.Read and Mail.ReadWrite, and add the permission from your authentication app registration in step 2 by looking up the app display name. Take note of the Application (client) ID of your new Outlook connector app. 
1. Run the Set-NAVWebServerInstanceConfiguration cmdlet to configure the Business Central Web server with the following settings, then restart the web server instance. 
Set ExchangeOnlineAppId to the application (client) ID from step 3.
Set ExchangeOnlineAppScope to the Scope from step 2.

Learn more details aboout these step in [Set up the add-ins for Outlook in Business Central on-premises](Setting-up-Office-Add-Ins-Outlook-Inbox.md).
 
## Why is this action needed? 

Microsoft Exchange Online will soon require Outlook add-ins to use Nested App Authentication (NAA).  

To continue using legacy Exchange Online tokens and delay the automatic switch to NAA, please see Turn on legacy Exchange Online tokens. This command will affect all add-ins or integrations in your environment.  

<!--Remove all the comments in this template before you sign-off or merge to the main branch.-->
