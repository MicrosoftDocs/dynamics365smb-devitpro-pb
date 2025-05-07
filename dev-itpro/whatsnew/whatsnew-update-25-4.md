---
title: Update 25.4 for Microsoft Dynamics 365 Business Central 2024 release wave 2
description: Get an overview of new and changed capabilities in the 25.4 update of Business Central online, which is part of 2024 release wave 2.
ms.author: jswymer
ms.date: 02/12/2025
ms.reviewer: jswymer
ms.topic: article
author: jswymer
ms.custom:
    - bap-template
---

# Update 25.4 for Microsoft Dynamics 365 Business Central online 2024 release wave 2

Would you like to know what changes are in update 25.4? Below you find an overview and relevant links to what was done on hotfixes and regulatory features in this update. In addition, we gathered some good to know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download on-premises files from Microsoft Support at [Update 25.4 for Business Central 2024 release wave 2](https://support.microsoft.com/help/5052987).

## Feature changes

- Chat with Copilot from anywhere

  Update 25.4 extends the public preview of Copilot Chat to all Business Central countries and regions. 

  Customers upgrading to this version of Business Central must first enable Chat with Copilot from the Feature Management page. 

  This feature is supported in English. While it can be used in other languages, it might not function as intended. Language quality might vary based on the user's interaction or system settings, which might impact accuracy and the user experience.

  Learn more in [Chat with Copilot](/dynamics365/business-central/chat-with-copilot).

- [Package resources in extensions and access from AL](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/package-resources-extensions-access-al)

## Localization updates

|Country|Feature|Description|
|-|-|-|
|Czech Republic|New VAT Statement and Report for Czech Republic|The VAT return now includes two additional lines for corrections when the obligation arises within the correction period for someone who is no longer a taxpayer.  If the new lines are unnecessary, use the existing export. If the customer needs the new lines, you must:<ul><li>Add new codes to the VAT Attribute Codes table.</li><li>Add new lines to the VAT report.</li><li>Define a new XML format for the report name.</li></ul>.|

## Release plan

Do you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2024 release wave 2 (release from October 2024 through March 2025)? Learn more at [Plan and prepare for Dynamics 365 Business Central in 2024 release wave 2](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 25.4

New customers automatically get the latest builds of Business Central (25.4). If you're an existing partner/customer, you receive an email notification as soon as your environment is upgraded.

## Good to know

### New installation path started in 25.2

25.2 included internal database schema changes with the following consequences:

- New platform version 25.2 instead of 25.0.
- Different installation path than 25.0 and 25.1. Instead of using folder '250', components are installed in folder '252', for example: `C:\Program Files\Microsoft Dynamics 365 Business Central\252`.

Update 25.4 and future version 25 updates will also use platform number '25.2' and installation folder '252'.

### Business Central Launch Event videos on YouTube

The Business Central Launch Event for the 2024 release wave 2 took place on October 18, 2024. This online event aimed to provide information about the new features and enhancements in the 2024 release wave 2 to resellers, partners, ISVs, and consultants. You can find over 40 videos of this event on YouTube by visiting [aka.ms/BCLE](https://aka.ms/BCLE).

### Upcoming service features

The following Business Central online service features are expected to roll out in February or March 2025:

- [Encrypt data at-rest with customer-managed encryption key](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/encrypt-data-at-rest-customer-managed-encryption-key)
- [Get list of manageable environments for Microsoft Entra apps](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/get-list-manageable-environments-entra-apps)

### Features becoming mandatory soon

Prepare for features becoming mandatory soon. Learn more in [Optional features that are now mandatory](https://aka.ms/BCFeatureMgmt).

When the following features become mandatory, they might have potentially disruptive effects on extensions and apps you install in the future. These features are now optional to use and can be enabled in the **Feature Management** page in Business Central. Learn in more [Enabling Upcoming Features Ahead of Time](../administration/feature-management.md)).

- **Extending G/L Entry Aggregations When Posting Invoices**

   This feature is generally available with Update 23.1 and becoming mandatory in Update 26.0 (2025 release wave 1). The Invoice Posting interface replaces the use of the **Invoice Post. Buffer** table. The replacement helps resolve extensibility issues for the legacy Invoice Post. Buffer table. You can now use your own implementation of G/L invoice posting. As a developer, you can learn more about how to extend G/L entry aggregations when posting invoices [Extending G/L Entry Aggregations When Posting Invoices](../developer/devenv-invoice-posting-example.md).

- **New extensible exchange rate adjustment**

   This feature, including the posting review feature, is generally available with Update 23.0 and becoming mandatory in Update 26.0 (2025 release wave 1). New capability replaces the legacy Exchange Rates Adjustment Report. This new capability increases extensibility and makes it easier to comply with local and industry-specific requirements. It also gives you more control over exchange rate adjustments with a posting preview and how dimension values are post when you adjust exchange rate, and better reporting. As a developer, you can learn more about how to extend G/L entry aggregations when posting invoices in [Extending Currency Exchange Rate Adjustments](../developer/devenv-extend-exchange-rates.md).

Before the features become mandatory, work with your partner to update installed extensions and apps.

### Discover all partner related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).  
