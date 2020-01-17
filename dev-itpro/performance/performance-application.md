---
title: "How Application Configurations Affect Performance"
ms.custom: na
ms.date: 01/14/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: KennieNP
---

# How Application Configurations Affect Performance
The topics in this session are tips and tricks on how to setup BC for performance and also describes how in-product configurations affect the performance of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].

## Run things in the background
It is often desirable to offload work from the user session to happen in the background. Examples are
- Schedule long running reports to run in background: https://docs.microsoft.com/en-us/dynamics365/business-central/ui-work-report#ScheduleReport
- Schedule jobs (e.g. posting) to run in background
- Enable background posting in areas where your business is using reservations and item tracking using serial and lot numbers
- Adjust item costs as a periodic background job (i.e. don't adjust automatically) 

Tip! Don't run job queues too frequently

## Avoid locking
When the BC database needs to have exclusive access to a table or a data row, it will issue a lock. When a another session needs to access a locked resource, it needs to wait until the session holding the lock is finished with its work. There are a few places in the BC application where you can reduce the chance of locking. 

### Use Number series that allow gaps
Number series in BC are a shared resource that sometimes cause locking issues
Not all records that you create in Business Central are financial transactions that must use sequential numbering. Customer cards, sales quotes, and warehouse activities are examples of records that are assigned a number from a number series, but are not subject to financial auditing and/or can be deleted. For all such number series, consider using number series that allow gaps to avoid locking issues. 
- https://docs.microsoft.com/en-us/dynamics365/business-central/ui-create-number-series#gaps-in-number-series

### Be cautious about the Copy company operation
The Copy company operation is not intended to run while business transactions is being applied to BC. First, the operation is very likely to induce locks on the tables that data is copied from and these locks will block users from transaction in the company. Second, the operation is using a lot of resources on the BC database, which can in turn cause resource starvation for users working in other companies.  

Should you need to perform Copy company operation, it is highly recommended to do it outside working hours. Do turn off scheduled jobs while performing Copy company to avoid locking issues.

## Things that affect UI

Personalize your UI for performance (hide non-essential parts on rolecenter, list and card pages)

Use links over document attachment to improve performance?

## Faster Data Entry
Use keyboard shortcuts for faster data entry

Block inactive customer, vendors or items to improve filtering and searching on document data entry

## Don't do this
- Adjust cost item entries should be set to run as infrequently as possible. (already in Application section)
- Setup change log on everything https://docs.microsoft.com/en-us/dynamics365/business-central/across-log-changes 
- Do not run job queues too frequently
- If you have a lot of item entries, then do not Adjust item costs automatically (run in the background instead)  
- Do not postpone setting up global dimensions, as this can be a heavy operation when you have a lot of data: Setup correct global dimensions to avoid changing them later on

## Data search
Data search (See slide 57 in [Directions EMEA 2019])

## Functionality with known performance impact
These areas require extra testing with realistic data setup 
- [Performance impact of security filtering Mode](../security/security-filters.md#PerformanceImpact)
- Item tracking 
- Configure inventory posting to fit your business needs
- Dimensions <-should we put design detail docs under dev part? 
- Dynamics Order tracking 
- Automatic reservation 
- Lot/SN Expiration dates 
- change log https://docs.microsoft.com/en-us/dynamics365/business-central/across-log-changes 

## Performance effect of integration records 
(See slide 33 in [Directions EMEA 2019])
Enabling integration on a table can hurt performance
	
Integration Record table
Mapping of RecordID to GUID
Tracks ModifiedOn
	
Event listener on modify
Inefficient to lookup by RecordID


## See Also
