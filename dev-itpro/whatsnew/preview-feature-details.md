---
title: Feature details in update 28.0 public preview for 2026 release wave 1
description: Feature details for Business Central 2026 release wave 1
ms.date: 02/28/2026
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: concept-article
ROBOTS: NOINDEX
---

# Feature details for Business Central 2026 release wave 1 public preview

[!INCLUDE [preview-banner](~/../shared-content/shared/preview-includes/preview-banner.md)]

This articles provides details about the features available in the Business Central 2026 release wave 1 (preview). 

> [!IMPORTANT]
> - The features in this article are preview features.
> - Preview features aren’t meant for production use and might have restricted functionality. These features are subject to [supplemental terms of use](https://go.microsoft.com/fwlink/?linkid=2189520), and are available before an official release so that customers can get early access and provide feedback.

## Add pictures to item variants to differentiate product options

You can now store pictures for item variants, letting you add images that represent each variant, such as color or size, so you can quickly recognize differences. You can take a picture, import an existing file, export the current image, or delete it from a **Picture** FactBox on the **Item Variant Card** page.

### Add a picture to an item variant

1. Open the **Item Card** and choose the **Variants** action.
1. Select the variant that you want to update.
1. On the **Item Variant Card**, in the **Picture** FactBox, choose one of the following actions: 

   - **Import** to upload a file.
   - **Take** to use your device camera to capture an image.
   - **Delete** if you don't want the picture.
   - **Export** if you want to save the current image.



## Add the Description 2 field to various pages to gain more insight

The **Description 2** field is now available for personalization on more pages.

* **Production BOM Lines** (page 99000788)
* **Production BOM Version Lines** (page 99000789)
* **Prod. BOM Mat. per Ver. Matrix** (page 9287)
* **Prod. BOM Version Comparison** (page 9288)
* **Planning Component List** (page 99000861)
* **Planning Components** (page 99000862)
* **Prod. Order Comp. Lines** (page 5407)
* **Prod. Order Components** (page 99000818)
* **Standard Tasks** (page 99000799)
* **Routing Lines** (page 99000765)
* **Routing Version Lines** (page 99000767)
* **Planning Routing** (page 99000863)
* **Prod. Order Routing** (page 99000817)
* **Prod. Order Routing Lines** (page 5408)
* **Machine Center Task List** (page 99000916)
* **Work Center Task List** (page 99000915)

The **Description 2** field is added at the table level, and is fully supported in planning, routing, production order creation, and related processes.



## Adjust VAT in local currency on sales documents in Czechia

You can now adjust VAT amounts in local currency on posted sales invoices issued in foreign currency. The functionality mirrors the existing process for purchase invoices:

* A new action, **Correct VAT in Local Currency**, is available on posted sales invoices in foreign currency (hidden for invoices in local currency).
* Users can increase or decrease the VAT amount and post the difference to a dedicated rounding account defined in **VAT Posting Setup**.
* A new field, **Rounding Account for VAT Correction in Local Currency**, has been added to the Sales tab in **VAT Posting Setup**.
* The correction entries are filtered by document number and posted using the same logic as purchase corrections.



## AL developers can use semantic search on data and metadata

In this release wave, we make it possible for AL developers to get access to the semantic ranking of (virtual metadata provider) records from the AL language.

Effectively this means that a developer can run a query like: TOP n by similarity to "search term".

The semantic data (and metadata) search is available from the new codeunit "Semantic Data Search" with methods such as 
* SetMaxResults
* SetSearchTarget(RecRef)
* FindSimilarByField(SearchString, FieldIds, Rec)



## Align VAT periods with Microsoft standards for Czechia

The feature consolidates the Czech localization functionality **VAT Period** into the standard **VAT Return Period** table. All processes previously based on VAT Period—such as period generation, closing, and posting checks—will now operate on VAT Return Period. 

Key elements include:

* **Data Migration**: Existing VAT Period records will be migrated to VAT Return Period during the upgrade.
* **Synchronization**: Bidirectional synchronization between VAT Period and VAT Return Period ensures data consistency.
* **New Report**: Create VAT Return Periods report for generating periods with parameters (start date, number of periods, length, due date).
* **Report Updates**: Reports such as VAT Statement Preparation, Calculate and Post VAT Settlement, and Export VAT Statement will reference VAT Return Period.
* **Feature Management**: Controlled activation via Feature Management, allowing testing in sandbox environments before enabling in production.



## Approve requisition worksheets and item journals

We've extended approval workflows to item journals and requisition and planning worksheets. You can ensure that someone reviews and approves entries before creating purchase documents or posting inventory adjustments.

### Approval workflows for item journals

Item Journals now support the same approval workflow capabilities that you have today in general journal batches. You can send batches for approval from the following journals:

* Item Journal
* Physical Inventory Journal
* Output Journal
* Consumption Journal

When a journal batch has an approval entry in progress, you can't edit, delete, or post the record until the approval is completed or canceled. The workflow status shows on the journal pages, and the **Approve**, **Reject**, **Delegate**, and **Comments** approval actions are available.

### Approval workflows for requisition and planning worksheets

Requisition and planning worksheets now include full approval workflow support at the worksheet batch level. You can send a worksheet batch for approval before you carry out planning or convert requisition lines into purchase documents. When an approval request is created for a worksheet batch:

* You can't insert, modify, or delete requisition or planning lines.
* The workflow status shows on the worksheet pages.
* Approval actions are available to approve, reject, or delegate the batch.

Worksheet-level approval prevents changes to planning data while decisions are pending.

### Enable and use approvals

You configure these approvals under **Workflows**:

1.  Choose **Tell me**, enter **Workflows**, and then select the related link.
2.  Select an **Item Journal Batch Approval Workflow** or **Requisition Worksheet Batch Approval Workflow** workflow template.
3.  Specify the template and batch in the event conditions.
3.  Configure approvers, and enable the workflow.
4.  Open a item journal or requisition/planning worksheet, and choose the **Send for approval** action.
5.  Track the status of the approval in the **Status** field on the **Approval Entries** page.

Microsoft Power Automate support is available through updated workflow events and responses, with guidance provided as part of the enhancement.



## Assign custom collections to items exported to Shopify

This feature enables you to synchronize custom product collections from Shopify into Business Central. You can import available collections from your Shopify store and manage them on the **Shopify Custom Product Collections** page. From this page, you can:

- Get a list of custom product collections from Shopify.
- Assign the items you export from Shopify to the appropriate collections.

One thing to note, however, is that Shopify lets you define **Custom** and **Smart** collections. This feature doesn't cover Smart collections because they're rule-based and can't be manually assigned.

### Multiple product tax or VAT rates

Some product categories are eligible for reduced tax rates, such as pharmaceutical products or children's clothing and footwear. You can use the tax override feature in Shopify to specify that and custom collection is a key element for that. Learn more at [Tax overrides and exemptions](https://help.shopify.com/manual/taxes/tax-overrides#create-a-manual-collection-for-products-that-need-a-tax-override).



## Audit user and group permissions across apps

The new **Permissions Overview** page provides comprehensive visibility into permission sets across all installed apps and extensions.

Key capabilities:

- View permissions from all apps and extensions in a unified view
- Filter data by object, scope, extension, or permission set to quickly find specific permissions
- Identify which permission sets grant access to a specific object (for example, which sets allow editing customer records)
- FactBoxes that showing which security groups and users are assigned each permission set

This centralized view helps administrators analyze permission dependencies, conduct security audits, and troubleshoot access issues without navigating multiple pages or extensions.



## Calculate taxes for plastic and sugar

Business Central introduces new capabilities in excise journals to calculate tax amounts for plastic and sugar based on legislation requirements that use weight, content, and transaction quantities as the basis for excise tax. The new **Excise Tax Type**, **Qty. for Excise Tax**, and **Excise UOM** fields on the **Item Card** and **Fixed Asset Card** pages let you define material composition and the relevant quantity basis for each product or fixed asset.

For tax on plastic, Business Central calculates excise quantities by aggregating item ledger entries from purchases, positive adjustments, production output, assembly output, and fixed asset ledger entries related to an acquisition. To determine the tax basis, it multiplies the calculated quantity by the defined excise quantity.

For tax on sugar, Business Central uses Item ledger entries from sales and negative adjustments to determine the total sugar content for the reporting period. The tax basis is derived by multiplying the excise quantity per unit by the total quantity sold or consumed.

These calculations generate the core data needed to report tax on plastics and sugar, while the specific country/region‑level tax declaration forms remain out of scope. This provides flexibility for partners and customers to adapt the output to local submission requirements while relying on standardized, accurate calculations in Business Central.



## Calculate withholding taxes for vendors

In some countries/regions, companies must pay withholding tax to the government for certain third‑party services or vendor purchases. Business Central calculates withholding tax when you pay a vendor invoice, or when you post it, based on your setup. The tax amount is withheld from the payment and reduces the total amount owed to the vendor.

You can configure withholding tax by setting up **Withholding Tax Codes** and **Vendors**.

### Get started

To enable withholding tax calculation, open the **General Ledger Setup** page and turn it on. Next, configure the **Withholding Tax Revenue Types**, including their sequences and posting groups. Then, set up the following:

- **Withholding Tax Bus. Post. Group** and apply it to vendors that are subject to withholding tax.
- **Withholding Tax Prod. Post. Group** and apply it to items or general ledger accounts.  
- **Withholding Tax Posting Setup** (using the two groups above)

If needed, you can override the product posting group on purchase document lines using the **Withholding Tax Prod. Post. Group** field.

### Using withholding tax

Withholding tax applies automatically when you're working with purchase documents. When you post a document that includes withholding tax, Business Central creates a withholding tax entry. You can also use the **Calculate and post withholding tax settlements** action to process withholding tax for a specific period based on the withholding tax entries you already posted.



## Change Original Document VAT Date in VAT Entries - Czechia

This functionality enables authorised users to edit the **Original VAT Date** field on posted VAT entries. When the date is changed, all related tables, such as posted purchase invoices, credit memos, VAT entries, general journals, and VAT control reports are updated accordingly. A confirmation dialog appears for changes that affect related entries. Additional validations prevent changes to closed entries, issued VAT control reports, or when the new date conflicts with the VAT date. The user setup has been extended to include the **Allow Original VAT Date Change** option on the user setup card.



## Connect AI agents to the Admin Center through MCP server

2026 release wave 1 starts the preview of the MCP (Model Context Protocol) server that exposes Business Central Admin Center APIs in a standardized, self‑describing way. MCP‑compatible AI agents can discover available admin operations, understand context, and perform environment management tasks.

Using tools like Visual Studio Code, administrators can ask questions such as environment update status, available upgrades, or installed extensions, and receive structured responses sourced directly from the Admin Center. Agents can also propose follow‑up actions—such as copying an environment to a sandbox, scheduling an update, or investigating a failed upgrade—while keeping the user in control through explicit confirmation steps.

Example scenarios include:
* Checking whether updates are available for environments and when they're scheduled
* Copying an environment to a sandbox and triggering an immediate update
* Reviewing update history and diagnosing failed upgrades
* Listing installed extensions for a given environment

This approach simplifies common admin workflows that previously required PowerShell scripts or Logic Apps, making environment management more accessible and consistent across tools while reusing the same secure Business Central Admin Center APIs.



## Control the lifecycle of report layouts

Report layout administrators can set the status of report layouts to control their lifecycle stages. The following statuses are available:

* Draft - Layout is under development and not available to users.
* Pending approval - Layout is awaiting approval.
* Approved - Layout is approved and available to users.
* Retired - Layout is phased out and no longer available.



## Create contract service orders with respect of the One Service Item Line/Order setting

Based on service contracts, you can automatically create service orders for the maintenance of service items. 

1. Select **Search** (Alt+Q), enter **Create Contract Service Orders**, and then choose the related link.  
2. Fill in the **Starting Date** and **Ending Date** fields with the starting date and ending date for the period that you want to create contract service orders for. The batch job creates service orders that include service items in service contracts with next planned service dates within this period.  
3. Optionally, set more filters that apply to the **Service Contract Header**.
4. Choose **OK**.

Service orders will be created.

The **One Service Item Line/Order** setting on the **Service Management Setup** page determines how orders are created for service contracts with several service items:

- If the **One Service Item Line/Order** is enabled, the batch process creates one service order per service item in the contract. For example, a contract with four service items results in four separate service orders.
- If the **One Service Item Line/Order** is disabled, the batch process creates a single service order containing all service items from the contract.

We'd like to thank our community for making this valuable contribution.



## Create purchase orders from drop shipments

You can create purchase orders directly from sales orders that are set up for drop shipment by choosing the **Create Purchase Orders** action.

Drop shipment orders are taken into consideration by the **Order Planning** page, so drop shipment lines are included when calculating plans. Also, the **Planning Worksheet** page now includes a dedicated **Drop Shipment** action group with the **Get Sales Orders** and **Sales Orders** actions, similar to the requisition worksheet.

### Create a purchase order from a drop shipment

You can create purchase orders from drop shipments from several pages.

From a sales order, as follows:

1.  Open a sales order that has lines marked as **Drop Shipment**.
2.  Choose the **Create Purchase Orders** action.
3.  On the **Create Purchase Orders** page, review the suggested lines. The vendor is added based on information from the **Item Card** or the **Stockkeeping Unit Card** pages. You can change the vendor if needed.

From order planning, as follows:

- On the **Order Planning** page, use the **Calculate Plan** action. Drop shipment lines are included.

From a planning worksheet, as follows:

- On the **Planning Worksheet** page, use the new **Drop Shipment** action group and the **Get Sales Orders** action to include sales orders.



## Create purchase quotes for contacts

You can create purchase quotes for contacts that aren't yet associated with a vendor. This removes the need to set up a vendor record before you prepare a quote, which is useful when you're unsure whether the purchase will proceed.

When you convert the quote into an order or release the document, Business Central automatically creates the vendor using a vendor template. Business Central selects the appropriate template based on criteria such as territory code, country/region code, and contact type from the contact. If only one template matches, it's applied automatically, otherwise you're prompted to choose from available templates.

Here's an overview of the process:

1.  Create a **Purchase Quote**, and select a contact that isn't linked to a vendor.
2.  If multiple templates are available, choose a vendor template.
3.  Enter the details for the quote.
4.  When you release the quote or convert it to an order, Business Central creates the vendor record using the selected template.



## Define item attributes for item variants

Item variants are a great way to keep your list of products under control. For example, you have a large number of items that are almost identical and vary only in color. You can define each variant as a separate item. But you can also choose to set up one item and specify the various colors as variants of the item.

You can assign attribute values that reflect the specific variant at the item variant level. Item variants inherit attributes from the item, and you can adjust or remove those inherited values when the variant requires different information.
  
You can open the **Item Variant Attribute Values** page from the **Item Variants List** or the **Item Variant Card** pages to review or edit variant-specific attributes. When you add a new variant of an item, the attributes defined for the item transfer to the variant. You can then update or delete the inherited values to ensure the variant shows the correct details. 

There is also also new the **Update Variant Attributes** action available from the **Item Card** that lets you to force sync attributes from the item to its variants.



## Discover emails in the mailbox that have been processed by Payables Agent

Payables Agent assigns the **Processed by Payables Agent** category to the emails it picks up. The category makes it easier for the people who work in the same mailboxes in Outlook to identify the messages that the agent has processed. This change is a direct result of user feedback and is an important improvement to the human-agent relationship.



## Download symbols from NuGet feed

A new command **AL: Download Symbols from Global Sources** allows downloading app packages directly from Microsoft's public NuGet feeds, or optionally from custom feeds if this is set up.

Country/region-specific packages are supported, using the al.symbolsCountryRegion setting, giving developers flexibility when working with localized or external apps.

Custom NuGet feeds can be configured via al.customNugetFeeds, with the option to restrict downloads to custom feeds only using al.useOnlyCustomFeeds.

Usage
* Open Visual Studio Code Command Palette and invoke "AL: Download Symbols from Global Sources". 
* The AL VSIX extension then downloads symbols from Microsoft feeds and/or your custom feeds based on settings. 

Feature settings
You can control how symbol feeds are handles via these new settings.json entries in Visual Studio Code
* al.nuget - Feeds	Array of custom NuGet feed URLs to search for symbol packages. These feeds are checked after the built-in Microsoft feeds. Each URL should point to a public NuGet v3 feed that does not require authentication.	
* al.useOnlyCustomFeeds	- Boolean. When true, only the feeds specified in al.nugetFeeds are used. Built-in Microsoft feeds are ignored.	
* al.symbolsCountryRegion	- Country/region code for localized symbol packages. Use ISO 3166-1 alpha-2 codes (e.g., us, de, dk) or w1 for worldwide. If not specified, you will be prompted during download.	

Note
* Built-in Microsoft feeds are used unless al.useOnlyCustomFeeds is enabled. 
* Country/region codes must follow ISO 3166-1 alpha-2 or w1 for worldwide. 
* Custom feeds should be public NuGet v3 feeds without authentication.



## Enable Troubleshooting MCP Server for AL

The Troubleshooting MCP Server is available during active AL debugging sessions in Visual Studio Code and becomes accessible when execution is paused at a breakpoint or runtime error. In this state, GitHub Copilot, or other coding agents, can use the server to analyze the current execution context and provide insights based on real runtime data rather than static code inspection.

Through the Troubleshooting MCP Server, coding agents can retrieve and analyze the full call stack to explain how execution reached a specific point, including scenarios involving deep or complex call chains across multiple application objects. This makes it easier to trace error origins, understand execution flow, and identify which entry points or tests triggered a failure.

The Troubleshooting MCP server also enables inspection of variable state across different stack frames, allowing partners to understand why conditions evaluated as they did or how data was passed and transformed between procedures. Variable inspection supports both local and global variables, as well as complex types, helping partners diagnose subtle state‑related issues that are difficult to uncover with traditional single‑frame debugging.

In addition, the Troubleshooting MCP Server can retrieve source code for the relevant execution frame, including system or framework code, enabling analysis of implementation details without manually navigating files. Thus, coding agents can also place breakpoints programmatically based on ongoing analysis, supporting targeted investigations in areas that are otherwise hard to reach.

While the Troubleshooting MCP Server enhances debugging for complex and multi‑layered scenarios, it's designed to complement—not replace—traditional debugging tools. Interactive step‑through debugging and quick visual inspection remain well-suited for simple issues or for learning code flow, whereas the Troubleshooting MCP Server excels in advanced analysis, multi‑frame reasoning, and AI‑assisted diagnostics.



## Enhanced demo data for sales, purchasing, and fixed assets analytics

We're enhancing the demo data for the Sales, Purchasing, and Fixed Assets modules to make it easier to demonstrate the reporting and analytics in those areas. The following lists briefly describe the enhancements in each area.

**Sales**

* Salespersons: Distributed sales documents across more salespeople.
* Open orders: Added more open sales orders.
* Backorders: Added more sales backorders.
* Due dates: Spread out the due date of existing sales documents.
* Deferral codes: Added deferral codes to posted and unposted sales documents.
* Discounts: Added line discounts to posted sales invoices.

**Purchasing**

* Added new purchasing department dimension and used that on purchase documents before posting.
* Purchasing Module: Added purchasers and return reasons to existing purchase documents.
* Analytics Module: Added purchasers and return reasons to existing purchase documents.

**Fixed Assets**

* Added dimension setup and posted entries for fixed assets.



## Enhanced Subscription Billing Power BI app

We've updated the Subscription Billing Power BI app with a number of new features and generally aligning its appearance with the style of the other Power BI apps. 

We also introduced map visuals for data with locations, enhanced analyses on profitability, and introduced drill-back from the report back to the transactions in Business Central.

The following reports are updated:

* Subscription Billing Overview
* Revenue Year-Over-Year
* Revenue Analysis
* Revenue Development
* Churn Analysis
* Revenue by Item
* Revenue by Customer
* Revenue by Salesperson
* Total Contract Value Year Over Yeah Growth
* Total Contract Value Analysis
* Customer Deferrals
* Vendor Deferrals
* Revenue Forecast
* Billing Forecast

The following are more details about the changes we made to each report.

**Subscription Billing Overview**

* Updated the Layout of Overview page to align with other embedded reports in Business Central and focus high-level analysis across the Customers, Vendors, and Package dimensions.
* Updated the Top 5 Customer and Vendor visuals to be stacked bar charts for easier analysis of key revenue and cost sources.
* Implemented KPI Card pages to emphasize to key Subscription Billing measures.

**Revenue Year-Over-Year**

* Added **Mon. Recurring Revenue by Package** for more dynamic analysis by subscription packages.
* Added a **Tooltips to Recurring Revenue by Month** visual to improve access to supporting measures.
* Applied conditional formatting to emphasize key measures and updated time intelligence visual to a line chart to align with other reports.

**Revenue Analysis**

* Added **Item Category** and **Salesperson** navigation visuals to the left of the decomposition tree for easier analysis and to align with the sales and purchasing reports.

**Revenue Development**

* Updated the time intelligence visual to focus on total change and align with other embedded reports in Business Central.
* Moved additional measures to tooltips to improve clarity when analyzing the **Change to Monthly Revenue** report.
* Added support for a fiscal calendar hierarchy to enhance flexibility when analyzing by date.

**Churn Analysis**

* Added **Churn by Fiscal Period and Customer** visuals to the left of the decomposition tree for easier analysis and to align with sales and purchasing reports.

**Revenue by Item**

* Added a **Profitability by Item Category** scatter chart for more engaging visualization of item profit and revenue performance.
* Added support for an item category hierarchy to enhance flexibility when analyzing by item categories.
* Updated the **Mon. Recurring Revenue by Item** visual to be a tree map for consistency with other embedded reports.
* Added conditional formatting to emphasize the **Monthly Profit %** measure.

**Revenue by Customer**
* Added Customer Location Map visual to improve subscription profit insights across customer demographics.
* Added conditional formatting to emphasize key Monthly Net Profit % measure

**Revenue by Salesperson**

* Added a **Profitability by Salesperson** visual for more engaging visualization of salesperson profit and revenue performance.
* Added conditional formatting to emphasize key **Net Profit %** measures.
* Implemented consistent legend formatting for easier analysis by salesperson.

**Total Contract Value Year Over Yeah Growth**

* Updated the **Total Contract Value by Calendar Year** visual to align with other embedded reports in Business Central.
* Added a **Total Contract Change** measure to tooltip to allow for easier analysis when comparing against previous year.
* Added conditional formatting to matrix visual to emphasize the **Total Contract Value** measure.

**Total Contract Value Analysis**

* Added **Contract Value by Package and Salesperson** visuals to the left of the decomposition tree for easier analysis and to align with sales and purchasing reports.

**Customer Deferrals**

* Added a **Customer Deferrals by Released Status** pie chart visual for easier analysis of total customer deferrals by status.

**Vendor Deferrals**

* Added a **Vendor Deferrals by Released Status** pie chart visual for easier analysis of total customer deferrals by status.

**Revenue Forecast**

* Added conditional formatting to more effectively analyse revenue forecast trends and outliers, and align with the sales app.

**Billing Forecast**

* Added a dedicated **Billing Forecast by Vendor** table to improve clarity when analyzing vendor and customer forecasts.
* Added conditional formatting to more effectively analyze billing forecast trends and outliers.



## Evaluate AL coding agents with BC-Bench

BC‑Bench is a benchmarking framework for evaluating agent performance on real‑world Dynamics 365 Business Central AL coding tasks. Inspired by SWE‑Bench, it provides measurable, repeatable results instead of subjective impressions, helping developers understand what improvements actually work.

The benchmark focuses on realistic Business Central development scenarios, such as bug fixes and test creation, using curated AL code problems derived from real pull requests. It establishes a consistent evaluation baseline across agent context, instructions, and tooling, enabling objective comparison over time.

By producing transparent metrics, BC‑Bench increases trust in Copilot capabilities, supports data‑driven investment decisions, and helps partners and the community clearly understand an agent's strengths and limitations for Business Central development.



## Evaluate the quality of goods and materials

Quality Management features are available as an extension. The extension installs automatically on newly deployed environments. For upgraded environments, you can install the extension from AppSource.

The extension gives you full control of when you do quality checks:

- **Purchase Receipts**: Quality checks happen after you post purchase receipts, with or without warehousing handling.
- **Production Output**: Quality checks happen on production output, either manually or automatically (flushing), to verify that the manufactured products meet quality specifications.
- **Assembly Output**: Quality checks happen on assembly output, either manual or automatic (assembly-to-order), to ensure that the assembled items meet quality standards.
- **Manual and Scheduled Checks**: Quality checks trigger manually or at regular intervals on a schedule.

Several parameters are available that let you fine-tune your quality checks:

- **Quality check scope**: Apply the quality check scope to various levels, including individual items, groups, lots, or specific serial and package numbers.
- **Parameters or attributes to assess**: Assess physical measurements such as weight, dimensions, and density to ensure products conform to specifications.
- **Quality check timing and triggers**: Specify the event that initiates the quality control procedure. For example, use an event when you post a purchase receipt, after production or assembly output, or at predefined time intervals.
- **External analysis settings**: Set a fixed quantity or percentage of the total quantity as samples for third-party analysis.
- **Quality test plans**: Define a quality test plan for each scope. Include triggers and a list of testing parameters for each trigger.
- **Quarantine procedures**: Define quarantine procedures to freeze items or prevent their immediate use.

The extension also offers several tools for reporting and analyses.

- **Quality Certificates**: Quality certificates are essential documents that verify the quality and safety of products. They ensure compliance with standards.
- **Certificate of Analysis**: A certificate of analysis provides detailed information about the composition and quality of a product. You often need it for regulatory compliance.
- **Quality Status Overview**: An overview of item quality status helps stakeholders understand the current quality levels and any issues in production.
- **Quality Orders Overview**: An overview of quality orders summarizes customer requirements and production batches. It ensures that quality expectations are met.

## Experience improved usability in manufacturing

We've addressed several friction points in manufacturing processes.

### Use the Explode Routing action and items with serial numbers

When you report production output for items with serial number tracking, you often need one journal line per serial number. Previously, when you turned on **Item Tracking on Lines** in the **Output Journal** and chose **Explode Routing**, the last operation for a serial-tracked item could still show the full order quantity on the line. With this improvement, Business Central respects item tracking setting when exploding routing lines in output journals:

* For serial-tracked items, Business Central splits the last routing operation into multiple lines with quantity 1 per serial number, and the journal line is ready for you to enter assigned serial number.
* For lot-tracked items, the behavior is unchanged. The operation remains on a single line with the full quantity.

### Respect location code when posting capacity and overhead

In many manufacturing environments, you post production consumption and output by location, with separate WIP accounts per site. Until now, capacity and overhead postings were always evaluated against the **Inventory Posting Setup** for a *blank* location code, because the related entries didn't have a location value. This could cause:

* All capacity and overhead costs to be posted to a single WIP account.
* Imbalances when material consumption and output were posted to location-specific WIP accounts, but capacity and overhead went to the blank-location WIP account.
* An error that forced you to maintain an **Inventory Posting Setup** line for blank location when you added overhead to routings and posted the production journal.

With this improvement, Business Central uses the production location when posting capacity and overhead.

The following list describes what we changed.

*  Value entries that are linked to capacity ledger entries now have a **Location Code** value that comes from the related production order line or item journal line.
* When you post capacity or overhead, Business Central uses the **Inventory Posting Setup** for that specific location, not the blank location.
* You are no longer forced to keep an **Inventory Posting Setup** line for a blank location just to post overhead.

### Control warnings for non-certified production BOMs and routings

When you design or maintain production BOMs and routings, you might work with **non-certified** structures for extended periods. A confirmation message that reminds you that a BOM or routing isn't certified is useful, but it can also become noise if it displays many times per day. Previously, when you tried to close a non-certified production BOM or version, Business Central showed a message such as:

- *The Production BOM has not been certified. Are you sure you want to exit?*

There was no way to turn this specific warning on or off per person. Now, we've added a new **My Notifications** setting so you can control whether to display warnings for non-certified production BOMs and routings. To configure the notification:

1.  Choose the **Settings** icon and select **My Settings**.
2.  Choose **My Notifications**.
3.  Search for **“Warn about non-certified production BOMs and routings”**.
4.  Turn on the notification if you want to be reminded, or **off** if you mainly work with non-certified data and don't want the extra confirmation.



## Export items to Shopify with product options based on item attributes

When you export items from Business Central to Shopify, you can now designate up to three item attributes as Shopify product options. This capability allows you to define products in Shopify with independent options like color, size, or material to create variants based on different combinations of these attributes.

This capability lets you control how item attributes translate to Shopify's product structure. When you mark an item attribute with the **Incl. in Product Sync** field set to *As Option*, the connector exports that attribute as a Shopify product option during synchronization. Each item variant with different attribute values becomes a distinct Shopify variant with properly structured options.

For example, if you have a t-shirt item in Business Central with **Color** and **Size** attributes marked as options, the export creates a Shopify product with Color and Size as options you can select. Each item variant (Red/Small, Red/Large, Blue/Small, Blue/Large) appears as a separate variant in Shopify with the correct option values.

### How it works

You configure item attributes at the item level in Business Central. When you're ready to sync:

1. Open the **Item Attributes** page and identify which attributes should become Shopify product options.
2. Set the **Incl. in Product Sync** field to *As Option* for the attributes you want to export.
3. Assign attribute values to your items and item variants. Make sure that the item has a maximum of three attributes that you mark with the *As Option* value.
4. Export items to Shopify

The connector validates your configuration before export. If you try to export an item with more than three attributes marked as options, Business Central skips the item and logs the reason in the **Shopify Skipped Entries** page. Similarly, if you have duplicate attribute value combinations across variants (such as two variants that both have a Color attribute set to Black), the export fails with a clear explanation in the log.

When you add a new item as a variant to an existing Shopify product using the **Add Item as Variant** action, the connector verifies that the new item has the same attribute structure as the original product and that the attribute value combination is unique.

### Limitations

This feature isn't available when you turn on the **UoM as Variant** toggle in the **Shopify Shop** card. Conversely, if you have item attributes configured for synchronization, you can't turn on the UoM as Variant toggle. This mutual exclusivity prevents conflicts between two different variant management approaches.



## Filter receipt and shipment lines to quickly find the documents you want to invoice

This release adds new filtering options to the **Get Receipt Lines**, **Get Shipment Lines**, and **Get Service Shipment Lines** pages. When you bring receipt or shipment lines into documents such as purchase, sales, or service invoice, you can now narrow the list by filtering on following fields: 

*All*: 
- **Order No.** 
- **Your Reference** 

Sales/Service shipment only: 
- **External Document No.

Purchase receipts only: 
- **Vendor Order No.** 
- **Vendor Shipment No.** 
- **Item Reference No.** 

These fields come from the related document header and are now stored on the receipt or shipment line, so you can apply filters directly on the lookup pages. 

### How to use the new filters 

1. Open a purchase, sales, or service invoice.  
2. Choose **Get Receipt Lines**, **Get Shipment Lines**, or **Get Service Shipment Lines**.  
3. On the lookup page, use the filters on fields as usual to narrow the list to the specific order or reference you are working with.  
4. Select the matching lines and bring them into your document.



## Financial Reporting enhancements

Report users, authors, and administrators get new features to make common tasks in financial reporting more efficient.

Report authors can:

* Choose to display the company logo on PDF outputs.
* Override global defaults for negative number format, report period, and logo placement on single reports.

Report users can:

* Schedule reports for a distribution group. Recipients can get the report output in an email and in their report inbox.
* Run a report over all values of a dimension.
* Run multiple reports and get a single PDF with the result.

Report administrators can:

* Set global defaults for negative number format, report period, and logo placement.
* Monitor report use from a new audit log.



## Get item insights with advanced KPIs and Summary

Copilot gives you faster and more comprehensive item summaries with new KPIs and data points from the new **Item Statistics** page. 

### Item Statistics page 

The **Item Statistics** page provides financial and performance metrics for an item across different time periods.

- **Current Inventory Value**: Track the current inventory value (in local currency), calculated as the sum of Cost Amount (Actual) + Cost Amount (Expected) on posted Value Entries for this item.
- **Expired Inventory Value**: Identify obsolete stock for timely action. Applicable for items with enabled item tracking and expiration dates. Calculated as the sum of Cost Amount (Actual) + Cost Amount (Expected) from Value Entries applied to open Item Ledger Entries with Expiration Date before the Work Date. 

The Sales section displays four time period columns with multiple metrics per period.

Time periods:
1. **This Fiscal Period** - Current accounting period in the fiscal year
2. **This Fiscal Year** - Current fiscal year to date
3. **Last Fiscal Year** - Previous fiscal year
4. **Lifetime** - All transactions since the item was created

Sales Metrics:
- **Sales Growth Rate (%)**: Compare current and prior periods to identify demand trends. Calculated as (Sales in the current period in the fiscal year - Sales in the prior period in the fiscal year) ÷ Sales in the prior period in the fiscal year. A positive value indicates growth, while a negative value indicates a decline in sales.
- **Net Sales (LCY)**: View actual revenue after returns and discounts. Calculated as Total sales in the period  - Total returns - Total given discounts.
- **Gross Margin (%)**: Assess profitability by comparing revenue to cost of goods sold. Calculated as((Net Sales - COGS) ÷ Net Sales. A higher percentage reflects better profitability.
- **Return Rate (%)**: Monitor product quality and customer satisfaction through return ratios.  Calculated as Returned Quantity ÷ Total Sold Quantity. A lower percentage indicates fewer returns and higher product acceptance.

When you turn on the **Summarize with Copilot** capability, you automatically enable these enhancements. 

> [!NOTE]
> - You can use this feature as a production-ready preview in production and sandbox environments for any country/region localization. Production-ready previews have supplemental terms of use. For more information, see [Supplemental terms of use for Dynamics 365 preview](https://go.microsoft.com/fwlink/?linkid=2105274).
> - Microsoft supports this feature in English and select languages only. While you can use it in other languages, it might not work as expected. Language quality depends on your interaction and system settings, which can affect accuracy and the user experience.
> - AI-generated content might be incorrect.

### About security, privacy, and AI

Copilot is built on Microsoft's comprehensive approach to enterprise security, privacy, compliance, and responsible AI. Our philosophy is that your data is your data: Microsoft doesn't use customer data in Business Central to train AI models.

[Read the FAQ for Copilot data security and privacy for Dynamics 365.](/power-platform/faqs-copilot-data-security-privacy)

### Additional resources

[Summarize records with Copilot](/dynamics365/business-central/summarize-with-copilot) (docs)

## Get started with clearer user setup controls for Czechia

The **User Setup** page has been updated so that all links to extended user control functionality are grouped under a new action group called **User Check**. This group appears or disappears dynamically based on the value of the **User Checks Allowed** field in **General Ledger Setup**.

Fields related to user controls on the **User Setup** page are conditionally displayed based on the global functionality setting in **General Ledger Setup**.

The **User Setup Card** page now provides a clearer layout for links to functionality settings.



## Link inbound e-documents to purchase invoices

This feature helps when inbound e‑document arrives from the connector after the related purchase invoice is already in Business Central, specifically in intercompany processes.

To link an e‑document, you open the **E‑Document Purchase Draft** page, ensure a vendor is assigned, and then use the **Link to Existing Document** action. Business Central displays a filtered list of purchase invoices or credit memos based on vendor and total amount. After you select a document, Business Central updates it with the e‑document totals and sets the e‑document status to **Processed**.

You can also relink an already processed e‑document to a different document. Depending on how you created the previous document, Business Central either unlinks it or deletes it. The feature requires that the vendor has an **IC Partner Code**, because it currently supports intercompany scenarios only.



## Manage database index usage and cost per company

### View index information

Access detailed index information directly in the UI. Open the **Database Index Information** page from the **Table Information** page by selecting a table. Here, you see per-index details from the new **Database Index** virtual table, including storage usage, SQL Server index usage statistics, and index type (AL-defined or system-generated).

### Turn off indexes per company

You can turn off non-unique indexes with low usage to reduce storage costs and improve write performance. In the **Indexes** section of the **Database Index Information** page, clear the **Enabled in Database** check box for the unwanted index.

Unique indexes, primary keys, SIFT, and systemid indexes are protected from disabling. Disabling an index takes effect immediately. Enabling an index is queued for the next scheduled midnight process.



## Manage tasks from all agents in dedicated task pane

This feature introduces a dedicated task pane in Business Central that displays all tasks generated by the agents. 

The task pane appears as an additional panel in the user interface and can be opened from anywhere in Business Central. Tasks include suggestions, validations, follow‑ups access to draft documents, and other agent‑initiated actions. Users can review task details, navigate directly to the affected record, complete tasks, or dismiss them.

This improvement primarily benefits roles that rely heavily on AI‑driven workflows — such as accountants, sales people, and managers — who often engage with multiple agents throughout the day. The task pane reduces friction by collecting all insights in a single location, minimizing missed tasks and improving throughput.



## Match purchase invoices to multiple order and receipt lines

The purchase order matching experience lets you match purchase invoice lines to multiple purchase order lines and posted receipt lines. You gain much more flexibility compared to the existing **Get Receipt Lines** action, which is based on posted receipts and matches line to line.

The new **Get Order Lines** action on the purchase invoice opens a list of order lines that are received but not invoiced, or order lines that aren't received. You can match each invoice line to any number of purchase order lines, regardless of whether receipts exist. When receipts exist, they display with the relevant details. When receipts don't exist, you can match the invoice line directly to the purchase order lines and decide later whether to receive manually or to use the new auto‑receipt capability.

From each invoice line, you can open the **Matched Order Lines** page to review and adjust the order lines that will be invoiced with that invoice line. You can edit quantities, add additional PO‑lines or posted receipt lines, and review discrepancies such as price or amount differences. You can also open **Matched Order Lines** on the invoice header to review and correct matching across the entire document.

On purchase orders, the new **Matched Invoice Lines** field shows the quantity matched via invoice lines to each order line. 

When you turn on the new **Receipt on Invoice** toggle on the order, posting the linked invoice automatically creates the required receipts. However, you can't enable this option for orders that use advanced warehouse operations, have item tracking, or are already partially received.

This feature has a few limitations though:
 
- It doesn’t work with orders that have prepayments, or lines of the Item Charges type.
- You can’t use it with orders linked to projects, subcontracting, blanket orders, or intercompany transactions.
- You can’t use auto-receive with partially received lines, or locations that use directed put away and pick (in warehouse management).



## Migrate to the cloud from any SQL database

Business Central cloud migration tooling is extended to let developers build fast, repeatable, and reliable data migration engines for SQL‑based source systems. These custom migration engines are implemented as extensions and can be packaged, installed, and reused through AppSource, enabling consistent delivery across customer projects.

The platform introduces a generic, system‑level migration module that integrates directly with the Cloud Migration wizard through a new Generic Custom migration type. Developers implement a standardized AL interface that defines how data is mapped, replicated, and transformed from external SQL sources into Business Central. The platform provides shared helper methods to simplify custom implementations, including mapping helpers, replication and transformation orchestration, and a generic UI for tracking migration progress and errors.

Custom migration engines built using this model have the same core migration capabilities as Microsoft‑provided migration engines for Business Central, Dynamics GP, and Dynamics SL. Migration execution, status, and failures surface in a generic migration UI, ensuring a consistent administrative experience across built‑in and partner‑provided migrations.

This extensibility model allows partners and ISVs to create reusable, supported migration solutions for legacy and industry‑specific systems, reducing project risk and eliminating the need for ad‑hoc scripts, external tooling, or one‑off migration code.



## Modernizing analytical reports for inventory

We've added modernized versions of the following inventory reports:

* Inventory Top 10 List
* Item Availability
* Inventory Purchase Orders
* Item/Vendor Catalog
* Inventory Availability Plan
* Item Age Composition by Quantity and Value (new report)
* Inventory - Transaction Detail
* Item Expiration - Quantity

By _modernizing_ a report, we mean:

* We replaced RDL layouts with Excel and Word layouts.
* We updated our documentation in Microsoft Learn.

We're also deprecating the following reports:

* Item Age Composition - Value 
* Item Age Composition - Quantity
* Items with Negative Inventory



## Post purchase invoices for drop shipments independently of related sales invoices

You can post invoices for drop shipment purchase orders, even if you haven't invoiced the related sales order. You can post invoice from a purchase order or by using the **Get receipt lines** action.

One thing to note is that this feature might affect your extensions and customizations. This change modifies the posting logic for drop shipments and removes checks that previously blocked purchase invoice posting until the related sales invoice was posted. The following events are no longer called:

**Codeunit 90 "Purch.-Post"**

- OnCheckAssocOrderLinesOnBeforeCheckOrderLine
- OnBeforeCheckAssociatedSalesOrderLine

**Codeunit 22 "Item Jnl.-Post Line"**

- OnBeforeVerifyInvoicedQty
- OnVerifyInvoicedQtyOnAfterGetSalesShipmentHeader

Partners and ISVs should review any customizations or extensions that rely on these events and adjust their logic accordingly.



## Reverse drop shipments when sales and purchase documents aren't invoiced

You can reverse posted drop shipments when both the sales shipment and the related purchase receipt aren't yet invoiced. Today, when you post a purchase receipt for a drop shipment, Business Central also posts the linked sales shipment and you can't undo the receipt. It's difficult to correct mistakes and often forces you to create credit memos, adjust quantities, or manually recreate sales and purchase lines.

You can now undo a sales shipment that originates from a drop shipment. Business Central reverts the linked purchase receipt, creates correction entries, and reapplies the purchase and sales entries to their reversal entries.

To reverse a drop shipment, open a posted sales shipment connected to it and choose **Undo Shipment**.



## Review content generated by agents directly on pages

This improvement introduces the ability for Business Central users to review and approve content generated by agents directly on the pages where they work. You no longer need to navigate to separate task pane to understand that a given document was created by an agent. Instead, agent‑generated suggestions—such as descriptions, text proposals, or field‑specific updates appear inline where they can be evaluated and modified before being applied.

By keeping the review process within the page context, users maintain flow, reduce clicks, and ensure content quality with minimal disruption.  The feature builds on existing Business Central autofill user interface patterns ensuring admins and users can adopt it as part of existing agent‑powered daily workflows.



## Run AL objects and open record references using fully qualified names

New method overloads have been introduced to support running codeunits, pages, and reports using their fully qualified names. Additionally, RecordRef.Open can now be invoked with the fully qualified name of a table.



## Run AL Tests from Visual Studio Code

You can now use the built in Test Explorer in Visual Studio Code to discover and run AL tests in the workspace. Read more about the Test Explorer and running tests in Visual Studio Code here https://code.visualstudio.com/docs/debugtest/testing

Currently, only tests in the active workspace are added to the Test Explorer. The tests have to be published beforehand to a Business Central server before being run.

Running tests is only supported on Business Central 2026 release wave 1 and newer, on both sandboxes and local servers.

Note: This feature is under active development, and more functionality may be added or existing functionality changed. It should be considered as an experimental feature.



## Send posted sales shipments and return receipts by email

We're introducing the ability to send posted sales shipments and posted return receipts by email, which compliments the **Print** option and aligns the experience of handling these documents with that of posted sales invoices and credit memos. This enhancement gives you several options:

- **Send by Email**: Send the posted document by email to the customer.
- **Send**: Use the standard sending options that are available for other posted documents.
- **Attach as PDF**: Generate and add the generated document in PDF format to the **Attachment** part.

The **Attachment** part allows you to store and manage printed document versions for future reference, and is now also available on the following pages:

 - **Posted Return Receipt** (page 6660)
 - **Posted Return Receipts** (page 6662)
 - **Posted Sales Shipment** (page 130)
 - **Posted Sales Shipments** (page 142)



## Set a default e-document type on vendor templates

Business Central extends vendor templates to include the **E‑Document Type** field that's used in the **E‑Documents** module. Instead of always defaulting new vendors to **Purchase Order**, administrators can now specify whether a vendor should default to **Purchase Order** or **Purchase Invoice** based on their processes. When you create a vendor from a template, Business Central automatically applies the selected type, ensuring consistent setup and reducing errors in downstream e‑document handling. This enhancement improves efficiency, supports scalable vendor onboarding, and aligns vendor configuration with real‑world document workflows. To start using this feature, on the **Vendor Template** page, choose the **Receive E-Document To** option on the **Receiving** FastTab.



## Set default language for documents on the company level

Previously, the language used on invoices and other sales documents was determined by the language of the user creating or printing the document. This could lead to unintended results in local businesses that primarily serve domestic customers.

For example, even if all customers are local and expect documents in the local language, employees working in a different UI language could inadvertently generate invoices in a foreign language—making them difficult for customers to read.

To address this, we’ve introduced a new Default Language Code field on the Company Information page.

You can now define a company-wide default language for customer-facing documents.
Local customers will consistently receive invoices and other sales documents in the expected language, regardless of the user’s UI language.
This improves clarity, reduces confusion, and ensures a better customer experience, especially in multilingual teams.

This new setting provides better control over document language while maintaining flexibility for international scenarios.



## Set up Service Participants to Company Information

Business Central currently identifies the receiving company for electronic documents by using VAT Registration No. or GLN. This approach isn't consistent across all countries/regions and doesn't fully support local requirements where different identifiers or schemes are expected.

This feature extends Company Information with the same Service Participant model already used for customers and vendors. By aligning these entities, Business Central gains a more consistent and future‑proof approach to identifying companies in electronic document exchange scenarios.

**Objectives**

* Provide a reliable and localization‑agnostic way to identify the company when sending or receiving E‑Documents.
* Align Company Information with the established Service Participant framework used for customers and vendors.
* Improve interoperability with multiple standards, including Peppol and other country/region‑specific schemes.
* Simplify setup and reduce errors caused by inconsistent identification methods.

To enable it, administrators need to navigate to **Company Information** and specify the appropriate **Service Participant Identifier** and **Scheme**. When Business Central sends or receives E‑Documents, it uses the new **Service Participant** fields for company identification. The system behavior is now aligned with how customer and vendor participants are handled, increasing consistency across the application.



## Show avatars for record creators and modifiers in lists

This feature introduces visual avatars in Business Central list pages to indicate which user or agent created or last modified a record. The capability enhances traceability and supports collaborative work by making identity information immediately visible without opening the record.

The avatars reflect either a named Business Central user, a system user or an AI agent, following the existing identity model. Users can hover over the avatar to see a tooltip with the full display name and record update timestamp (if available).

This improvement benefits roles that frequently work with shared data&mdash;including accountants, order processors, warehouse staff, service teams, and administrators&mdash;by reducing time spent verifying ownership or responsibility for items, documents, or configuration entries. It also helps organizations adopting AI‑generated records understand when an automated agent has contributed.

The feature surfaces existing **Created By** and **Modified By** fields more intuitively while respecting Business Central’s data privacy and permissions model.

## Stay in flow of work with updated Outlook integration

- We've improved security of the Outlook add-ins that helps users manage their business inbox. When you install the add-ins, you'll need to complete an extra one-time setup to ensure your account stays protected. Administrators can still automate add-in deployment across your organization using centralized deployment.
- We've also improved the user experience, speed and security of the contact synchronization feature that people can use to copy contacts from Business Central to Microsoft 365. You can easily author mails or schedule meetings with business contacts from Outlook and Teams. To synchronize contacts, go to the Contacts list and find the new **Synchronize with Outlook** action.
- As we continue our work to keep our customers secure, we're deprecating the Exchange Synch. setup pages that are no longer needed for connecting Business Central with Outlook and Exchange.


## Stop all active tasks for selected agent

This feature introduces a new action that stops all active tasks for a selected agent, addressing scenarios where an agent is overloaded, misconfigured, or executing tasks that need immediate cancellation. It's a one-click action to stop all active tasks for a selected agent. It shows a confirmation dialog to prevent accidental task termination and then stops all tasks currently running.

## Sync images of product variants between Business Central and Shopify

This feature adds support for synchronizing images of item variants in Business Central with their corresponding product variants in Shopify. Previously, you could only synchronize images of items to products. When you work with products that include variations, such as different colors, materials, or styles, you can now ensure that each variant displays the correct image in Shopify.

When you synchronize images from Shopify, Business Central imports variant-specific images and saves the related item variant. When you synchronize images to Shopify, the image assigned to each item variant in Business Central is uploaded and linked to the correct product variant in Shopify.



## Transfer journal line descriptions to bank statements

We added a **Keep Description** field to the **Bank Account Card** page with the following attributes:

* The field is also available on the **request page** of the **Create General Journal report**.
* The default value on the report is inherited from the selected bank account.
* When you run the report, the value of Keep Description is transferred to the corresponding field on related payment journal lines.
* If you turn off the Keep Description field and change the account on a journal line, the description updates based on the validation of the new account.



## Use AI resources for your Copilot extensions

Using the AI resources provides several benefits:

- **Reduced operational overhead**: Avoid the need to handle infrastructure management, updates, monitoring, troubleshooting, or maintenance of custom Azure OpenAI subscriptions. This benefit frees up resources to focus on core business operations and provides value-adding intellectual property (IP) to customers.
- **Simplified onboarding**: Quickly integrate AI capabilities into your solutions without having to navigate the complexities of setting up and managing your own Azure OpenAI subscription.
- **Improved reliability**: Proactive scaling, throttling, load balancing, and fault tolerance measures ensure consistent performance during peak demand.
- **Enhanced security compliance**: Built-in compliance measures and governance, including robust protection from malicious and harmful content, ensure compliance with data residency requirements. This benefit reduces the burden of ensuring regulatory compliance for ISVs.
- **Streamlined experience for customers**: Customers get a seamless AI resource management process without maintaining different configurations for separate ISV solutions.

This capability also provides a cohesive AI consumption tracking and billing experience for Business Central customers. Customers who use AI resources across multiple AI-enabled solutions built with Business Central customer developer tools for Copilot benefit from a unified approach to AI consumption monitoring and invoicing. They don't need to reconcile multiple invoices or metrics from separate ISVs.

For details on billing costs, see AI tools at [Message scenarios](/microsoft-copilot-studio/requirements-messages-management#message-scenarios).

For most publishers, the default Business Central AI resources are enough. However, if you need specific models, including fine-tuned models, that the Business Central AI resources don't provide, you can bring your own subscription for customers. In this case, the publisher is responsible for deploying, maintaining, scaling, and securing the service. The publisher also handles billing AI resources to customers.

We recommend using the developer toolkit AI resources when you extend Copilot in Business Central. You just need to authenticate with the `SetManagedResourceAuthorization` method in the [AI Module AzureOpenAI](/dynamics365/business-central/application/system-application/codeunit/system.ai.azure-openai) codeunit. You also provide your own Azure OpenAI subscription details, but the authentication process doesn't use them.

```al
// Example of using the default toolkit AI resources in AL 
AzureOpenAI.SetManagedResourceAuthorization(Enum::"AOAI Model Type"::"Chat Completions",AzureOpenAIAccountName,AzureOpenAIApiKey,AOAIDeployments.GetGPT4oLatest());
```

To use your own subscription, authenticate it with the `SetAuthorization` method.

```al
// Example of using your own Azure OpenAI subscription in AL 
AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions",GetEndpoint(),GetDeployment(),GetApiKey());
```

This AI billing model isn't designed to replace the existing AppSource monetization pathway for publishers who create Business Central apps. Instead, it offers another option that simplifies AI consumption for customers and partners. ISVs can use the AppSource monetization option to monetize their IP.


## Use carbon footprint with OIOUBL e-invoicing format

Business Central introduces a new version of the OIOUBL e‑invoicing format designed for a Danish pilot program that supports carbon‑footprint data exchange. The format automatically includes emissions values sourced from the **Sustainability** module for both sales and purchase processes. When sending sales e‑invoices, Business Central embeds the calculated emission data from the **Item Card** or **Resource Card** pages, or the  updated **Sales Lines**. When receiving purchase e‑invoices, the footprint values are captured and added to purchase invoices or purchase orders and posted to sustainability ledger entries.

You just need to select the new format on the **E‑Documents Service** page. No additional configuration is required. This builds the foundation for future sustainability data exchange across the full transaction lifecycle.



## Use checkout currency when you create sales documents from Shopify orders

You can control whether Business Central creates sales documents from Shopify orders in the shop currency or in the customer’s checkout (presentment) currency. This gives you full flexibility when working with Shopify Markets or any store that sells in multiple currencies.

A new **Currency Handling** setting on the **Shopify Shop Card** lets you choose:

- **Shop currency** (default) 
- **Presentment currency**

When you select **Presentment currency**, Business Central uses the currency and amounts that the customer saw and paid during checkout when it creates sales orders and credit memos. The amounts in local currencies are calculated based on the exchange rates defined in Business Central. Business Central stores the choice of currency handling on each Shopify order at processing time. 

  

### How it works

- When you import Shopify orders, Business Central retrieves both the shop currency and the presentment currency with their amounts.

- If the Shopify Shop Card is set to **Presentment currency**, sales orders and credit memos use the presentment currency and corresponding amounts.

- The **Suggest Payments** function also uses presentment currency when applicable.

- Pages such as Shopify Orders, Order Lines, Shipping Charges, Refunds, Transactions, and Returns display presentment currency fields whenever the order or shop uses presentment currency. Shop currency values remain visible for reference.



## Use new APIs for analyzing approval workflows for auditors and IT staff

In this release wave, we're introducing read-only APIs on the (workflow) approval system. This allows for establishing security and auditing analytics and reporting outside Business Central, for example creating reports with Power BI or agents with Microsoft Copilot Studio and MCP Server for Business Central.

The APIs are read-only and allow querying for:

- Workflow
- Workflow and User mappings
- Workflow, User, and Action history


We're also introducing a new permission set that allows a user to use approval APIs. This shouldn't be granted to standard users, but might be included in security-related permission sets.



## Use new APIs for analyzing permissions for auditors and IT staff

In this release wave, we're introducing read-only APIs on the permission system. This allows for establishing security and auditing analytics and reporting outside Business Central, for example creating reports with Power BI or agents with Microsoft Copilot Studio and MCP Server for Business Central.

The APIs are read-only and allow querying for:

- Permission Set
- Object, Scope, Extension info, and Permission Set
- Permission Set and Security Group mappings
- Permission Set and User mappings

We're also introducing a new permission set that allows a user to use the new permission APIs. This shouldn't be granted to standard users, but might be included in security-related permission sets.



## Use new APIs in Sustainability for better integration

The feature introduces four new APIs in the Sustainability area to improve interoperability and enable automated data flows between Business Central and external applications.

The new APIs are:

- **Goals**: Provides read, insert, and modify operations for sustainability goals.
- **ESG Reporting Staging**: Read-only API for accessing staged ESG reporting data.
- **Emission Value Entry**: Read-only API for retrieving emission value entries calculated in Business Central.
- **Purchase Lines with Sustainability Detail**: Enables read, insert, and modify operations on purchase lines, including sustainability-related fields.



## Use new sales document reports layout that show your carbon footprint

Business Central adds new ESG‑focused report layouts for sales documents, enabling you to include carbon‑footprint information directly on invoices and quotes. These Word-layouts extend existing invoice and quote templates by adding CO₂e information per unit and a total emissions line.

The following documents use the new layouts:

* **Sales Invoice**

  * Standard ESG Sales Invoice (Word)
  * Standard ESG Sales Invoice – Blue (Word)

* **Sales Quote**

  * Standard ESG Sales Quote (Word)
  * Standard ESG Sales Quote – Blue (Word)

Each layout is based on the corresponding standard template and include additional sustainability fields. These additions allow you to provide transparent emissions information on both quotes (pre‑sales) and invoices (post‑sales) to ensure consistency between commercial documents and sustainability reporting. The layouts work with existing CO₂e values calculated using value chain operations from the **Sustainability** module and require no additional customization.



## Use self-billed invoices

Business Central offers full support for self‑billed invoices in the purchase process. Buyers can now generate invoices on behalf of a vendor when a self‑billing agreement is in place. A new Boolean field on the **Vendor Card** page enables this agreement, and all **Purchase Invoices** created for that vendor, whether from **Purchase Orders** or directly, are automatically marked as self‑billed. Vendors can also be assigned a dedicated **No. Series** for self‑billed invoices, ensuring correct document sequencing.

A new report layout, **Posted Purchase Invoice – Self‑Billing Invoice**, formats the invoice to align with the sales invoice style, showing buyer company information, vendor details, VAT information, and all essential invoice data.

For Danish localizations, the posting process can automatically create **Digital Vouchers** when you enable self‑billing, ensuring compliance with local audit and documentation rules. To prevent conflicts between buyer‑issued and supplier‑issued documents, vendors with a self‑billing agreement can't receive inbound e‑documents for accounts payable. This guarantees data integrity and avoids duplicate or contradictory documents in the purchase flow.



## Use the latest update for the Shopify connector

Shopify releases a new API version every three months at the beginning of the quarter, and supports each version for 12 months. The updated versions might contain important changes, so it's important to uptake Shopify API versions in major releases of Business Central. Typically, new versions of APIs increase stability and security, and enable additional capabilities. Starting with this release, Shopify Connector uses the Shopify API that was released in January 2026.

> [!Important] 
> The Shopify Connector released in 2025 release wave 2 (October 2025) relies on API 2025-07, which is supported until June 30, 2026. To continue to use your integration, upgrade to the latest version of Business Central before this date.

### API changes

#### Exporting inventory and product variants

This update aligns Business Central with the latest Shopify inventory mutation logic. When you export inventory:

* Business Central sends updated on‑hand quantities using the new *inventorySetQuantities* mutation.
* The connector avoids concurrency conflicts by opting out of Shopify’s compare‑and‑swap mechanism, because Business Central acts as the source of truth.
* The connector automatically retries operations when Shopify responds with concurrency‑related errors, helping you reduce missed updates. When retries still fail, the system logs the skipped records so you can review and take corrective action.

The export process for product variants is also updated. Business Central creates correct batch sizes when you export product variants. Shopify now enforces a limit of 50,000 inventory quantities per mutation. The connector automatically calculates the correct number of variants per batch depending on your number of locations. When you export items or variants, Business Central sends them in the optimal batch size, without requiring any configuration from you.

#### Handling updated bulk operations

Shopify removed support for older bulk operation queries. The connector now uses the new *GetBulkRequest* pattern, ensuring that actions like exporting products or retrieving catalogs work with the latest API expectations.

#### Updated return reasons

Shopify introduced new return reason definitions. Business Central now stores both the return reason *name* and *handle* on return lines. If you previously mapped return reasons using the old field, you now use the new values when you process refunds or analyzing return data.

#### More detailed payout information

Payout records now include an external trace ID. When you import payouts, you can view this extra identifier to support reconciliation or payment inquiries.

#### Removing the tax code from variants

Shopify removed the legacy **Tax Code** field from variants. Business Central reflects this change by marking the tax code value as obsolete. If you rely on this information in your reporting or processing, migrate to other fields supported by Shopify.

#### Expanded metafield support

You can now work with Shopify’s new **article\_reference** metafield type. This helps you maintain richer product information when you synchronize item data.

### User feedback

#### Review retrieved Shopify data for fulfillment orders

You can now inspect the raw Shopify JSON captured when fulfillment orders are imported. This helps you diagnose issues with imported fulfillment data.

You can:

* Open **Shopify Fulfillment Orders** and choose **Retrieved Shopify Data**.
* Open a specific **Shopify Fulfillment Order** card and choose **Retrieved Shopify Data**.
* If you import fulfillment lines separately, you can inspect the data for each line.

#### Import marketing text when you create items from Shopify

When you create new items by syncing products from Shopify, Business Central now imports the product’s HTML description into the **Marketing Text** field, provided that you enable **Sync Item Marketing Text**. This extra synchronization gives you richer product information on new items without manually copying descriptions.

#### Set the unit of measure when you select an item on order lines

When you map Shopify order lines to items manually, Business Central now automatically fills in the **Unit of Measure Code** based on the value from the item’s setup.

* If the item has a **Sales Unit of Measure**, that value is used.
* Otherwise, the **Base Unit of Measure** is applied.

The auto-fill reduces manual entry and helps you avoid unit‑of‑measure errors when you process Shopify orders.

#### Import retail location information on order headers

Shopify order headers now include the **retailLocation** (ID and name). Business Central imports and stores this information so that you can review it and use it in future processes. This update only imports the data, and isn't used for automated processing yet.

### Update unit cost when syncing prices to Shopify

When you turn off the **Sync Prices with Products** toggle, Business Central previously updated the **Unit Cost** field on the item variant entry but didn't send the change to Shopify. With this improvement, the unit cost is included in all price synchronization operations, both individual and bulk. When you sync prices, the **Price** and **Compare at Price** fields, and now the **Unit Cost** field, update in Shopify and correctly revert if a bulk operation fails.



