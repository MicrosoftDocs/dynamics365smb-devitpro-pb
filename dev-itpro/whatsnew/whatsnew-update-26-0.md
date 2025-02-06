---
title: Update 26.0 for Microsoft Dynamics 365 Business Central 2025 release wave 1
description: Get an overview of new and changed capabilities in the 26.0 update of Business Central online, which is part of 2025 release wave 1.
ms.author: jswymer
ms.date: 01/27/2025
ms.reviewer: jswymer
ms.topic: conceptual
author: jswymer
ms.custom: 
    - bap-template
---

# Update 26.0 for Microsoft Dynamics 365 Business Central online 2025 release wave 1

This article provides an overview of new features and general information about update 26.0.

## Features

The following table lists the new features planned for 26.0. For a comprehensive feature list and details, see [Plan and prepare for Dynamics 365 Business Central in 2025 release wave 1](/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/).

<!--
| Product area             | Feature                                                               |
|-------------------------------|----------------------------------------------------------------------------|
| Application                   | Integrate Field Service with service management                            |
|                               | View item availability in Field Service work orders                        |
| Commerce                      | Delete incorrect e-documents and avoid duplicates                          |
|                       | Activate sales channels in Shopify Connector                               |
|                       | Send e-documents via a service and email simultaneously                    |
|                       | Import and export more data using Shopify metafields                       |
|                       | Use payments with the E-Document framework                                 |
|                       | Troubleshoot export issues on Shopify Skipped Records page                 |
|                       | Generate multiple incoming e-documents for multiple attachments            |
|                       | Automate embedded attachments in PEPPOL                                    |
|                       | Use Logiq as a service provider for e-documents                            |
|                       | Create e-documents from posted sales invoices                              |
|                       | Process e-documents in two steps                                           |
|                       | Use the latest update for the Shopify connector                            |
|                       | Preview incoming e-invoices prior to processing                            |
|                       | Use e-documents to fix unposted purchase documents                         |
| Copilot and AI                | Enhance purchase order line matching with Copilot                          |
| Country and regional          | Posting cash documents to projects in Czech localization                   |
|           | Extended text on cash documents in Czech localization                      |
|           | Calculate and post VAT settlement by Activity Code - Italy                 |
|           | Use Peppol PINT A-NZ format in E-documents in Australia and New Zealand    |
|           | Calculate GST on recurring journals for India                              |
|           | Define allowed languages per environment                                   |
|           | Use new Contoso Coffee Demo Dataset CZ in Czechia                          |
|           | Use the payment times reporting in Australia                               |
|           | Use Functional Currency in Czech localization to support to the VAT return |
|           | Use modern search in Czech applications                                    |
|           | Hide rows with zero quantity in Czech document reports                     |
| Development                   | Move tables and fields with data across extensions as part of refactoring  |
|                    | Select extensions to open in Visual Studio Code from the web client        |
|                    | Troubleshoot clients, apps, and add-ins with telemetry                     |
|                    | Mock outbound HttpClient web service calls during testing                  |
|                    | View build metadata in Extension Management page                           |
|                    | Use new properties on a report layout                                      |
|                    | Embed Power BI content in web client with new page type                    |
|                    | Generate launch json from web client                                       |
| Financial Management          | Analyze subscription billing data with Power BI reports                    |
|           | Require people to set Intrastat classifications on documents               |
|           | Check total purchase amounts on documents                                  |
| Governance and administration | Add support for MultiSubnetFailover                                        |
|  | Support IPv6 for enhanced security and scalability                         |
| Reporting and data analysis   | Enhance reports with PDF post-processing capabilities                      |
|    | Use enhanced analytics for manufacturing                                   |
|    | Access report and request metadata in Word layouts                         |
|    | Use enhanced Financial Reporting capabilities                              |
|    | Use new templates for financial reporting                                  |
| Service and platform          | Calculate values only for visible FlowFields                               |
| Supply chain management       | Use enhanced customer document layout for service management               |
|        | Cancel production order that have consumption                              |
|        | Add more columns to various pages to gain more insight                     |
|        | Allow multiple people to post inventory at the same time                   |
|        | Experience improved usability in manufacturing                             |
|        | Receive project items with receipts or put-aways                           |
|        | Block items or variants from production output                             |
|        | Avoid document number errors when you post project journals                |
|        | Handle production output with warehouse put-aways                          |
|        | Reopen finished production orders                                          |
|        | Use streamlined product design tools in manufacturing                      |
|        | Print barcodes from production order                                       |
|        | Manage document attachments in manufacturing                               |
|        | Edit item tracked items in Excel on output, consumption, and item journals |
| Sustainability Management     | Specify default sustainability values for various entities                 |
|      | Use enhanced analytics for Sustainability                                  |
|      | Capture sustainability data with general journals                          |
|      | Use water and waste management with sustainability                         |
|      | Enable sustainability Scope 3 value chain for assembly and transfers       |
|      | Provide carbon equivalent data for sales based on Scope 3 automation       |
|      | Start value chain in purchase process for Scope 3 in sustainability        |
|      | Use sustainability Scope 3 value chain in manufacturing                    |
|      | Use the new Out of scope emission category                                 |
| User experiences              | Preview PDF attachments directly in web client                             |
|               | Optimize screen estate usage on the web                                    |
|               | Allow adjusting the width of the FactBox pane                              |
|               | Use user interface enhancements for better experience                      |-->


