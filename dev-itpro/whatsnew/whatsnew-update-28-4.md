---
title: Update 28.4 for Microsoft Dynamics 365 Business Central 2026 Release Wave 1
description: Get an overview of new and changed capabilities in the 28.4 update of Business Central online, which is part of 2026 release wave 1
ms.author: jswymer
ms.date: 08/01/2026
ms.reviewer: jswymer
ms.topic: concept-article
author: jswymer
ms.custom:
    - bap-template
---
# Update 28.4 for Business Central 2026 release wave 1

Want to know what changes are in update 28.4? The following sections provide an overview and relevant links to hotfixes and regulatory features in this update. In addition, the release notes include some good-to-know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download the on-premises files from Microsoft Support at [Update 28.4 for Business Central 2026 release wave 1](https://support.microsoft.com/servicing/dynamics/business-central/update/2026/08/update-28-4-for-microsoft-dynamics-365-business-central-2026-release-wave-1).

## Feature changes

|Product area|Feature|Public preview/General availability|
|-|-|-|
|Copilot and agents|[Speed up processing with Known Senders in Payables Agent](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/speed-up-processing-known-senders-payables-agent)|General availability|
|Electronic documents|[Use payments with the E-Document framework](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-payments-e-document-framework)|General availability|
||[Use purchase draft page to preview Peppol electronic invoices](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-purchase-draft-page-preview-peppol-electronic-invoices)|Public preview|

## Localization updates

No updates

## Release plan

For a comprehensive overview of what's new and planned for Business Central online for the entire 2026 release wave 1 (release from April 2026 to October 2026), see [Plan and prepare for Dynamics 365 Business Central in 2026 release wave 1](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/planned-features)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 28.4

### Online customers

- New customers automatically get Business Central version 28.4.
- Existing customers receive a notification when update 28.4 is available so they can schedule the update. For more information, see [Schedule an update](../administration/tenant-admin-center-update-management.md#schedule).

### On-premises customers

The upgrade path depends on your current major version. Select the instructions that match your deployment:

- **Version 28**: Follow the instructions in [Install a Business Central 2026 release wave 1 update](../upgrade/upgrading-cumulative-update-v28.md).
- **Version 27 and earlier**: Learn more about upgrading to version 28 in [Upgrading to Dynamics 365 Business Central 2026 release wave 1](../upgrade/upgrade-overview-v28.md).

## Good to know

### Improved Field Service integration

Business Central now fully respects the Dataverse **Convert to Customer Asset** setting when synchronizing service items with Dynamics 365 Field Service.

Previously, eligible service items could be synchronized as customer assets even when the related Field Service product was configured not to create customer assets, that is, when **Convert to Customer Asset** was set to **No**. Going forward, new uncoupled service items create customer asset records only when **Convert to Customer Asset** is set to **Yes**.

To avoid disrupting existing integrations, service items that are already coupled to customer assets continue to synchronize regardless of the current product setting. This change affects only new service item and customer asset synchronizations.

This change helps ensure that new synchronizations follow the intended Field Service product configuration while preserving existing integrations.

## Copilot and agent data movement across geographies

Starting July 1, 2026, Business Central environments on version 28.0 or later in some countries or regions might process Copilot and agent requests in a different Azure geography. You can manage data processing preferences on the **Copilot & agent capabilities** page.

Learn more in [Copilot data movement across geographies](/dynamics365/business-central/ai-copilot-data-movement).

### Business Central Launch Edition - 2026 release wave 1

Explore the Business Central Launch Edition (BCLE)&mdash;a comprehensive skilling experience designed to help partners stay up to date, aligned, and ready to deliver value faster with every release wave.

- 40+ what's new sessions on YouTube: [aka.ms/BCLE](https://aka.ms/BCLE)
- 'What's new' partner deck for download: [aka.ms/BCLEDECK](https://aka.ms/BCLEDECK)
- Have questions? Go to the new Business Central partner communities on Viva Engage and ask the product experts: [aka.ms/BCVivaEngage](https://aka.ms/BCVivaEngage)

### Discover all partner-related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user-related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).
