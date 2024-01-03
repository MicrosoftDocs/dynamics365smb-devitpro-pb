---
title: Update 23.3 for Microsoft Dynamics 365 Business Central 2023 Release Wave 2
description: Get an overview of new and changed capabilities in the 23.3 update of Business Central online, which is part of 2023 release wave 3.
ms.author: a-enielsson
ms.custom: na
ms.date: 01/03/2023
ms.reviewer: jswymer
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: EmmaNielsson
---

# Update 23.3 for Microsoft Dynamics 365 Business Central online 2023 release wave 2

Would you like to know what has changed in update 23.2? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links that you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5033775) and the downloads [here](https://aka.ms/BCDownload).

## Feature changes
- [E-invoicing with NemHandel in Denmark](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/e-invoicing-nemhandel-denmark)
- [Granular administration as Dynamics 365 Business Central Administrator](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/assign-more-granular-administration-rights)
- [Detect invalid cloud migration configurations with proactive warnings](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/detect-invalid-cloud-migration-configurations-proactive-warnings)
- [Access worksheet pages from mobile phones](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/access-worksheet-pages-mobile-phones) 
- [Translatable Excel layouts](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/translatable-excel-layouts)
- [Make use of static and runtime metadata available in Excel layouts](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/make-use-static-runtime-metadata-excel-layouts)
- Generic Microsoft Graph API Wrapper
- Add Azure File Services API module


## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| Denmark | Notification and registration with Nemhandel | Based on new bookkeeping act, companies will be notified if they are not registered with Nemhandel with the link for registration. Companies must populate their CVR number in the Registration Number field on the Company Information page. This functionality will be run by default from January 1st. |
| Denmark | E-submission of VAT return | Companies can use electronical submission of VAT returns through the connection with Skattestyrelsen via their APIs. To use this feature, companies must populate their CVR number in the Registration Number field on the Company Information page.|
| Denmark | Suspending company deleting | Based on new bookkeeping act, companies cannot delete production data. All production companies (Production environment only) already registered with Nemhandel cannot be deleted from the system.|
| Denmark | Import SAF-T file | Companies can import SAF-T files and keep the attached in the system if required.|
| Denmark | E-invoicing with Nemhandel | Companies can use e-invoicing with Nemhandel connected via certified access points. Both OIOUBL and PEPPOL formats are supported. This functionality is extension of new E-documents framework. |
| Denmark | Enforcing digital vouchers | Companies can choose to enable blocking of document or journal posting if the attachment is not provided to keep full audit trail. Administrator can set different rules for different types of documents. In Denmark, this feature will enforce mandatory attachment for Purchase and Sales documents from July 1st based on new bookkeeping act. |


## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2023 release wave 2 (release from October 2023 through March 2024), find the link to the release plan [here](https://aka.ms/BCReleasePlan).

## Upgrade to 23.3

Please note that new customers will automatically get the latest builds of Business Central (23.2). If you're an existing partner/customer, you'll receive an email notification as soon as your environment has been upgraded.

## Good to know

### Business Central Launch Event videos on YouTube  
Follow along as we're posting Business Central Launch Event sessions to the new YouTube channel. All 35 videos will be added to the channel by December 31, 2023. Subscribe now and watch the videos: [aka.ms/BCYouTube](https://aka.ms/BCYouTube). Find the rest of the launch event videos on: [aka.ms/BCLE](https://aka.ms/BCLE).

### Upcoming Business Central Office Hours Calls

During November, we'll host the following calls, which you can already register for today:

- **January 9:** AL-Go for GitHub
- **January 23:** How we secure your data in Business Central (2024 update)
- **February 6:** Power Platform and Business Central virtual tables

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours).
Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings). 

### Automatically update AppSource apps with minor updates  

You can now change the app update cadence for your environments to have AppSource apps update with every minor update. Read the Release Plan for more details.

### Features becoming mandatory soon

The following features may have potentially disruptive effect on extensions and apps you have installed in the future, when they become mandatory. These features are now optional to use and can be enabled in the [Feature Management](https://dynamics.microsoft.com/en-us/business-central/signin/?ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2F%3Fpage%3D2610%26noSignUpCheck%3D1) page. 
- Extending G/L Entry Aggregations When Posting Invoices feature is generally available with Update 23.1 and becoming mandatory in Update 26.0 (2025 Release Wave 1). 
The Invoice Post. Buffer table is replaced by the use of the Invoice Posting interface. The replacement helps resolve extensibility issues for the legacy Invoice Post. Buffer table. You can now use your own implementation of G/L invoice posting. 
If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to [Extending G/L Entry Aggregations](/dynamics365/business-central/dev-itpro/developer/devenv-invoice-posting-example) When Posting Invoices. 
- New extensible exchange rate adjustment, including posting review feature is generally available with Update 23.0 and becoming mandatory in Update 26.0 (2025 Release Wave 1) The legacy Exchange Rates Adjustment Report is being replaced by a new capability that increases extensibility and makes it easier to comply with local and industry-specific requirements. It also gives you more control over exchange rate adjustments with a posting preview and how dimension values are post when you adjust exchange rate, and better reporting. 

If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to
Extending Currency Exchange Rate Adjustments. 

Work with your partner to update extensions and apps you have installed before above features become mandatory. To view complete list of optional features and features that are becoming mandatory, go to [aka.ms/BCFeatureMgmt]https://aka.ms/BCFeatureMgmt

### Discover all partner related resources on aka.ms/BCAll

If you’re a partner and you’re looking for relevant resources, you can find them in this article: [aka.ms/BCAll](https://aka.ms/BCAll). 
 
### Discover all user related resources on aka.ms/BCUsers

If you’re a user and you’re looking for relevant resources, you can find them in this article: [aka.ms/BCUsers](https://aka.ms/BCUsers).  