---
title: Update 26.4 for Microsoft Dynamics 365 Business Central 2025 Release Wave 1
description: Get an overview of new and changed capabilities in the 26.4 update of Business Central online, which is part of 2025 release wave 1
ms.author: jswymer
ms.date: 07/17/2025
ms.reviewer: solsen
ms.topic: conceptual
author: jswymer
ms.custom:
    - bap-template
---
# Update 26.4 for Business Central online 2025 release wave 1

Would you like to know what changes are in update 26.4? Below you find an overview and relevant links to what was done on hotfixes and regulatory features in this update. In addition, we gathered some good to know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download on-premises files from Microsoft Support at [Update 26.4 for Business Central 2025 release wave 1](https://support.microsoft.com/help/5063362).

## Feature changes

| Product area | Feature | PP/GA |
|-|-|-|
| Copilot and agents | [Chat with Copilot to learn how to use installed add-on apps](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/chat-copilot-learn-use-installed-add-on-apps) | PP  |
|  | [Automate payables processes with the Payables Agent](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/automate-payables-processes-payables-agent) | PP  |
| | Capture more sales with enhanced Sales Order Agent (link coming soon)| PP  |
||[Summarize with Copilot](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/summarize-record-copilot#enhancements-with-update-263-july-update) is faster in update 26.4 and includes a Copy summary option.| PP |
||[Autofill with Copilot](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/autofill-fields-copilot) adds improved support for keyboard shortcuts and screen readers.| PP |
| Country and regional | [Calculate and post VAT settlement by Activity Code - Italy](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/allowing-calculation-posting-vat-settlement-activity-code-italy) | GA  |
| Electronic Documents | [Use Continia as a service provider for e-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-continia-as-service-provider-e-documents) | GA |

## Localization updates

|Country|Feature|Description|
|-|-|-|
|ES|SII CSV file update|The CSV in the SII schema has been updated related to the newest changes required by AEAT.|
|DE|ZUGFeRD format availability|ZUGFeRD format (PDF/A) for E-invoicing in Germany is now available. In AP process, system will automatically extract the XML and process, and in the AR process system will use default report layout to create PDF and attach the XML inside.|
|DE|Peppol BIS3 adjustment|Users in Germany now can use new Peppol BIS3 DE format for E-invoicing aligned with German standards.|
|BE|Peppol BIS3 adjustment|Users in Belgium now can use new Peppol BIS3 BE format for E-invoicing aligned with Belgian standards (i.e. using Enterprise No.).|

## Release plan

Do you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2025 release wave 1 (release from April 2025 through October 2025)? Learn more at [Plan and prepare for Dynamics 365 Business Central in 2025 release wave 1](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 26.4

### Online customers

New customers automatically get Business Central version 26.4. If you're an existing customer or partner, you get an email notification when the update is available. You can choose when to update to the version. Learn more in [Schedule an update](../administration/tenant-admin-center-update-management.md#schedule-an-update).

### On-premises customers

Deployments using version 24 or earlier must upgrade to version 25 before upgrading to version 26.4. Several objects marked as obsolete in earlier versions are deleted from the version 26 base application. Learn more in [Important information and considerations when upgrading to Business Central version 26](../upgrade/upgrade-considerations-v26.md).

## Good to know

### Copilot uses online content from app publishers

Users can now chat with Copilot and ask questions about the apps they have installed.To give our partner community time to prepare their online content for Copilot, this functionality is initially available in Update 26.4 sandbox environments only and becomes available at the end of July 2025 even if you deploy an environment earlier.

### System symbols now included with Business Central server

Business Central server binaries now include the system symbols instead of the **System** extension. As a result, you can't publish `SymbolsOnly` packages by using the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp). You get a warning if you use the `-SymbolsOnly` parameter with the [Get-NAVAppInfo cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo). To get information about the system symbols, use the `-Name System` parameter.

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
