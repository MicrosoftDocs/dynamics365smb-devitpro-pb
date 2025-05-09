---
title: Update 26.1 for Microsoft Dynamics 365 Business Central 2024 Release Wave 1
description: Get an overview of new and changed capabilities in the 26.1 update of Business Central online, which is part of 2025 release wave 1
ms.author: jswymer
ms.date: 05/08/2025
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.custom:
    - bap-template
---
# Update 26.1 for Business Central online 2025 release wave 1

Would you like to know what changes are in update 26.1? Below you find an overview and relevant links to what was done on hotfixes and regulatory features in this update. In addition, we gathered some good to know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download on-premises files from Microsoft Support at [Update 26.1 for Business Central 2025 release wave 1](https://support.microsoft.com/help/5059415).

## Feature changes

| Product area           | Feature aame                                                                      |
|-------------------------------|-----------------------------------------------------------------------------------|
| Copilot and AI                | [Automate tests for your Copilot extensions with the Business Central Test Toolkit](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/automate-tests-copilot-extensions-business-central-test-toolkit) |
| E-Documents                     | [Create e-documents from posted sales invoices](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/create-e-documents-posted-sales-invoices) |
| E-Documents                     | [Delete incorrect e-documents and avoid duplicates](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/delete-incorrect-e-documents-avoid-duplicates) |
| E-Documents                     | [Export reminders and finance charges as PEPPOL files](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/export-reminders-finance-charges-as-peppol-files) |
| E-Documents                     | [Preview incoming e-invoices prior to processing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/preview-incoming-e-invoices-prior-processing) |
| E-Documents                     | [Send e-documents via a service and email simultaneously](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/send-e-documents-via-service-email-simultaneously) |
| E-Documents                     | [Use e-documents to fix unposted purchase documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-e-documents-fix-unposted-purchase-credit-memos) |
| E-Documents                     | [Use ExFlow by SignUp connector for e-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-exflow-signup-connector-e-documents) |
| E-Documents                     | [Use Logiq as a service provider for e-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-service-providers-e-documents-framework) |
| Sustainability Management     | [Use the new Out of Scope emission category](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-out-scope-emission-category) |
| Sustainability Management     | [Use water and waste management with sustainability](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-water-waste-management-sustainability) |
|User experiences|[Optimize screen estate usage on the web](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/optimize-screen-estate-usage-web) (controlled by **Feature Management**)|

## Localization updates

No localization updates for 26.1.

## Release plan

Do you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2025 release wave 1 (release from April 2025 through October 2025)? Learn more at [Plan and prepare for Dynamics 365 Business Central in 2025 release wave 1](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 26.1

### Online customers

New customers automatically get Business Central version 26.1. If you're an existing customer or partner, you get an email notification when the update is available. You can choose when to update to the version. Learn more in [Schedule an update](../administration/tenant-admin-center-update-management.md#schedule-an-update).

### On-premises customers

Deployments using version 24 or earlier must upgrade to version 25 before upgrading to version 26.1. Several objects marked as obsolete in earlier versions are deleted from the version 26 base application. Learn more in [Important information and considerations when upgrading to Business Central version 26](../upgrade/upgrade-considerations-v26.md).

## Good to know

### Recent and upcoming online service features

- [Manage environment updates more flexibly](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/manage-environment-updates-more-flexibly) (general availability)

  This feature establishes a five-month update period for major updates and allows you to opt in to minor updates by selecting a later version. The option to select the target version in the Business Central admin center is expected to be available around the same time as update 26.1. Learn more in [Major updates and minor updates for Business Central online](../administration/update-rollout-timeline.md).  

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
