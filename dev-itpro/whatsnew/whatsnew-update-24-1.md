---
title: Update 24.1 for Microsoft Dynamics 365 Business Central 2024 Release Wave 1
description: Get an overview of new and changed capabilities in the 24.1 update of Business Central online, which is part of 2024 release wave 1.
ms.author: jswymer
ms.date: 04/30/2024
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.custom: 
    - bap-template
---

# Update 24.1 for Microsoft Dynamics 365 Business Central online 2024 release wave 1

Would you like to know what has changed in update 24.1? Below you'll find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links that you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5038531) and the downloads [here](https://aka.ms/BCDownload).

## Feature changes

- [Automate country of origin listed for item tracking code in Intrastat reporting](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/automate-country-origin-listed-item-tracking-code-intrastat-reporting)
- [Handle multiple file uploads and file drop zones](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/handle-multiple-file-uploads-file-drop-zones)

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
|Spain|Introduce the **Ignore in SII** option for the G/L Account|If users want to ignore some lines in the sales or purchase invoices when they report to SII, they can now do it using a new setup in the **VAT Posting Setup** where they can mark the **Ignore in SII** field.|

## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2024 release wave 1 (release from April 2024 through September 2024), find the link to the release plan [here](https://aka.ms/BCReleasePlan).

## Upgrade to 24.1

Note that new customers will automatically get the latest builds of Business Central (24.1). If you're an existing partner/customer, you'll receive an email notification as soon as your environment has been upgraded.

## Good to know

### Business Central channel on YouTube

Check out the new [!INCLUDE [prod_short](../includes/prod_short.md)] channel on YouTube at [aka.ms/BCYouTube](https://aka.ms/BCYouTube), where you can find the latest videos from the 2024 release wave 1 Launch Event.

### Upcoming Business Central Office Hours Calls

<!--During May, we'll host the following call, which you can already register for today:

- **May xx:** tbd-->

Register and stay tuned for upcoming calls: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours).
Watch on-demand recordings: [aka.ms/BCOfficeHoursRecordings](https://aka.ms/BCOfficeHoursRecordings).

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
