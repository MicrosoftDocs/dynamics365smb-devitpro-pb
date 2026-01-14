---
title: Update 27.1 for Microsoft Dynamics 365 Business Central 2025 Release Wave 2
description: Get an overview of new and changed capabilities in the 27.1 update of Business Central online, which is part of 2025 release wave 2
ms.author: jswymer
ms.date: 01/14/2026
ms.reviewer: jswymer
ms.topic: concept-article
author: jswymer
ms.custom:
    - bap-template
---
# Update 27.1 for Business Central online 2025 release wave 1

Would you like to know what changes are in update 27.1? Below you find an overview and relevant links to what was done on hotfixes and regulatory features in this update. In addition, we gathered some good to know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download on-premises files from Microsoft Support at [Update 27.1 for Business Central 2025 release wave 2](https://support.microsoft.com/help/5071096).

## Feature changes

| Product area | Feature | Public preview/General availability |
|-|-|-|
| Copilot and agents | [Automate payables processes with the Payables Agent](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/automate-payables-processes-payables-agent) | General availability |
| | [Get more contextual invoice drafts with Payables Agent](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/get-more-contextual-invoice-drafts-payables-agent) | General availability |
| | [Capture more sales with enhanced Sales Order Agent](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/capture-more-sales-enhanced-sales-order-agent) | General availability |
| | [Use Sales Order Agent to automate sales order-taking](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/use-copilot-agent-capabilities-automate-sales-order-taking-process) | General availability |
| | [Connect AI agents to Business Central through MCP server](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/connect-ai-agents-business-central-through-mcp-server) | Public preview |
| Country and regional | [Delete companies from production environments in Denmark](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/delete-companies-production-environments-denmark) | General availability |
| | [Submit IRS 1099 forms electronically to IRIS in the US localization](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/submit-irs1099-forms-electronically-iris) | General availability |
| Electronic Documents | [Process sales e-documents in two steps](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/process-sales-e-documents-two-steps) | General availability |
| | [Use the E-Documents framework with Power Automate and other solutions](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/use-e-documents-power-automate) | General availability |
| | [Use the ForNAV Peppol connector for e-documents](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/use-fornav-peppol-connector-e-documents) | Public preview |
| Financial Management | [Print the Audit Trail report](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/print-audit-trail-report) | General availability |
| | [Use new SEPA file CAMT0530008](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/use-new-sepa-file-camt0530008) | Public preview |
| | [Use the Account Payable Role Center](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/use-account-payables-administrator-role-center) | General availability |
| Sustainability Management | [Support Digital Product Pass reporting requirements](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/support-digital-product-pass-reporting-requirements) | General availability |
| User experiences | [Use the Concealed text field type for sensitive data](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/use-concealed-text-field-type-sensitive-data) | General availability |
|Shopify| [Create sales invoices from orders automatically, and use new ways to view orders](/dynamics365/business-central/shopify/synchronize-orders) | General availability |
| | [Use renamed customer templates and fulfillments](/dynamics365/business-central/shopify/synchronize-customers) | General availability |
|Dynamics GP migration|**Recurring purchase and sales lines creation:** The Dynamics GP migration tool supports automatic creation of recurring purchase and sales lines in Business Central from Dynamics GP Purchasing and Sales Accounts. When enabled in migration settings, it evaluates vendor/customer accounts, class accounts, and default purchasing/sales accounts in Dynamics GP, then generates corresponding recurring lines in Business Central. Each line is linked to the appropriate vendors or customers, includes mapped dimensions, and is set to insert automatically on purchase or sales documents. This option is off by default. <br><br>Learn more in [Generating recurring purchase lines](../administration/migrate-dynamics-gp.md#creating-recurring-purchase-lines) and [Generating recurring sales lines](../administration/migrate-dynamics-gp.md#recurring-sales-lines).|General availability|

## Localization updates

No localization updates for 27.1.

## Release plan

Do you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2025 release wave 2 (release from October 2025 to April 2026)? Learn more at [Plan and prepare for Dynamics 365 Business Central in 2025 release wave 1](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 27.1

### Online customers

- New customers get Business Central version 27.1 automatically.
- Existing customers are notified when update 27.1 is available. Admins can schedule update 27.1 to any date within the five-month update period, which ends on February 28, 2026.

Learn more in [Major updates for Business Central online](../administration/update-rollout-timeline.md#major-updates).

### On-premises customers

Deployments using version 24 or earlier must upgrade to version 25 before upgrading to update 27.1. Several objects marked as obsolete in these earlier versions are no longer included in the base application. Learn more in [Important information and considerations when upgrading to Business Central version 27](../upgrade/upgrade-considerations-v26.md).

## Good to know

### Recent online service features

**Early access preview versions for partner:** Tenants with the partner sandbox license get early access to preview environments for the next major Business Central version so they can explore new capabilities and prepare for changes ahead of general availability. Learn more in [Early access previews](../administration/preview-environments.md#early-access-preview).

**Consume available Copilot Credits with no extra setup:** You can now use prepaid Copilot Credits without configuring AI billing on Business Central environments. Copilot Credits consumed by Business Central environments that don't have AI billing setup are reported against the Power Platform default environment for the tenant. Learn more in [Manage consumption-based billing for agent capabilities](../administration/tenant-admin-center-manage-consumption-billing.md).

### Business Central Launch Edition - 2025 release wave 2

The Business Central Launch Event (BCLE) is now the Business Central Launch Edition&mdash;a comprehensive readiness experience to support you throughout the release wave. The Business Central Launch Edition provides you with a suite of resources:

- 45+ what's new sessions on YouTube: [aka.ms/BCLE](https://aka.ms/BCLE)
- 'What's new' partner deck for download: [aka.ms/BCLEDECK](https://aka.ms/BCLEDECK)
- BCLE Highlight videos for download: [aka.ms/BCHighlights](https://aka.ms/BCHighlights)
- 'Ask Us Anything' Office Hours in November: [aka.ms/BCOfficeHours](https://aka.ms/BCOfficeHours)
- BCLE 2025 release wave 2 group on Viva Engage for asking questions to our product experts: [BCLE 2025 release wave 2](https://www.yammer.com/dynamicsnavdev/#/threads/inGroup?type=in_group&feedId=236770828288&view=all)

### Features becoming mandatory next release wave

Prepare for features expected to be mandatory in the next release wave (28.0). When these features become mandatory, they might disrupt extensions and apps you install in the future. Work with your partner to update installed extensions and apps before the features are mandatory. These features are optional and can be enabled on the **Feature Management** page in Business Central. Learn more in [Enabling Upcoming Features Ahead of Time](../administration/feature-management.md).

- [Feature Update: Enable use of G/L currency revaluation](/dynamics365/business-central/finance-revalue-account-balances)
- [Feature Update: New sales pricing experience](/previous-versions/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/use-new-sales-pricing-experience-)
- [Feature Update: Use new communication texts for reminder terms](/dynamics365/business-central/finance-automate-reminders)
- [Feature: Advanced Tell Me (preview)](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/find-pages-reports-advanced-tell-me-search)
- [Feature: Calculate only visible FlowFields](../developer/calculate-only-visible-flowfields-feature-key.md)
- [Feature: Enable MCP Server access](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/connect-ai-agents-business-central-through-mcp-server)
- [Feature: Preview semantic similarity search on application metadata](../developer/semantic-search-feature-key.md)
- [Feature: Use optimized text search in lists](/dynamics365/business-central/design-details-warehouse-entries#creating-warehouse-transactions)

For a list of features that became mandatory in version 27, go to [Optional features that are now mandatory](https://aka.ms/BCFeatureMgmt).

### Discover all partner related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).  
