---
title: Index Management Features in Business Central
description: Learn how Business Central's enhanced index management tools provide developers and admins with detailed insights and control over database indexes.
author: phduck
ms.author: magram
ms.reviewer: jswymer
ms.topic: conceptual
ms.collection: #Required; If this isn't a getting started article, don't remove the attribute, but leave the value blank. The values for this attribute will be updated over time.
ms.date: 02/23/2026
ms.custom: bap-template
---

# Manage indexes in Business Central

This article describes features in Business Central related to index management: a virtual table that lists all database indexes, a page that shows per-index detailed information, and the option to enable or disable existing indexes.

These features give administrators and developers greater control and visibility over database indexes.

## 1. Virtual table for database indexes

A virtual table is called [Database Index](https://learn.microsoft.com/en-us/dynamics365/business-central/application/system/table/system.diagnostics.database-index) captures detailed database information on a per-index basis both for AL-defined key and automatically system defined indexes.  

The information in the table provides insights into index usage by providing access to the corresponding [SQL DMV](/sql/relational-databases/system-dynamic-management-views/sys-dm-db-index-usage-stats-transact-sql) in the form of the two set of values *user* and last_user*. Developers and administrators can use these values to decide which indexes are underused in the specific company or environment. 

Before version 28, it was only possible to get index storage usage aggregated on a per-table basis via the **Table Information** page. In version 28 and later, it's possible to get per-index storage usage insights since the virtual table also shows index usage.

## 2. Database Index Information Page

With the introduction of per-index information, a new page has been created to display detailed index information. This page is accessible directly from the existing **Table Information** page via a link on the table ID.

The **Database Index Information** page aggregates index-related data and displays a curated subset of information from the "Database Index" virtual table. Index management functionality is centralized here, with actions supporting various operations.


With the introduction of per-index information a new page has been created to display this information, it's accessible directly from the existing Table Information via the link on table ID. 

The page collects both aggregated information related to indexes but also shows a subset of the information available on the "Database Index" virtual table.

Index management functionality is also centralized on the new page with actions that support the various operations supported. 

## 3. Enable and disable indexes

You can enable and disable non-unique indexes at runtime on a per-index basis, excluding primary key and systemid indexes.

For example, you might choose to disable indexes that show consistently low usage according to the *user* and *last_user* values in the **Database Index** virtual table, to save database storage and remove the performance overhead of index maintenance when updating data in SQL.  

You can also create functionality-specific indexes. For example, indexes that have overhead you'd normally want to avoid, but provide value when specific functionality is enabled. These indexes would be created as `enabled = false` and can then be enabled when needed.

Disabling an index takes effect immediately, while enabling an index is queued to run during the next scheduled midnight process.