| Product area             | Feature                                                               |
|-------------------------------|----------------------------------------------------------------------------|
| Application                   | [Integrate Field Service with service management](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/integrate-field-service-service-management)                            |
|                               | [View item availability in Field Service work orders](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/view-item-availability-field-service-work-orders)                        |
| Commerce                      | [Delete incorrect e-documents and avoid duplicates](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/delete-incorrect-e-documents-avoid-duplicates)                          |
|                       | [Activate sales channels in Shopify Connector](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/activate-sales-channels-shopify-connector)                               |
|                       | [Send e-documents via a service and email simultaneously](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/send-e-documents-service-email-simultaneously)                    |
|                       | [Import and export more data using Shopify metafields](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/import-export-more-data-using-shopify-metafields)                       |
|                       | [Use payments with the E-Document framework](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-payments-e-document-framework)                                 |
|                       | [Troubleshoot export issues on Shopify Skipped Records page](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/troubleshoot-export-issues-shopify-skipped-records-page)                 |
|                       | [Generate multiple incoming e-documents for multiple attachments](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/generate-multiple-incoming-e-documents-multiple-attachments)            |
|                       | [Automate embedded attachments in PEPPOL](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/automate-embedded-attachments-peppol)                                    |
|                       | [Use Logiq as a service provider for e-documents](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-logiq-service-provider-e-documents)                            |
|                       | [Create e-documents from posted sales invoices](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/create-e-documents-posted-sales-invoices)                              |
|                       | [Process e-documents in two steps](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/process-e-documents-two-steps)                                           |
|                       | [Use the latest update for the Shopify connector](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-latest-update-shopify-connector)                            |
|                       | [Preview incoming e-invoices prior to processing](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/preview-incoming-e-invoices-prior-processing)                            |
|                       | [Use e-documents to fix unposted purchase documents](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-e-documents-fix-unposted-purchase-documents)                         |
| Copilot and AI                | [Enhance purchase order line matching with Copilot](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enhance-purchase-order-line-matching-copilot)                          |
| Country and regional          | [Posting cash documents to projects in Czech localization](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/posting-cash-documents-projects-czech-localization)                   |
|           | [Extended text on cash documents in Czech localization](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/extended-text-cash-documents-czech-localization)                      |
|           | [Calculate and post VAT settlement by Activity Code - Italy](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/calculate-post-vat-settlement-activity-code-italy)                 |
|           | [Use Peppol PINT A-NZ format in E-documents in Australia and New Zealand](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-peppol-pint-a-nz-format-e-documents-australia-new-zealand)    |
|           | [Calculate GST on recurring journals for India](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/calculate-gst-recurring-journals-india)                              |
|           | [Define allowed languages per environment](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/define-allowed-languages-per-environment)                                   |
|           | [Use new Contoso Coffee Demo Dataset CZ in Czechia](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-contoso-coffee-demo-dataset-cz-czechia)                          |
|           | [Use the payment times reporting in Australia](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-payment-times-reporting-australia)                               |
|           | [Use Functional Currency in Czech localization to support to the VAT return](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-functional-currency-czech-localization-support-vat-return) |
|           | [Use modern search in Czech applications](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-modern-search-czech-applications)                                    |
|           | [Hide rows with zero quantity in Czech document reports](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/hide-rows-zero-quantity-czech-document-reports)                     |
| Development                   | [Move tables and fields with data across extensions as part of refactoring](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/move-tables-fields-data-across-extensions-part-refactoring)  |
|                    | [Select extensions to open in Visual Studio Code from the web client](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/select-extensions-open-visual-studio-code-web-client)        |
|                    | [Troubleshoot clients, apps, and add-ins with telemetry](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/troubleshoot-clients-apps-add-ins-telemetry)                     |
|                    | [Mock outbound HttpClient web service calls during testing](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/mock-outbound-httpclient-web-service-calls-during-testing)                  |
|                    | [View build metadata in Extension Management page](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/view-build-metadata-extension-management-page)                           |
|                    | [Use new properties on a report layout](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-properties-report-layout)                                      |
|                    | [Embed Power BI content in web client with new page type](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/embed-power-bi-content-web-client-new-page-type)                    |
|                    | [Generate launch json from web client](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/generate-launch-json-web-client)                                       |
| Financial Management          | [Analyze subscription billing data with Power BI reports](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/analyze-subscription-billing-data-power-bi-reports)                    |
|           | [Require people to set Intrastat classifications on documents](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/require-people-set-intrastat-classifications-documents)               |
|           | [Check total purchase amounts on documents](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/check-total-purchase-amounts-documents)                                  |
| Governance and administration | [Add support for MultiSubnetFailover](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/add-support-multisubnetfailover)                                        |
|  | [Support IPv6 for enhanced security and scalability](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/support-ipv6-enhanced-security-scalability)                         |
| Reporting and data analysis   | [Enhance reports with PDF post-processing capabilities](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enhance-reports-pdf-post-processing-capabilities)                      |
|    | [Use enhanced analytics for manufacturing](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-analytics-manufacturing)                                   |
|    | [Access report and request metadata in Word layouts](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/access-report-request-metadata-word-layouts)                         |
|    | [Use enhanced Financial Reporting capabilities](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-financial-reporting-capabilities)                              |
|    | [Use new templates for financial reporting](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-templates-financial-reporting)                                  |
| Service and platform          | [Calculate values only for visible FlowFields](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/calculate-values-only-visible-flowfields)                               |
| Supply chain management       | [Use enhanced customer document layout for service management](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-customer-document-layout-service-management)               |
|        | [Cancel production order that have consumption](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/cancel-production-order-consumption)                              |
|        | [Add more columns to various pages to gain more insight](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/add-more-columns-various-pages-gain-more-insight)                     |
|        | [Allow multiple people to post inventory at the same time](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/allow-multiple-people-post-inventory-same-time)                   |
|        | [Experience improved usability in manufacturing](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/experience-improved-usability-manufacturing)                             |
|        | [Receive project items with receipts or put-aways](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/receive-project-items-receipts-put-aways)                           |
|        | [Block items or variants from production output](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/block-items-variants-production-output)                             |
|        | [Avoid document number errors when you post project journals](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/avoid-document-number-errors-post-project-journals)                |
|        | [Handle production output with warehouse put-aways](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/handle-production-output-warehouse-put-aways)                          |
|        | [Reopen finished production orders](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/reopen-finished-production-orders)                                          |
|        | [Use streamlined product design tools in manufacturing](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-streamlined-product-design-tools-manufacturing)                      |
|        | [Print barcodes from production order](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/print-barcodes-production-order)                                       |
|        | [Manage document attachments in manufacturing](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/manage-document-attachments-manufacturing)                               |
|        | [Edit item tracked items in Excel on output, consumption, and item journals](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/edit-item-tracked-items-excel-output-consumption-item-journals) |
| Sustainability Management     | [Specify default sustainability values for various entities](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/specify-default-sustainability-values-various-entities)                 |
|      | [Use enhanced analytics for Sustainability](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-enhanced-analytics-sustainability)                                  |
|      | [Capture sustainability data with general journals](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/capture-sustainability-data-general-journals)                          |
|      | [Use water and waste management with sustainability](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-water-waste-management-sustainability)                         |
|      | [Enable sustainability Scope 3 value chain for assembly and transfers](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/enable-sustainability-scope-3-value-chain-assembly-transfers)       |
|      | [Provide carbon equivalent data for sales based on Scope 3 automation](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/provide-carbon-equivalent-data-sales-based-scope-3-automation)       |
|      | [Start value chain in purchase process for Scope 3 in sustainability](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/start-value-chain-purchase-process-scope-3-sustainability)        |
|      | [Use sustainability Scope 3 value chain in manufacturing](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-sustainability-scope-3-value-chain-manufacturing)                    |
|      | [Use the new Out of scope emission category](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-new-out-scope-emission-category)                                 |
| User experiences              | [Preview PDF attachments directly in web client](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/preview-pdf-attachments-directly-web-client)                             |
|               | [Optimize screen estate usage on the web](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/optimize-screen-estate-usage-web)                                    |
|               | [Allow adjusting the width of the FactBox pane](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/allow-adjusting-width-factbox-pane)                              |
|               | [Use user interface enhancements for better experience](https://learn.microsoft.com/en-us/dynamics365/release-plan/2025wave1/smb/dynamics365-business-central/use-user-interface-enhancements-better-experience)                      |

## Upgrade to 26.0

New customers automatically get the latest builds of Business Central (26.0). Existing partners and customers receive an email notification when their environment is upgraded.

## On-premises download packages

Download on-premises files from Microsoft Support at [Update 26.0 for Business Central 2025 release wave 1](https://www.microsoft.com/en-us/download/details.aspx?id=106000).

## Good to know

### Business Central Launch Event videos on YouTube

Visit [aka.ms/BCLE](https://aka.ms/BCLE).

### Discover all partner related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).  
