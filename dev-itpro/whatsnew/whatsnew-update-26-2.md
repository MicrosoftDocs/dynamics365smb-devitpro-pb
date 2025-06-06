---
title: Update 26.2 for Microsoft Dynamics 365 Business Central 2024 Release Wave 1
description: Get an overview of new and changed capabilities in the 26.2 update of Business Central online, which is part of 2025 release wave 1
ms.author: jswymer
ms.date: 06/05/2025
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.custom:
    - bap-template
---
# Update 26.2 for Business Central online 2025 release wave 1

Would you like to know what changes are in update 26.1? Below you find an overview and relevant links to what was done on hotfixes and regulatory features in this update. In addition, we gathered some good to know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download on-premises files from Microsoft Support at [Update 26.2 for Business Central 2025 release wave 1](https://support.microsoft.com/help/5061918).

## Feature changes

| Product area| Feature| PP/GA  |
|-|-|-|
| Copilot and AI | [Use AI resources for your Copilot extensions](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-business-central-ai-resources-copilot-features-business-central) | PP |
||[Calculate and post VAT settlement by Activity Code - Italy](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/allowing-calculation-posting-vat-settlement-activity-code-italy)|GA|
||[Comply with Australian Payment Times Reporting bill](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/comply-australian-payment-time-reporting-bill)|GA|
| E-documents | [Send e-documents via a service and email simultaneously](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/send-e-documents-via-service-email-simultaneously) | GA|
|| [Use B2B Router as a service provider for E-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-b2b-router-as-service-provider-e-documents) | GA|
||[Export reminders and finance charges as PEPPOL files](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/export-reminders-finance-charges-as-peppol-files)|GA|
| | [Automate embedded attachments in PEPPOL](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/automate-embedded-attachments-peppol) | GA|
| | [Use Continia as a service provider for e-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-continia-as-service-provider-e-documents) | PP  |
| Financial management | [Analyze subscription billing data with Power BI reports](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/analyze-subscription-billing-data-power-bi-reports) | GA|
| Governance and administration | [Migrate record links and notes with cloud migration tooling](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/migrate-record-links-notes-cloud-migration-tooling) | GA|
|  | [View app compatibility with future versions in admin center](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/view-app-compatibility-future-versions-admin-center) | GA|
|  | [Automate environment management with Power Platform connector](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/automate-environment-management-power-platform-connector) | GA|
| Reporting and data analysis   | [Use enhanced analytics for purchasing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-analytics-purchasing) | GA|
| | [Use enhanced analytics for projects](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-analytics-projects) | GA|
||Use enhanced analytics for sales | GA|
| | [Use enhanced Excel reports for sustainability](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-excel-reports-sustainability) | GA|
|| [Add fields from related tables in analysis mode](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/add-fields-related-tables-analysis-mode) | GA    |
| | [Use enhanced analytics for manufacturing (updated Power BI app)](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-analytics-manufacturing) | GA|
| Sustainability management | [Use enhanced analytics for Sustainability](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-analytics-sustainability) | GA|

## Localization updates

|Country|Feature|Description|
|-|-|-|
|Mexico|Updated DIOT file format in Mexico|The DIOT txt file now complies with the latest SAT regulations and can be generated with 54 fields, replacing the previous version that had only 25 fields.|

## Release plan

Do you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2025 release wave 1 (release from April 2025 through October 2025)? Learn more at [Plan and prepare for Dynamics 365 Business Central in 2025 release wave 1](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 26.2

### Online customers

New customers automatically get Business Central version 26.2. If you're an existing customer or partner, you get an email notification when the update is available. You can choose when to update to the version. Learn more in [Schedule an update](../administration/tenant-admin-center-update-management.md#schedule-an-update).

### On-premises customers

Deployments using version 24 or earlier must upgrade to version 25 before upgrading to version 26.1. Several objects marked as obsolete in earlier versions are deleted from the version 26 base application. Learn more in [Important information and considerations when upgrading to Business Central version 26](../upgrade/upgrade-considerations-v26.md).

## Good to know

### Recent and upcoming online service features

- [Manage environment updates more flexibly](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/manage-environment-updates-more-flexibly) (GA)
- [Support IPv6 for enhanced security and scalability](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/support-ipv6-enhanced-security-scalability) (GA)

### Business Central Launch Event videos on YouTube

The Business Central launch event for the 2025 release wave 1 was held in April 2025. This online event provided information about the new features and enhancements in the 2025 release wave 1 for resellers, partners, ISVs, and consultants. Watch the event videos on YouTube at [aka.ms/BCLE](https://aka.ms/BCLE).

### Features becoming mandatory next release wave

Prepare for features expected to be mandatory in the next release wave (27.0). When these features become mandatory, they might disrupt extensions and apps you install in the future. Work with your partner to update installed extensions and apps before the features are mandatory. These features are optional and can be enabled on the **Feature Management** page in Business Central. Learn more in [Enabling Upcoming Features Ahead of Time](../administration/feature-management.md).

- [Feature: Calculate only visible FlowFields](../developer/calculate-only-visible-flowfields-feature-key.md)
- [Feature Update: Enable multiple users to post warehouse entries at the same time](/dynamics365/business-central/design-details-warehouse-entries#creating-warehouse-transactions) <!--(/dynamics365/release-plan/2024wave2/smb/dynamics365-business-central/allow-more-than-one-user-post-warehouse-entries-at-time)-->
- [Feature: Use optimized text search in lists](/dynamics365/business-central/design-details-warehouse-entries#creating-warehouse-transactions)
- [Feature Update: Enable use of G/L currency revaluation](/dynamics365/business-central/finance-revalue-account-balances)
- [Feature: Enable server certificate validation for Http requests](../developer/devenv-httpcertvalid-feature-key.md)
- [Feature Update: Enable using 1099 forms to transmit the tax data to the IRS in the United States](/dynamics365/business-central/localfunctionality/unitedstates/set-up-use-irs1099-form)
- [Feature Update: Enable use of package tracking in physical inventory orders](/dynamics365/business-central/inventory-how-work-item-tracking)
- [Feature Update: Use new communication texts for reminder terms](/dynamics365/business-central/finance-automate-reminders)
- [Feature Update: Auto-save with every field change](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/auto-save-as-work)
- [Feature: Enables advanced navigation (not data) search capabilities by utilizing semantic similarity search on application metadata](../developer/semantic-search-feature-key.md)
- [Feature: Optimize screen estate usage on the web](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/optimize-screen-estate-usage-web)

For a list of features that became mandatory in update 26.0, go to [Optional features that are now mandatory](https://aka.ms/BCFeatureMgmt).

### Discover all partner related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).  
