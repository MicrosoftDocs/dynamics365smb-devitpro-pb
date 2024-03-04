---
title: Update 23.5 for Microsoft Dynamics 365 Business Central 2023 Release Wave 2
description: Get an overview of new and changed capabilities in the 23.5 update of Business Central online, which is part of 2023 release wave 2.
ms.author: a-enielsson
ms.custom: bap-template
ms.date: 02/28/2024
ms.reviewer: jswymer
ms.topic: conceptual
author: EmmaNielsson
---

# Update 23.5 for Microsoft Dynamics 365 Business Central online 2023 release wave 2

Would you like to know what has changed in update 23.5? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links that you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5036474) and the downloads [here](https://aka.ms/BCDownload).

## Feature changes

- [Improved update release processes](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/improved-update-release-processes)
- [Control partner access per environment](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/control-partner-access-per-environment)

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| Spain | Sending multiple documents in SII | Improved feature related with posting lots of documents, where multiple job queue entries trigger and send the same documents to the API, resulting in "Factura Duplicada" error. Now when one job queue entry is executed, it reserves the set of documents and the job queue entry doesn't consider same documents for sending. |
| Denmark | VAT E-submission | With new improved feature, the customer doesn't need to posses the certificate, because they can use Microsoft default certificate instead. |

## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2023 release wave 2 (release from October 2023 through March 2024), find the link to the release plan [here](https://aka.ms/BCReleasePlan).

## Upgrade to 23.5

Note that new customers will automatically get the latest builds of Business Central (23.5). If you're an existing partner/customer, you'll receive an email notification as soon as your environment has been upgraded.

## Good to know

### Access and administer environments as Dynamics 365 Business Central Administrator

Environments and the Admin Center can now be accessed and administered with the new Microsoft Entra role named Dynamics 365 Business Central Administrator. This role improves upon the roles currently supported in that it doesn't grant access to resources beyond Business Central, giving customers an option to grant internal and delegated administrators access to Business Central without giving access to other resources and services in the tenant.

There are no changes to the access granted to administrators with a Global Administrator or Dynamics 365 Administrator role assigned. Delegated Helpdesk Administrators will soon lose access to the Admin Center; we recommend you replace any use of this role with the Dynamics 365 Business Central Administrator role. If you have accessed your customer environments using this role recently, you'll soon receive deprecation notifications sent to notification recipients set up in the Admin Center. Read more [here](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/assign-more-granular-administration-rights).


### Upcoming Business Central Office Hours Calls

During March, we'll host the following call, which you can already register for today:

- **March 19:** Get data-driven with telemetry

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours).
Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings). 

### Shopify connector update  
With the previous minor update (23.4), we transitioned to the Shopify Admin API version 2023-10. Note that as of April 1, 2024, Business Central will no longer support the Shopify Admin API version 2023-04. To continue to use your integration, we recommend upgrading to Business Central version 23.4 or later before this date. You can see version of Shopify Admin API and the date until API is valid in the Shopify Shop Card page.

### Automatically update AppSource apps with minor updates  
You can now change the app update cadence for your environments to have AppSource apps update with every minor update. Read the [release plan](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/planned-features) for more details.

### Features becoming mandatory soon
Prepare for features becoming mandatory soon on [aka.ms/BCFeatureMgmt](https://aka.ms/BCFeatureMgmt).
Following features may have potentially disruptive effect on extensions and apps you have installed in the future, when they become mandatory. These features are now optional to use and can be enabled in the [Feature Management](https://dynamics.microsoft.com/en-us/business-central/signin/?ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2F%3Fpage%3D2610%26noSignUpCheck%3D1) page. 

**Extending G/L Entry Aggregations When Posting Invoices** feature is generally available with Update 23.1 and becoming mandatory in Update 26.0 (2025 Release Wave 1). The Invoice Post. Buffer table is replaced by the use of the Invoice Posting interface. The replacement helps resolve extensibility issues for the legacy Invoice Post. Buffer table. You can now use your own implementation of G/L invoice posting. If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to [Extending G/L Entry Aggregations When Posting Invoices](/dynamics365/business-central/dev-itpro/developer/devenv-invoice-posting-example).
 
**New extensible exchange rate adjustment**, including posting review feature is generally available with Update 23.0 and becoming mandatory in Update 26.0 (2025 Release Wave 1) The legacy Exchange Rates Adjustment Report is being replaced by a new capability that increases extensibility and makes it easier to comply with local and industry-specific requirements. It also gives you more control over exchange rate adjustments with a posting preview and how dimension values are post when you adjust exchange rate, and better reporting. 
If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to [Extending Currency Exchange Rate Adjustments](/dynamics365/business-central/dev-itpro/developer/devenv-extend-exchange-rates). 
Work with your partner to update extensions and apps you have installed before above features become mandatory. To view complete list of optional features and features that are becoming mandatory, go to [aka.ms/BCFeatureMgmt](https://aka.ms/BCFeatureMgmt).

### Discover all partner related resources on aka.ms/BCAll

If you’re a partner and you’re looking for relevant resources, you can find them in this article: [aka.ms/BCAll](https://aka.ms/BCAll).

### Discover all user related resources on aka.ms/BCUsers

If you’re a user and you’re looking for relevant resources, you can find them in this article: [aka.ms/BCUsers](https://aka.ms/BCUsers).  
