---
title: Update 24.3 for Microsoft Dynamics 365 Business Central 2024 Release Wave 1
description: Get an overview of new and changed capabilities in the 24.3 update of Business Central online, which is part of 2024 release wave 1.
ms.author: jswymer
ms.date: 07/01/2024
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.custom: 
    - bap-template
---

# Update 24.3 for Microsoft Dynamics 365 Business Central online 2024 release wave 1

Would you like to know what's changed in update 24.3? Below you find an overview and relevant links to what has been done on hotfixes and regulatory features in this update. In addition, we have gathered some good to know information and links that you might find interesting.

## Hotfixes

Find an overview of hotfixes in this [article](https://support.microsoft.com/help/5041133) and the downloads [here](https://aka.ms/BCDownload).

## Feature changes

- [Enable additional countries and regions (preview)](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/enable-additional-countries-regions)
- [Simplify collections with Copilot for Finance and Business Central (preview)](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/empower-collections-team-copilot-finance-business-central)
- [Enable sustainability features for integrations with APIs](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/enable-sustainability-features-integrations-apis)
- [Automate country of origin listed for item tracking code in Intrastat reporting](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/automate-country-origin-listed-item-tracking-code-intrastat-reporting)
- [Install Field Service Integration with Business Central from AppSource](/dynamics365/release-plan/2024wave1/smb/dynamics365-business-central/install-field-service-integration-business-central-appsource)

## Localization updates

|Country/region|Feature|Description|
|-|-|-|
|BE|New SEPA format CT pain.001.001.09|Added new reports **File SEPA 001.001.09 Pmts** and **File FCY SEPA 001.001.09 Pmts** that can be chosen as **Export Protocols** for the new format.|
|CH|New SEPA format DD pain.008.001.02|Added new XMLport **SEPA DD pain.008.001.02.ch03** that can be chosen as bank export/import format.|
|DK|Missing SchemeID in PEPPOL|Added **SchemeID** in the **CompanyID** section of the **PEPPOL** file and changed **VAT Scheme** in **Country/Region** for DK to 0184. It's also added a prefix DK to **VAT Registration No.** when applicable|
|FI|New SEPA format CT pain.001.001.09|Added new Codeunit **Exp. SEPA CT pain.001.001.09** and report **Exp. SEPA CT pain.001.001.09** that can be used to export files in new format.|
|IT|Vendor exemption export|Added amounts for each VAT exemptions in the **Amount to declare** field on the **Declaration of Intent Export** card.|
|NL|New SEPA formats CT pain.001.001.09 and DD pain.008.001.08|Added new reports **SEPA ISO20022 Pain 008.001.08** and **SEPA ISO20022 Pain 001.001.09** that can be chosen as **Export Protocols** to export files in the corresponding format.|
|W1|New SEPA formats CT pain.001.001.09 and DD pain.008.001.08|New SEPA formats **CT pain.001.001.09** and **DD pain.008.001.08** have been added as options on the **Bank Account** card.|

## Release Plan

If you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2024 release wave 1 (release from April 2024 through September 2024), find the link to the release plan [here](https://aka.ms/BCReleasePlan).

## Upgrade to 24.3

New customers automatically get the latest builds of Business Central (24.3). If you're an existing partner/customer, you receive an email notification as soon as your environment is upgraded.

## Good to know

- All Microsoft partners are invited to the SMB Partner Hour on July 24, at 8:30AM PT. Microsoft will walk through FY25 SMB plans, incentives, resources to accelerate your growth. Register now at: [aka.ms/SMBPartnerHour](https://aka.ms/SMBPartnerHour).
- Watch the newest edition of the Under the Hood podcast where we discuss “How many users can Business Central handle in the cloud?”. [Watch it on YouTube](https://youtu.be/snVsG69X-kw?si=D19Eg9fo1qdVMtW8)

### Features becoming mandatory soon

Prepare for features becoming mandatory soon on [aka.ms/BCFeatureMgmt](https://aka.ms/BCFeatureMgmt).
Following features might have potentially disruptive effect on extensions and apps you install in the future, when they become mandatory. These features are now optional to use and can be enabled in the [Feature Management](https://dynamics.microsoft.com/en-us/business-central/signin/?ru=https%3A%2F%2Fbusinesscentral.dynamics.com%2F%3Fpage%3D2610%26noSignUpCheck%3D1) page. 

**Extending G/L Entry Aggregations When Posting Invoices** feature is generally available with Update 23.1 and becoming mandatory in Update 26.0 (2025 Release Wave 1). The Invoice Post. Buffer table is replaced by the use of the Invoice Posting interface. The replacement helps resolve extensibility issues for the legacy Invoice Post. Buffer table. You can now use your own implementation of G/L invoice posting. If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to [Extending G/L Entry Aggregations When Posting Invoices](/dynamics365/business-central/dev-itpro/developer/devenv-invoice-posting-example).

**New extensible exchange rate adjustment**, including posting review feature is generally available with Update 23.0 and becoming mandatory in Update 26.0 (2025 Release Wave 1) The legacy Exchange Rates Adjustment Report is being replaced by a new capability that increases extensibility and makes it easier to comply with local and industry-specific requirements. It also gives you more control over exchange rate adjustments with a posting preview and how dimension values are post when you adjust exchange rate, and better reporting. 
If you're a developer and want to learn more about how to extend G/L entry aggregations when posting invoices, go to [Extending Currency Exchange Rate Adjustments](/dynamics365/business-central/dev-itpro/developer/devenv-extend-exchange-rates).

Work with your partner to update extensions and apps you have installed before above features become mandatory. To view complete list of optional features and features that are becoming mandatory, go to [aka.ms/BCFeatureMgmt](https://aka.ms/BCFeatureMgmt).

### Discover all partner related resources on aka.ms/BCAll

If you’re a partner and you’re looking for relevant resources, you can find them in this article: [aka.ms/BCAll](https://aka.ms/BCAll).

### Discover all user related resources on aka.ms/BCUsers

If you’re a user and you’re looking for relevant resources, you can find them in this article: [aka.ms/BCUsers](https://aka.ms/BCUsers).  
