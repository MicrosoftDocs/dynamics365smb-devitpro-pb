---
title: Update 28.2 for Microsoft Dynamics 365 Business Central 2026 Release Wave 1
description: Get an overview of new and changed capabilities in the 28.2 update of Business Central online, which is part of 2026 release wave 1
ms.author: jswymer
ms.date: 06/08/2026
ms.reviewer: jswymer
ms.topic: concept-article
author: jswymer
ms.custom:
    - bap-template
---
# Update 28.2 for Business Central 2026 release wave 1

Would you like to know what changes are in update 28.2? The following sections provide an overview and relevant links to hotfixes and regulatory features in this update. In addition, we gathered some good-to-know information and links that you might find interesting.

## Hotfixes

Learn about the hotfixes and download the on-premises files from Microsoft Support at [Update 28.2 for Business Central 2026 release wave 1](https://support.microsoft.com/help/5100266).

## Feature changes

|Product area|Feature|Public preview/General availability|
|-|-|-|
|Copilot and agents|Sales Order Agent features:<ul><li>The agent is now available in Belgium and Switzerland. To support this change, a new search configuration setting is available to admins that helps the agent find items accurately in multilingual environments, regardless of data language. Learn more in [Configure text search language for multilingual environments](/dynamics365/business-central/admin-optimize-text-search-language)</li><li>Cleaner email handling - The agent now detects and skips inline email attachments (signature logos, tracking pixels, embedded images), so it focuses only on real order documents like PDFs and spreadsheets. This change also means the agent uses fewer credits.</li></ul>|General availability|
|Country and regional|[Comply with Australian Payment Times Reporting bill](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/comply-australian-payment-time-reporting-bill)|General availability|
||[Enable electronic invoicing in France](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/enable-electronic-invoicing-france)|Public preview|
||[Use Payment Practices in the UK localization](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-payment-practices-uk-localization)|General availability|
|Electronic documents|[Use payments with the E-Document framework](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-payments-e-document-framework)|Public preview|
|Financial management|[Calculate withholding taxes for vendors](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/calculate-withholding-taxes-vendors)|General availability|
||[Enable accelerated depreciation methods for fixed assets](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/enable-accelerated-depreciation-methods-fixed-assets)|Public preview|
||[Use self-billed invoices](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-self-billed-invoices)|General availability|
|Governance and administration|[Run reimplementation projects using cloud migration tool](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/run-reimplementation-projects-using-cloud-migration-tool)|Public preview|
|Reporting and data analysis|[Use new APIs for analyzing approval workflows for auditors and IT staff](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-new-apis-analyzing-approval-workflows-auditors-it-staff)|General availability|
||[Use new APIs for analyzing permissions for auditors and IT staff](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-new-apis-analyzing-permissions-auditors-it-staff)|General availability|
||Use new APIs for getting the PDF of a document report|General availability|
|Supply chain management|Quality management features:<ul><li>Word report layouts - The three printable quality management reports (**Certificate of Analysis**, **Non-Conformance**, and **General Purpose Inspection**) now ship with Word layouts as the default rendering option. Alternate RDLC layouts are also available. Reports can be printed from the **Quality Inspection** card and the **Quality Inspections** list. Default assignments are managed on the **Report Selection - Quality Management** page, which is now accessible from the **Quality Manager Role Center** and the **Manual Setup** list page.</li><li>Demo data and checklist - The **Quality Management Setup** page includes an **Install Demo Data** action that installs the **Contoso Coffee Demo Dataset** from AppSource and opens the **Contoso Demo Tool**. Demo data installation is also the first step in the **Quality Manager Role Center** checklist, which registers automatically when a quality manager first signs in.</li></ul>|General availability|
|Sustainability management|[Use new APIs in Sustainability for better integration](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/use-new-apis-sustainability-better-integration)|General availability|

## Localization updates

No updates

## Release plan

Do you want to get a comprehensive overview of what's new and planned for Business Central online for the entire 2026 release wave 1 (release from April 2026 to October 2026)? Learn more at [Plan and prepare for Dynamics 365 Business Central in 2026 release wave 1](/dynamics365/release-plan/2026wave1/smb/dynamics365-business-central/planned-features)<!--(https://aka.ms/BCReleasePlan)-->.

## Upgrade to 28.2

### Online customers

- New customers get Business Central version 28.2 automatically.
- Existing customers are notified when update 28.2 is available so they can schedule the update. Learn more in [Schedule an update](../administration/tenant-admin-center-update-management.md#schedule).

> [!NOTE]
> The rollout of Business Central online version 28.2 in Thailand (TH) is currently delayed and is expected to start within a few days.

### On-premises customers

The upgrade path depends on your current major version. Select the instructions that match your deployment:

- **Version 28**: Follow the instructions in [Install a Business Central 2026 release wave 1 update](../upgrade/upgrading-cumulative-update-v28.md).
- **Version 27 and earlier**: Learn more about upgrading to version 28 in [Upgrading to Dynamics 365 Business Central 2026 release wave 1](../upgrade/upgrade-overview-v28.md).

## Good to know

### Share your feedback

Remember to share feedback directly with Microsoft from inside Business Central. This capability is available for most Copilot and agent features, such as Chat, Sales Order Agent, and Payables Agent, as well as select other features including Shopify Connector and Quality Management.

To submit feedback, select the feedback links or like (thumbs up) or dislike (thumbs down) icons in the UI, as shown in the examples in the Shopify Shops page and Chat with Copilot:

:::image type="content" source="../developer/media/chat-feedback.png" alt-text="Shows how to submit feedback in the Chat pane":::

The feedback form lets you:

- Provide detailed feedback describing what did or didn't work as expected
- Add supporting details such as screenshots, file attachments, or screen recordings
- Indicate whether Microsoft may contact you for follow-up

Your feedback helps us improve the product and prioritize future enhancements.

### Change AI models for agents (preview)

Agents in Business Central can run on different AI models. The model an agent uses can affect its behavior, performance, and results. Multiple models can be available at the same time, and each agent can either use a specific model or rely on the automatic (default) model selection.

You can choose and change the AI model used by agents. Learn more in [AI Models for Agents (preview)](../ai/ai-agent-models.md).

### Evaluate agent behavior with the Evaluation framework

Use the Evaluation framework to test and validate Copilot and agent behavior in Business Central. Learn more in [Evaluation](../developer/ai-test-copilot-testtool.md).

## Copilot and agent data movement across geographies

Beginning July 1, 2026, Business Central environments on version 28.0 or later in some countries/regions might process Copilot and agent requests in a different Azure geography. Manage data processing preferences on the **Copilot & agent capabilities** page.

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
