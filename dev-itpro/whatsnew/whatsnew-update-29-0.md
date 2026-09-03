---
title: What's New or Changed in Business Central 2026 release wave 2 - Update 29.0 preview
description: Get an overview of new and changed capabilities in the 29.0 update of Business Central online, which is part of 2026 release wave 2.
ms.author: jswymer
ms.date: 09/01/2026
ms.reviewer: jswymer
ms.topic: whats-new
author: jswymer
ms.custom:
    - bap-template
---

# Update 29.0 public preview for Business Central 2026 release wave 2

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

This article provides an overview of new and updated features in update 29.0 public preview, which applies only to Business Central online sandbox environments and not to production or on-premises environments.

More features and information about on-premises deployments will be added to this article when version 29.0 is generally available in October 2026. <!-- Learn more about all features planned for 2026 release wave 2 (version 29) in [Plan and prepare for Dynamics 365 Business Central in 2026 release wave 2](/dynamics365/release-plan/2026wave2/smb/dynamics365-business-central).-->

> [!IMPORTANT]
> - The features in this article are preview features.
> - Preview features aren't meant for production use and might have restricted functionality. These features are subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520), and are available before an official release so that customers can get early access and provide feedback.

## New and updated features

This table lists new and updated features in update 29.0. Select a linked feature name to learn more. Additional details aren't available for every feature. Features are no longer linked to release plans. Learn more in [New AI at Work roadmap instead of Release Plans](#new-ai-at-work-roadmap-instead-of-release-plans).

