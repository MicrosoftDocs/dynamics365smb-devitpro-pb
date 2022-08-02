---
title: "Data Transfer"
description: "Learn about the DataTransfer object type and how to use it to move data between tables."
author: jswymer

ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.author: jswymer
ms.date: 07/29/2022
---

# Transferring Data as Part of Upgrade

The DataTransfer object is an AL data type that supports the bulk transferring of data between SQL based tables. Instead of operating on a row-by-row model, like the record API does, it produces SQL code that operates on sets. This behavior allows for far more performant execution.

> [!IMPORTANT]
> DataTransfer object can only be used in upgrade code and it will throw an runtime error if used outside of upgrade codeunits.  

## Usage and behavior

DataTransfer uses a builder style pattern, where you:

1. Specify the source and destination tables by calling the SetTables.
2. Specify which fields to transfer or set to a constant value by calling the AddFieldValue or AddConstantValue, respectively.
3. Specify the rows to transfer by calling AddSourceFilter.
4. Execute the query for transferring data by calling CopyFields or CopyRows.

Because DataTransfer operates in bulk and not on a row-by-row basis, no row based events or triggers will be executed. For example, when calling CopyFields, none of the following events will be called: OnBeforeModify, OnModify, or OnAfterModify. Or, when calling CopyRows, none of the following events will be called: OnBeforeInsert, OnInsert, or OnAfterInsert.

## CopyFields

Calling CopyFields on the DataTransfer object will copy selected fields in the source table and copy them to the destination table. Unless you're copying with the same source and destination table, specifying a join condition is necessary. The join condition specifies how to match rows from the source with rows from the destination table.

A typical scenario is obsoleting a field and moving its data into another table. For example, suppose you have two tables, **Source** and **Destination**, as illustrated with sample data below. You eventually want to obsolete field **S3** in the table **Source**. But before doing, you want to copy some values of **S3** into the field **D3** in table **Destination**. Specifically, you only want to copy field **D3** in rows where field **D2** is equal to *A*. 

<table>
<tr><th>**Source** table</th><th>**Destination** table (before copy)</th> <th>**Destination** table (after copy)</th></tr>
<tr><td>

| PK | S1 | S2 | S3 |
|----|----|----|----|
| 1  | A  | A  | 42 |
| 2  | B  | A  | 43 |
| 3  | C  | B  | 44 |
| 4  | D  | B  | 45 |

</td><td>

| PK | D1 | D2 | D3 |
|----|----|----|----|
| 1  | A  | A  | 99 |
| 2  | B  | A  |    |
| 4  | C  | B  |    |

</td><td>

| PK | D1 | D2 | D3 |
|----|----|----|----|
| 1  | A  | A  | *42*|
| 2  | B  | A  | *43*|
| 4  | C  | B  |    |

</td>
</tr>
</table>

The code to accomplish this operation is as follows.

```AL
local procedure CopyFields()
var
    dt: DataTransfer;
    dest : Record Destination;
    src: Record Source;
begin
    dt.SetTables(Database::Source, Database::Destination);
    dt.AddFieldValue(src.FieldNo("S3"), dest.FieldNo("D3"));
    dt.AddSourceFilter(src.FieldNo("S2"), '=%1', 'A');
    dt.AddJoin(src.FieldNo("PK"), src.FieldNo("PK"));
    dt.CopyFields();
end;
```

### Performance

The same scenario could also be coded using the record API, by first looping over all rows in the table **Source** with a filter on field **S2**, then for each match, calling Get on the destination record, setting the fields, and calling Modify.

The record-based solution executes three SQL operations per-row, while the DataTransfer does a maximum of two SQL queries altogether. Measurements for DataTransfer and record API solutions have shown an ~200x  performance improvement for DataTransfer. These gains will be even greater if the destination table has modify triggers or if the environment has significant latency to SQL.

### Uniqueness in the source table

The join condition can be specified on arbitrary fields, which leaves the possibility that the set of fields doesn't produce a unique set of rows on that set of fields. This situation would lead to a many-to-many relation between the tables. A many-to-many relation would require the runtime to know which row to select&mdash;which at best would be selected at random. Instead, the upgrade runtime will detect this situation and throw an error. The following table illustrates an example where joining the fields **S1** and **S2** doesn't produce a unique set of rows, and would therefore lead to a runtime error.

| PK | S1 | S2 | S3 |
|----|----|----|----|
| 1  | *A*  | *A*  | 42 |
| 2  | *A*  | *A* | 43 |
| 3  | C  | B  | 44 |
| 4  | D  | B  | 45 |

## CopyRows

Calling CopyRows on the DataTransfer object inserts a row in the destination table for each matching row in the specified source table. Fields in the inserted row are populated with values specified by calling AddFieldValue or AddConstantField. Fields not specified by AddFieldValue or AddConstantField are populated with the field's [InitValue](properties/devenv-initvalue-property.md), if any, or the field type's default value.

If the code tries to copy a row from the source table that has the same primary key as an existing row in the destination table, a runtime error will be thrown.

To help explain CopyRows, consider an example using sample tables **Source** and **Destination** again. In this code example, you'll copy the **PK** and **S3** fields for all rows where **S2** equals *A* and add them as new rows in table **Destination**.  

```AL
local procedure InsertTheRows()
var
    dt: DataTransfer;
    dest : Record Destination;
    src: Record Source;
begin
    dt.SetTables(Database::Source, Database::Destination);
    dt.AddFieldValue(src.FieldNo("PK"), dest.FieldNo("PK"));
    dt.AddFieldValue(src.FieldNo("S3"), dest.FieldNo("D3"));
    dt.AddConstantValue('X', dest.FieldNo(D2));
    dt.AddSourceFilter(src.FieldNo("S2"), '=%1', 'A');
    dt.CopyRows();
end;
```

<table>
<tr><th>**Source** table</th><th>**Destination** table (before copy)</th> <th>**Destination** table (after copy)</th></tr>
<tr><td>

| PK | S1 | S2 | S3 |
|----|----|----|----|
| 2  | B  | A  | 43 |
| 3  | C  | A  | 44 |
| 4  | D  | B  | 45 |


</td><td>

| PK | D1 | D2 | D3 |
|----|----|----|----|
| 1  | A  | A  | 99 |

</td><td>

| PK | D1 | D2 | D3 |
|----|----|----|----|
| 1  | A  | A  | 99 |
| 2  |   |  X | 43 |
| 3  |   |  X | 44 |

</td>
</tr>
</table>

### Performance

As with CopyFields, CopyRows is a bulk operation. It provides performant execution by doing only a single SQL statement for the entire operation, instead of doing multiple per-row operations. Measurements have shown an ~50x performance improvement with a DataTransfer solution compared with a record API solution.

## See Also

[Upgrading Extensions](devenv-upgrading-extensions.md)  