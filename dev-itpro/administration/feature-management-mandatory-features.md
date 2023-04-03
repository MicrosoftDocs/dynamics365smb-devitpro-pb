---
title: Optional features now mandatory
description: Learn about the features that were optional but are now mandatory.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: jswymer
ms.topic: conceptual
ms.date: 03/23/2023
ms.custom: bap-template
---

# Optional features that are now mandatory

This article provides the following information about optional features, starting with 2023 release wave 1:

* Features that are now mandatory and can't be disabled
* Features that are turned on by default for new customers
* Features that are now generally available
* Features where we postponed making them mandatory

Some of the features or design improvements in major and minor updates are optional and aren't immediately enabled. You can learn about these features in the release plans and documentation and decide whether your administrator should turn them on. To learn more about optional features, go to [Enabling Upcoming Features Ahead of Time](feature-management.md).

However, these features are only optional for a while. The period in which they're optional typically starts when the update they're made in becomes generally available. The period ends when the features become mandatory and are automatically enabled. The approximate date and service update when we expect to make each optional feature mandatory is shown in the **Automatically enabled from** field on the **Feature Management** page. After that date, the feature will no longer appear on the Feature Management page, and you can't turn it off. To learn more about the optional period, go to [Example timeline for an optional feature](feature-management.md#example-timeline-for-an-optional-feature).

## Features becoming mandatory in 2023 release wave 1

These features are now mandatory and can no longer be disabled. Use the links to learn more about them in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans.

|Feature  |Description  |
|---------|---------|
|[Check Documents and Journals while you work](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/check-documents-journals-background)     | To alert you about issues with data in documents and journals that can prevent you from posting, we've introduced validations that identify issues right away. Early, unobtrusive visual indications of a problem can help improve productivity and save time. You can still control documents and check journal data for all users by turning on the **Enable Data Check** toggle on the **General Ledger Setup** page or, for individual users, by choosing **Enable Data Check** on the **My Notifications** page.        |
|[Auto-accept transactions for intercompany journals](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/intercompany-postings-have-auto-accept-transaction-enabled-intercompany-general-journals)     | Intercompany postings make accounting for two or more companies easier for a centralized finance department or bookkeepers in intercompany partner companies. We've automated the task of accepting general journals, which removes several manual steps in the intercompany accounting process.        |
|[Use currency symbol in data synchronization with Dataverse](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/use-currency-symbol-data-synchronization-dataverse)     | Including currency symbols with amounts makes it easier to visually scan and understand financial figures. If your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] is integrated with Microsoft Dataverse, you can now synchronize currency symbols between the two apps.        |
|[Map to Dataverse option sets such as payment terms, freight terms, and shipping agents without code](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/map-dataverse-option-sets-such-as-payment-terms-freight-terms-shipping-agents-without-code)    | Payment terms, shipment methods, and shipping agents can change along with the environments in which businesses operate. To react quickly to changing business conditions, businesses must be able to quickly and cost effectively change their payment, shipping, or freight policies across their business systems.        |
|[Log emails using a shared mailbox and Graph API](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/log-emails-using-shared-mailbox-graph-api)     | Get more out of the communications between salespeople and your existing or potential customers by tracking email exchanges and turning them into actionable opportunities. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] can work with Microsoft Exchange Online to keep a log of the inbound and outbound messages.        |
|[Item variant code on demand forecasts](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/item-variant-code-demand-forecasts)     | Accurate demand forecasting gives businesses valuable insight into their position in the market, which helps decision makers shape their strategies for pricing, business growth, and market potential. The ability to include the right level of detail on item variants in demand forecasts unlocks planning capabilities and reduces lead times for companies that don't have an inflow of sales orders and manage many nearly identical items.        |
|[Support inventory pick and warehouse pick operations for jobs](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/support-inventory-pick-warehouse-pick-operations-jobs)     | Businesses can switch on warehouse activities for jobs to help drive an effective flow through the warehouse and to organize and maintain inventory.        |
|[Report read-only data access](/dynamics365/business-central/admin-data-access-intent)     | You can set up [!INCLUDE [prod_short](../developer/includes/prod_short.md)] to use read-only replicas of the primary (read-write) database. Using the database replica reduces the load on the primary database. In some cases, it will also improve the performance when viewing data in the client. Replicas benefit objects, like reports, queries, and API pages, that are used for viewing data only, not modifying data.        |
|[Unlock time sheets in Business Central using assisted setup and data entry on mobile devices](/dynamics365-release-plan/2021wave2/smb/dynamics365-business-central/unlock-time-sheets-business-central-using-assisted-setup-data-entry-mobile-devices)     | Getting to that first time sheet entry should be as painless as possible. Many employees use time sheets. As the time sheet administrator or manager, you want to make sure that [!INCLUDE [prod_short](../developer/includes/prod_short.md)] has you covered when you create time sheets for the first time, or you add an employee or resource to record the time spent on tasks.A busy professional on the road using mobile devices (Android or iOS) needs to be able to provide time sheet entries in an easy and productive way while on the go.        |

### Features enabled by default in 2023 release wave 1

These features are turned on by default for new customers, but you can still manually disable them. Use the links to learn more about them in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans.

|Feature  |Description  |
|---------|---------|
|[Convert user group permissions](/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/manage-user-permissions-using-security-groups)     | As businesses grow and change, managing permissions can become increasingly complex. Security groups can simplify the process by allowing administrators to group users by department, job function, or other criteria, and assign permissions to the group as a whole. Using security groups to manage permissions can save time and reduce the risk of human error. Security groups allow for easier management of access control, ensuring that users only have access to the resources they need. This can also streamline the process of onboarding new employees or contractors, as they can be quickly added to the appropriate security groups.        |
|[New approval workflow experience with Power Automate templates](/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/new-approval-workflow-experience-templates-power-automate)     | Advanced and flexible approval workflows don't need to be complex. Business owners or decision makers can choose from multiple templates when they set up approval workflows in [!INCLUDE [prod_short](../developer/includes/prod_short.md)].        |

### Features becoming generally available in 2023 release wave 1

These features are now generally available. They aren't turned on by default and must be enabled manually. Use the links to learn more about them in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans.

* [Replace the existing Automatic Account Codes functionality with the new Automatic Account Codes extension](/dynamics-nav-app/localfunctionality/sweden/automatic-account-codes)
* Use new customer and item templates in Shopify instead of the generic templates
* [Enable using SIE Audit Files Exports](/dynamics365/business-central/localfunctionality/sweden/how-to-import-and-export-data-in-standard-import-export-format)

### Features postponed from becoming mandatory in 2023 Release Wave 1

The change to making these features mandatory is postponed. They aren't turned on by default and must be enabled manually. Use the links to learn more about them in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans.

|Feature  |Expected to be mandatory release wave |
|---------|---------|
|[Use tracking by package number in reservation and tracking system](/dynamics365/business-central/inventory-how-setup-item-tracking)     |  2024 release wave 1       |
|[Use new sales pricing experience](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/use-new-sales-pricing-experience-)     | 2024 release wave 1        |
|[New Microsoft Word report rendering platform](/dynamics365/business-central/dev-itpro/developer/devenv-howto-report-layout)     | 2024 release wave 1        |
|[Replace Multiple Interest Rate CZ with Finance Charge Interest Rate](/dynamics365/business-central/receivables-collect-outstanding-balances)| 2025 release wave 2 |

## See Also

[Enabling Upcoming Features Ahead of Time](feature-management.md)  
[Deprecated Features in the Base App](../upgrade/deprecated-features-w1.md)