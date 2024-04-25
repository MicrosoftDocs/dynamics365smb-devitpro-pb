---
title: Clean data
description: This article discusses tasks to do on data in Business Central on-premises database before you run cloud migration.
author: jswymer
ms.author: jswymer
ms.reviewer: jswymer
ms.topic: how-to
ms.date: 03/24/2023
ms.custom: bap-template
---

# Clean data

This article discusses tasks you must consider doing on data in Business Central on-premises database before you run cloud migration. By cleaning data before running cloud migration, you can help ensure that the process proceeds smoothly.

## Clean up corrupted code fields in tables

<!-- You must delete any invalid characters in [code data type](../developer/methods-auto/code/code-data-type.md) fields of tables. Invalid characters include lowercase characters and white space characters. White space characters are invisible characters representing keystrokes like line feed, carriage return, tab, and space bar.-->

Corrupted [code data type](../developer/methods-auto/code/code-data-type.md) fields are those fields that contain invalid characters, such as lowercase characters and white space characters. White space characters are invisible characters representing keystrokes like line feed, carriage return, tab, and space bar. These characters must be deleted before running cloud migration to ensure that any code modification, read, or delete operations on the corrupted fields in the cloud don't fail.

> [!TIP]
> For a list of the Unicode characters, see [IsWhiteSpace method](/dotnet/api/system.char.iswhitespace#remarks).

To delete the invalid characters, run the [Invoke-NAVSanitizeField cmdlet](/powershell/module/microsoft.dynamics.nav.management/invoke-navsanitizefield), which is available in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. The cmdlet returns an object containing the number of rows and values modified, the tables impacted and a list of potentially ignored records.

### General steps

You run Invoke-NAVSanitizeField cmdlet against the on-premises database. The general steps for running the Invoke-NAVSanitizeField cmdlet are:

1. Open the [Business Central Administration Shell](administration-shell.md#run-the-business-central-administration-shell) as an administrator.
2. At the command prompt, run the Invoke-NAVSanitizeField cmdlet. For example, the following command sanitizes fields in tenant with the ID `tenant1`. `$result` is an object containing the results of the operation execution.

   ```powershell
   $result = Invoke-NAVSanitizeField -ServerInstance <Business Central Server instance name> -Tenant <tenant ID>
   ```

### Recommended steps

The previous steps run the cmdlet on all tables in the database. We recommend that you fix the customer's production database before migrating to the cloud. To make the process most efficient, follow these steps:

1. Make a copy of the customer database.
2. Connect the database to a Business Central server instance.
3. Run the Invoke-NAVSanitizeField on all tables in the copied database.

   ```powershell
   $result = Invoke-NAVSanitizeField -ServerInstance <Business Central Server instance name>  
   ```

   This command returns a list of the tables that include corrupted fields.
4. Run the `Invoke-NAVSanitizeField` on the production database, one table at a time, using the `-TableId` parameter:

   ```powershell
   $result = Invoke-NAVSanitizeField -ServerInstance <Business Central Server instance name> -TableID <table name>
   ```

  > [!TIP]
  > If you have set up cloud migration, you can clean a table from the Business Central client for your target online tenant. But you can only clean one table at a time using this method. It's not recommended to use this method for cleaning all tables prior to migration&mdash;use the recommended steps instead. However, this method is useful for cleaning individual tables after migration:
  > 1. Open the **Cloud Migration Management** page.
  > 2. Select **Actions** > **Sanitize tables**.
  > 3. Set the **Company name** field to the company that the table belongs to.
  > 4. Set the **Table ID** field to the table that you ant to sanitize.
  > 5. Select **Sanitize**.

## Clean up corrupted company names

Like code fields, fields that contain a company name can also include invalid characters. The problem in this case is that tables for companies with corrupt names don't even be picked up for cloud migration.

The company names can't be fixed by using the Invoke-NAVSanitizeField cmdlet, as you can with code fields, because company name fields are [text data type](../developer/methods-auto/text/text-data-type.md). Instead, you have to use an SQL query on the on-premises database. For example:

```sql
SELECT * FROM Company WHERE
([Name] like '% ') or --trailing spaces
([Name] like ' %') or --leading spaces
([Name] like + Char(10) + '%') or --line feed
([Name] like + Char(13) + '%') --carriage return
```

## Compress or archive data

It's beneficial to compress data and archive data that is out of date. To do this task, use page 9035 **Data Archive** in the client. This page includes reports for compressing and archiving data. For more information, go to [Data Archive extension](/dynamics365/business-central/admin-archive-data).

## Next steps

[Set up cloud migration](migration-setup-overview.md)  
