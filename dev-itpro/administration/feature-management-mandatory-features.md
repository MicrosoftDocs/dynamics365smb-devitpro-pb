---
title: Optional features now mandatory
description: Learn about the features that were optional but are now mandatory.
author: brentholtorf
ms.author: bholtorf
ms.reviewer: jswymer
ms.topic: conceptual
ms.date: 10/24/2023
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

## Features becoming generally available in 2023 release wave 2

The following features are generally available. However, they aren't turned on by default, so to use them your administrator must manually enable them.

|Feature  |Description  |
|---------|---------|
|[Feature Update: Enable use of new extensible invoice posting engine](/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/extend-general-ledger-posting-aggregations)  |Regulations in different countries/regions and industries, and customer business practices, might require a change to how general ledger entries are aggregated during posting. We remove the dependencies from the Invoice Posting Buffer table in the base application and build an invoice posting component with an interface and an extensible enum for the implementation setup. This refactoring makes the posting process for sales, purchase, and service transactions extensible. Partners can also change the way the posting algorithm aggregates G/L entries—for example, by specific document lines, posting groups, or any tax setup that is required by local legislation. Partners can replace customizations by using the interface for G/L invoice posting, resolve legacy issues for the Invoice Posting Buffer table, and use their own implementation of G/L invoice posting.<br><br>   |

|Feature  |Description  |
|---------|---------|
|[Feature Update: Enable use of new extensible exchange rate adjustment, including posting review](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/adjust-exchange-rates-easily-replace-built-in-batch-job)  |**Note:** This feature update will become generally available in the first update for 2023 release wave 2.<br><br>When companies operate in multiple countries or regions, it's important that they can do business and run financial reports in more than one currency. Because exchange rates often change, businesses must periodically update the rates in [!INCLUDE [prod_short](../developer/includes/prod_short.md)]. This feature update gives accountants additional control over how they adjust exchange rates. At the same time, it allows partners to extend and customize an exchange rate adjustment to meet the needs of specific industries or markets.  |

|Feature  |Description  |
|---------|---------|
|[Feature Update: Enable Tri-State locking in AL](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/performance-gain-reducing-locks-database)  |The tri-state locking feature is aimed at enhancing the performance and concurrency of database transactions. By enabling this feature, AL-based read operations that follow write operations are performed optimistically, rather than with strict consistency and low concurrency. Consequently, users can expect higher levels of concurrency and fewer blocked or failed operations while accessing data. [Learn more about tri-state locking](../developer/devenv-tri-state-locking.md).  |


## Features becoming mandatory in 2023 release wave 2

These features are now mandatory and can no longer be disabled. Use the links to learn more about them in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans.

|Feature  |Description  |
|---------|---------|
|[Feature Preview: Analysis mode, quickly analyze data directly in Business Central](/dynamics365/release-plan/2023wave2/smb/dynamics365-business-central/analyze-group-pivot-data-list-pages-using-multiple-tabs)  |End users and data analysts can analyze data from list pages directly in the client without the need to open the page in Excel or run a report. The ability to analyze data directly in list pages raises the bar for what you can do without having to switch applications, while still allowing customers and partners to do more in report objects, Excel, Power BI, or other data analysis applications.  |

<!--

Coming soon...

|Feature  |Description  |
|---------|---------|
|**Feature Update: Use the platform table 'Report Layout List' for adding and selecting layouts in the 'Report Selection' pages**  | Users can choose which report layout to use on the request page. This will make it easier to use different report layouts for different purposes, especially for Excel layouts. |

-->

|Feature  |Description  |
|---------|---------|
|[Feature Preview: Create AI-powered product descriptions with Copilot](/dynamics365/release-plan/2023wave1/smb/dynamics365-business-central/drive-sales-ai-generated-product-descriptions) | Great products deserve great marketing, but authoring compelling product descriptions for dozens or even hundreds of similar products for your online store requires time, skill, and creativity. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] accelerates time to market with AI-generated product descriptions, right from where you manage your inventory. We've streamlined the end-to-end process, starting from uploading a picture to [!INCLUDE [prod_short](../developer/includes/prod_short.md)], to AI-powered suggestions for marketing copy based on your product attributes such as color and material, to publishing that to your online store with just a few clicks. |

