---
title: Update 25.2 for Microsoft Dynamics 365 Business Central 2024 release wave 2
description: Get an overview of new and changed capabilities in the 25.2 update of Business Central online, which is part of 2024 release wave 2.
ms.author: jswymer
ms.date: 12/09/2024
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.custom: 
    - bap-template
---

# Update 25.2 for Microsoft Dynamics 365 Business Central online 2024 release wave 2

Would you like to know what changes are in update 25.2? Below you find an overview and relevant links to what was done on hotfixes and regulatory features in this update. In addition, we gathered some good to know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download on-premises files from Microsoft Support at [Update 25.2 for Business Central 2024 release wave 2](https://support.microsoft.com/help/5049396).

## Feature changes

- [Do ad hoc analysis on fixed assets, projects, and services (general availability)](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/do-ad-hoc-analysis-fixed-assets-projects-services)
- [E-file IRS 1099 forms without integration (public preview)](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/e-file-irs-1099-forms-without-integration)
- [Migrate to the cloud from Dynamics SL (general availability)](../administration/migrate-sl-overview.md)
- [Start using E-Documents framework localized for Germany (public preview)](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/start-using-e-documents-framework-localized-germany)
- [Use embedded Power BI reports out of the box (general availability)](use-embedded-power-bi-reports-out-box)
- [Use the e-documents framework in the Spanish version (public preview)](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/use-e-documents-framework-spanish-version)

## Localization updates

| Country| Feature  |Description|
|-------------|--------------|--------------|
| Czech Republic| Copy Document action added to sales and purchase advice etters | The **Copy Document** action is now available on sales and purchase advance letters, allowing users to copy details from previously created documents, eliminating the need for manual re-entry each month. On the request page of the action, the only document types available to choose from are Sales or Purchase Advance Letters. |
| Norway | SAF-T 1.3 mapping update | Starting 01/01/2025, the new SAF-T form 1.30 is required but can be used immediately. It isn't fully backward compatible due to significant changes. The old form 1.20 remains valid for FY2024 and earlier. Users can now select the SAF-T version in the SAF-T Setup, which will generate different XML content based on the chosen version. |
| Spain | Adding new period type to the SII | In the new version, we've added a **Tax Period** option to the SII Setup, defaulting to **Monthly**. Companies required to submit the SII will have a **Monthly** tax period, while those voluntarily enrolled can choose **Quarterly**. Selecting **Quarterly** ensures the XML message reflects the correct value. |

## Release plan

Do you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2024 release wave 2 (release from October 2024 through March 2025)? Learn more at [Plan and prepare for Dynamics 365 Business Central in 2024 release wave 2](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 25.2

New customers automatically get the latest builds of Business Central (25.2). If you're an existing partner/customer, you receive an email notification as soon as your environment is upgraded.

## Good to know

### Sales Order Agent in Business Central - Early Access Program (US only)

We've recently announced the [Early Access Program for the Business Central Sales Order Agent](https://www.yammer.com/dynamicsnavdev/#/Threads/show?threadId=3092919011729408&search_origin=global&scoring=linear1Y-prankie-group-private-higher&match=any-exact&search_sort=relevance&page=1&search=sales%20order%20agent). Spaces are limited, so sign up here: [https://aka.ms/bcAgentsEarlyAccess](https://aka.ms/bcAgentsEarlyAccess).

Learn more about the Sales Order Agent at [Use Copilot with agent capabilities to automate sales order-taking](/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/use-copilot-agent-capabilities-automate-sales-order-taking-process).

### Business Central Launch Event videos on YouTube

The Business Central Launch Event for the 2024 release wave 2 took place on October 18, 2024. This online event aimed to provide information about the new features and enhancements in the 2024 release wave 2 to resellers, partners, ISVs, and consultants. You can find over 40 videos of this event on YouTube by visiting [aka.ms/BCLE](https://aka.ms/BCLE).

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
