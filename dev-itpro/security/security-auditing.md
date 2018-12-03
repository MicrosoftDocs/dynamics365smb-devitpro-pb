---
title: "User Security in Business Central"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
---

# Security Auditing in Business Central

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] includes a change log that lets you track all direct modifications a user makes to data in the database. Plus, it always logs changes to various system tables, which enables you to track changes to security sub-systems like users and permissions.

Specifically, the change log tracks the following tables:
 
- Table 2000000053 Access Control

- Table 2000000005 Permission

- Table 2000000004 Permission Set

- Table 2000000120 User

- Table 2000000121 User Property

- Table 402 Change Log Setup

- Table 403 Change Log Setup

- Table 404 Change Log Setup (Field)

> [!IMPORTANT]  
> The change log on the above tables is always turned on and cannot be turned off on the **Change Log Setup** page in the client. <br /><br />
> The change log code is called from the `OnDatabaseInsert` method in the system codeunit **49 GlobalTriggerManagemnet**. 

[Logging Changes in Business Central](https://docs.microsoft.com/en-us/dynamics365/business-central/across-log-changes)

<!-- change title to auditing data changes in bllal-->
## See Also  

[Security Development Lifecycle](https://www.microsoft.com/en-us/sdl)  