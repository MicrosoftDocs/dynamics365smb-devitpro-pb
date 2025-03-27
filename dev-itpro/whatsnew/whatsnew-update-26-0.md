---
title: What's new or changed in Business Central 2025 release wave 1 update 26.0
description: Get an overview of new and changed capabilities in the 26.0 update of Business Central online, which is part of 2025 release wave 1.
ms.author: jswymer
ms.date: 01/27/2025
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.custom: 
    - bap-template
---

# What's new or changed in Business Central 2025 release wave 1 update 26.0

This article provides an overview of new features, changed features, and general information about the 2025 release wave 1 (update 26.0).

## New features

This table lists the features in public preview or general availability for version 26.0. For a comprehensive feature list and details, refer to [Plan and prepare for Dynamics 365 Business Central in 2025 release wave 1](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central).



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
1. Slect table you just cretaed.
1. Copy thi prompt in chat:

In the table, make each feature name in the Feature column a markdown link. Follow these steps for each row in the column:
 
1. Identify the markdown file name in "Release Plan URL" column.
2. Create a relative link on the text in the "Feature" column using the format: [<text>](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/<markdown file name>. 
3. Omit .md in the link

When all the links have been created, remove the "Release Plan URL" column from the table, so the table only has the format:

-->

| Product Area              | Feature                         |
|---------------------------|----------------------------------|
| Application               | [Integrate Field Service with service management](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/integrate-field-service-service-management) |
|                           | [View item availability in Field Service work orders](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/view-item-availability-field-service-work-orders) |
|                           | [Use improved troubleshooting options for cost adjustments](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/improved-performance-enhanced-troubleshooting-options-cost-adjustment-runs) |
|                           | <!--[Edit price lists in Excel](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/edit-price-lists-excel)--> Edit price lists in Excel|
| Commerce                  | [Import and export more data for Shopify B2B companies and company locations](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/import-export-more-data-shopify-b2b-companies-company-locations) |
|                           | [Activate sales channels in Shopify Connector](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/activate-sales-channels-shopify-connector) |
|                           | [Import and export more data using Shopify metafields](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/import-export-more-data-using-shopify-metafields) |
|                           | [Troubleshoot export issues on Shopify Skipped Records page](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/troubleshoot-export-issues-shopify-skipped-records-page) |
|                           | [Use the latest update for the Shopify connector](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-latest-update-shopify-connector) |
| Copilot and AI            | [Enhance purchase order line matching with Copilot](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enhance-purchase-order-line-matching-copilot) |
|                           | [Summarize with Copilot](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/summarize-record-copilot) |
|                           | [Autofill fields with Copilot](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/autofill-fields-copilot) |
| Country and regional      | [Post cash documents to projects in Czech localization](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/post-cash-documents-projects-czech-localization) |
|                           | [Add more text in cash documents in Czech localization](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/add-more-text-cash-documents-czech-localization) |
|                           | [Use Peppol PINT A-NZ format for e-documents in AU and NZ](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-peppol-a-nz-format-e-documents-australia-new-zealand) |
|                           | [Calculate GST on recurring journals for India](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/calculate-gst-recurring-journals-india) |
|                           | [Showcase Business Central with Czech localization demos](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/showcase-business-central-czech-localization-demos) |
|                           | [Use VAT Return to report VAT in local and functional currencies in Czech Republic](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-vat-return-report-vat-local-functional-currencies-czech-republic) |
|                           | [Use modern search to access data in Czech localization](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-modern-search-access-data-czech-localization) |
|                           | [Hide lines with zero quantity in Czech document reports](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/hide-lines-zero-quantity-czech-document-reports) |
|                           | [Define allowed languages per environment](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/define-allowed-languages-per-environment) |
| Development               | Manage external files more easily through a unified API in the External File Storage module <!--[Manage external files more easily through a unified API in the External File Storage module](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/manage-external-files-unified-api-external-file-storage-module)--> |
|                           | [Troubleshoot clients, apps, and add-ins with telemetry](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/troubleshoot-clients-apps-add-ins-telemetry) |
|                           | [Validate certificates on external web service endpoints called from AL HttpClient](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/validating-certificates-external-web-service-endpoints-called-al-httpclient) (controlled by **Feature Management**)|
|                           | [Use new properties on a report layout](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-properties-report-layout) |
|                           | [Embed Power BI content in web client with new page type](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/embed-power-bi-content-web-client-new-page-type) |
|                           | [Overloaded JsonObject data type GetValue method](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/overloaded-jsonobject-data-type-getvalue-method) |
|                           | [Move tables and fields with data across extensions as part of refactoring](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/move-tables-fields-data-across-extensions-as-part-refactoring) |
|                           | [Extend CardPageId on list and listpart pages](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/extend-cardpageid-list-listpart-pages) |
|                           | [Use the new continue keyword for AL loops](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-continue-keyword-al-loops) |
|                           | [Read and write YAML in AL using JsonObject](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/read-write-yaml-al-using-jsonobject) |
|                           | [Select extensions to open in Visual Studio Code from the web client](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/select-extensions-open-visual-studio-code-web-client) |
|                           | [Mock outbound HttpClient web service calls during testing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/mock-outbound-httpclient-web-service-calls-during-testing) |
|                           | [Search, navigate and use app symbols as context for GitHub Copilot](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/search-navigate-use-app-symbols-as-context-github-copilot) |
|                           | [View build metadata in Extension Management page](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/view-build-metadata-extension-management-page) |
|                           | [Work with multiline strings in AL](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/work-multiline-strings-al) |
|                           | [Self-service App Key Vault onboarding for AppSource apps](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/self-service-app-key-vault-onboarding-appsource-apps) |
|                           | [Use new IncStr parameter to change integers by more than 1 in string variables](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-incstr-parameter-change-integers-more-than-1-string-variables) |
|                           | [Convert simple type values to text using new ToText method](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/convert-simple-type-values-text-using-new-totext-method) |
|                           | [Create lists and dictionaries of interfaces in AL](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/create-list-dictionary-interfaces-al) |
|                           | [Generate launch json file from the web client](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/generate-launchjson-file-web-clientjson-file-from-the-web-client) |
|                           | [Running objects in actions defaults to UI descriptors on target object](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/running-objects-actions-defaults-caption-tooltip-abouttext-abouttitle-target-object) |
| Documents                 | [Generate multiple incoming e-documents for multiple attachments](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/generate-multiple-incoming-e-documents-multiple-attachments) |
|                           | [Automate embedded attachments in PEPPOL](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/automate-embedded-attachments-peppol) |
|                           | [Use Logiq as a service provider for e-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-service-providers-e-documents-framework) |
|                           | [Use ExFlow by SignUp connector for e-documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-exflow-signup-connector-e-documents) |
|                           | [Process e-documents in two steps](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/process-e-documents-two-steps) |
|                           | [Extend E-Documents features using a new interface](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/extend-e-documents-features-using-new-interface) |
| Financial Management      | [Require Intrastat classifications on documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/require-intrastat-classifications-documents) |
|                           | [Check total purchase amounts on documents](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/check-total-purchase-amounts-documents) |
| Governance and administration | [Link to Power Platform to use Copilot Studio messages](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/link-power-platform-use-copilot-studio-messages) |
|                           | [Add support for MultiSubnetFailover](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/add-support-multisubnetfailover) |
|                           | Enhanced index troubleshooting <!-- [Enhanced index troubleshooting](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enhanced-index-troubleshooting)--> |
| Reporting and data analysis   | Use enhanced analytics for inventory <!-- [Use enhanced analytics for inventory](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-analytics-for-inventory)--> |
|                           | [Enhance reports with PDF post-processing capabilities](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enhance-reports-pdf-post-processing-capabilities) |
|                           | [Validate report layouts for errors as an admin](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/validate-report-layouts-errors-as-admin) |
|                           | [Access report and request metadata in Word layouts](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/access-report-request-metadata-word-layouts) |
|                           | [Use enhanced Financial Reporting capabilities](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-financial-reporting-capabilities) |
| Service and platform          | [Calculate values only for visible FlowFields](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/calculate-values-only-visible-flowfields) (controlled by **Feature Management**)|
| Supply chain management       | [Reschedule production orders within a safety lead time](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/reschedule-production-orders-within-safety-lead-time) |
|                           | [Use enhanced customer document layout for service management](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-customer-document-layout-service-management) |
|                           | [Cancel production orders that have consumption](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/cancel-production-orders-that-have-consumption) |
|                           | [Add more columns to various pages to gain more insight](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/add-more-columns-various-pages-gain-more-insight) |
|                           | [Experience improved usability in manufacturing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/experience-improved-usability-manufacturing) |
|                           | [Enable overpicking for production orders](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enable-over-picking-production-orders) |
|                           | [Achieve greater accuracy in manufacturing costing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/achieve-greater-accuracy-manufacturing-costing) |
|                           | [Omit warehouse pick for manual flushing methods](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/omit-warehouse-pick-manual-flushing-methods) (controlled by **Feature Management**)|
|                           | [Receive project items with receipts or put-aways](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/receive-project-items-receipts-or-put-aways) |
|                           | [Block items or variants from production output](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/block-items-or-variants-production-output) |
|                           | [Avoid document number errors when you post project journals](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/avoid-document-number-errors-when-post-project-journals) |
|                           | [Handle production output with warehouse put-aways](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/handle-production-output-warehouse-put-aways) |
|                           | [Reopen finished production orders](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/reopen-finished-production-orders) |
|                           | [Use streamlined product design tools in manufacturing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-streamlined-product-design-tools-manufacturing) |
|                           | [Print barcodes from production orders](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/print-barcodes-production-orders) |
|                           | [Manage document attachments in manufacturing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/manage-document-attachments-manufacturing) |
|                           | [Use Edit in Excel on output, consumption, and item journals](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/edit-item-tracked-items-excel-output-consumption-item-journals) |
|                           | [Combine service shipments on a single service invoice](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/combine-service-shipments-single-service-invoice) |
|                           | [Allow multiple people to post inventory at the same time](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/allow-multiple-people-post-inventory-at-same-time) (controlled by **Feature Management**) |
|                           | [Create demo data for Subscription Billing with demo data tool](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/create-demo-data-subscription-billing-contoso-demo-data-tool) |
|                           | [Create subscription contract lines manually](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/create-subscription-contract-lines-manually) |
|                           | [Add unit cost in subscription lines](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/add-unit-cost-subscription-lines) |
|                           | [Track and rebill quantity changes in subscriptions](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/track-rebill-quantity-changes-subscriptions) |
|                           | [Align Subscription Billing with standard user experience and terminology](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/align-subscription-billing-standard-user-experience-terminology) |
| Sustainability Management     | [Specify default sustainability values for various entities](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/specify-default-sustainability-values-various-entities) |
|                           | [Capture sustainability data with general journals](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/capture-sustainability-data-general-journals) |
|                           | [Use water and waste management with sustainability](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-water-waste-management-sustainability) |
|                           | [Enable sustainability Scope 3 value chain for assembly and transfers](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enable-sustainability-scope-3-value-chain-assembly-transfers) |
|                           | [Provide carbon equivalent data for sales based on Scope 3 automation](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/provide-carbon-equivalent-data-sales-based-scope-3-automation) |
|                           | [Start value chain in purchase process for Scope 3 in sustainability](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/start-value-chain-purchase-process-scope-3-sustainability) |
|                           | [Use refreshed demo data for Sustainability](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-refreshed-demo-data-sustainability) |
|      | [Use sustainability Scope 3 value chain in manufacturing](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-sustainability-scope-3-value-chain-manufacturing) |
|      | [Use the new Out of Scope emission category](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-out-scope-emission-category) |
| User experiences              | [Preview PDF attachments directly in web client](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/preview-pdf-attachments-directly-web-client) |
|              | [Adjust the FactBox pane width](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/allow-adjusting-factbox-pane-width) |
|              | [Use user interface enhancements for better experience](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-user-interface-enhancements-better-experience) |

## Changes to optional features in Feature Management

This section outlines changes to feature and feature updates controlled by **Feature management** in version 26.0.

### Features now mandatory and removed from feature management

- [Feature Update: Enable use of new extensible exchange rate adjustment, including posting review](https://go.microsoft.com/fwlink/?linkid=2187318)
- [Feature Update: Enable use of new extensible invoice posting engine](https://go.microsoft.com/fwlink/?linkid=2187318)
- [Feature Update: Replace the existing EU 3-Party Trade Purchase functionality with the new EU 3-Party Trade Purchase extension](https://go.microsoft.com/fwlink/?linkid=2235119)
- [Feature: Enable legacy locking scheme in AL](https://go.microsoft.com/fwlink/?linkid=2244711)
- [Feature: Enable using bulk operations for Shopify connector](https://go.microsoft.com/fwlink/?linkid=2242514)

### New features added and enabled by default

- [Feature Update: Convert the manufacturing flushing method 'Manual', so that it no longer requires picking.](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/omit-warehouse-pick-manual-flushing-methods)
- [Feature: Disable SOAP web services on Microsoft UI pages](../developer/devenv-disable-soap-microsoft-pages-feature-key.md)<!-- missing rp-->
- [Feature: Enable server certificate validation for HTTP requests](../developer/devenv-httpcertvalid-feature-key.md)

### New features added and disabled by default

- [Feature Update: Enable multiple users to post item ledger entries and value entries at the same time](https://go.microsoft.com/fwlink/?linkid=2299833) 
- [Feature Update: Enable multiple users to post job ledger entries at the same time](https://go.microsoft.com/fwlink/?linkid=2299833)  <!-- missing rp-->
- [Feature Update: Enable multiple users to post resource ledger entries at the same time entries at the same time](https://go.microsoft.com/fwlink/?linkid=2299833)  <!-- missing rp-->
- [Feature: Calculate only visible FlowFields](../developer/calculate-only-visible-flowfields-feature-key.md)
- [Feature: Enables advanced navigation (not data) search capabilities by utilizing semantic similarity search on application metadata](../developer/semantic-search-feature-key.md)<!-- missing rp-->

## On-premises download packages

Download on-premises files from Microsoft Support at Update 26.0 for Business Central 2025 release wave 1 (link not yet available)

## Upgrade to 26.0 for online customers

New customers automatically get the latest builds of Business Central (26.0). Existing partners and customers receive an email notification when their environment is upgraded.

## Good to know

### Business Central Launch Event

The Business Central Launch Event for the Business Central 2025 release wave 1 is on April 1, 2025. Learn more at [aka.ms/BCLE](https://aka.ms/BCLE).

### Discover all partner related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).  
