---
title: "Temporary Tables"
ms.custom: na
ms.date: 07/10/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: blrobl
---

# Temporary Tables

A temporary table is a temporary variable that holds a table. A temporary table is used as a buffer or intermediate storage for table data.

You can use a temporary table just like you use a database table. The differences between a temporary table and a database table are as follows:  

- A temporary table data isn't stored in the database. It's only held in memory until the table is closed.  

- The write transaction principle that applies to a database table doesn't apply to a temporary table.  

## Advantage of using a temporary table  

The advantage of using a temporary table is that all the interaction with a temporary table occurs on [!INCLUDE[prodlong](includes/prodlong.md)]. A temporary table reduces the load on both the network and the SQL database server.  

When you want to do many operations on the data in a specific table in the database, you can load the data into a temporary table when you modify it. Loading the data into a temporary table speeds up the process because all the operations are done in memory on the [!INCLUDE[server](includes/server.md)].

## Creating and using a temporary table

There are three ways to implement a temporary table:

- Setting the [TableType property](properties/devenv-tabletype-property.md) on the table object to **Temporary**
- Using a temporary record variable.
- Setting the [SourceTableTemporary property](properties/devenv-sourcetabletemporary-property.md) on a page.

Whichever way you choose, you must create the [table object](devenv-table-object.md) that defines the fields, like any other table object. The differences are explained in the following sections.

> [!TIP]
> Temporary tables retain system fields, like SystemID and data audit fields. For more information, see [System Fields](devenv-table-system-fields.md).

## Setting the TableType to Temporary

With this implementation, a physical table isn't created in the database. In the table object, set the `TableType` property to `true`:

```
table 50100 MyTable
{
    DataClassification = ToBeClassified;
    TableType = Temporary;

    fields
    
    ...
}
```

This implementation has the same effect as using a temporary record variable or setting the SourceTableTemporary property on a page. But the advantage is that the table schema isn't synchronized with the database. So it doesn't have restrictions on breaking schema changes, like removing a field, changing its data type or length.

It will also improve the performance of BACPAC generation using the sqlpackage command-line tool, compared to temporary tables based on temporary record variables and pages. For more information, see [Performance of BACPAC generation](/performance/performance-onprem.md#performance-of-bacpac-generation).

#### Changing the table type

You can change from **Normal** to **Temporary**, and the other way around. When changing **Normal** to **Temporary** the table, you'll have to synchronize the extension with the database. This step will remove the table from the database. So if the table contains data, you'll have to synchronize the schema using the ForceSync mode.

## Using a temporary record variable

With this implementation, a physical table isn't created in the database. You create a global or local variable of the type record and set the [Temporary Property](properties/devenv-temporary-property.md) next to it. The variable that holds a temporary table is defined just like any other global or local variable. The syntax is shown in the following example:

```
var
    TempInvoicePostBuffer: Record "Invoice Post. Buffer" temporary;
```

You manipulate the temporary table variable as you would with any other database table. For example, you can apply filters and do searches. For more information about the operations you can do, see [Record Data Type](methods-auto/record/record-data-type.md).

## Using a SourceTableTemporary property on page objects

Another option for temporary tables is to set the [SourceTableTemporary](properties/devenv-sourcetabletemporary-property.md) on the page that uses the table. This implementation will also use a physical table in the database.

```
page 50100 MyPage
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TableName;
    SourceTableTemporary = true;
    
    layout

    ...
}
```

## Temporary tables on reports and XMLPorts

You can also use temporary tables for storing the data set that is returned by a report object or that is imported by an XMLPort. To do so, set the **UseTemporary property** to **true** on the relevant report data item or XMLPort table element. For more information, see [UseTemporary Property \(XMLports\)](properties/devenv-usetemporary-xmlport-property.md) and [UseTemporary Property \(Reports\)](properties/devenv-usetemporary-report-property.md).  

It's useful to use a temporary table for a report when the column data isn't mapped directly to a field in the database but is instead the result of a process or operation, such as an aggregation of data from several columns. If a temporary table isn't used, the data must be handled by AL code.

For XMLPorts, if the data that you're importing has a different structure than the table in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] that you want to insert it into, you can import the data into a temporary table. You can then modify the data before inserting it into the database.

## See Also

[Getting Started with AL](devenv-get-started.md)  
[Table Object](devenv-table-object.md)  
[Temporary Property](properties/devenv-temporary-property.md)  
[UseTemporary Property (Report)](properties/devenv-usetemporary-report-property.md)  
[UseTemporary Property (XMLPort)](properties/devenv-usetemporary-xmlport-property.md)  
