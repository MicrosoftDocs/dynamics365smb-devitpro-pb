---
title: What's New or Changed in Business Central 2025 Release Wave 1 Update 27.0 
description: Get an overview of new and changed capabilities in the 27.0 update of Business Central online, which is part of 2025 release wave 1.
ms.author: jswymer
ms.date: 04/24/2025
ms.reviewer: jswymer
ms.topic: whats-new
author: jswymer
ms.custom: 
    - bap-template
---
# Update 27.0 for Business Central 2025 release wave 2 (preview)

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

This article provides an overview of new and updated features in update 27.0 preview, which applies only to Business Central online sandbox environments and not to production or on-premises environments.

More features and information about on-premises deployments will be added to this article when version 27.0 is generally available. Learn more about all features planned for 2025 release wave (version 27) in [Plan and prepare for Dynamics 365 Business Central in 2025 release wave 2](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central).

[!INCLUDE [preview-note](~/../shared-content/shared/preview-includes/preview-note-d365.md)]

## Highlights

[Optional - tbd]

<!--
> [!TIP]
> Watch video on YouTube: [Dynamics 365 Business Central 2025 Release Wave 2 Release Highlights](https://www.youtube.com/watch?v=D2KPQEbO40Q).
-->
## New and updated features

This table lists new and updated features in the 27.0 public preview for sandboxes.

<!-- Generate table:

1. In successHub, filter on releas plns similar to https://successhub.crm.dynamics.com/main.aspx?appid=0fe9f79a-a1f6-4064-af95-ded6c5e7bd5c&pagetype=entitylist&etn=rn_releasenote&viewid=9d407e0c-72e4-ef11-a731-7c1e520c4fd1&viewType=4230&lid=1738859869588
2. Export to Excel
3. Install excel to markdown extension in VScode:
4. Open Excel file
5. Sort product area column in ascending orders
1. Copy rows and columns
1. In VS Code, press Shift Alt V

Add links:

1. Start Copilot Chat
1. Slect table you just created.
1. Copy this prompt in chat:

In the table, make each feature name in the Feature column a markdown link. Follow these steps for each row in the column:
 
1. Identify the markdown file name in "Release Plan URL" column.
2. Create a relative link on the text in the "Feature" column using the format: [<text>](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/<markdown file name>. 
3. Omit .md in the link

When all the links have been created, remove the "Release Plan URL" column from the table, so the table only has the format: 
| Product Area | Feature Name|

-->

| Product area | Feature |
|--------------|--------------|
| Copilot and agents | [Find pages and reports with advanced Tell Me search](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/find-pages-reports-advanced-tell-me-search) |
| Country and regional| Alternative posting groups for Employees - Czechia |
| | [Check total amounts on purchase advances for Czechia](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/check-total-amounts-purchase-advances-czechia) |
| | [Get UI improvements for Unreliable Payer for Czechia](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/unreliable-payer-user-interface-improvements-czechia) |
| | [New Contoso Coffee Demo Dataset for Intrastat in Czechia](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/new-contoso-coffee-demo-dataset-intrastat-czechia) |
|  | [New pages for purchase and sales advance lines for Czechia](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/new-pages-purchase-sales-advance-lines-czechia) |
| | [Reconciliation feature in cash documents for Czechia](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/reconciliation-feature-cash-documents-czechia) |
| Electronic documents | [Use the ForNAV Peppol connector for e-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-fornav-peppol-connector-e-documents) |
| Financial management | Alternative posting groups for Employees |
| | [New Contoso Coffee Demo Dataset for Intrastat](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/new-contoso-coffee-demo-dataset-intrastat) |
| Sustainability management | [Enable taxonomy elements for ESRS and other standards](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enable-taxonomy-elements-esrs-other-standards) |
| | [Use ESG Reporting integrated with Business Central](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-esg-reporting-integrated-business-central) |

## Changes to optional features in Feature Management

This section outlines changes to feature and feature updates controlled by **Feature management** in version 27.0.

### Feature keys now mandatory and removed

- [Feature Update: Enable use of package tracking in physical inventory orders](/dynamics365/business-central/inventory-how-work-item-tracking)
- [Feature: Add fields from related tables in analysis mode.](/dynamics365/business-central/analysis-mode-feature-key)
- [Feature: Enable server certificate validation for Http requests](/dynamics365/business-central/dev-itpro/developer/devenv-httpcertvalid-feature-key)

### New feature keys enabled by default

- [Feature Update: Provides functionality for having default values for financial reports](/dynamics365/release-plan/2025wave2/smb/dynamics365-business-central/use-enhanced-financial-reporting)<!-- missing rp-->

### New feature keys disabled by default

- [Feature: Advanced Tell Me (preview)](https://go.microsoft.com/fwlink/?linkid=2331650)

### Existing feature keys now enabled by default

- [Feature Update: Enable multiple users to post item ledger entries and value entries at the same time](/dynamics365/business-central/inventory-how-setup-general#allow-workers-to-post-transactions-at-the-same-time) 
- [Feature Update: Enable multiple users to post job (now called project) ledger entries at the same time](/dynamics365/business-central/projects-how-setup-jobs?tabs=current-experience#allow-multiple-people-to-post-project-transactions-at-the-same-time) 
- [Feature Update: Enable multiple users to post resource ledger entries at the same time](/dynamics365/business-central/projects-how-setup-resources#allow-multiple-people-to-post-resource-transactions-at-the-same-time)  <!-- missing rp-->
- [Feature: Calculate only visible FlowFields](../developer/calculate-only-visible-flowfields-feature-key.md)
- [Feature: Enables advanced navigation (not data) search capabilities by utilizing semantic similarity search on application metadata](../developer/semantic-search-feature-key.md) changed to Feature: Preview semantic similarity search on application metadata.

### Other feature key changes

- [Feature: Enables advanced navigation (not data) search capabilities by utilizing semantic similarity search on application metadata](../developer/semantic-search-feature-key.md) renamed to **Feature: Preview semantic similarity search on application metadata**.


<!--
## Deprecated and removed features

- [Deprecated or removed features in the platform](../upgrade/deprecated-features-platform.md#changes-in-2025-release-wave-2-version-270)
- [Deprecated or removed in the base app](../upgrade/deprecated-features-w1.md#changes-in-2025-release-wave-1)
- [Deleted objects](../upgrade/deleted-objects-25w1.md)
-->
<!--
## On-premises download packages

Select and download the package for the appropriate country or region version from Microsoft Support.

|Country/region|Download package|
|-|-|
|AT - Austria|[Dynamics.365.BC.33317.AT.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.AT.DVD.zip)|
|AU - Australia|[Dynamics.365.BC.33317.AU.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.AU.DVD.zip)|
|BE - Belgium|[Dynamics.365.BC.33317.BE.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.BE.DVD.zip)|
|CA - Canada|[Dynamics.365.BC.33317.CA.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.CA.DVD.zip)|
|CH - Switzerland|[Dynamics.365.BC.33317.CH.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.CH.DVD.zip)|
|CZ- Czechia|[Dynamics.365.BC.33317.CZ.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.CZ.DVD.zip)|
|DE - Germany|[Dynamics.365.BC.33317.DE.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.DE.DVD.zip)|
|DK - Denmark|[Dynamics.365.BC.33317.DK.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.DK.DVD.zip)|
|ES - Spain|[Dynamics.365.BC.33317.ES.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.ES.DVD.zip)|
|FI - Finland|[Dynamics.365.BC.33317.FI.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.FI.DVD.zip)|
|FR - France|[Dynamics.365.BC.33317.FR.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.FR.DVD.zip)|
|GB - United Kingdom|[Dynamics.365.BC.33317.GB.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.GB.DVD.zip)|
|IN - India|[Dynamics.365.BC.33317.IN.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.IN.DVD.zip)|
|IS - Iceland|[Dynamics.365.BC.33317.IS.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.IS.DVD.zip)|
|IT - Italy|[Dynamics.365.BC.33317.IT.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.IT.DVD.zip)|
|MX - Mexico|[Dynamics.365.BC.33317.MX.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.MX.DVD.zip)|
|NL - Netherlands|[Dynamics.365.BC.33317.NL.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.NL.DVD.zip)|
|NO - Norway|[Dynamics.365.BC.33317.NO.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.NO.DVD.zip)|
|NZ - New Zealand|[Dynamics.365.BC.33317.NZ.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.NZ.DVD.zip)|
|RU - Russia|[Dynamics.365.BC.33317.RU.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.RU.DVD.zip)|
|SE - Sweden|[Dynamics.365.BC.33317.SE.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.SE.DVD.zip)|
|US - United States|[Dynamics.365.BC.33317.US.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.US.DVD.zip)|
|All other countries/regions (W1)|[Dynamics.365.BC.33317.W1.DVD.zip](https://download.microsoft.com/download/98ec0254-fb6b-4b87-82fb-708a78867ab4/Dynamics.365.BC.33317.W1.DVD.zip)|
-->

## Create new sandbox environment on 27.0 preview

Creating a new preview environment lets you review new functionality in a clean environment without customer data, setup, or customizations. To create a new preview environment, follow the instructions in [Create a new environment](../administration/tenant-admin-center-environments.md#create-a-new-environment). Set the environment type to **Sandbox** and the version to **27.0 preview**.

## Update existing sandbox environment to 27.0 preview

> [!NOTE]
> Updating a sandbox environment is a new capability introduced in the service.

Updating an existing sandbox environment to a preview version lets you review new functionality in an environment that might contain your own data, setup, and customizations by testing with your extensions installed. To update an existing sandbox, follow the instructions in [Schedule an update for an environment](../administration/tenant-admin-center-update-management.md#schedule). Set the version to **27.0 preview**.

## Good to know

### Business Central Launch Event

The Business Central Launch Event for the Business Central 2025 release wave 2 is on October 1, 2025. Learn more at [aka.ms/BCLE](https://aka.ms/BCLE).

### Discover all partner related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).  