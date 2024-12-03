---
title: Security auditing in Business Central
description: Learn about the built-in capabilities in Business Central that let you track and audit usage of your Business Central.
author: jswymer
ms.topic: conceptual
ms.author: jswymer
ms.date: 10/21/2024
ms.reviewer: solsen
---

# Security auditing in Business Central

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] includes a change log that lets you track all direct modifications that a user makes to data in the database. In addition, the change log always records changes to various system tables, which enables you to track changes to security sub-systems like users and permissions.

Some of the most important tables tracked include:  

- Table 2000000053 Access Control
- Table 2000000005 Permission
- Table 2000000004 Permission Set
- Table 2000000120 User
- Table 2000000121 User Property
- Table 2000000253 Tenant Permission Set Rel.
- Table 402 Change Log Setup
- Table 403 Change Log Setup
- Table 404 Change Log Setup (Field)

> [!IMPORTANT]  
> The changelog on the above tables is always turned on and can't be turned off by using **Change Log Setup** page in the client.
>
> The changelog code is called from the `OnDatabaseInsert` method in the system codeunit **49 GlobalTriggerManagemnet**.

Learn more in [Auditing changes in Business Central](/dynamics365/business-central/across-log-changes).


## Analyzing the changelog

You can use the **Data Analysis** feature to analyze data in the changelog from the [Change Log Entries](https://businesscentral.dynamics.com/?page=595) page. You don't have to run a report or open another application, such as Excel. The feature provides an interactive and versatile way to calculate, summarize, and examine data. Instead of running reports using options and filters, you can add multiple tabs that represent different tasks or views on the data. Some examples are "Who changed what data, and when," or "Data changes by table/field," or any other view you can imagine. 

Learn more in [Ad-hoc analysis of change log data](/dynamics365/business-central/across-log-changes#analyze-data-in-the-change-log).

<!-- change title to auditing data changes -->

## Related information

[Ad-hoc analysis of change log data](/dynamics365/business-central/across-log-changes#analyze-data-in-the-change-log)  
[Auditing overview](../auditing/auditing-overview.md)  
