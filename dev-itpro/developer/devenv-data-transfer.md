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

The DataTransfer object is an AL data type that supports the bulk transferring of data between SQL based tables. Instead of operating on a row-by-row model, as the record API does, it produces SQL code that operates on sets and allows for far more performant execution.

> [!IMPORTANT]
> DataTransfer object can only be used in upgrade code and it will throw an runtime error if used outside of upgrade codeunits.  

## Usage and behavior

DataTransfer uses a builder style pattern, where you:

1. Specify the source and destination tables by calling the SetTables.
2. Specify which fields to transfer or set to a constant value by calling the AddFieldsValue or AddConstantValue, respectively.
3. Specify the rows to transfer is filter by calling AddSourceFilter.
4. Execute the query for transferring data by calling CopyFields or CopyRows.

Because DataTransfer operates in bulk and not on a row-by-row basis, no row based events or triggers will be executed. For example, when calling CopyFields, none of the following events will be called: OnBeforeModify, OnModify, or OnAfterModify. Or, when calling CopyRows, none of the following events will be called: OnBeforeInsert, OnInsert, or OnAfterInsert.

## CopyFields

Calling CopyFields on the DataTransfer object will copy selected fields in the source table and copy them to the destination table. Unless you're copying with the same source and destination table, specifying a join condition is necessary. The join condition specifies how to match rows from the source with rows from the destination table.

A typical scenario is obsoleting a field and moving its data into another table. For example, suppose you have two tables, table A and table B, as illustrated with sample data below. You want to eventually obsolete the field **A3** in the table **A**. But before doing, you want to copy some field values of **A3** into the field **B3** in table **B**. Specifically, you only want to copy field **A3** in rows where field **A2** is equal to *A*. 

<table>
<tr><th>Table A </th><th>Table B (before copy)</th> <th>Table B (after copy)</th></tr>
<tr><td>

| PK | A1 | A2 | A3 |
|----|----|----|----|
| 1  | A  | A  | 42 |
| 2  | B  | A  | 43 |
| 3  | C  | B  | 44 |
| 4  | D  | B  | 45 |

</td><td>

| PK | B1 | B2 | B3 |
|----|----|----|----|
| 1  | A  | A  | 99 |
| 2  | B  | A  |    |
| 4  | C  | B  |    |

</td><td>

| PK | B1 | B2 | B3 |
|----|----|----|----|
| 1  | A  | A  | *42*|
| 2  | B  | A  | *43*|
| 4  | C  | B  |    |

</td>
</tr>
</table>

The code to accomplish this operation is as follows. In this scenario, table **A** is the source and table **B** is the destination:

```AL
local procedure MoveTheFields()
var
    dt: DataTransfer;
    dest : Record B;
    src: Record A;
begin
    dt.SetTables(Database::A, Database::B);
    dt.AddFieldsValue(src.FieldNo("A3"), dest.FieldNo("B3"));
    dt.AddSourceFilter(src.FieldNo("A2"), '=%1', 'A');
    dt.AddJoin(src.FieldNo("PK"), src.FieldNo("PK"));
    dt.CopyFields();
end;
```

### Performance

The same scenario could also be coded using the record API, by first looping over all rows in the table **A** with a filter on field **A2**, then for each match, calling Get on the destination record, setting the fields, and calling Modify.

The record-based solution executes three SQL operations per-row, while the DataTransfer does a maximum of two SQL queries all-in-all. Measuring execution timings for both DataTransfer and Record API based solutions, they show a ~200x performance improvement for DataTransfer. These gains will be even better if the destination table has Modify triggers or if the execution environment has significant latency to SQL.

### Uniqueness in the source table

The join condition can be specified on arbitrary fields, which leaves the possibility that the set of fields doesn't produce a unique set of rows on that set of fields. This situation would lead to a many-to-many relation between the tables. A many-to-many relation would require the runtime to know which row to select&mdash;which at best would be selected at random. Instead, the upgrade runtime will detect this situation and throw an error. The following table illustrates an example where joining the fields **A1** and **A2** doesn't produce a unique set of rows, and would therefore lead to a runtime error.

| PK | A1 | A2 | A3 |
|----|----|----|----|
| 1  | *A*  | *A*  | 42 |
| 2  | *A*  | *A* | 43 |
| 3  | C  | B  | 44 |
| 4  | D  | B  | 45 |

## CopyRows

Calling CopyRows on the DataTransfer object will insert a row in the destination table for each matching row in the specified source table. The row will be inserted with the fields and constant values specified by calling AddFieldsValue or AddConstantField, with values from the destination table. The remaining fields, which aren't populated from the other table or constant, will be inserted with its field InitValue or the types default value if no InitValue is specified.

If one tries to copy a row from the source table where a row with same primary key exists in the destination table a runtime error will be thrown.  

```AL
local procedure InsertTheRows()
var
    dt: DataTransfer;
    dest : Record Destination;
    src: Record Source;
begin
    dt.SetTables(Database::Source, Database::Destination);
    dt.AddFieldsValue(src.FieldNo("PK"), dest.FieldNo("PK"));
    dt.AddFieldsValue(src.FieldNo("A3"), dest.FieldNo("B3"));
    dt.AddSourceFilter(src.FieldNo("A2"), '=%1', 'A');
    dt.CopyRows();
end;
```

<table>
<tr><th>Before Table Source</th><th>Before Table Destination </th> <th>Resulting Destination Table</th></tr>
<tr><td>

| PK | A1 | A2 | A3 |
|----|----|----|----|
| 2  | B  | A  | 43 |
| 3  | C  | A  | 44 |
| 4  | D  | B  | 45 |


</td><td>

| PK | B1 | B2 | B3 |
|----|----|----|----|
| 1  | A  | A  | 99 |

</td><td>

| PK | B1 | B2 | B3 |
|----|----|----|----|
| 1  | A  | A  | 99 |
| 2  |   |   | 43 |
| 3  |   |   | 44 |

</td>
</tr>
</table>

### Performance

As with CopyFields, CopyRows is a bulk operation so it allows for performant execution doing only a single SQL statement for the entire operation instead of doing multiple per-row operations. Measurements show an ~50x performance improvement over the comparable record API based solution.

## See Also

[Upgrading Extensions](devenv-upgrading-extensions.md)  