|Feature  |Description  |
|---------|---------|
|[Feature: Enable using Form 1096 to transmit paper Tax Forms to the IRS in the United States](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/irs-1096-form-united-states)  |Form 1096 is used to transmit paper forms 1097, 1098, 1099, 3921, 3922, 5498, and W-2G to the IRS. You can now run the Form 1096 report and send it to the IRS if this is required for them. Because [!INCLUDE [prod_short](../developer/includes/prod_short.md)] reports only Form 1099, the new Form 1096 is related only to any already transmitted 1099 paper forms.  |

|Feature  |Description  |
|---------|---------|
|[Feature Update: Legacy list views are hidden](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/legacy-list-views-are-hidden)  | Legacy views are list views that were created by developers in previous versions of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] by placing them on the role center page. [!INCLUDE [prod_short](../developer/includes/prod_short.md)] displays legacy views side by side with modern views directly on the list page, but legacy views offer a degraded experience and fewer options compared to modern views.|

|Feature  |Description  |
|---------|---------|
|[Feature Update: Auto-save with every field change](/dynamics365-release-plan/2022wave2/smb/dynamics365-business-central/auto-save-as-work)  | [!INCLUDE [prod_short](../developer/includes/prod_short.md)] immediately saves changes to individual fields as soon as you tab away from the field or set focus to another element on the page, instead of only saving when the page is closed. Changes are saved to the database without any noticeable impact to performance. |

|Feature  |Description  |
|---------|---------|
|[Feature: Enable using of Service Declaration (Intrastat for Services)](/dynamics365/business-central/finance-how-setup-use-service-declaration)  | In some EU countries/regions, authorities require that businesses report the export of services to other EU countries/regions. The Service Declaration extension lets you collect information about service trade in the EU and report it to the authorities. Although it's named Service Declaration, you can also use it as Intrastat for Services. This extension is available for all EU countries/regions as a W1 version, and it can be used as-is in Belgium.  |

|Feature  |Description  |
|---------|---------|
|[Feature Update: Standardized bank reconciliation and deposits.](/dynamics365-release-plan/2022wave1/smb/dynamics365-business-central/standardizing-bank-reconciliation-process-north-american-versions?branch=main&branchFallbackFrom=pr-en-us-2746)|Bank reconciliation in the North American (NA) versions for the United States, Canada, and Mexico can be done either through the standard **Bank Reconciliation** page or with the **Bank Rec. Worksheet** page, which was missing some of the newer features that the **Bank Reconciliation** page offers. To standardize the bank reconciliation process, we have modified the **Bank Reconciliation** page, added a feature for deposits that is the same as we provide for the NA version today, and added capabilities to allow users to reconcile deposits.|

### Features postponed from becoming mandatory in 2023 Release Wave 2

The change to making these features mandatory is postponed. They aren't turned on by default and must be enabled manually. Use the links to learn more about them in the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] release plans.

|Feature  |Expected to be mandatory release wave |
|---------|---------|
|[Use new sales pricing experience](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/use-new-sales-pricing-experience-)     | 2025 release wave 1        | 

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
|[Use new sales pricing experience](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/use-new-sales-pricing-experience-)     |**Note:** This feature was originally scheduled to become mandatory in 2024 release wave 1. It's now expected to become mandatory in 2025 release wave 1.        |
|[New Microsoft Word report rendering platform](/dynamics365/business-central/dev-itpro/developer/devenv-howto-report-layout)     | 2024 release wave 1        |
|[Replace Multiple Interest Rate CZ with Finance Charge Interest Rate](/dynamics365/business-central/receivables-collect-outstanding-balances)| 2025 release wave 2 |

## See Also

[Enabling Upcoming Features Ahead of Time](feature-management.md)  
[Deprecated Features in the Base App](../upgrade/deprecated-features-w1.md)