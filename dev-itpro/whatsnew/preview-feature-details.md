---
title: Feature details in update 29.0 public preview for 2026 release wave 2
description: Feature details for Business Central 2026 release wave 2
ms.date: 09/03/2026
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: concept-article
ROBOTS: NOINDEX
---

# Feature details for Business Central 2026 release wave 2 public preview

This article provides details about the features available in the Business Central 2026 release wave 2.

## Adapt faster with Power Platform

### Map new Dataverse fields in Business Central

This feature simplifies how administrators keep Business Central and Dataverse aligned as Dataverse schemas evolve. Previously, exposing new or existing custom Dataverse fields required creating or updating a table extension (PTE) in the integration layer. Based on partner and customer feedback, this update removes that dependency.

When a new field is added in Dataverse—such as a custom field in Dynamics 365 Sales—you can now map the field directly from the **Integration Table Mappings** page. You can refresh the Dataverse field list, add the field to an existing mapping, select the corresponding Business Central field, define the synchronization direction, and enable it for data synchronization. Once enabled, the field participates in sync without modifying extensions or recreating mappings.

![<!--alt text start -->Shows the new integration mappings page in Business Central<!--alt text end -->](media/dataverse-mappings.png "Shows the new integration mappings page in Business Central")

This enhancement reduces configuration overhead and supports faster adoption of custom Dataverse fields, especially for organizations that frequently customize their Dataverse environments.

Business Value: 
As an administrator, you can map newly added Dataverse fields without recreating table extensions or writing code, reducing configuration effort and supporting faster adoption of custom fields and solutions. This improvement makes it easier to keep Business Central and Dataverse aligned as Dataverse schemas change.

