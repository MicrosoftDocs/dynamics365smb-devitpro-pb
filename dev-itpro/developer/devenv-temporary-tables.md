---
title: "Temporary Tables"
ms.custom: na
ms.date: 07/10/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"    
author: blrobl
---

# Temporary Tables

A temporary table is a temporary variable that holds a table. A temporary table is used as a buffer or intermediate storage for table data.

You can use a temporary table just like you use a database table. The differences between a temporary table and a database table are as follows:  

- A temporary table is not stored in the database, but is only held in memory until the table is closed.  

- The write transaction principle that applies to a database table does not apply to a temporary table.  

## Advantage of using a temporary table  

The advantage of using a temporary table is that all the interaction with a temporary table occurs on [!INCLUDE[prodlong](includes/prodlong.md)]. This reduces the load on both the network and the SQL database server.  

When you want to perform many operations on the data in a specific table in the database, you can load the data into a temporary table when you modify it. Loading the data into a temporary table speeds up the process because all the operations are performed in memory on the [!INCLUDE[server](includes/server.md)].  

## Defining and using a temporary table  

You must define the temporary table before you can use it in your AL code. The variable that holds a temporary table is defined just like any other global or local variable.  

To use a temporary table, you must first create a [table object](devenv-table-object.md). Then create a global or local variable of the type record and set the [Temporary Property](properties/devenv-temporary-property.md) next to it. The syntax is shown in the following example:

```
var
    TempInvoicePostBuffer: Record "Invoice Post. Buffer" temporary;
```

You manipulate the temporary table variable as you would with any other database table. For example, you can apply filters and perform searches. For more information about the operations you can perform, see [Record Data Type](methods-auto/record/record-data-type.md). 

## Temporary tables on reports and XMLPorts

You can also use temporary tables for storing the data set that is returned by a report object or that is imported by an XMLPort. To do so, set the **UseTemporary property** to **true** on the relevant report data item or XMLPort table element. For more information, see [UseTemporary Property \(XMLports\)](properties/devenv-usetemporary-xmlport-property.md) and [UseTemporary Property \(Reports\)](properties/devenv-usetemporary-report-property.md).  

It is useful to use a temporary table for a report when the column data is not mapped directly to a field in the database but is instead the result of a process or operation, such as an aggregation of data from several columns. If a temporary table is not used, the data must be handled by AL code.

For XMLPorts, if the data that you are importing has a different structure than the table in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] that you want to insert it into, you can import the data into a temporary table. You can then modify the data before inserting it into the database.

## See Also

[Getting Started with AL](devenv-get-started.md)  
[Table Object](devenv-table-object.md)  
[Temporary Property](properties/devenv-temporary-property.md)  
[UseTemporary Property (Report)](properties/devenv-usetemporary-report-property.md)  
[UseTemporary Property (XMLPort)](properties/devenv-usetemporary-xmlport-property.md)  
