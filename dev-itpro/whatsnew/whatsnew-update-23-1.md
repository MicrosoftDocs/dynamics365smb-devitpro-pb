---
title: "Update 23.1 for Microsoft Dynamics 365 Business Central 2023 Release Wave 2"
description: Get an overview of new and changed capabilities in the 23.1 update of Business Central online, which is part of 2023 release wave 2.
ms.author: a-enielsson
ms.custom: na
ms.date: 10/25/2023
ms.reviewer: jswymer
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 23.1 for Microsoft Dynamics 365 Business Central online 2023 release wave 2

Would you like to know what has changed in update 23.1? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links that you might find interesting.


## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5032755) and the downloads [here](https://aka.ms/BCDownload).

## Feature changes

- [Business Central virtual tables fully supported on Microsoft Dataverse](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/business-central-virtual-tables-fully-supported-dataverse) 
- [Get marketing text suggestions with Copilot](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/get-marketing-text-suggestions-copilot)
- [Complete bank account reconciliation faster with Copilot](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/complete-bank-account-reconciliation-faster-copilot)
- [Extend general ledger posting aggregations](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/extend-general-ledger-posting-aggregations)
- [Include or exclude tables from cloud migration](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/include-or-exclude-tables-cloud-migration)
- [Use actions to go to or fix errors inline](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/use-actions-navigate-or-fix-errors-inline-validation-dialog)


## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| Spain | Non-Deductible and partly deductible VAT update | Adding global non-deductible VAT feature to the Spanish localization to keep compliant with VAT reporting and SII requirements.|
| Spain | Overdue Balance report update | New requirements for Vendor - Overdue Balance report (10748) in the Spanish version where we added Amounts (Volumen Monetario) and Number of invoices (Numero de facturas) information.|


## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2023 release wave 2 (release from October 2023 through March 2024), find the link to the release plan [here](https://aka.ms/BCReleasePlan).

## Upgrade to 23.1

Please note that new customers will automatically get the latest builds of Business Central (23.1). If you are an existing partner/customer, you will receive an email notification as soon as your environment has been upgraded.

## Good to know

### New Copilot content at the Business Central Launch Event  
With more AI capabilities rolling out with Wave 2, we’ve published new, on-demand content covering three topics (note: you need to be logged in to the portal, before you can access the links below):
- [What's new: Marketing text suggestions (feature is generally available with Update 23.1)](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjcyNDM=)
- [Introducing: Bank account reconciliation assistance (feature is in preview from Update 23.1)](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjcyNDE=)
- [What’s new: Designing and developing generative AI experiences for your extensions (toolkit available with insider builds)](https://app.hopin.com/events/business-central-launch-event-3502b259-fc5c-44f8-9448-1e07e075819e/replay/UmVjb3JkaW5nVXBsb2FkOjcyMzk=)
 
 To access recordings on demand from the Business Central Launch Event, register for free at: https://aka.ms/BCLE.

### Did you join the Business Central Launch Event?   
If not, you have until end of January 2024 to watch the opening session and consume 35 what's new videos made by the Microsoft engineering team. Register and watch the videos: [aka.ms/BCLE](https://aka.ms/BCLE).  

### Upcoming Business Central Office Hours Calls

During November, we will host the following calls, which you can already register for today:

- **November 14:** Cloud Migration
- **November 21:** Mobile app and barcode scanning

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours).
Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings). 

### Automatically update AppSource apps with minor updates  
You can now change the app update cadence for your environments to have AppSource apps update with every minor update. Read the Release Plan for more details.

### Follow our new YouTube channel  
We're excited to announce that we're on YouTube now! Follow along as we're posting how to videos, Business Central Launch Event sessions, and much more! 
Subscribe now: [aka.ms/BCYouTube](https://aka.ms/BCYouTube).

### Discover all partner related resources on aka.ms/BCAll
If you’re a partner and you’re looking for relevant resources, you can find them in this article: aka.ms/BCAll. 
 
### Discover all user related resources on aka.ms/BCUsers
If you’re a user and you’re looking for relevant resources, you can find them in this article: aka.ms/BCUsers.  

### Features becoming mandatory soon  
Following features may have potentially disruptive effect on extensions and apps you have installed in the future, when they become mandatory. These features are now optional to use and can be enabled in the [Feature Management](https://dynamics.microsoft.com/en-us/business-central/signin/?ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2F%3Fpage%3D2610%26noSignUpCheck%3D1) page. 
- Extending G/L Entry Aggregations When Posting Invoices feature is generally available with Update 23.1 and becoming mandatory in Update 26.0 (2025 Release Wave 1). 
The Invoice Post. Buffer table is replaced by the use of the Invoice Posting interface. The replacement helps resolve extensibility issues for the legacy Invoice Post. Buffer table. You can now use your own implementation of G/L invoice posting. 
If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to [Extending G/L Entry Aggregations](/dynamics365/business-central/dev-itpro/developer/devenv-invoice-posting-example) When Posting Invoices. 
- New extensible exchange rate adjustment, including posting review feature is generally available with Update 23.0 and becoming mandatory in Update 26.0 (2025 Release Wave 1) The legacy Exchange Rates Adjustment Report is being replaced by a new capability that increases extensibility and makes it easier to comply with local and industry-specific requirements. It also gives you more control over exchange rate adjustments with a posting preview and how dimension values are post when you adjust exchange rate, and better reporting. 

If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to
Extending Currency Exchange Rate Adjustments. 

Work with your partner to update extensions and apps you have installed before above features become mandatory. To view complete list of optional features and features that are becoming mandatory, go to [aka.ms/BCFeatureMgmt]https://aka.ms/BCFeatureMgmt


### Looking for an aka.ms link?

Are you looking for an aka.ms link, but simply can't find it? Remember that you can find all aka.ms links on [aka.ms/BCLinks](https://aka.ms/BCLinks). Don't forget to bookmark it!