Learn more in [Add table and field mappings to existing integration tables](/dynamics365/business-central/admin-how-to-modify-table-mappings-for-synchronization#add-table-and-field-mappings-to-existing-integration-tables).

## Copilot and agents

### Enable Microsoft Copilot chat experience

The updated Microsoft Copilot chat experience introduces a modern, consistent, and intuitive interface that aligns Business Central with the broader Microsoft Copilot ecosystem. The enhancement modernizes the chat panel, streamlines navigation, and improves user workflows by adopting familiar interaction patterns from Microsoft Copilot.

This update benefits users who regularly interact with Copilot to accelerate daily tasks - especially operations managers, accountants, sales representatives, and administrators who rely on conversational assistance to navigate and analyse data. It also provides a more predictable experience across Microsoft 365 applications, reducing onboarding time and helping organizations adopt AI capabilities more systematically.

Business Value:
The updated Copilot chat experience provides a familiar and consistent AI experience across Business Central and Microsoft applications. You get started faster, switch more easily between applications, and interact with AI more confidently, helping improve productivity and accelerate adoption.

Learn more in [Chat with Copilot (preview)](/dynamics365/business-central/chat-with-copilot).

### Improve purchase order matching in Payables Agent

This feature improves PO matching quality in Payables Agent and aligns draft finalization behavior with existing posting controls.

The agent uses an enriched **PO Lines** list page during matching that includes these fields:

- Line Amount - enables matching on value, not just description and quantity. This field is especially valuable for service lines where quantity (often just 1) isn't a meaningful discriminator.
- Expected Receipt Date - helps the agent factor in timing when multiple PO lines could match.

By using these fields, the agent can more reliably distinguish between similar-looking PO lines, which improves accuracy in first-pass matches.

The agent now respects the app's *Never block draft finalization* setting in the **Receipt on Invoice** field on purchase orders. This change means the agent doesn't block draft finalization because a matched PO line isn't yet marked as received. Whether goods are received is a posting time control, not a draft time control. The "Receipt on Invoice" setting on the order governs this behavior at posting.

The "Receipt on Invoice" field is already available on purchase orders. With this release, we're expanding this setting to more entities:

- A new vendor-level "Receipt on Invoice" setting is introduced and automatically applied to new purchase orders created for a vendor.
- A new PO-line-level "Receipt on Invoice" setting allows per-line override. The inheritance chain for the setting is vendor, then purchase order, and then purchase order line, but each level can override the parent.

We've also improved draft warnings. When the agent creates a purchase invoice draft matched to a PO, the draft surfaces warnings based not just on quantity, but also on amount. The draft warnings are for information only and don't block finalization. For example, they warn about the discrepancies in the draft and you can decide how to proceed.

Learn more in [Payables Agent process flow](/dynamics365/business-central/payables-agent#payables-agent-process-flow).

### Manage agent permissions easier

Assign additional permissions to agents when they request them.

Learn more in [Prerequisites](/dynamics365/business-central/supervise-agent-tasks#prerequisites).

### Manage tasks from all agents in dedicated task pane

This feature introduces a dedicated task pane in Business Central that displays all tasks generated by the agents. 

The task pane appears as an additional panel in the user interface and can be opened from anywhere in Business Central. Tasks include suggestions, validations, follow‑ups access to draft documents, and other agent‑initiated actions. Users can review task details, navigate directly to the affected record, complete tasks, or dismiss them.

This improvement primarily benefits roles that rely heavily on AI‑driven workflows, such as accountants, sales people, and managers who often engage with multiple agents throughout the day. The task pane reduces friction by collecting all insights in a single location, minimizing missed tasks and improving throughput.

Business Value: 
The Show all agent tasks on a separate task pane feature help organizations get more value from Microsoft Copilot in Business Central by giving users a single, structured place to review and act on AI‑generated tasks. Instead of relying on notifications scattered across different pages, users gain a clear, consolidated overview of all tasks created by agents working in finance, purchasing, sales, and operations.

Learn more in [Review from the Tasks pane](/dynamics365/business-central/supervise-agent-tasks#review-from-the-tasks-pane).

### Review content generated by agents directly on pages

This improvement introduces the ability for Business Central users to review and approve content generated by agents directly on the pages where they work. You no longer need to navigate to separate task pane to understand that a given document was created by an agent. Instead, agent‑generated suggestions, such as descriptions, text proposals, or field‑specific update, appear inline where they can be evaluated and modified before being applied.

By keeping the review process within the page context, users maintain flow, reduce clicks, and ensure content quality with minimal disruption. The feature builds on existing Business Central autofill user interface patterns ensuring admins and users can adopt it as part of existing agent‑powered daily workflows.

Business Value:
The ability to review agent‑generated content directly on pages helps organizations streamline their daily work while maintaining accuracy and control. You can evaluate suggestions in the context of the task you are performing, reducing interruptions and improving the quality of the final output.

Learn more in [Review directly on pages](/dynamics365/business-central/supervise-agent-tasks#review-directly-on-pages).

### Run data queries with MCP Server

Use new MCP tools to define, validate, and run custom data queries. Your MCP application can then query data for which no existing APIs exist.

Learn more in [Model Context Protocol (MCP) in Business Central](../ai/mcp-overview.md).

### Show avatars for record creators and modifiers in list

This feature introduces visual avatars in Business Central list pages to indicate which user or agent created or last modified a record. The capability enhances traceability and supports collaborative work by making identity information immediately visible without opening the record.

The avatars reflect either a named Business Central user, a system user or an AI agent, following the existing identity model. Users can hover over the avatar to see a tooltip with the full display name and record update timestamp (if available).

This improvement benefits roles that frequently work with shared data&mdash;including accountants, order processors, warehouse staff, service teams, and administrators&mdash;by reducing time spent verifying ownership or responsibility for items, documents, or configuration entries. It also helps organizations adopting AI‑generated records understand when an automated agent has contributed.

The feature surfaces existing **Created By** and **Modified By** fields more intuitively while respecting Business Central's data privacy and permissions model.

Business Value:
Supporting avatars for the users or agents who created and last modified entries makes record ownership clearer and easier to understand across Business Central. By surfacing identity information directly in list pages, you can quickly determine responsibility, follow up with the right person, and work with shared data more confidently.

Learn more in [Display lists in different ways](/dynamics365/business-central/across-display-lists-different-views).

### Updates to Agent UI experience

Manage agents more easily by grouping avatars and using a dedicated action to start new tasks.

Learn more in [Supervise agent activities](/dynamics365/business-central/supervise-agent-tasks).

## Development

### Access application links through ModuleInfo

"Read help, EULA, privacy statement, and locale-aware context-sensitive help links from an app manifest at runtime through additional ModuleInfo properties.

Business value: Extensions can surface application-specific help, legal, and privacy resources dynamically instead of duplicating links in code. Context-sensitive help can also respect the current user's locale, improving support experiences for multilingual deployments."

Learn more in [ModuleInfo data type](../developer/methods-auto/moduleinfo/moduleinfo-data-type.md).


### Actions on reports and pages can now inherit tooltips

Tooltips on page or report objects are now inherited into actions that run those pages. 

This means you only need to write descriptive tooltips in one place and have it propagated out to all usage of the object.

Learn more in [Add tooltips to table and page fields](../developer/devenv-adding-tooltips.md).

### AL developers can turn indexes on/off in AL code.

AL developers can now turn indexes off/on from AL code.

This allows app publishers to ship index management to match their features.

Learn more in [Secondary keys](../developer/devenv-table-keys.md#secondary-keys).

### Audit AL app accessibility and debugging boundaries

"Build and query static AL call graphs to trace public-to-internal calls, debugging boundaries, elevated code, and cross-app relationships, with visual exports.

Business value: Extension developers can understand how public APIs expose internal implementation details and where execution crosses debugging boundaries. This visibility helps teams review extension architecture, reduce unintended API exposure, and identify cases where sensitive values could become inspectable in the debugger. The analysis can run across an app and its dependencies, making it useful for architecture reviews, security assessments, and automated governance in larger extension portfolios."

Learn more in [Graph commands](../developer/devenv-al-tool.md#graph-commands).


### Build extensible and data-driven AL test suites

"Create parameterized AL tests from reusable data sources, and attach lifecycle handlers for shared setup, cleanup, logging, measurement, and test reporting.

Business value: Developers can build more maintainable AL test suites by separating reusable test data and lifecycle behavior from individual test procedures. Data-driven tests reduce duplicated test code, while test handlers provide a consistent way to implement logging, cleanup, performance measurement, and custom reporting across many test codeunits. These capabilities make it easier to expand test coverage, standardize test execution, and understand failures without adding the same setup and instrumentation code to every test."

Learn more in [Add lifecycle handlers to test codeunits](../developer/devenv-test-codeunits-and-test-methods.md#add-lifecycle-handlers-to-test-codeunits).


### Check records for uncommitted changes

"Use the Record API IsDirty property to determine whether a record instance contains unsaved changes before deciding to validate, save, or otherwise process it.

Business value: AL developers can determine whether a record instance has been changed before deciding to save it, validate it, or prompt the user. This can simplify conditional persistence and reduce unnecessary database operations."

Learn more in [Record.IsDirty() Method](../developer/methods-auto/record/record-isdirty-method.md).


### Configure AL MCP workspaces dynamically

"Start the AL MCP server without a predefined project, add AL projects at runtime, and use configured connection details in headless scenarios without authentication prompts.

Business value: AI-agent hosts can start a reusable AL MCP server before the target project is known, then load projects as work begins. This supports flexible agent sessions, shared tooling configurations, and headless automation without requiring a separate server process for every preconfigured workspace."

Learn more in [Add projects at runtime](../developer/devenv-al-tool.md#add-projects-at-runtime).


### Debug recorded Business Central failures with an AI agent

"Describe a failing scenario to an AI agent, record the next matching Business Central session or a known session, and collect its snapshot for offline AL debugging.

Business value: Developers can investigate intermittent or production-only AL failures by describing the problem to an AI agent and reproducing the scenario, without manually configuring and operating the snapshot debugger. The agent arms the recording, monitors its status, and collects the completed snapshot for offline debugging. This guided workflow makes snapshot debugging more accessible and helps support teams capture the execution that caused an error even when the affected session doesn't yet exist."

Learn more in [Snapshot debugging with an AI agent (MCP server)](../developer/devenv-snapshot-debugging.md#snapshot-debugging-with-an-ai-agent-mcp-server).


### Developers can define indexes that span fields from a base table and its table extensions

The new data model for storing fields from table extensions allows developers to define keys across fields from the base table and table extensions.

Learn more in [Secondary keys](../developer/devenv-table-keys.md#secondary-keys).

### Diagnose AL MCP server activity with file logging

"Write AL MCP server diagnostics to a configurable file, select the appropriate detail level for troubleshooting, or turn file logging off when it isn't required.

Business value: Developers and administrators can retain AL MCP server diagnostics for troubleshooting intermittent failures and reviewing agent activity. Configurable verbosity helps capture detailed information during investigation without permanently producing excessive logs."

Learn more in [File logging](../developer/devenv-al-tool.md#file-logging).


### Discover objects in connected Business Central environments

"Search objects installed in a connected Business Central environment, including owning-app metadata needed to add dependencies and download the correct symbols.

Business value: Developers and coding agents can discover AL objects that are installed in the target Business Central environment even when the corresponding symbols haven't yet been downloaded into the workspace. This reduces failed searches and helps agents add the correct app dependency before generating code that uses an object."

Learn more in [Searching the connected environment](../developer/al-agent-tools/al-tool-symbol-search.md#searching-the-connected-environment).


### Evolve AL interfaces with default implementations

"Add default method bodies to AL interfaces so existing implementors continue working, then use RequiredPending and analyzer rules to introduce required methods safely.

Business value: Extension publishers can add behavior to an interface without immediately requiring every implementing extension to change. Default methods provide a compatible implementation, while the new transition attribute and AppSourceCop rules support a managed path toward making a method mandatory in a future version. This reduces disruptive interface upgrades and gives dependent developers time to adopt new contracts."

Learn more in [Default interface methods](../developer/devenv-interfaces-in-al.md#default-interface-methods).


### Get clearer guidance for AL object structure

"Use compiler diagnostic AL0926 to identify AL object sections declared in the wrong order instead of interpreting multiple secondary and less specific parser errors.

Business value: Developers and coding agents receive a direct explanation when sections of an AL object are declared in the wrong order. The clearer diagnostic reduces time spent interpreting secondary parser errors and makes automated code generation easier to correct."

Learn more in [Compiler Error AL0926](../developer/diagnostics/diagnostic-al926.md).


### Let agents allocate free AL object IDs

"Let coding agents find available IDs for AL objects and extension objects within project ranges, reducing manual range checks and collisions with existing project objects. Note that only IDs in connected environment are considered.

Business value: Coding agents can scaffold AL objects without manually reading ID ranges or risking collisions with objects already declared in the project. This makes generated code more reliable and reduces the corrections needed before it compiles."

Learn more in [Get next object ID - al_getnextobjectid](../developer/al-agent-tools/al-tool-get-next-object-id.md).


### Page Scripting enters General Availability

"The oage scripting tool that can be used to record and replay user actions directly in the Business Central web client is moving out of preview to general availability. Thus the tool is fully localized and includes accessibility, usability, and visual improvements. We have also added new capabilitites to select multiple rows in grids and validate text displayed in message and error dialogs. 

Business value: Customers, consultants, and testers can create repeatable user acceptance tests for real business processes without writing AL code. The new support for multi-selection captures bulk workflows accurately, while dialog-text validation turns recordings into meaningful checks of expected messages and errors."

Learn more in [Use page scripting tool for acceptance testing (preview)](../developer/devenv-page-scripting.md).


### Profile slow Business Central sessions with AI agents

"Let an AI agent schedule profiling for a Business Central session, collect CPU and memory data, identify costly AL paths, and summarize SQL and HTTP activity.

Business value: Developers and administrators can investigate slow Business Central sessions with help from an AI agent instead of manually collecting and interpreting performance profiles. The agent can capture the affected session, identify expensive AL call paths, and summarize whether CPU or managed-memory usage contributes to the problem. This guided workflow shortens the time from a reported performance problem to actionable code-level findings, even when the user isn't already debugging the session."

Learn more in [Performance profiling MCP proxy](../developer/devenv-al-tool.md#performance-profiling-mcp-proxy).


### Restrict global symbol resolution to a minor version

"Configure global symbol downloads to remain within the major and minor version in app.json while still selecting the newest available patch for all dependencies.

Business value: Development teams can make symbol restoration more predictable by preventing dependencies from moving to a newer minor release unexpectedly. This helps reproduce builds and test extensions against the intended Business Central minor version while still receiving compatible patch updates."

Learn more in [AL Language extension configuration](../developer/devenv-al-extension-configuration.md).


### Run AL tests from command-line and CI/CD workflows

"Use ALTool to compile, deploy, and run AL test projects from scripts or pipelines, with structured JSON results for test methods and pass, fail, and skip counts.

Business value: Development teams can run AL tests directly from automated build and release pipelines without depending on the MCP server or a manually operated test client. Machine-readable output makes it easier to publish test results, enforce quality gates, and diagnose failures in continuous integration environments. The same command can also be used locally, giving developers and build systems a consistent test-execution workflow."

Learn more in [Run tests](../developer/devenv-al-tool.md#run-tests).


### Simplify AL extension setup and authentication in Visual Studio Code

"Automatically acquire the required .NET runtime and use Visual Studio Code authentication by default, reducing manual setup across local and browser-hosted environments.

Business value: AL developers spend less time installing runtimes and managing separate authentication prompts when setting up Visual Studio Code. The AL extension is also smaller because it no longer includes separate runtime copies for each supported operating system. The streamlined configuration provides a more consistent setup across Windows, macOS, and Linux."

Learn more in [Install the required .NET runtime](../developer/devenv-get-started.md#install-the-required-net-runtime).


### Track AL compiler diagnostics in automated builds

"Have ALTool workspace builds write structured, project-specific compiler error logs that automated systems can retain, analyze, and use for code-quality tracking.

Business value: Development teams can retain structured compiler and analyzer results from workspace builds, making it easier to track code-quality regressions and integrate AL diagnostics with automated alerting and reporting systems."

Learn more in [workspace compile](../developer/devenv-al-tool.md#workspace-compile).


### Translate objects with the same name in different namespaces

"Generate namespace-aware translation identifiers so identically named AL objects can be translated independently while existing non-namespaced translations remain valid.

Business value: Extension developers can translate objects independently when those objects have the same name but belong to different namespaces. This avoids translation identifier collisions and supports broader adoption of namespaces in existing apps."

Learn more in [Namespaces in AL](../developer/devenv-namespaces-overview.md).


### Use AL language intelligence from AI agents and other editors

"Run the standalone AL language server to provide completion, navigation, references, rename, formatting, and other project-aware LSP features outside Visual Studio Code.

Business value: Teams can use full AL language intelligence in AI coding agents and development environments that support the Language Server Protocol (LSP), without requiring Visual Studio Code as the client. This opens AL development to additional editors and agentic workflows while retaining accurate project-aware navigation and refactoring."

Learn more in [AL LSP](../developer/devenv-al-tool.md#al-lsp).


## E-Documents

### Exchange EDI documents

This feature extends the **E-Documents** framework to support Electronic Data Interchange (EDI), which enables organizations to exchange business documents electronically with vendors and partners using widely adopted industry standards. Key capabilities include:

* Leverage the existing E-Documents framework as a unified platform for managing electronic document exchange.
* Enable organizations to send and receive structured business documents without relying on paper-based or manual processes.
* Exchange documents using Peppol BIS 3, which is an often used for electronic procurement and invoicing, but also opened for adding new formats based on local or customer standards.
* Support order exchange, and sending remitannce advices, and is open for additional document types.
* Facilitate standardized document exchange between organizations and vendors.
* Automate the generation, transmission, and processing of electronic business documents.
* Align with regulatory, industry, and partner requirements for electronic document exchange.

By bringing EDI capabilities into e-documents, organizations can modernize their supply chain and procurement processes while using a consistent, scalable approach to electronic business communication.

Learn more in [Available service providers](/dynamics365/business-central/finance-edocuments-connectors#available-service-providers).

## Ecommerce

### Control sales document creation for Shopify orders and returns

#### Business Value

Set Use Shopify Order No. and Process Returns as on the Shopify Shop Card, then review contacts before you choose Create Sales Document.

#### Details

The Shopify connector gives you more control before it creates sales documents.

Although the connector already stores the Shopify order number in dedicated fields on sales documents, using the same document number in Shopify and Business Central can improve traceability across both systems even more.

- Turn on **Use Shopify Order No.** on the Shopify Shop Card to use the Shopify order number as the Business Central sales document number.

> [!NOTE]
> Configure a number series that permits manual numbers. A number conflict can prevent the Shopify order number from being used.

You can also review the contacts that the connector selects for billing, shipping, and order communication before you create the sales document.

- Review and edit sell-to, ship-to, and bill-to contact numbers on the Shopify Order. If the connector doesn't find the right contact, use the lookup to select a different contact for the corresponding customer. The contact fields are hidden by default and can be added through personalization.

Both Shopify and Business Central support advanced return processes, but the original connector implementation represented refunds only as sales credit memos, which doesn't support warehouse return processing. You can now choose which sales document type the connector creates for refunds.

- Use **Process Returns as** to choose whether Shopify refunds create sales credit memos or sales return orders.

> [!NOTE]
> Processing Shopify returns remains unsupported.

Learn more in [Set up the import of orders on the Shopify Shop Card](/dynamics365/business-central/shopify/synchronize-orders#set-up-the-import-of-orders-on-the-shopify-shop-card).

### Keep Shopify connections current

#### Business Value

Shopify regularly retires API versions. Staying current helps prevent avoidable connection interruptions and keeps synchronization compatible with Shopify platform changes. Better operational cues and clearer timestamps help administrators find failures faster and understand whether a value came from Shopify or Business Central.

#### Details

Shopify releases a new API version every three months at the beginning of the quarter, and supports each version for 12 months. The updated versions might contain important changes, so it's important to uptake Shopify API versions in major releases of Business Central. Typically, new versions of APIs increase stability and security, and enable additional capabilities. Starting with this release, Shopify Connector uses the Shopify API that was released in July 2026. This update keeps the integration on a supported API version and includes security changes such as support for expiring offline access tokens for public apps, as well as functional changes, like market-driven shipping methods.

> [!IMPORTANT]
>
> The Shopify Connector released in 2026 release wave 1 (April 2026) relies on API 2026-01, which is supported until December 31, 2026. To continue to use your integration, upgrade to the latest version of Business Central before this date.


##### The connector now supports Shopify's expiring offline access tokens

- Access tokens refresh automatically before their one-hour lifetime expires.
- Refresh tokens rotate and remain valid for up to 90 days.
- Existing non-expiring tokens migrate when the connector needs next authentication.
- If the refresh-token window expires, an administrator must reconnect the shop from the Shopify Shop Card.

##### Operational improvements make synchronization easier to supervise

- A **With errors** view filters the Shopify Log to entries that contain errors.
- The Shopify Activities page shows **Skipped Records** and **API Errors** cues and highlights them when action is needed.
- Product and price synchronization skips invalid item unit-of-measure combinations and records the reason instead of stopping the complete synchronization. Enable logging to retain skipped-record details.
- Suffixes help you to distinguish **Created At (Shopify)** and **Updated At (Shopify)** imported from Shopify from standard audit fields present in Business Central.

Learn more in [What Shopify API is used](/dynamics365/business-central/shopify/shopify-faq#what-shopify-api-is-used).


### Manage Shopify B2B companies, catalogs, and pricing

#### Business Value

Shopify expanded core B2B capabilities to all plans, and the Shopify connector supports company synchronization, B2B order processing, and market catalogs across those plans. The latest improvements make tax identifiers, company records, and catalog pricing easier to configure and help prevent conflicting price synchronization.

#### Details

The following capabilities are available on all Shopify plans:

- **Company synchronization**: Import Shopify B2B companies and company locations and map them to customers in Business Central.
- **B2B order processing**: When a B2B order arrives, the connector identifies the company and resolves the correct bill-to and ship-to customer based on the company location.
- **Market catalogs**: Assign catalogs to B2B markets for price synchronization. Basic, Grow, and Advanced plans support up to three active market catalog assignments. The Plus plan supports unlimited assignments.

Customer and company synchronization includes these improvements:

- Open **Companies** directly from the Shopify navigation group on supported role centers.
- Map Shopify company tax registration IDs to the appropriate customer registration or VAT registration field. In Belgium, the localized mapping uses **Enterprise No.** and avoids conflicting VAT Registration No. validation.
- Use the Country/Region **ISO Code** when the connector selects a Shopify Tax Area for customer or company export. Shopify Tax Area mappings must use the applicable Shopify ISO codes.
- Use updated province data for the Italian provinces formerly named Olbia-Tempio and Carbonia-Iglesias.
- When the same direct company catalog appears for multiple companies, the connector prevents you from synchronizing its prices more than once. If you enable **Sync Prices** on another entry, the connector explains that only one pricing configuration per catalog is used, offers to disable synchronization on the other entries, and recommends market catalogs when you want to link one catalog to multiple B2B companies.
- Use the clearer **B2B Catalog** terminology in company-related captions and tooltips, including **Auto Create B2B Catalog**. The **Get Catalogs** tooltip now explains that companies must be imported before company catalogs can be retrieved.

The following features require an Advanced or Plus plan:

- Direct company catalogs
- Staff member mapping

Learn more in [B2B Companies](/dynamics365/business-central/shopify/synchronize-customers#b2b-companies).

### Process Shopify order changes, exchanges, and refunds

#### Business Value

Keep edited and exchanged Shopify orders aligned when you create sales documents and process refunds.

#### Details

When a Shopify return includes a replacement item, the connector imports the returned item and the exchange item together and adds them to a sales credit memo or sales return order. You can keep both items on the same document or move the exchange item to a new sales document.

##### Example: Process an exchange

A customer orders, pays for, and receives an item. You import and process the Shopify order in Business Central, where it becomes a posted sales invoice. Later, the customer decides that the item doesn't fit and returns it in exchange for a replacement item.

The connector imports the updated Shopify order and its linked refund. When you choose **Create Sales Document**, the connector creates the document type selected in **Process Returns as**: a sales credit memo or sales return order. The returned item has a positive quantity on the new document, and the exchange item has a negative quantity.

You can post the document with both lines, or you can keep the returned item on the credit memo or return order and move the exchange item to a separate sales document. To split the lines before posting:

1. If the credit memo or return order has the **Released** status, choose **Reopen**.
2. Choose **Move Negative Lines**. From a sales credit memo, this action creates a sales invoice by default. From a sales return order, it creates a sales order by default.

The new invoice or order for the replacement remains linked to the originating Shopify order and appears in the **Linked Documents** FactBox.

For exchanges where the replacement costs more, the connector doesn't add an unnecessary balancing refund-account G/L line. A G/L line can still be added for cash rounding.

Learn more in [Set up returns and refunds](/dynamics365/business-central/shopify/synchronize-orders#set-up-returns-and-refunds).

### Synchronize tariff numbers and origin values with Shopify

#### Business Value

Accurate tariff numbers and country/region of origin values support international shipping and customs reporting. Synchronizing these values with Shopify reduces duplicate data entry and helps keep product trade data consistent across both systems

#### Details

Turn on **Sync HS Code and Country/Region of Origin** on the Shopify Shop Card to synchronize tariff numbers and country or region of origin values between Business Central and Shopify. On import, the connector updates values only when the Shopify value resolves to an existing Tariff Number or Country/Region record.

Other product information management improvements provide more control over matching, product status, and variant information:

- Use **Find Mapping by Barcode** to control whether the connector tries barcode matching after the selected SKU mapping strategy fails. The setting is on by default for compatibility and can be disabled when barcodes aren't unique.
- Set **Status for Created Products** now includes new **Unlisted** status. The selected status applies when the connector creates a product in Shopify.
- Add **Compare-at Price** to the Shopify Variants page through personalization to inspect the comparison price used for a variant.
- From an Item Card or Item List, the **Show Product in Shopify** action is also enabled for items exported as variants to Shopify.

Learn more in [Synchronize customs data](/dynamics365/business-central/shopify/synchronize-items#synchronize-customs-data).

## Expense Agent

### Add date ranges and vehicle types in your mileage calculation

Expense Agent now supports advanced mileage rate configuration based on both effective date ranges and vehicle types, enabling more flexible and accurate mileage reimbursement calculations. This enhancement combines mileage rate scheduling with support for differentiated vehicle categories. Key capabilities include additions on the **Mileage Rate Setup page:

* Define mileage rates that are valid only within specific date ranges, allowing organizations to accommodate rate changes over time.
* Configure separate mileage reimbursement rates for different vehicle types, such as cars, motorcycles, electric vehicles, or other organization-defined vehicle categories.
* Automatically apply the correct reimbursement rate based on the travel date and selected vehicle type during mileage expense calculation.
* Support evolving regulatory requirements, company policies, and regional reimbursement standards without requiring manual recalculation of submitted mileage claims.

Administrators can maintain a set of mileage rate records that include both an effective date range and an associated vehicle type. When someone creates a mileage expense, Expense Agent evaluates the trip date and the type of vehicle, and then applies the matching reimbursement rate automatically. This evaluation ensures that mileage claims are calculated using the appropriate rate in effect for the specific travel period and mode of transportation.

Learn more in [Configure a mileage rate](/dynamics365/business-central/expense-management/expense-management-mileage-rate-setup#configure-a-mileage-rate).

### AI-Driven Approvals

Expense Agent can validate submitted expense reports against approval policies written in natural language and provide approvers with guidance during the review process. After an employee submits an expense report, the system evaluates both the overall report and the individual expense lines to detect potential policy violations, suspicious patterns, or situations that might require closer attention. This process supports policies that aren't limited to exact thresholds or fixed numeric conditions, such as when business class travel is allowed, what qualifies as an appropriate business meal, or when exceptions to preferred hotel standards might be acceptable. The result is additional review context that helps approvers make better-informed decisions without replacing the final human approval step.

By running policy validation after submission, the feature can apply controls at the level of a single expense line in the first relese. The feature complements existing approval workflows by highlighting issues, providing context, and helping organizations enforce policy consistently while keeping approvers in control of the final decision.

Learn more in [Understand AI-assisted policy evaluation](/dynamics365/business-central/expense-management/expense-agent-policy-compliance#understand-ai-assisted-policy-evaluation).

### Calculate and report VAT based on expense reports

Expense Agent supports automated VAT handling for expense reports, which cab help simplify tax management and improve reporting accuracy. Key capabilities include:

* **Automatic VAT Calculation**: Expense Agent identifies VAT-relevant expense transactions and calculates applicable VAT amounts based on the information in submitted expense reports.
* **VAT-Aware Expense Processing**: VAT values are incorporated into the expense review and processing workflow, reducing the need for manual tax calculations.
* **Enhanced VAT Reporting**: VAT amounts captured from employee expenses are aggregated and reported, supporting financial reporting and tax recovery processes.
* **Improved Compliance**: Standardized VAT handling helps ensure that expense-related tax calculations apply consistently across the organization.
* **Human in the loop**: If the VAT calculation is enabled for expense reports, accountants must review VAT calculation and confirm that everything is correct before posting it.

Learn more in [Configure general settings](/dynamics365/business-central/expense-management/expense-management-setup#configure-general-settings).

### Calculate withholding tax automatically in expense reports

Organizations can automatically calculate employee withholding taxes (WHT) as part of the expense report process. When employees submit expenses that are subject to withholding tax requirements, the system applies the appropriate tax calculations directly within the expense report workflow. Key capabilities include:

* Automatic withholding tax calculation for employee expense transactions that require tax deductions.
* Calculate single or multiple withholding taxes for each category, based on you setup. Calculations can also be simple or compound.
* Calculate thresholds based on different periods for records, documents,  categories (period accumulation), and total (period accumulation).
* Base calculations on gross or net amounts.

Learn more in [Set up withholding tax](/dynamics365/business-central/finance-set-up-withholding-tax).

### Improve duplicates prevention

Expense Agent can identify and handle duplicated expense submissions. Key capabilities include:

* Enhanced duplicate detection that identifies expenses with matching or highly similar details, such as amount, date, merchant, receipt, or transaction information.
* Proactive guidance that alerts employees when it detects a potential duplicate expense in the current expense report, or one that\s already posted.
* Reduced manual review effort by helping prevent duplicate claims from entering approval and reimbursement workflows.
* Improved expense data integrity through more intelligent validation and comparison of submitted expenses.

Learn more in [Expense Agent Overview for Business Central](/dynamics365/business-central/expense-management/expense-agent-overview).

### More countries and languages

Expense Agent supports more languages and regions, enabling an experience for users in **all countries/regions** where Business Central is available, and adding the following languages: Czech, Dutch, Finish, Icelandic, Italian, Norwegian, and Swedish.

Learn more in [What are the limitations of Expense Agent?](/dynamics365/business-central/expense-management/faqs-expense-agent#what-are-the-limitations-of-expense-agent).


### Use assigned projects only in the web app

Expense Agent web app now uses dedicated resource assignments for projects to determine which projects are available to each user when they create or manage expense entries. Key capabilities include:

* You can asign dedicated resources (employees) to the whole project or to the specific task.
* Display only projects or/and tasks where the user is assigned as a resource.
* Automatically filter project lists based on project-resource relationships.
* Reduce the risk of users selecting projects that aren't relevant to their role or assignments.

Learn more in [Expense Agent Overview for Business Central](/dynamics365/business-central/expense-management/expense-agent-overview).

## Finance

### Calculate multiple excise duties per item

This feature enhances excise tax management by allowing multiple excise duty definitions to be associated with a single item and calculated during transactions.

Key capabilities include:

* Assign multiple excise duty configurations to the same inventory item (i.e, item is liable for both plastic and sugar tax).
* Automatically calculate all applicable excise duties during purchasing and vendor-related transactions.
* Support complex tax scenarios where products are subject to more than one excise levy.
* Reduce the need for manual workarounds, customizations, or separate item records to represent different tax obligations.
* Improve tax accuracy and consistency across purchasing, inventory valuation, and financial reporting processes.

With this enhancement, businesses can model real-world excise tax structures more effectively while maintaining compliance with local regulatory requirements. The system aggregates and applies all configured excise duties for an item, ensuring that tax amounts are calculated consistently and transparently throughout the transaction lifecycle.

Learn more in [Set up items and fixed assets for excise tax](/dynamics365/business-central/finance-set-up-excise-tax#set-up-items-and-fixed-assets-for-excise-tax).

### Use withholding taxes (WHT) with employee transactions

This feature extends withholding tax capabilities to include employee transactions. The feature supports scenarios where employee-related payments or reimbursements are subject to withholding tax requirements and ensures that you accurately process the transactions in the financial system. Key capabilities include:

* Apply withholding tax rules to employee transactions.
* Automatically calculate withholding tax amounts based on configured tax setups.
* Maintain consistent tax treatment across vendor and employee transaction processing.

When someone creates an employee transaction, the system finds the applicable withholding tax configuration and applies the relevant withholding tax treatment. This capabililty enables organizations to meet local tax requirements for employee-related payments while keeping financial records accurate and compliant.

Learn more in [Set up and post employee withholding tax](/dynamics365/business-central/finance-withholding-tax-employees).

### Vendor specific number series for Self-billing Invoices

Organizations that use self-billing often need to follow supplier-specific invoicing requirements, including unique numbering conventions. With this enhancement, users can define and assign dedicated number series for self-billed purchase invoices on a per-vendor basis.

Key capabilities include:

* Set up a unique number series for individual vendors that participate in self-billing arrangements.
* Automatically apply the vendor-specific number series when creating self-billed purchase invoices.
* Maintain separate invoice numbering sequences across different suppliers.
* Improve compliance with vendor agreements and local business requirements that mandate specific invoice numbering practices.
* Reduce manual intervention and the risk of numbering errors during invoice generation.

Learn more in [Use self-billed invoices for vendors](/dynamics365/business-central/purchasing-how-register-new-vendors#use-self-billed-invoices-for-vendors).

## Governance and administration

### Administrators can turn SIFT indexes on/off

Administrators can now turn SIFT indexes on/off directly in the Business Central application.

Learn more in [Manage database index usage](/dynamics365/business-central/manage-indexes).

### Monitor usage of Open in Excel with telemetry

Logging Open in Excel actions to telemetry makes data export events auditable, which can be critical for compliance, security investigations, and understanding how customers use Business Central.

Learn more in [Analyze Open in Excel telemetry](../administration/telemetry-open-in-excel-trace.md).

## Reporting and data analysis

### Automate report outputs

Use new APIs on the report inbox to extend automation with Power Automate or MCP to reports.

Learn more in [Share and Export Reports with the Report Inbox](/dynamics365/business-central/ui-work-report-inbox).

### Bookmark list views and analysis tabs

Bookmark analysis tabs and list views to your role center and/or incorporate them into profiles.

Learn more in [Bookmark link to page or report on role center](/dynamics365/business-central/ui-bookmarks).

### Brand document reports with report themes

With the new composable layouts feature, you can apply a report theme on layouts to get consistent look and feel on the PDF output. 

It is possible to set defaults on a global level, per company, per report, or per layout, giving the administrator full flexibility of theming.

Learn more in [Set Up Report Themes and Header/Footer Layouts](/dynamics365/business-central/ui-set-up-report-themes-header-footer-layouts).

### Control the lifecycle of all report layouts

Set status on all types of layouts (including layouts shipped with Business Central, per-tenant extensions, and AppSource apps) to control which layouts are available to end users.

Learn more in [Report and document layouts overview](/dynamics365/business-central/ui-manage-report-layouts).

### Design document report themes with the updated Word add-in

Design document report themes using the new document samples controls in the Word add-in. 

We have added samples that look like common document types, such as

- invoice
- pick list
- outstanding orders.

Learn more in [Design Word Layouts with the Business Central Add-in](/dynamics365/business-central/ui-design-word-layouts-business-central-add-in).

### Design document reports with the updated Word add-in

Use new design components in the Word add-in to layout your document report layouts.

We have added design controls for common document report parts, such as 

- Addresses
- Field groups
- Amounts
- Signature lines
- Notes

Learn more in [Design Word Layouts with the Business Central Add-in](/dynamics365/business-central/ui-design-word-layouts-business-central-add-in).

### Design header/footer layouts for document reports with the updated Word add-in

Design document report header/footer layouts using the new header and/or footer document samples controls in the Word add-in.

We have addes samples that can be used for internal or external reports.

Learn more in [Design Word Layouts with the Business Central Add-in](/dynamics365/business-central/ui-design-word-layouts-business-central-add-in).

### Financial report changes are now always logged

Changes to financial row, column, and report definitions are automatically recorded in the change log for easier auditing.

Learn more in [Auditing changes](/dynamics365/business-central/across-log-changes).

### Reduce complexity of report datasets

Word layouts now include a company information dataitem that is shared across all report datasets. 

This reduces the work needed for a report developer and standardizes how company information is used across report layouts.

Learn more in [Design Word Layouts with the Business Central Add-in](/dynamics365/business-central/ui-design-word-layouts-business-central-add-in).

### Reuse header/footer layouts across document reports

With the new composable layouts feature, you can apply a header/footer on layouts to get consistent look and feel on the PDF output. 

It is possible to set defaults on a global level, per company, per report, or per layout, giving the administrator full flexibility of theming.

Learn more in [Set Up Report Themes and Header/Footer Layouts](/dynamics365/business-central/ui-set-up-report-themes-header-footer-layouts).

### Run multiple financial reports and get a single PDF output

Define report packs that contain multiple financial reports, and then run them immediately or schedule delivery to report inboxes or by email.

Learn more in [Design your own financial reports](/dynamics365/business-central/bi-design-financial-reports).

### Trace G/L account usage in finance reports

Financial report authors can now identify uncategorized accounts, trace account usage and calculations, and preview definitions before publishing.

Learn more in [Design your own financial reports](/dynamics365/business-central/bi-design-financial-reports).

### Use conditional visibility in the updated Word add-in

Design document reports layouts with conditional visibility using the new HideIf logic control in the Word add-in. 

The control can use boolean fields in the dataset to handle visibility of the content inside.

Learn more in [Design Word Layouts with the Business Central Add-in](/dynamics365/business-central/ui-design-word-layouts-business-central-add-in).

### Use system audit fields in analysis mode and in profiles

Use system audit fields in analysis tabs and add them directly to pages in profiles.

Learn more in [Analyze list page and query data using data analysis](/dynamics365/business-central/analysis-mode).



## Service and platform

### Faster data loading with improved data model for table extensions

With the new data model for table extensions, all fields on an AL table are stored in the same table in the database. 

This gives faster performance on all database operations that involve table extensions.

Learn more in [Extension objects in the same app](../developer/devenv-extensibility-overview.md#extension-objects-in-the-same-app).

## Supply chain management

### Carry subcontracting instructions into purchase orders

#### Business Value

Subcontractors need clear instructions about the work they must perform. Reentering that information on purchase orders takes time and can introduce differences between the routing, production order, and purchasing documents.

#### Details

Subcontracting comments and attachments now follow the operation into the purchase order. The purchasing document keeps the production context needed by the vendor while allowing you to review and adjust the information before sending the order.

The **Subcontracting Comments** action is available from standard tasks, routing lines, routing version lines, and production order routing operations. Comments follow the production flow:

1. Add subcontracting comments to a standard task or routing operation.
2. When you assign the standard task, its comments copy to the routing operation.
3. When you create or refresh a production order, routing comments copy to the production order routing operation.
4. When you create a subcontracting purchase order directly or from the Subcontracting Worksheet, the comments become descriptive purchase lines attached to the related subcontracting line.

Both **Description** and **Description 2** flow through the process. If you change the vendor or recalculate the work center on the Subcontracting Worksheet, the worksheet preserves routing-specific descriptions when the work center still matches the production order routing operation.

You can also carry supporting documents from the routing into the purchase order. On a routing header attachment, turn on both **Production Trx** and **Purchase Trx**. The attachment copies first to the production order and then to each related subcontracting purchase line. Attachments added manually to a production order line don't offer the **Purchase Trx** setting and don't copy automatically. Purchase-line attachments also aren't included automatically in vendor email messages. Use the **Add file from source document** action on the **Email Editor** page.

Learn more in [Review comments for subcontracting orders](/dynamics365/business-central/subcontract-order#review-comments-for-subcontracting-orders).

### Post direct transfer orders from warehouse-enabled locations

#### Business Value

Direct transfers move inventory between locations without using an in-transit location. You can use this simpler transfer method when the source location requires outbound warehouse handling, while preserving the picking and shipment controls configured for that location.

#### Details

Previously, one setting on the **Inventory Setup** page controlled how Business Central posted all direct transfers. You can now choose a posting method for each transfer route, so different routes can post separate transfer shipment and receipt documents together or create one posted direct transfer document.

Set **Default Direct Transfer Posting** on the **Inventory Setup** page to define the company-wide default. On the **Transfer Routes** page, set **Direct Transfer Posting** for routes that need a different method. The transfer order uses the route setting when one is specified and otherwise uses the Inventory Setup default. You can change **Direct Transfer Posting** on an open **Transfer Order** when needed.

The posting methods work as follows:

- **Shipment and Receipt** posts a transfer shipment and transfer receipt together. **Qty. to Ship** must equal **Qty. to Receive**. When you post from a warehouse shipment, partial posting is supported.
- **Direct Transfer** posts one **Posted Direct Transfer** document. Business Central posts the full transfer-line quantity without creating separate transfer shipment and receipt documents.

Direct transfers support the following outbound warehouse scenarios:

| Transfer-from location setup | How you complete the transfer |
|---|---|
| No warehouse requirements | Post from the **Transfer Order**. |
| **Require Pick** without **Require Shipment** | Create and post an **Inventory Pick**. |
| **Require Shipment** without **Require Pick** | Create and post a **Warehouse Shipment**. |
| **Require Pick** and **Require Shipment** | Register the **Warehouse Pick**, and then post the **Warehouse Shipment**. |
| **Bin Mandatory** | Enter valid source and destination bins, and post from the document required by the other warehouse settings. |
| **Directed Put-away and Pick** at the source | Register the warehouse pick and post the warehouse shipment by using the advanced warehouse process. |

With **Shipment and Receipt**, the destination can't require warehouse receipt or put-away. A destination that uses bins requires a valid **Transfer-To Bin Code**.

Learn more in [Comparison of different settings for transfer orders](/dynamics365/business-central/inventory-how-transfer-between-locations#comparison-of-different-settings-for-transfer-orders).

### Reduce manual work in quality tests and inspections

#### Business Value

The Quality Management extension helps you include quality checks in receiving, production, assembly, and inventory processes. We improved several parts of the experience so that inspectors and quality managers can complete routine tasks with fewer interruptions. These improvements reduce manual work when you record inspection outcomes, make inventory disposition easier to complete, and provide clearer guidance when a quality inspection blocks a transaction.

#### Details

##### Choose whether to assign an inspection to yourself

When you edit an eligible unassigned quality inspection, Business Central asks whether you want to take ownership of it. The notification provides the following choices:

- **Assign to myself** assigns the inspection to you.
- **Ignore** leaves the inspection unassigned.

##### Calculate passed and failed quantities automatically

When you finish an inspection, Quality Management automatically records the inspected quantity as **Passed Quantity** when the result is acceptable, or as **Failed Quantity** for another result. The calculation uses **Sample Size**, or **Quantity (Base)** when no sample size is specified.

##### Select destination bins when moving inspected inventory

Quality Management workflows provide more control when a disposition moves inspected inventory. You can specify the movement method, quantity basis, destination location, and destination bin. Assisted bin selection helps you choose a valid destination for the movement.

##### Resolve blocked transactions from the responsible inspection

When a quality inspection prevents a transaction, such as sale or consumption, the error includes details about the inspection that caused the block. You can open the responsible inspection directly from the error and review or complete it before trying the transaction again.

##### Apply quality rules and permissions consistently

Quality Management validates inspection assignments and enforces quality rules consistently, including operations performed through indirect or implicit access. These checks help preserve the intended inspection and transaction controls without requiring broader permissions than the task needs.

Learn more in [Assign and perform an inspection](/dynamics365/business-central/qms-manual-test-creation#assign-and-perform-an-inspection).

### Set up and explore subcontracting more easily

#### Business Value

Subcontracting requires coordinated setup across work centers, vendors, locations, prices, and production BOMs. A guided starting point and actionable warnings help administrators find the required setup and correct missing information before it interrupts production work.

#### Details

Clearer demonstration data also makes it easier to evaluate intermediate and final subcontracting operations and compare more than one subcontractor.

The **Subcontracting Setup** assisted setup guide, available after the Subcontracting app is installed, organizes initial configuration into three steps:

1. Review an introduction to subcontracting.
2. Review company defaults such as the worksheet template and batch, production-order information lines, component costs, and transfer lead time.
3. Open the related pages to set up work centers, vendors, locations, subcontractor prices, component supply methods, and supporting documentation.

Additional improvements make setup and discovery clearer:

- From the **Work Center Card**, open **Subcontractor Prices**, **Subcontracting WIP Entries**, and **Subcontractor - Dispatch List** for configured subcontractor work centers.
- From routing lines and production order pages, review subcontracting comments, prices, work-in-process entries, related purchase documents, transfer orders and entries, return transfers, and linked components. You can also create subcontracting orders and adjust WIP from supported released production order pages.
- When you open the obsolete Subcontracting Worksheet in an online environment without the app installed, a notification explains that the app replaces the worksheet. Choose **Install** to get the new experience or **Don't show me again** to dismiss future notifications.
- When you assign a subcontractor vendor to a work center and the vendor has no **Subc. Location Code**, a notification explains why the location is needed for components and WIP items. 
- Contoso Coffee demonstration data includes **Bulk Assembly** and **Local Assembly** subcontractors, locations, and work centers. The **Airpot - Subc. Mid-Routing** and **Airpot - Subc. Final Op** routings demonstrate intermediate and final subcontracting operations.
- Standard tasks and detailed work instructions provide more realistic manufacturing examples. Routing operations use different direct costs so that you can compare scenarios without relying on preconfigured subcontractor price records.

Learn more in [Use assisted setup](/dynamics365/business-central/subcontract-setup#use-assisted-setup).

### Use inventory put-aways and picks for subcontracting

#### Business Value

Companies that use basic warehouse configurations can include subcontracting in the same inventory activities they use for other inbound and outbound work. Warehouse employees can process subcontracted output without switching to warehouse receipts, and production teams can move work-in-process items (WIP items) between locations without treating them as physical inventory.

#### Details

The activities respect the different accounting and inventory effects of final and intermediate routing operations. They also preserve unit-of-measure conversions, bin information, and item tracking where the subcontracting flow supports those details.

You can use inventory put-aways for subcontracting purchase lines at locations that require put-away processing but don't require warehouse receipts. You can also use inventory picks and return put-aways for WIP transfer orders.

The posting behavior depends on the source line:

- For the final subcontracting operation, posting the inventory put-away records physical production output and the related capacity. Serial and lot tracking assigned to the production order flows to the subcontracting documents and resulting item ledger entries.
- For an intermediate subcontracting operation, the activity records outside processing without creating physical item or warehouse ledger entries.
- For a WIP transfer, the inventory activity keeps the displayed transfer quantity while the base quantity remains zero. The transfer therefore represents production progress rather than stocked inventory.

To use an inventory put-away for subcontracted output:

1. Set up a basic warehouse location that requires put-away processing but doesn't require receive processing.
2. Create and release the production order, calculate subcontracts, and create the subcontracting purchase order.
3. Assign serial or lot numbers from the production or subcontracting document when item tracking is required.
4. On the released purchase order, choose the **Create Inventory Put-away/Pick** action.
5. Open and post the inventory put-away after you record the quantities and bins that warehouse employees handled.

The activities handle partial processing, repeated processing, unit conversions, and split put-away lines across bins. Item tracking isn't supported for WIP item transfers. Some follow-up processes, including receiving subcontracting invoices through **Get Receipt Lines** and specific undo-receipt scenarios, remain restricted.

Learn more in [Post WIP transfer orders](/dynamics365/business-central/subcontract-wip-transfers#post-wip-transfer-orders).

### Work more efficiently with manufacturing documents and capacity calendars

#### Business Value

Planners and production managers often move between planning worksheets, production orders, work and machine centers, production BOMs, and routings to complete routine work. Small gaps in page actions, fields, filtering, and error navigation add unnecessary steps and can delay production scheduling.

#### Details

These improvements place manufacturing information and actions closer to the records where you work. You can create released production orders directly from planning suggestions, monitor and calculate capacity calendars, correct uncertified production definitions from actionable errors, and find relevant manufacturing details with less navigation.

##### Create released production orders from planning suggestions

On the **Planning Worksheet**, run **Carry Out Action Message** and choose one of the new production order options:

- **Released** creates released production orders directly from the accepted planning lines.
- **Released & Print** creates released production orders and includes them in production order printing.


##### Calculate and monitor capacity calendars

You can run **Calculate Work Center Calendar** from the **Work Center Card** and **Calculate Machine Center Calendar** from the **Machine Center Card**. The reports open for the current center, so you don't need to return to the list page.

The **Calendar Entries Available Until** field on Work Center and Machine Center cards and lists shows the latest date for which calendar entries exist. A date earlier than the work date appears in the warning style so that you can identify calendars that need recalculation before scheduling fails.

##### Resolve uncertified BOM and routing errors

When a production order references a production BOM or routing that isn't certified, the validation error provides a navigation action:

- **Show Production BOM [number]** opens the affected Production BOM.
- **Show Routing [number]** opens the affected Routing.

Certify the document and retry the operation.

##### Find and maintain manufacturing information more easily

The following page improvements reduce extra navigation and prevent avoidable errors:

- **Copy Production Order Document** excludes the current production order from the **Document No.** lookup when the source and destination statuses match.
- **Routing Link Code** is available on **Planning Routing**, **Prod. Order Components**, and **Prod. Order Comp. Line List**. 

Learn more in [To calculate a work center calendar](/dynamics365/business-central/production-how-to-create-work-center-calendars#to-calculate-a-work-center-calendar).

## Sustainability Management

### Estimate your carbon footprint in Service Management

This feature extends sustainability tracking to cover **Service Management** features by displaying carbon footprint values on service documents. Emission data comes from sustainability value entries for items and from resource cards for resource-related emissions.

When you consume or ship items or resources as part of a service order, the system retrieves their associated CO₂e values from sustainability data.

The system shows emission details on service invoices and posted documents for reporting and customer communication. Resource emissions are based on values defined on the resource card. Item emissions come from sustainability setup and item configuration.

Calculations follow the same logic as in other sustainability features, ensuring consistency across modules.

Learn more in [Sustainability value chain in Service Management](/dynamics365/business-central/value-chain-howto-service).

### Reverse Sustainability Ledger entries transaction

Keep your sustainability data accurate by reversing sustainability ledger entries that contain mistakes.

If you post sustainability transactions that contain a mistake, you can't delete the entries. However, if you posted the entries from a sustainability journal or a general journal, what you can do is use the **Reverse Transaction** action on the **Sustainability Ledger Entries** page to reverse them. The reversal creates a new sustainability ledger entry that has the document number and posting date from the original entry. It also records the user who ran the reversal. The original posting date makes the values net to zero in the same period.

Learn more in [Reverse sustainability ledger entries](/dynamics365/business-central/finance-sustainability-accounts-ledger#reverse-sustainability-ledger-entries).



### Track your carbon footprint for fixed assets

This feature extends sustainability tracking to fixed assets by introducing fields and logic that capture emissions during acquisition, reclassification, and disposal. Emission data flows into the sustainability ledger and integrates with existing sustainability reporting. Validation ensures you can enter emissions only for acquisition transactions. Posting rules maintain data integrity across your fixed asset and sustainability ledgers.

Sustainability fields are available only if you enable sustainability features in setup.

Learn more in [Sustainability value chain setup](/dynamics365/business-central/value-chain-howto-setup).


### Track your carbon footprint with item journals and item reclassification journals

This feature introduces carbon footprint tracking to **Item Journals** and **Item Reclassification Journals**. It adds fields for CO₂e per unit and total CO₂e, and calculates emissions to ensure that emissions follow the same lifecycle logic as item costs.

Emissions are calculated based on **Sustainability Value Entries** by using the **Average** or the new **Specific** method. Posting results are recorded in **Sustainability Value Entries** only. There are no changes to item cost entries.

For **Item Reclassification Journals**:

- Emissions transfer between items without adding new values.
- Maintains a chain for updates after adjustments.

Learn more in [Sustainability value chain in item journals](/dynamics365/business-central/value-chain-howto-item-journals).

### Use formulas to calculate emissions in purchase documents

This feature introduces formula-based emission calculations on purchase documents and uses the same calculation logic as sustainability journals. It applies emission factors to inputs such as fuel, electricity, distance, or custom amounts.

Set up this feature on the **Sustainability Setup** page:

- First, turn on the **Use Emissions in Purchase Documents** toggle.
- Then, turn on the **Use Formulas in Purchase Documents** toggle.
- When both options are active, additional fields become available on purchase lines.

When you fill in a formula field, Business Central calculates values for **Emission CO₂**, **Emission CH₄**, and **Emission N₂O** using **Emission Factors**.

Input validation follows the same rules as sustainability journals, and is based on **Sustainability Account Categories**. If formula fields contain values, manual entry of emissions is blocked. If you enter emissions manually, you can't use formula fields.

Learn more in [Calculate emissions on purchase lines](/dynamics365/business-central/finance-sustainability-journal#calculate-emissions-on-purchase-lines).



### Use specific method for carbon footprint calculation when enabling item tracking

This feature introduces a new calculation method for carbon footprint tracking in sustainability value entries. In addition to the current **Average** method, you can enable a **Specific** method for items that you track with serial or lot numbers. On the **Item Card** page, on the **Sustainability** FastTab, you can choose one of the following options in the **Carbon Tracking Method** field:

- **Average** (default) – Use the current behavior for all postings.
- **Specific** – Use the exact emission value for the unit received, similar to specific costing, when you track items by using serial or lot numbers.

Learn more in [Choose how to track carbon for an item](/dynamics365/business-central/value-chain-howto-setup#choose-how-to-track-carbon-for-an-item).

## User experience

### Agent actions review notifications on lists

Show and manage documents where agents require human interaction by using a new review bar on documents and lists.

Learn more in [Review from the Tasks pane](/dynamics365/business-central/supervise-agent-tasks#review-from-the-tasks-pane).

### Preview images directly in web client

You can open image attachments in the Business Central web client without downloading the images first. Files display in preview mode with an easy to use viewer experience that's similar to the print preview or PDF preview features. If you want to save a copy, you can download the image file from the viewer.

This feature works across all areas of Business Central, including agents, email, and code from extensions. However, extension developers must add support for this feature using *File.ViewFromStream* for Business Central online, or *File.View* for Business Central on-premises. These methods follow the pattern of the *File.Download* method.

Preview images directly supports the following types of image files: JPEG, JPG, PNG, BMP, SVG, WEBP, ICO, plus GIF and AVIF (both include animated versions). On the Safari browser, this feature also supports TIFF and TIF.

The following are a couple of additional benefits:

* There is suport for GIF files as FactBox thumbnails, including animation for GIFs up to 48 frames.
* Thumbnail previews are clickable for images and the first page of PDFs, which open the previewer window.

Learn more in [View an attached file](/dynamics365/business-central/ui-how-add-link-to-record#view-an-attached-file).

### Show recently searched in Tell Me

Find pages and reports faster by accessing recent searches in Tell Me (Alt+Q).

Learn more in [Finding Pages and Information with Tell Me](/dynamics365/business-central/ui-search).

### Show recently used in lookups

Business Central now highlights recently used records directly in lookup dialogs. When users open a lookup, the system surfaces records they have recently accessed or worked with, making it easier to select the correct value without performing a search.

The suggestions are personalized to each user and are based on usage signals already collected by the platform. The feature reuses the same server-side intelligence that supports Autofill and recent-record scenarios, ensuring consistent recommendations across Business Central experiences.

The feature makes Business Central feel more responsive and personalized by adapting lookup suggestions to each user's working patterns. It reduces repetitive data entry, speeds up transaction processing, and helps users stay focused on their work. By reusing existing server intelligence already powering Autofill experiences, the feature delivers a consistent and efficient way to surface the most relevant records across the application.

Business Value:
Finding the right record in a lookup is a common task throughout Business Central, but users often select the same customers, vendors, items, projects, or dimensions repeatedly during the day. By showing recently used records at the top of lookup dialogs, users can find and select frequently accessed data faster, with fewer searches and less navigation.

Learn more in [How Copilot provides suggestions](/dynamics365/business-central/autofill-fields-with-copilot#how-copilot-provides-suggestions).

## Related information

[Update 29.0 public preview for Business Central 2026 release wave 2](whatsnew-update-29-0.md)
