---
title: "Keeping Database Size Under the Limit"
description: Learn about the best ways to reduce data stored in Business Central databases.
author: jswymer
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 04/01/2021
---

# Reducing Data Stored in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Databases 

The article provides an overview of the different ways to reduce the amount of data stored in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. Reducing the size of your database serves the following purposes:

- Prevents reaching the size limit when using [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online.
- Improves runtime performance.
- Improves database management processes, like backing up and restoring databases.

These measures are typically done by an application administrator or developer.

## Delete unused companies

If you have companies that are no longer needed, such as test companies or the Demo company, delete these companies.

## Delete documents

Over time, the database will accumulate historical data for documents, like invoiced purchase orders. If these documents are no longer needed, delete them.

<!--
Over time, the database will accumulate historical data for documents, like invoiced purchase orders and vendor ledger entries from previous fiscal years. This data, in some cases, is no longer needed. There are two ways to deal with this data. You can either delete the documents or use date compression. Date compression combines several old entries into one new entry based on specified time period.
-->

For more information, see [Manage Storage by Deleting Documents or Compressing Data](/dynamics365/business-central/admin-manage-documents#delete-documents).

## Use retention policies

Retention policies allow you to specify how frequently you want [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to automatically delete outdated data in tables that contain log entries and archived records.

For more information, see [Define Retention Policies](/dynamics365/business-central/admin-data-retention-policies).

## Migrate BLOB data types to Media or MediaSet

Data in Media or Media set data types aren't counted in the database limit. As an extension developer, consider migrating data from blobs to the Media or MediaSet datatypes for your own extensions.

For more information, see [Working With Media on Records](../developer/devenv-working-with-media-on-records.md).

## Compress tables
<!--
Compressing table data saves space and helps improve performance of I/O-intensive workloads. There are two ways to compress data in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

- On a table level, use the [CompressionType property](../developer/properties/devenv-compressiontype-property.md) on table objects. 


    With [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, omit the property or set it to `Unspecified` to use the global setting for the tenant.
- On a database level, use the [Start-NAVDatabaseCompression cmdlet](/powershell/module/microsoft.dynamics.nav.management/start-navdatabasecompression). This cmdlet is only available with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 1 and later.

For more information about data compression, see [Data Access - Using SQL Server data compression](optimize-sql-data-access.md#Compression).

> [!NOTE]
> Data compression on tables is automatically enabled in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online. Data compression is applied on tables in Microsoft extensions as well as third-party extensions, unless the **CompressionType** property is explicitly set to **None**.
-->

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] supports data compression of tables. Compressing table data saves space and helps improve performance of I/O-intensive workloads.

> [!NOTE]
> With [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, page-level data compression is automatically enabled on tables in a tenant. It's applied to Microsoft extensions and third-party extensions, unless the **CompressionType** property on a table is explicitly set to `None`.

There are two ways to enable or change data compression in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]:

- On a table-level, use the [CompressionType property](../developer/properties/devenv-compressiontype-property.md) on table objects.

- On a database-level (on-premises only), use the [Start-NAVDatabaseCompression cmdlet](/powershell/module/microsoft.dynamics.nav.management/start-navdatabasecompression). This cmdlet is only available with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 1 and later.

For more information about data compression, see [Data Access - Using SQL Server data compression](optimize-sql-data-access.md#Compression).

## See Also

[Managing Capacity](tenant-admin-center-capacity.md)  
[Creating Databases in Business Central](../deployment/devenv-create-databases.md)  