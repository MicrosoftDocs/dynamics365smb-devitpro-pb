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

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] includes a change log that lets you track all direct modifications a user makes to data in the database. The change log can track changes to specific application tables. Plus, it always logs changes to various system tables, which enables you to track changes to security sub-systems like users and permissions.

> [!IMPORTANT]  
> The change log is turned on by default. It can be turned off and on from the **Change Log Setup** page in the client. However, this action is always logged so you can see which user has made the change.<br /><br />
> The change log code is called from the `OnDatabaseInsert` method in the system codeunit **49 GlobalTriggerManagemnet**. 

[Logging Changes in Business Central](https://docs.microsoft.com/en-us/dynamics365/business-central/across-log-changes)

## See Also  

[Security Development Lifecycle](https://www.microsoft.com/en-us/sdl)  