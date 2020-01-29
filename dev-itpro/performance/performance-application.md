---
title: "How Application Configurations Affect Performance"
ms.custom: na
ms.date: 01/29/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: KennieNP
---

# How Application Configurations Affect Performance

The topics in this session are tips and tricks on how to setup [!INCLUDE[prodshort](../developer/includes/prodshort.md)] for performance and also describe how in-product configurations affect the performance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## Run things in the background

It is often desirable to offload work from the user session to happen in the background. Examples are:

- [Schedule long running reports to run in background](/dynamics365/business-central/ui-work-report#ScheduleReport)
- Schedule jobs (for example posting) to run in background
- Enable background posting in areas where your business is using reservations and item tracking using serial and lot numbers
- Adjust item costs as a periodic background job (i.e. do not adjust automatically) 

> [!TIP]  
> Do not run job queues too frequently.

## Avoid locking

When the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database needs to have exclusive access to a table or a data row, it will issue a lock. When another session needs to access a locked resource, it needs to wait until the session holding the lock is finished with its work. There are a few places in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application where you can reduce the risk of locking. 

### Use number series that allow gaps

Number series in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are a shared resource that sometimes cause locking issues. Not all records that you create in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are financial transactions that must use sequential numbering. Customer cards, sales quotes, and warehouse activities are examples of records that are assigned a number from a number series, but are not subject to financial auditing and/or can be deleted. For all such number series, consider using number series that allow gaps to avoid locking issues. For more information, see [Gaps in Number Series](/dynamics365/business-central/ui-create-number-series#gaps-in-number-series).

### Be cautious with the **Copy company** operation

The **Copy company** operation is not intended to run while business transactions are being applied to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. First, the operation is very likely to induce locks on the tables that data is copied from and these locks will block users from transaction in the company. Second, the operation is using a lot of resources on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, which can in turn cause resource starvation for users working in other companies.  

Should you need to perform a **Copy company** operation, it is highly recommended to do it outside working hours. Do turn off scheduled jobs while performing **Copy company** to avoid locking issues.

## Things that affect UI performance

Consider personalizing your UI for performance (hide non-essential parts on role center, list, and card pages)
- [Personalize Your Workspace](/dynamics365/business-central/ui-personalization-user)

Use links instead of document attachments to improve performance
- [Manage Attachments, Links, and Notes on Cards and Documents](/dynamics365/business-central/ui-how-add-link-to-record)

## Faster data entry

Use keyboard shortcuts for faster data entry

- [Keyboard Shortcuts](/dynamics365/business-central/keyboard-shortcuts)

Block inactive customers, vendors, or items to improve filtering and searching on document data entry

- [Block Customers](/dynamics365/business-central/receivables-how-block-customers)  
- [Block Vendors](/dynamics365/business-central/payables-how-block-vendors)  
- [Block Items from Sales or Purchasing](/dynamics365/business-central/inventory-how-block-items)  

## Data search

Search in lists searches all columns in the database. To avoid resource starvation on broad data searches, a search might be subject to a timeout in which case the user will see a *"Searching for rows is taking too long. Try to search or filter using different criteria."* message. 

If users are experiencing slowness in data search, suggest them to set a column filter instead.

## Performance effect of enabling integration on a table

There is a performance overhead involved in enabling integration on an entity such as **Customer** or **Contact** that will impact performance. Only enable integration if you intend to integrate with Dynamics 365 Sales, and only do so on the entities that are needed.

For more information, see [Synchronizing Data in Business Central and Dynamics 365 Sales](/dynamics365/business-central/admin-synchronizing-business-central-and-sales). <!-- change with CDS integration in spring 2020 -->

## Functionality with known performance impact

These areas of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] application are known to cause a performance impact and require extra testing with realistic data setup before they are rolled out. 

- [Security filtering mode](../security/security-filters.md#PerformanceImpact)  
- [Inventory Posting](/dynamics365/business-central/design-details-inventory-posting)  
- [Dimensions](/dynamics365/business-central/finance-dimensions)  
- [Dynamic Order tracking](/dynamics365/business-central/design-details-reservation-order-tracking-and-action-messaging)  
- [Automatic reservation](/dynamics365/business-central/design-details-reservation-order-tracking-and-action-messaging)  
- [Item tracking and Lot/SN Expiration dates](/dynamics365/business-central/inventory-how-work-item-tracking)  
- [Change log](/dynamics365/business-central/across-log-changes)  

## Please do not do this

Finally, make sure that you do not repeat these performance mistakes that we have seen cause massive performance issues for customers:

- Do not adjust cost item entries with a high frequency.
- Do not set up a change log on everything. For more information, see [Auditing Changes in Business Central](/dynamics365/business-central/across-log-changes).  
- Do not run job queues too frequently.
- Do not adjust item costs automatically if you have a lot of item entries (run in the background instead).  
- Do not postpone setting up global dimensions, as this can be a heavy operation when you have a lot of data: set up correct global dimensions to avoid changing them later on.
- Do not run the **Copy company** operation during business hours.

## See Also

[Performance Overview](performance-overview.md)  
[Performance Topics For Developers](performance-developer.md)  
[Performance Online](performance-online.md)  
[Performance of On-Premises Installations](performance-onprem.md)  
[How to Work with a Performance Problem](performance-work-perf-problem.md)  