| Product area | Feature | Description |
| --- | --- | --- |
| Copilot and agents |[Improve purchase order matching in Payables Agent](preview-feature-details.md#copilot-and-agents-improve-purchase-order-matching-in-payables-agent) | Improve purchase order matching in Payables Agent with line amounts and expected receipt dates. Align draft finalization with the Receipt on Invoice settings. |
| | Run data queries with MCP Server | Use new MCP tools to define, validate, and run custom data queries. Your MCP application can then query data for which no existing APIs exist. |
| Country/region | [Cash document – sending by e‑mail in Czechia](preview-feature-details.md#countryregion-cash-document--sending-by-email-in-czechia) | Issue, post, and email Czech receipt cash documents using standard document sending profiles. |
| | [Compensation – sending by e‑mail in Czechia](preview-feature-details.md#countryregion-compensation--sending-by-email-in-czechia) | Businesses can share compensations by email directly from Business Central. |
| | [Proforma Invoice Report with Czech Layout in Czechia](preview-feature-details.md#countryregion-proforma-invoice-report-with-czech-layout-in-czechia) | Use the enhanced Draft Invoice and Pro Forma Invoice reports with additional details and an improved layout for pre-posting approval processes. |
| | [Separate setup for automatic dimensions in Czechia](preview-feature-details.md#countryregion-separate-setup-for-automatic-dimensions-in-czechia) | Use a new framework that automates how you create and maintain default dimensions with migration from existing setups. |
| Development | Access application links through ModuleInfo | Read help, EULA, privacy statement, and locale-aware context-sensitive help links from an app manifest at runtime through additional ModuleInfo properties. |
| | Actions on reports and pages can now inherit tooltips | Tooltips on page or report objects are now inherited into actions that run those pages. This means you only need to write descriptive tooltips in one place and have it propagated out to all usage of the object. |
| | AL developers can turn indexes on/off in AL code. | AL developers can now turn indexes off/on from AL code. |
| | Audit AL app accessibility and debugging boundaries | Build and query static AL call graphs to trace public-to-internal calls, debugging boundaries, elevated code, and cross-app relationships, with visual exports. |
| | Build extensible and data-driven AL test suites | Create parameterized AL tests from reusable data sources, and attach lifecycle handlers for shared setup, cleanup, logging, measurement, and test reporting. |
| | Check records for uncommitted changes | Use the Record API IsDirty property to determine whether a record instance contains unsaved changes before deciding to validate, save, or otherwise process it. |
| | Configure AL MCP workspaces dynamically | Start the AL MCP server without a predefined project, add AL projects at runtime, and use configured connection details in headless scenarios without authentication prompts. |
| | Control transaction isolation for queries and isolated storage | Read only committed data in AL queries and choose the isolation level for isolated-storage reads, including row locking for safer read-modify-write operations. |
| | Debug recorded Business Central failures with an AI agent | Describe a failing scenario to an AI agent, record the next matching Business Central session or a known session, and collect its snapshot for offline AL debugging. |
| | Detect tables approaching SQL column limits | Receive compiler warnings when tables or table extensions contain many normal fields, helping identify data models that are approaching SQL extensibility limits. |
| | Developers can define indexes that span fields from a base table and its table extensions | The new data model for storing fields from table extensions allows developers to define keys across fields from the base table and table extensions. |
| | Diagnose AL MCP server activity with file logging | Write AL MCP server diagnostics to a configurable file, select the appropriate detail level for troubleshooting, or turn file logging off when it isn't required. |
| | Discover objects in connected Business Central environments | Search objects installed in a connected Business Central environment, including owning-app metadata needed to add dependencies and download the correct symbols. |
| | Evolve AL interfaces with default implementations | Add default method bodies to AL interfaces so existing implementors continue working, then use RequiredPending and analyzer rules to introduce required methods safely. |
| | Get clearer guidance for AL object structure | Use compiler diagnostic AL0926 to identify AL object sections declared in the wrong order instead of interpreting multiple secondary and less specific parser errors. |
| | Let agents allocate free AL object IDs | Let coding agents find available IDs for AL objects and extension objects within project ranges, reducing manual range checks and collisions with existing project objects. |
| | Migrate table fields from Integer to BigInteger | Increase an existing table field from Integer to BigInteger while receiving compiler and analyzer warnings for dependent expressions that might narrow or overflow values. |
| | Profile slow Business Central sessions with AI agents | Let an AI agent schedule profiling for a Business Central session, collect CPU and memory data, identify costly AL paths, and summarize SQL and HTTP activity. |
| | Restrict global symbol resolution to a minor version | Configure global symbol downloads to remain within the major and minor version in app.json while still selecting the newest available patch for all dependencies. |
| | Run AL tests from command-line and CI/CD workflows | Use ALTool to compile, deploy, and run AL test projects from scripts or pipelines, with structured JSON results for test methods and pass, fail, and skip counts. |
| | Simplify AL extension setup and authentication in Visual Studio Code | Automatically acquire the required .NET runtime and use Visual Studio Code authentication by default, reducing manual setup across local and browser-hosted environments. |
| | Track AL compiler diagnostics in automated builds | Have ALTool workspace builds write structured, project-specific compiler error logs that automated systems can retain, analyze, and use for code-quality tracking. |
| | Translate objects with the same name in different namespaces | Generate namespace-aware translation identifiers so identically named AL objects can be translated independently while existing non-namespaced translations remain valid. |
| | Use AL language intelligence from AI agents and other editors | Run the standalone AL language server to provide completion, navigation, references, rename, formatting, and other project-aware LSP features outside Visual Studio Code. |
| | Use cross-platform report layout paths | Use either forward slashes or backslashes in report layout and analysis-view paths so the same AL source compiles consistently on Windows and Linux systems. |
| Ecommerce | [Control sales document creation for Shopify orders and returns](preview-feature-details.md#ecommerce-control-sales-document-creation-for-shopify-orders-and-returns) | Set Use Shopify Order No. and Process Returns as on the Shopify Shop Card, then review contacts before you choose Create Sales Document. |
| | [Keep Shopify connections current](preview-feature-details.md#ecommerce-keep-shopify-connections-current) | Use Shopify's July 2026 API, activate secure access tokens, and use clearer synchronization diagnostics with Skipped Records and API Errors cues. |
| | [Manage Shopify B2B companies, catalogs, and pricing](preview-feature-details.md#ecommerce-manage-shopify-b2b-companies-catalogs-and-pricing) | Map company tax identifiers, manage B2B catalogs, and control price synchronization for capabilities available with your Shopify plan. |
| | [Match Shopify tax lines with the Tax Matching Agent](preview-feature-details.md#ecommerce-match-shopify-tax-lines-with-the-tax-matching-agent) | Review suggested tax jurisdictions, confidence levels, and rate differences on the Tax Match Review page before you process sales document with sales tax. |
| | Process Shopify order changes, exchanges, and refunds | Keep edited and exchanged Shopify orders aligned when you create sales documents and process refunds. |
| | [Synchronize tariff numbers and countries/regions of origin with Shopify](preview-feature-details.md#ecommerce-synchronize-tariff-numbers-and-origin-values-with-shopify) | Turn on Sync HS Code and Country of Origin on the Shopify Shop Card page to include tariff numbers and countries or regions of origin into the product synchronization tasks. |
| Electronic documents | [Exchange EDI documents via E-Documents](preview-feature-details.md#electronic-documents-exchange-edi-documents-via-e-documents) | Send and receive electronic documents (orders, payments) seamlessly through E-Documents using the Peppol BIS 3 EDI standard for secure, efficient data exchange. |
| Expense Agent | [Add data range and different vehicle types in your mileage calculation in Expense Agent](preview-feature-details.md#expense-agent-add-data-range-and-different-vehicle-types-in-your-mileage-calculation-in-expense-agent) | Configure mileage rates by effective date range and vehicle type to ensure accurate calculations that reflect changing policies and transportation methods |
| | [Add interim approver when submit the expense report](preview-feature-details.md#expense-agent-add-interim-approver-when-submit-the-expense-report) | Enable interim approvers for expense reports, allowing submissions to be routed through a temporary reviewer before final approval |
| | [Calculate withholding taxes automatically in expense report](preview-feature-details.md#expense-agent-calculate-withholding-taxes-automatically-in-expense-report) | Automatically calculate employee withholding taxes within expense reports to improve compliance, reduce manual effort, and ensure accurate reimbursement process |
| | [Expense Agent supports approval process](preview-feature-details.md#expense-agent-expense-agent-supports-approval-process) | Review submitted expense reports with AI-based policy validation that flags suspicious or noncompliant items across lines and reports. |
| | [Improve duplicates prevention in Expense Agent](preview-feature-details.md#expense-agent-improve-duplicates-prevention-in-expense-agent) | Improve expense accuracy with enhanced duplicate detection and prevention even with already posted documents, helping to reduce duplicate reimbursements |
| | [Manage travel requisitions with Expense Agent](preview-feature-details.md#copilot-and-agents-manage-travel-requisitions-with-expense-agent) | Plan and approve travel in advance using travel requisitions with support for multiple travelers and integrated approval workflows. |
| Financial Management | [Calculate multiple excise duties per item](preview-feature-details.md#financial-management-calculate-multiple-excise-duties-per-item) | Support multiple excise duties on a single item, enabling businesses to calculate and manage complex excise tax requirements with greater accuracy. |
| | [Calculate withholding taxes for vendors](preview-feature-details.md#financial-management-calculate-withholding-taxes-for-vendors) | You can calculate withholding tax for vendors in the standard version of Business Central. |
| | [Enable accelerated depreciation methods for fixed assets](preview-feature-details.md#financial-management-enable-accelerated-depreciation-methods-for-fixed-assets) | Introduce accelerated depreciation for fixed assets, enabling compliant calculations and reporting. |
| | [Set up vendor specific number series for self-billing invoices](preview-feature-details.md#financial-management-set-up-vendor-specific-number-series-for-self-billing-invoices) | Configure vendor-specific number series for self-billing purchase invoices to meet supplier requirements and improve invoice traceability and compliance. |
| | [Use withholding taxes with employee transactions](preview-feature-details.md#financial-management-use-withholding-taxes-with-employee-transactions) | Enable withholding tax processing for employee-related transactions, ensuring accurate tax calculation, posting, and compliance across employee payments |
| Governance and administration | Administrators can turn SIFT indexes on/off | Administrators can now turn SIFT indexes on/off directly in the Business Central application. |
| | Monitor usage of Open in Excel with telemetry | Logging Open in Excel actions to telemetry makes data export events auditable, which can be critical for compliance, security investigations, and understanding how customers use Business Central. |
| Reporting and data analysis | Automate report outputs | Use the new APIs on the report inbox to extend automation with Power Automate or MCP to reports. |
| | Bookmark list views and analysis tabs | Bookmark analysis tabs and list views to your role center and/or incorporate them into profiles. |
| | Brand document reports with report themes | With the new composable layouts feature, you can apply a report theme on layouts to get consistent look and feel on the PDF output. It is possible to set defaults on a global level, per company, per report, or per layout, giving the administrator full flexibility of theming. |
| | Control the lifecycle of all report layouts | Set status on all types of layouts to control which layouts are available to end users. |
| | Design document report themes with the updated Word add-in | Design document report themes using the new document samples controls in the Word add-in |
| | Design document reports with the updated Word add-in | Use new design components in the Word add-in to layout your document report layouts. |
| | Design header/footer layouts for document reports with the updated Word add-in | Design document report header/footer layouts using the new header and/or footer document samples controls in the Word add-in |
| | Financial report changes are now always logged | Changes to financial row, column, and report definitions are automatically recorded in the change log for easier auditing. |
| | Reduce complexity of report datasets | Word layouts now include a company information dataitem that is shared across all report datasets. This reduces the work needed for a report developer and standardizes how company information is used across report layouts. |
| | Reuse header/footer layouts across document reports | With the new composable layouts feature, you can apply a header/footer on layouts to get consistent look and feel on the PDF output. It is possible to set defaults on a global level, per company, per report, or per layout, giving the administrator full flexibility of theming. |
| | Run multiple financial reports and get a single PDF output | Define report packs that contain multiple financial reports, and then run them immediately or schedule delivery to report inboxes or by email. |
| | Trace G/L account usage in finance reports | Financial report authors can now identify uncategorized accounts, trace account usage and calculations, and preview definitions before publishing |
| | Use conditional visibility in the updated Word add-in | Design document reports layouts with conditional visibility using the new HideIf logic control in the Word add-in |
| | Use system audit fields in analysis mode and in profiles | Use system audit fields in analysis tabs and add them directly to pages in profiles. |
| Service and platform | Faster data loading with improved data model for table extensions | With the new data model for table extensions, all fields on an AL table are stored in the same table in the database. This gives faster performance on all database operations that involve table extensions. |
| Supply chain management | [Carry subcontracting instructions into purchase orders](preview-feature-details.md#supply-chain-management-carry-subcontracting-instructions-into-purchase-orders) | Give subcontractors the right operation instructions by carrying routing comments and attachments into purchase orders. |
| | [Migrate Italian legacy subcontracting data to the Subcontracting app](preview-feature-details.md#supply-chain-management-migrate-italian-legacy-subcontracting-data-to-the-subcontracting-app) | Complete open WIP transfers and purchase orders, then move setup, prices, and active document references in a sandbox and verify record counts before running migration in production. |
| | [Post direct transfer orders from warehouse-enabled locations](preview-feature-details.md#supply-chain-management-post-direct-transfer-orders-from-warehouse-enabled-locations) | Use direct transfer orders for source locations that require inventory picks or warehouse shipments. |
| | [Reduce manual work in quality tests and inspections](preview-feature-details.md#supply-chain-management-reduce-manual-work-in-quality-tests-and-inspections) | Finishing an inspection fills in passed and failed quantities. Actionable posting errors let you jump to blocking inspection. Editing an inspection prompts you to assign it to yourself. |
| | [Set up and explore subcontracting more easily](preview-feature-details.md#supply-chain-management-set-up-and-explore-subcontracting-more-easily) | Configure subcontracting with assisted setup and notifications that open missing vendor or location setup. Contoso demo data helps evaluate different subcontracting scenarios. |
| | [Use inventory put-aways and picks for subcontracting](preview-feature-details.md#supply-chain-management-use-inventory-put-aways-and-picks-for-subcontracting) | Basic warehouse configurations now support subcontracting, so employees can process this work alongside their regular inbound and outbound activities. |
| | [Work more efficiently with manufacturing documents and capacity calendars](preview-feature-details.md#supply-chain-management-work-more-efficiently-with-manufacturing-documents-and-capacity-calendars) | Create released orders from Planning Worksheet, monitor and update capacity calendars, and open production BOMs and routings from actionable errors. |
| Sustainability Management | [Add EUDR certification information](preview-feature-details.md#sustainability-management-add-eudr-certification-information) | Add EUDR for Item and track EUDR Items with Item Tracking, fulfill EUDR details on Lot Information |
| | [Estimate your carbon footprint in Service Management](preview-feature-details.md#sustainability-management-estimate-your-carbon-footprint-in-service-management) | Show an estimated carbon footprint on service invoices and related documents using sustainability data from items and resources in Service Management. |
| | [Reverse Sustainability Ledger entrie transaction](preview-feature-details.md#sustainability-management-reverse-sustainability-ledger-entrie-transaction) | Reverse sustainability ledger entries posted from sustainability or general journals, directly from the Sustainability Ledger Entries page. |
| | [Track your carbon footprint for fixed assets](preview-feature-details.md#sustainability-management-track-your-carbon-footprint-for-fixed-assets) | Enable carbon footprint tracking for fixed assets by adding sustainability accounts and CO₂e values to fixed asset transactions. |
| | [Track your carbon footprint with item journals and item reclassification journals](preview-feature-details.md#sustainability-management-track-your-carbon-footprint-with-item-journals-and-item-reclassification-journals) | Track your carbon footprint in item journals and reclassification journals by adding CO₂e per unit and total emissions, with full value chain traceability. |
| | [Use formulas to calculate emissions in purchase documents](preview-feature-details.md#sustainability-management-use-formulas-to-calculate-emissions-in-purchase-documents) | Calculate CO₂, CH₄, and N₂O in purchase documents using formula‑based inputs and emission factors that mirror sustainability journal logic. |
| | [Use specific method for carbon footprint calculation when enabling Item Tracking](preview-feature-details.md#sustainability-management-use-specific-method-for-carbon-footprint-calculation-when-enabling-item-tracking) | Enable precise carbon footprint calculation using a new Specific tracking method for items that you track with serial or lot numbers. |
| User experiences | Agent actions review notifications on lists | Show and manage documents where agents require human interaction by using a new review bar on documents and lists. |
| | Manage agent permissions easier | Assign additional permissions to agents when they request them. |
| | [Preview images directly in web client](preview-feature-details.md#user-experiences-preview-images-directly-in-web-client) | Preview an image without having to leave the Business Central app. |
| | Show recently searched in Tell Me | Find pages and reports faster by accessing recent searches in Tell Me (<kbd>Alt</kbd>+<kbd>Q</kbd>). |
| | [Show recently used in lookups](preview-feature-details.md#user-experiences-show-recently-used-in-lookups) | Accelerate data entry by using smart lookup suggestions that display your most recently accessed records for quick selection. |
| | Updates to Agent UI experience | Manage agents more easily by grouping avatars and using a dedicated action to start new tasks. |

## Create new sandbox environment on 29.0 public preview

Creating a new preview environment lets you review new functionality in a clean environment without customer data, setup, or customizations. To create a new preview environment, follow the instructions in [Create a new environment](../administration/tenant-admin-center-environments.md#create-a-new-environment). Set the environment type to **Sandbox** and the version to **29.0 preview**.

## Update existing sandbox environment to 29.0 public preview

> [!NOTE]
> Updating a sandbox environment to a preview version lets you test the update with your extensions installed.

Updating an existing sandbox environment to a preview version lets you review new functionality in an environment that might contain your own data, setup, and customizations. To update an existing sandbox, follow the instructions in [Schedule an update for an environment](../administration/tenant-admin-center-update-management.md#schedule). Set the version to **29.0 preview**.

## Good to know

### New AI at Work roadmap instead of Release Plans

Starting in September 2026, Microsoft stops publishing [Release Plans](/dynamics365/release-plans/). New Business Central capabilities will be published to the [AI at Work roadmap](https://aka.ms/AIatWorkRoadmap). Existing release plans remain available for historical reference until further notice. Learn more about the roadmap and disclosure changes at [One always-on roadmap: Dynamics 365, Power Platform and Dataverse join the AI at Work roadmap](https://aka.ms/ReleasePlannerMigrationBlog).

### Want to stay informed about upcoming Business Central releases?

Join the [Business Central Partner Announcements community on Viva Engage](https://engage.cloud.microsoft/main/org/microsoft.com/groups/eyJfdHlwZSI6Ikdyb3VwIiwiaWQiOiIyMzgwNDkxMjQzNTIifQ) to receive the latest updates, release overviews, and announcements from Microsoft. If you're not yet a member, request access here: [https://aka.ms/BCVivaSignUp](https://aka.ms/BCVivaSignUp)

### Duration and deletion of public preview environments

The public preview runs from the first week of September until update 29.0 becomes generally available in the first week of October. During this period, you can create new sandbox environments on the preview version or update existing sandbox environments to it.

Microsoft automatically deletes preview sandbox environments 30 days after update 29.0 becomes generally available&mdash;sometime in early November 2026. You can't update a preview environment to a different version.

Learn more about public preview in [Prepare for major updates with preview environments](../administration/preview-environments.md).

<!-- 
### Business Central Launch Edition - 2026 release wave 2

The Business Central Launch Edition for 2026 release wave 2 is in October 2026. Learn more at [aka.ms/BCLE](https://aka.ms/BCLE).
-->

### Discover all partner related resources

Are you a partner who wants a list of relevant resources? Learn more in [Resources for Partners](https://aka.ms/BCAll).

### Discover all user related resources

Are you a user who wants a list of relevant resources? Learn more in [Resources for users](https://aka.ms/BCUsers).

## Related information
