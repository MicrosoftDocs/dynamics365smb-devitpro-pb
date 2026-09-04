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

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

This article provides details about the features available in the Business Central 2026 release wave 2 public preview.

## Copilot and agents: Enable unified Copilot chat experience consistent with Microsoft Copilot

This feature becomes available over the coming days. After it's available in your environment, you might need to enable it on the **Copilot & Agent Capabilities** page.

With this new experience, you interact with a modern chat that combines business data from Business Central with web search results and general knowledge supported by the latest AI models. The feature is available to all users with a Business Central license. Users with a **Microsoft Copilot** license receive [additional benefits](https://support.microsoft.com/Microsoft-365-Copilot/standard-versus-priority-access-to-features-in-microsoft-365-copilot-chat), including access to [Work IQ](/microsoft-365/copilot/extensibility/work-iq/). [Eligible Microsoft 365 business customers](https://go.microsoft.com/fwlink/?linkid=2332640) also have access to these benefits.

To learn about pricing, visit [https://www.microsoft.com/microsoft-365-copilot/pricing](https://www.microsoft.com/microsoft-365-copilot/pricing).

## Copilot and agents: Improve purchase order matching in Payables Agent

This feature improves PO matching quality in Payables Agent and aligns draft finalization behavior with existing posting controls.

The agent uses an enriched **PO Lines** list page during matching that includes these fields:

* Line Amount — enables matching on value, not just description and quantity. This field is especially valuable for service lines where quantity (often just 1) isn't a meaningful discriminator.
* Expected Receipt Date — helps the agent factor in timing when multiple PO lines could match.

By using these fields, the agent can more reliably distinguish between similar-looking PO lines, which improves accuracy in first-pass matches.

The agent now respects the app's *Never block draft finalization* setting in the **Receipt on Invoice** field on purchase orders. This change means the agent doesn't block draft finalization because a matched PO line isn't yet marked as received. Whether goods are received is a posting time control, not a draft time control. The "Receipt on Invoice" setting on the order governs this behavior at posting.

The "Receipt on Invoice" field is already available on purchase orders. With this release, we're expanding this setting to more entities:

* A new vendor-level "Receipt on Invoice" setting is introduced and automatically applied to new purchase orders created for a vendor.
* A new PO-line-level "Receipt on Invoice" setting allows per-line override. The inheritance chain for the setting is vendor, then purchase order, and then purchase order line, but each level can override the parent.

We've also improved draft warnings. When the agent creates a purchase invoice draft matched to a PO, the draft surfaces warnings based not just on quantity, but also on amount. The draft warnings are for information only and don't block finalization. For example, they warn about the discrepancies in the draft and you can decide how to proceed.

This feature is available from the August minor release of 2026 release wave 1.

## Copilot and agents: Manage travel requisitions with Expense Agent

Expense Agent introduces travel requisition features that allow employees to request and manage business trips before they create expenses. Employees can create a travel requisition for themselves or, if they're managers, on behalf of their team members. A single requisition can include multiple travelers, enabling coordinated planning for team travel scenarios within one request structure.

Each travel requisition is stored in the **Travel Requisition** table, with related traveler records managed through a connected **Travelers** entity. Employees specify the purpose of the trip, assign travelers, and provide relevant travel information before they submit the request. When ready, they release the requisition to start the approval process.

## Country/region: Cash document – sending by email in Czechia

This feature introduces comprehensive email sending capabilities for receipt cash documents in the Czech localization and leverages Business Central’s standard document sending framework.

You can send emails while you process cash documents:

* New **Issue and Send** action on cash documents.
* New **Post and Send** action on cash documents.
* Documents are sent according to the customer's document sending profile or the default sending profile.
* Functionality is available only for receipt cash documents.

You can also send email from issued and posted cash documents:

* New **Send by Email** and **Send** actions on issued and posted cash document lists.
* New **Email** and **Send** actions on issued and posted cash document cards.
* You can send documents directly through email or use standard document sending profiles.

Validate messages before you send them:

* The system verifies that the document type is Receipt, the partner type is Customer, and that a partner number is specified.
* If validation fails, the document isn't issued or posted and an error message displays.

Use document sending profiles:

* Receipt cash documents can utilize the same document sending profile framework used by standard sales documents.
* You can review or select the sending profile before the document is sent.

Use a modern report selection:

* Cash Desk report selections are migrated from the local Cash Desk Rep. Selections CZP table to the standard Report Selections table.
* A new **Report Selection – Cash Desk CZP** page provides management of cash document report selections.
* Customer report layouts support receipt cash and posted receipt cash documents.
* The **Copy from Report Selections** process includes the automatic creation of corresponding report selection records.

Integrate with payment methods:

* The **Cash Document** action offers the **Issue and Send** and **Post and Send** options.
* When selected on a sales invoice or order, posting automatically issues or posts the cash document and sends it according to the customer's sending profile.
* These actions are restricted to sales invoices and sales orders to ensure correct business process usage.

Use new Word layouts:

* New Word layouts for email body generation are provided for receipt cash and posted receipt cash documents. The layouts help ensure consistent and professional customer communication experiences.

## Country/region: Compensation – send by email in Czechia

We added the **Send** and **Email** actions to the **Compensation Card** and **Posted Compensation Card** pages. We also added a **Report Selection – Compensation** page to configure default reports to use when you print, email, and do other output operations for compensation documents.

## Country/region: Proforma Invoice Report with Czech Layout in Czechia

This feature enhances the **1303 - Draft Invoice** and **1302 - Pro Forma Invoice** reports to provide a richer approval preview that more closely resembles the final localized posted sales invoice. The objective isn't to guarantee that draft or pro forma invoices are identical to the posted invoice in all scenarios. Instead, the goal is to provide the maximum amount of relevant information available on an unposted document to support customer review and approval before posting. Some of the key enhancements are:

Extended header information:

* Customer Registration No.
* Customer VAT Registration No.
* Vendor Registration No.
* VAT Date
* Due Date
* Bank Account Information
* Payment Terms
* Payment Method
* Your Reference
* Additional header information available on the localized posted sales invoice layout

An improved layout:

* Aligns the visual appearance and structure of Draft Invoice and Pro Forma Invoice reports with the localized posted sales invoice.

Additional summary information:

* Includes available totals and summary data where technically possible and correct for unposted documents.

Clear document identification:

* Maintains prominent labeling indicating that the document is a Draft Invoice or Pro Forma Invoice and not a final tax document.

However, there are a few known limitations:

* QR code functionality isn't included.
* The enhancement applies only to the RDL layout.
* Word layouts and emailing functionality are out of scope.

## Country/region: Separate setup for automatic dimensions in Czechia

This feature introduces a new framework for managing automatic creation and maintenance of default dimensions.

Automatic dimension configuration:

* A new **Auto. Create Default Dim. CZA** table stores rules and settings for automatic dimension creation.
* The new structure provides a centralized and extensible framework for managing dimension automation.

Automated dimension update management:

* A new **Dimension Auto.Update Mgt. CZA** code unit handles default dimension creation and updates based on rules you configure.
* The functionality ensures that dimensions align with the underlying master data.

Data upgrade and migration:

* Existing default dimension settings are migrated during upgrade to the new data structure.
* The upgrade process preserves existing customer configurations while enabling the new functionality.

User interface for configuration:

* A new **Auto. Create Default Dim. CZA** page lets you maintain settings for automatic dimension creation.
* You can review and manage automation rules directly from Business Central.

Integration with existing default dimensions:

* The **Default Dimension** table is extended to support the new framework.
* Obsolete fields are marked accordingly and replaced by the new automatic dimension management approach.

## Ecommerce: Control sales document creation for Shopify orders and returns

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

## Ecommerce: Keep Shopify connections current

Shopify releases a new API version every three months at the beginning of the quarter, and supports each version for 12 months. The updated versions might contain important changes, so it's important to uptake Shopify API versions in major releases of Business Central. Typically, new versions of APIs increase stability and security, and enable additional capabilities. Starting with this release, Shopify Connector uses the Shopify API that was released in July 2026. This update keeps the integration on a supported API version and includes security changes such as support for expiring offline access tokens for public apps, as well as functional changes, like market-driven shipping methods.

> [!IMPORTANT]
>
> The Shopify Connector released in 2026 release wave 1 (April 2026) relies on API 2026-01, which is supported until December 31, 2026. To continue to use your integration, upgrade to the latest version of Business Central before this date.


Shopify regularly retires API versions and is introducing expiring offline access tokens for public apps. Staying current helps prevent avoidable connection interruptions and keeps synchronization compatible with Shopify platform changes. Better operational cues and clearer timestamps help administrators find failures faster and understand whether a value came from Shopify or Business Central.

### The connector now supports Shopify's expiring offline access tokens

- Access tokens refresh automatically before their one-hour lifetime expires.
- Refresh tokens rotate and remain valid for up to 90 days.
- Existing non-expiring tokens migrate when the connector needs next authentication.
- If the refresh-token window expires, an administrator must reconnect the shop from the Shopify Shop Card.

### Operational improvements make synchronization easier to supervise

- A **With errors** view filters the Shopify Log to entries that contain errors.
- The Shopify Activities page shows **Skipped Records** and **API Errors** cues and highlights them when action is needed.
- Product and price synchronization skips invalid item unit-of-measure combinations and records the reason instead of stopping the complete synchronization. Enable logging to retain skipped-record details.
- Suffixes help you to distinguish **Created At (Shopify)** and **Updated At (Shopify)** imported from Shopify from standard audit fields present in Business Central.

## Ecommerce: Manage Shopify B2B companies, catalogs, and pricing

Shopify expanded core B2B capabilities to all plans, and the Shopify connector supports company synchronization, B2B order processing, and market catalogs across those plans. The latest improvements make tax identifiers, company records, and catalog pricing easier to configure and help prevent conflicting price synchronization.

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

- **Direct company catalogs**: Assign catalogs to specific companies or company locations for customer-level pricing. The B2B Catalogs page and **Auto Create B2B Catalog** setting are available only with these plans.
- **Staff member mapping**: Import Shopify staff members and map them to Business Central salespeople.

## Ecommerce: Match Shopify tax lines with the Tax Matching Agent

Although the Shopify orders you import have tax information, such as rates, amounts, and free-text tax descriptions, the tax amounts recalculate when you create the sales document. The recalculation means it's important that your VAT or sales tax settings are correct in Business Central. Differences between Shopify tax data and Business Central tax setup can delay order processing or require repetitive manual mapping. New tax fields let you correct tax details manually, while assisted matching helps US organizations map Shopify tax lines to the right tax jurisdictions with human oversight.

You can review imported tax details on the Tax Lines page, which you can open from the Shopify Order page or Shopify Order Shipping Charges page. On the Shopify Order, you can edit Tax Area Code and Tax Liable to replace the defaults that the connector derives from the Shopify Tax Area or customer. In the North American version, you can also enter Tax Jurisdiction Code on individual tax lines. Refunds inherit their tax setup from the related Shopify Order. The **Tax Area Code**, **Tax Liable**, and **Tax Exempt** fields are now visible in the **Tax** part of the **Shopify Refund** page.

Manual mapping gives you control, but matching many free-text tax descriptions can take time. Shopify Tax Matching Agent assists US organizations when an imported Shopify order still has unmatched tax lines after standard tax-area processing. The agent:

- Suggests a Tax Jurisdiction for each unmatched Shopify tax line by using its title, rate, and limited ship-to location data.
- Returns a confidence level and explanation for each suggestion.
- Can use or create a matching Tax Area and, when enabled, create missing Tax Jurisdictions and Tax Details.
- Detects a difference between the Shopify rate and the existing Business Central rate, keeps the existing rate, and holds the order for review.
- Provides a **Tax Match Review** page where you can inspect and change suggestions, approve or undo approval, open related tax setup, and choose **Use Shopify Rate** when appropriate.

Admins control review through **Tax Match Review Mode**. **Always**, the default, requires review of every AI-assisted match. **Low Confidence Only** requires review for medium- and low-confidence suggestions and newly created jurisdictions. **Never** doesn't require review based only on confidence. Unidentified jurisdictions and rate differences always require review.

The agent is available for the United States. It maps imported tax descriptions to Business Central tax setup, but it doesn't calculate tax, determine tax liability, file returns, or replace professional tax advice. You remain responsible for reviewing and approving the resulting tax setup.

## Ecommerce: Process Shopify order changes, exchanges, and refunds

When a Shopify return includes a replacement item, the connector imports the returned item and the exchange item together and adds them to a sales credit memo or sales return order. You can keep both items on the same document or move the exchange item to a new sales document.

### Example: Process an exchange

A customer orders, pays for, and receives an item. You import and process the Shopify order in Business Central, where it becomes a posted sales invoice. Later, the customer decides that the item doesn't fit and returns it in exchange for a replacement item.

The connector imports the updated Shopify order and its linked refund. When you choose **Create Sales Document**, the connector creates the document type selected in **Process Returns as**: a sales credit memo or sales return order. The returned item has a positive quantity on the new document, and the exchange item has a negative quantity.

You can post the document with both lines, or you can keep the returned item on the credit memo or return order and move the exchange item to a separate sales document. To split the lines before posting:

1. If the credit memo or return order has the **Released** status, choose **Reopen**.
2. Choose **Move Negative Lines**. From a sales credit memo, this action creates a sales invoice by default. From a sales return order, it creates a sales order by default.

The new invoice or order for the replacement remains linked to the originating Shopify order and appears in the **Linked Documents** FactBox.

For exchanges where the replacement costs more, the connector doesn't add an unnecessary balancing refund-account G/L line. A G/L line can still be added for cash rounding.

## Ecommerce: Synchronize tariff numbers and origin values with Shopify

Accurate tariff numbers and country/region of origin values support international shipping and customs reporting. Synchronizing these values with Shopify reduces duplicate data entry and helps keep product trade data consistent across both systems.

Turn on **Sync HS Code and Country/Region of Origin** on the Shopify Shop Card to synchronize tariff numbers and country or region of origin values between Business Central and Shopify. On import, the connector updates values only when the Shopify value resolves to an existing Tariff Number or Country/Region record.

Other product information management improvements provide more control over matching, product status, and variant information:

- Use **Find Mapping by Barcode** to control whether the connector tries barcode matching after the selected SKU mapping strategy fails. The setting is on by default for compatibility and can be disabled when barcodes aren't unique.
- Set **Status for Created Products** now includes new **Unlisted** status. The selected status applies when the connector creates a product in Shopify.
- Add **Compare-at Price** to the Shopify Variants page through personalization to inspect the comparison price used for a variant.
- From an Item Card or Item List, the **Show Product in Shopify** action is also enabled for items exported as variants to Shopify.

## Electronic documents: Exchange EDI documents via E-Documents

This feature extends the **E-Documents** framework to support Electronic Data Interchange (**EDI**), enabling organizations to exchange business documents electronically with vendors and partners using widely adopted industry standards.

Key capabilities include:

* Leverages the existing **E-Documents** framework as a unified platform for managing electronic document exchange.
* Enables organizations to send and receive structured business documents without relying on paper-based or manual processes.
* Exchange documents using Peppol BIS 3, which is commonly used for electronic procurement and invoicing, but also opened for adding new formats based on local or customer standards.
* In addition to the existing support for invoices and shipments, it now also supports order exchange and sending remittance advices, and it's opened for additional document types.
* Facilitates standardized document exchange between organizations and vendors.
* Automates the generation, transmission, and processing of electronic business documents.
* Helps organizations align with regulatory, industry, and partner requirements for electronic document exchange.

By bringing EDI capabilities into E-Documents, organizations can modernize their supply chain and procurement processes while using a consistent, scalable approach to electronic business communication.

## Expense Agent: Add date range and different vehicle types in your mileage calculation in Expense Agent

Expense Agent now supports advanced mileage rate configuration based on both effective date ranges and vehicle types, enabling more flexible and accurate mileage reimbursement calculations. This enhancement combines mileage rate scheduling with support for differentiated vehicle categories.

**Key capabilities**

* Define mileage rates in the **Mileage Rate Setup** that are valid only within specific date ranges, allowing organizations to accommodate rate changes over time.
* Configure separate mileage reimbursement rates for different vehicle types in the **Mileage Rate Setup**, such as cars, motorcycles, electric vehicles, or other organization-defined vehicle categories, based on predefined **Vehicle Types**.
* Automatically apply the correct reimbursement rate based on the travel date and selected vehicle type during mileage expense calculation.
* Support evolving regulatory requirements, company policies, and regional reimbursement standards without requiring manual recalculation of submitted mileage claims.

**How it works**

Administrators can maintain a set of mileage rate records that include both an effective date range and an associated vehicle type in the **Mileage Rate Setup**. When a mileage **Expense** is created, **Expense Agent** evaluates the trip date and **Vehicle Type** selection, then applies the matching reimbursement rate automatically. This ensures that mileage claims are calculated using the appropriate rate in effect for the specific travel period and mode of transportation.

## Expense Agent: Add interim approver when you submit the expense report

This feature introduces support for a simple interim approval scenario for expense reports. When you submit an expense report, your organization can designate an interim approver to review and approve expenses before the final approver can review and approve. In most situations, the interim approver reviews expense reports to confirm that everything is compliant and there's no missing information.

## Expense Agent: Calculate withholding taxes automatically in expense report

Organizations can now automatically calculate **employee withholding taxes** (WHT) as part of the expense report process. When employees submit expenses that are subject to withholding tax requirements, the system applies the appropriate tax calculations directly within the expense report workflow.

Key capabilities include:

* Automatic withholding tax calculation for employee expense transactions that require tax deductions.
* Integrated expense processing that incorporates withholding tax handling without additional manual calculations.
* The agent can calculate **single** or **multiple** withholding taxes for each of the categories, based on the setup, and calculation can also be **simple** or **compound**.
* Threshold for calculation can be calculated based on different periods, and the vase can be based on the **Record**, **Document**, **Category** (period accumulation), **Total** (period accumulation).
* Calculation can be done based on the **gross** or **net** amounts.
* Improved tax compliance by ensuring withholding tax amounts are consistently calculated and recorded.
* Reduced administrative effort through automation of a previously manual process.
* Accurate financial postings by including withholding tax information in expense-related accounting entries.

## Expense Agent: Expense Agent supports approval process

Expense Agent can validate submitted expense reports against approval policies written in natural language and provide approvers with guidance during the review process. After an employee submits an expense report, the system evaluates both the overall report and the individual expense lines to detect potential policy violations, suspicious patterns, or situations that might require closer attention. This process supports policies that aren't limited to exact thresholds or fixed numeric conditions, such as when business class travel is allowed, what qualifies as an appropriate business meal, or when exceptions to preferred hotel standards might be acceptable. The result is additional review context that helps approvers make better-informed decisions without replacing the final human approval step.

By running policy validation after submission, the feature can apply controls at multiple levels of the process. Some checks are relevant to a single expense line, some apply to the expense report as a whole, and others depend on how multiple lines relate to one another. This separation improves the quality of policy enforcement and gives approvers a clearer picture of both the report-level intent and the detailed transactions within it. The feature complements existing approval workflows by highlighting issues, providing context, and helping organizations enforce policy consistently while keeping approvers in control of the final decision.

## Expense Agent: Improve duplicates prevention in Expense Agent

The **Expense Agent** now includes improved duplicate prevention capabilities to better identify and handle potentially duplicated expense submissions.

Key capabilities include:

* Enhanced duplicate detection that identifies expenses with matching or highly similar details, such as amount, date, merchant, receipt, or transaction information.
* Proactive user guidance that alerts employees when a potential duplicate expense is detected during the submission process, regardless if this is duplicate with other expense in the same or different expense report, or even with the posted expense report.
* Reduced manual review effort by helping prevent duplicate claims from entering approval and reimbursement workflows.
* Improved expense data integrity through more intelligent validation and comparison of submitted expenses.
* Seamless expense management experience that allows users to review and resolve potential duplicates before completing their submission.

## Financial Management: Calculate multiple excise duties per item

This feature enhances excise tax management by allowing you to associate multiple excise duty definitions with a single item and calculate them during transactions.

Key capabilities include:

* Assign multiple excise duty configurations to the same inventory item (for example, the item is liable for both plastic and sugar tax).
* Automatically calculate all applicable excise duties during purchasing and vendor-related transactions.
* Support complex tax scenarios where products are subject to more than one excise levy.
* Reduce the need for manual workarounds, customizations, or separate item records to represent different tax obligations.
* Improve tax accuracy and consistency across purchasing, inventory valuation, and financial reporting processes.

By using this enhancement, you can model real-world excise tax structures more effectively while maintaining compliance with local regulatory requirements. The system aggregates and applies all configured excise duties for an item, ensuring that tax amounts are calculated consistently and transparently throughout the transaction lifecycle.

## Financial Management: Calculate withholding taxes for vendors

In some countries and regions, companies must pay withholding tax to the government for certain third‑party services or vendor purchases. Business Central calculates withholding tax when you pay a vendor invoice or when you post it, based on your setup. The tax amount is withheld from the payment and reduces the total amount owed to the vendor.

You can configure withholding tax by setting up **Withholding Tax Codes** and **Vendors**.

### Get started

To enable withholding tax calculation, open the **General Ledger Setup** page and turn it on. Next, configure the **Withholding Tax Revenue Types**, including their sequences and posting groups. Then, set up the following:

- **Withholding Tax Bus. Post. Group** and apply it to vendors that are subject to withholding tax.
- **Withholding Tax Prod. Post. Group** and apply it to items or general ledger accounts.
- **Withholding Tax Posting Setup** using the two groups above.

If needed, you can override the product posting group on purchase document lines by using the **Withholding Tax Prod. Post. Group** field.

### Using withholding tax

Withholding tax applies automatically when you work with purchase documents. When you post a document that includes withholding tax, Business Central creates a withholding tax entry. Use the **Calculate and post withholding tax settlements** action to process withholding tax for a specific period based on the withholding tax entries you already posted.

## Financial Management: Enable accelerated depreciation methods for fixed assets

Accelerated depreciation is now a standard depreciation method in fixed assets. Configure acceleration factors and asset settings directly in depreciation books. Business Central automatically calculates accelerated amounts, the equivalent linear amounts, and the difference between them, and posts the values to the appropriate accounts. Inquiry pages provide clear visibility into annual depreciation figures, variances, and remaining book value, supporting consistent financial tracking and audit transparency.

To get started, you need to:

1. Enable accelerated depreciation by configuring a depreciation book to use an accelerated depreciation method.
1. Enter the acceleration coefficient and other required settings on the fixed asset card.

After you prepare the depreciation book, the assets assigned to it automatically support accelerated depreciation. You don't need any additional modules or extensions.

After you set it up, depreciation is calculated through the standard depreciation processes. Business Central automatically computes the accelerated amount, the equivalent linear amount, and the difference between them. When posting depreciation, Business Central records both the accelerated depreciation and any variance. Inquiry pages provide an overview of annual depreciation, variances, and remaining book value so you can monitor the financial impact throughout the asset’s lifecycle.

## Financial Management: Set up vendor-specific number series for self-billing invoices

Organizations that use self-billing often need to follow supplier-specific invoicing requirements, including unique numbering conventions. With this enhancement, you can define and assign dedicated number series for self-billed purchase invoices on a per-vendor basis.

Key capabilities include:

* Set up a unique number series for individual vendors that participate in self-billing arrangements.
* Automatically apply the vendor-specific number series when creating self-billed purchase invoices.
* Maintain separate invoice numbering sequences across different suppliers.
* Improve compliance with vendor agreements and local business requirements that mandate specific invoice numbering practices.
* Reduce manual intervention and the risk of numbering errors during invoice generation.

## Financial management: Use withholding taxes with employee transactions

This feature extends withholding tax capabilities to employee transactions, so your organization can apply and manage withholding taxes. It supports scenarios where employee-related payments or reimbursements must follow withholding tax requirements. It ensures the financial system processes these transactions accurately.

Key capabilities include:

* Apply withholding tax rules to employee transactions.
* Automatically calculate withholding tax amounts based on configured tax setups.
* Support appropriate posting and accounting of withholding tax liabilities related to employee payments.
* Maintain consistent tax treatment across vendor and employee transaction processing.

**How it works**

When you create an employee transaction, the system evaluates applicable withholding tax configurations and applies the relevant withholding tax treatment to the transaction. Your organization can meet local tax requirements for employee-related payments while keeping financial records accurate and compliant.

## Supply chain management: Carry subcontracting instructions into purchase orders

Subcontractors need clear instructions about the work they must perform. Reentering that information on purchase orders takes time and can introduce differences between the routing, production order, and purchasing documents.

Subcontracting comments and attachments now follow the operation into the purchase order. The purchasing document keeps the production context needed by the vendor while allowing you to review and adjust the information before sending the order.

The **Subcontracting Comments** action is available from standard tasks, routing lines, routing version lines, and production order routing operations. Comments follow the production flow:

1. Add subcontracting comments to a standard task or routing operation.
2. When you assign the standard task, its comments copy to the routing operation.
3. When you create or refresh a production order, routing comments copy to the production order routing operation.
4. When you create a subcontracting purchase order directly or from the Subcontracting Worksheet, the comments become descriptive purchase lines attached to the related subcontracting line.

Both **Description** and **Description 2** flow through the process. If you change the vendor or recalculate the work center on the Subcontracting Worksheet, the worksheet preserves routing-specific descriptions when the work center still matches the production order routing operation.

You can also carry supporting documents from the routing into the purchase order. On a routing header attachment, turn on both **Production Trx** and **Purchase Trx**. The attachment copies first to the production order and then to each related subcontracting purchase line. Attachments added manually to a production order line don't offer the **Purchase Trx** setting and don't copy automatically. Purchase-line attachments also aren't included automatically in vendor email messages. Use the **Add file from source document** action on the **Email Editor** page.

## Supply chain management: Migrate Italian legacy subcontracting data to the Subcontracting app

Italian companies can move from deprecated Italy-specific subcontracting functionality to the worldwide Subcontracting app without recreating active setup and operational references manually. The migration preserves the information required to continue working with subcontractors, while prerequisite checks reduce the risk of moving incomplete documents.

Previously running the migration was limited to a sandbox copy. In this release the restriction that allowed migration only in sandbox environments is removed.

Before you disable legacy subcontracting:

1. Complete open transfer orders that contain work-in-process (WIP) item lines, or remove the blocking lines when the document state allows deletion.
2. Complete open purchase orders that contain WIP item lines, or remove the blocking lines.
3. On the **Manufacturing Setup** page, choose the action to disable legacy subcontracting.
4. Accept the prompts to install the **Subcontracting** and **IT Subcontracting Migration** apps if either app is missing.

The migration moves:

- Subcontracting location setup on vendors and purchase headers.
- Legacy subcontractor prices into the new pricing structure.
- Subcontracting classifications on purchase lines.
- Purchase, production, routing, operation, work center, and return references on transfer lines and headers.
- Original location information on production order components.
- WIP settings on production order routing lines and routing master data.

The process locks related records while it runs and compares record counts before and after migration. After the migration completes, the system disables **Legacy Subcontracting**. You can't reactivate legacy subcontracting while the Subcontracting app is installed.

For upgraded companies, the system keeps legacy subcontracting active when it detects legacy data or subcontractor work centers so that you can prepare the migration. New companies start with the worldwide app experience. To activate legacy subcontracting manually, first uninstall the Subcontracting app, and then use the **Activate Legacy Subcontracting** action.

## Supply chain management: Post direct transfer orders from warehouse-enabled locations

Direct transfers move inventory between locations without using an in-transit location. You can use this simpler transfer method when the source location requires outbound warehouse handling, while preserving the picking and shipment controls configured for that location.

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

To use direct transfer posting:

1. On the **Inventory Setup** page, choose a value in **Default Direct Transfer Posting**.
2. Optional: On the **Transfer Routes** page, enable **Direct Transfer** for a route and choose **Direct Transfer Posting**.
3. Create a transfer order, select the transfer-from and transfer-to locations, and enable **Direct Transfer**.
4. Add transfer lines and bin codes when the locations require them.
5. Post from the transfer order, inventory pick, or warehouse shipment according to the source location setup.
6. Review the posted transfer shipment and receipt, or the **Posted Direct Transfer**, according to the selected posting method.

Direct transfer posting doesn't create inbound warehouse receipts or inventory put-aways. The transfer-to location can't use **Directed Put-away and Pick**. With **Shipment and Receipt**, the destination also can't require warehouse receipt or put-away. A destination that uses bins requires a valid **Transfer-To Bin Code**.

## Supply chain management: Reduce manual work in quality tests and inspections

The Quality Management extension helps you include quality checks in receiving, production, assembly, and inventory processes. We improved several parts of the experience so that inspectors and quality managers can complete routine tasks with fewer interruptions. These improvements reduce manual work when you record inspection outcomes, make inventory disposition easier to complete, and provide clearer guidance when a quality inspection blocks a transaction.

### Create and delete quality tests with blank descriptions

You can leave **Description** blank on the **Quality Test** page. The red indicator remains as guidance to enter a useful description, but the field isn't mandatory. Closing or deleting a new quality test with a blank description now completes normally.

Existing safeguards continue to prevent you from deleting tests that quality inspections or templates already use.

### Choose whether to assign an inspection to yourself

When you edit an eligible unassigned quality inspection, Business Central asks whether you want to take ownership of it. The notification provides the following choices:

- **Assign to myself** assigns the inspection to you.
- **Ignore** leaves the inspection unassigned.

### Calculate passed and failed quantities automatically

When you finish an inspection, Quality Management automatically records the inspected quantity as **Passed Quantity** when the result is acceptable, or as **Failed Quantity** for another result. The calculation uses **Sample Size**, or **Quantity (Base)** when no sample size is specified.

Reopening the inspection clears the calculated passed and failed quantities so that the inspection can be evaluated again. Users with the **Quality Admin & Supervisor** role can manually change these quantities.

### Select destination bins when moving inspected inventory

Quality Management workflows provide more control when a disposition moves inspected inventory. You can specify the movement method, quantity basis, destination location, and destination bin. Assisted bin selection helps you choose a valid destination for the movement.

### Resolve blocked transactions from the responsible inspection

When a quality inspection prevents a transaction, such as sale or consumption, the error includes details about the inspection that caused the block. You can open the responsible inspection directly from the error and review or complete it before trying the transaction again.

### Apply quality rules and permissions consistently

Quality Management validates inspection assignments and enforces quality rules consistently, including operations performed through indirect or implicit access. These checks help preserve the intended inspection and transaction controls without requiring broader permissions than the task needs.

## Supply chain management: Set up and explore subcontracting more easily

Subcontracting requires coordinated setup across work centers, vendors, locations, prices, and production BOMs. A guided starting point and actionable warnings help administrators find the required setup and correct missing information before it interrupts production work.

Clearer demonstration data also makes it easier to evaluate intermediate and final subcontracting operations and compare more than one subcontractor.

The **Subcontracting Setup** assisted setup guide, available after the Subcontracting app is installed, organizes initial configuration into three steps:

1. Review an introduction to subcontracting.
2. Review company defaults such as the worksheet template and batch, production-order information lines, component costs, and transfer lead time.
3. Open the related pages to set up work centers, vendors, locations, subcontractor prices, component supply methods, and supporting documentation.

Finishing the guide saves the defaults and marks assisted setup as complete. The guide provides navigation to the required setup areas but doesn't validate that every subcontractor, location, price, or BOM is ready for use.

Additional improvements make setup and discovery clearer:

- From the **Work Center Card**, open **Subcontractor Prices**, **Subcontracting WIP Entries**, and **Subcontractor - Dispatch List** for configured subcontractor work centers.
- From routing lines and production order pages, review subcontracting comments, prices, work-in-process entries, related purchase documents, transfer orders and entries, return transfers, and linked components. You can also create subcontracting orders and adjust WIP from supported released production order pages.
- When you open the obsolete Subcontracting Worksheet in an online environment without the app installed, a notification explains that the app replaces the worksheet. Choose **Install** to get the new experience or **Don't show me again** to dismiss future notifications.
- When you assign a subcontractor vendor to a work center and the vendor has no **Subc. Location Code**, a notification explains why the location is needed for components and WIP items. Choose **Open Vendor Card** to correct the setup.
- Contoso Coffee demonstration data includes **Bulk Assembly** and **Local Assembly** subcontractors, locations, and work centers. The **Airpot - Subc. Mid-Routing** and **Airpot - Subc. Final Op** routings demonstrate intermediate and final subcontracting operations.
- Standard tasks and detailed work instructions provide more realistic manufacturing examples. Routing operations use different direct costs so that you can compare scenarios without relying on preconfigured subcontractor price records.

## Supply chain management: Use inventory put-aways and picks for subcontracting

Companies that use basic warehouse configurations can include subcontracting in the same inventory activities they use for other inbound and outbound work. Warehouse employees can process subcontracted output without switching to warehouse receipts, and production teams can move work-in-process items (WIP items) between locations without treating them as physical inventory.

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

## Supply chain management: Work more efficiently with manufacturing documents and capacity calendars

Planners and production managers often move between planning worksheets, production orders, work and machine centers, production BOMs, and routings to complete routine work. Small gaps in page actions, fields, filtering, and error navigation add unnecessary steps and can delay production scheduling.

These improvements place manufacturing information and actions closer to the records where you work. You can create released production orders directly from planning suggestions, monitor and calculate capacity calendars, correct uncertified production definitions from actionable errors, and find relevant manufacturing details with less navigation.

### Create released production orders from planning suggestions

On the **Planning Worksheet**, run **Carry Out Action Message** and choose one of the new production order options:

- **Released** creates released production orders directly from the accepted planning lines.
- **Released & Print** creates released production orders and includes them in production order printing.

These options remove the extra step of creating firm planned production orders and changing their status. Printing uses the configured production order report selections. Creating a released production order can immediately post consumption or output for components and routing lines that use forward flushing, according to your manufacturing, item tracking, bin, and warehouse setup.

### Calculate and monitor capacity calendars

You can run **Calculate Work Center Calendar** from the **Work Center Card** and **Calculate Machine Center Calendar** from the **Machine Center Card**. The reports open for the current center, so you don't need to return to the list page.

The calculation reports also provide more helpful filters:

- **Calculate Work Center Calendar** includes **No.** and **Work Center Group Code**.
- **Calc. Machine Center Calendar** includes **No.** and **Work Center No.**.

The **Calendar Entries Available Until** field on Work Center and Machine Center cards and lists shows the latest date for which calendar entries exist. A date earlier than the work date appears in the warning style so that you can identify calendars that need recalculation before scheduling fails.

### Resolve uncertified BOM and routing errors

When a production order references a production BOM or routing that isn't certified, the validation error provides a navigation action:

- **Show Production BOM [number]** opens the affected Production BOM.
- **Show Routing [number]** opens the affected Routing.

Certify the document and retry the operation.

### Find and maintain manufacturing information more easily

The following page improvements reduce extra navigation and prevent avoidable errors:

- **Copy Production Order Document** excludes the current production order from the **Document No.** lookup when the source and destination statuses match.
- **Routing Link Code** is available on **Planning Routing**, **Prod. Order Components**, and **Prod. Order Comp. Line List**. On **Planning Routing**, add the hidden field through personalization when needed.
- **Name 2** is available on Work Center and Machine Center cards and lists. The field is hidden by default and can be added through personalization.

## Sustainability Management: Add EUDR certification information

To help you track the information you need to conform with European Union Deforestation Regulation (EUDR) in Business Central, we added new fields and reports.

On the **Item Card** page, the new **EUDR Relevant** toggle requires a lot-tracking code with a **Lot Info. Required** setting enabled. There's also a new **EUDR Commodity** option (Cattle, Cocoa, Coffee, Oil palm, Rubber, Soya, Wood).

There are new fields for **Lot No. Information**:

- EUDR Certificate No.
- Certification Scheme
- Valid From
- Valid To
- Country/Regions of Production (defaults from the source document, editable for the distributor case)
- DDS Reference Number
- DDS Verification No.

The new **EUDR Sales Invoice** report is a variant of the standard sales invoice that prints, per line or lot, the certification scheme and certificate number registered in the report selection. It doesn't replace the default invoice.

You can access certificate data visible from posted entries by using the standard **Lot No. Information** drill-down.

## Sustainability Management: Estimate your carbon footprint in Service Management

This feature extends sustainability tracking to cover **Service Management** features by displaying carbon footprint values on service documents. Emission data comes from sustainability value entries for items and from resource cards for resource-related emissions.

When you consume or ship items or resources as part of a service order, the system retrieves their associated CO₂e values from sustainability data.

The system shows emission details on service invoices and posted documents for reporting and customer communication. Resource emissions are based on values defined on the resource card. Item emissions come from sustainability setup and item configuration.

Calculations follow the same logic as in other sustainability features, ensuring consistency across modules.

## Sustainability Management: Reverse Sustainability Ledger entries transaction

Enter feature detail here.

## Sustainability Management: Track your carbon footprint for fixed assets

This feature extends sustainability tracking to fixed assets by introducing fields and logic that capture emissions during acquisition, reclassification, and disposal. Emission data flows into the sustainability ledger and integrates with existing sustainability reporting. Validation ensures you can enter emissions only for acquisition transactions. Posting rules maintain data integrity across your fixed asset and sustainability ledgers.

Sustainability fields are available only if you enable sustainability features in setup.

## Sustainability Management: Track your carbon footprint with item journals and item reclassification journals

This feature introduces carbon footprint tracking to **Item Journals** and **Item Reclassification Journals**. It adds fields for CO₂e per unit and total CO₂e, and calculates emissions by using the **Average** method to ensure that emissions follow the same lifecycle logic as item costs.

Emissions are calculated based on **Sustainability Value Entries** by using the **Average** or the new **Specific** method. Posting results are recorded in **Sustainability Value Entries** only. There are no changes to item cost entries.

For **Item Reclassification Journals**:

* Emissions transfer between items without adding new values.
* Maintains a chain for updates after adjustments.

## Sustainability Management: Use formulas to calculate emissions in purchase documents

This feature introduces formula-based emission calculations on purchase documents and uses the same calculation logic as sustainability journals. It applies emission factors to inputs such as fuel, electricity, distance, or custom amounts.

Set up this feature on the **Sustainability Setup** page:

* First, turn on the **Use Emissions in Purchase Documents** toggle.
* Then, turn on the **Use Formulas in Purchase Documents** toggle.
* When both options are active, additional fields become available on purchase lines.

When you fill in a formula field, Business Central calculates values for **Emission CO₂**, **Emission CH₄**, and **Emission N₂O** using **Emission Factors**.

Input validation follows the same rules as sustainability journals, and is based on **Sustainability Account Categories**. If formula fields contain values, manual entry of emissions is blocked. If you enter emissions manually, you can't use formula fields.

## Sustainability Management: Use specific method for carbon footprint calculation when enabling item tracking

This feature introduces a new calculation method for carbon footprint tracking in sustainability value entries. In addition to the current **Average** method, you can enable a **Specific** method for items that you track with serial or lot numbers. On the **Item Card** page, on the **Sustainability** FastTab, you can choose one of the following options in the **Carbon Tracking Method** field:

* **Average** (default) – Use the current behavior for all postings.
* **Specific** – Use the exact emission value for the unit received, similar to specific costing, when you track items by using serial or lot numbers.

## User experiences: Preview images directly in web client

You can open image attachments in the Business Central web client without downloading the images first. Files display in preview mode with an easy-to-use viewer experience that's similar to the print preview or PDF preview features. If you want to save a copy, you can download the image file from the viewer.

This feature works across all areas of Business Central, including agents, email, and code from extensions. However, extension developers must add support for this feature by using *File.ViewFromStream* for Business Central online, or *File.View* for Business Central on-premises. These methods follow the pattern of the *File.Download* method.

Preview images directly supports the following types of image files: JPEG, JPG, PNG, BMP, SVG, WEBP, ICO, plus GIF and AVIF (both include animated versions). On the Safari browser, this feature also supports TIFF and TIF.

The following are a couple of additional benefits:

* There's support for GIF files as FactBox thumbnails, including animation for GIFs up to 48 frames.
* Thumbnail previews are clickable for images and the first page of PDFs, which open the previewer window.

## User experiences: Show recently used in lookups

Business Central now highlights recently used records directly in lookup dialogs. When users open a lookup, the system surfaces records they recently accessed or worked with, making it easier to select the correct value without performing a search.

The suggestions are personalized to each user and are based on usage signals already collected by the platform. The feature reuses the same server-side intelligence that supports Autofill and recent-record scenarios, ensuring consistent recommendations across Business Central experiences.

Users can still browse and search the full list of available records, but the most relevant and recently used entries are immediately available, helping reduce clicks and accelerate common workflows.

The feature makes Business Central feel more responsive and personalized by adapting lookup suggestions to each user's working patterns. It reduces repetitive data entry, speeds up transaction processing, and helps users stay focused on their work. By reusing existing server intelligence already powering Autofill experiences, the feature delivers a consistent and efficient way to surface the most relevant records across the application.

## Related information

[Update 29.0 public preview for Business Central 2026 release wave 2](whatsnew-update-29-0.md)
