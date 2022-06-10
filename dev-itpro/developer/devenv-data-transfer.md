---
title: "Data Transfer"
description: "Learn about the DataTransfer object type and how to use it to move data between tables."
author: jswymer

ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.author: jswymer
ms.date: 06/10/2022
---

# Transferring Data as Part of Upgrade

The DataTransfer object is an AL data type that supports the bulk transferring of data between SQL based tables. Instead of operating on a row-by-row model, as the record API does, it produces SQL code that operates on sets and allows for far more performant execution. Since it operates in bulk and not on a row-by-row basis, no row based events or triggers will be executed, f.e. when calling CopyFields none of the following events will be called: OnBeforeModify, OnModify, or OnAfterModify, and when calling CopyRows none of the following events will be called: OnBeforeInsert, OnInsert, or OnAfterInsert.

> [!IMPORTANT]
> DataTransfer object can only be used in upgrade code and it will throw an runtime error if used outside of codeunits.  

## Usage

It uses a builder style pattern where the developer first selects the source and destination tables with SetTables, followed by which fields to transfer or set to a constant value via the AddFields or AddConstantValue, and the rows to transfer is filter via AddSourceFilter.

After specifying the fields, constant, and filters either CopyFields or CopyRows are called to execute the built query.

## CopyFields

Calling CopyFields on the DataTransfer object will copy selected fields in the source table and copy them to the destination table. Unless one is copying with the same source and destination table specifying a join condition is necessary. The join condition specifies how to match rows from the source with rows from the destination table.

An example scenario is obsoleting a field and moving its data into another table can be  achieved most performantlty using DataTransfer.

As an example, consider that we want to obsolete the field "A3" in the table "Source" and therefore want to move its values into the field "B3" on table "Destination". A further restriction is that it should only be done for rows where the field "A2" is equal to 'A'.
The code to accomplish this can be found in [listing 1](#listing-1-using-datatransfer-to-transfer-the-values-of-fields-with-field-number-2-and-3-from-the-source-table-to-the-destination-table) with the input and output specified in [table 1](#table-1-example-data-for-source-and-destination-followed-by-the-result-after-executing-the-code-in).

```AL
local procedure MoveTheFields()
var
    dt: DataTransfer;
    dest : Record Destination;
    src: Record Source;
begin
    dt.SetTables(Database::Source, Database::Destination);
    dt.AddFields(src.FieldNo("A3"), dest.FieldNo("B3"));
    dt.AddSourceFilter(src.FieldNo("A2"), '=%1', 'A');
    dt.AddJoin(src.FieldNo("PK"), src.FieldNo("PK"));
    dt.CopyFields();
end;
```

#### Listing 1: Using DataTransfer to transfer the values of fields with field number 2 and 3 from the Source table to the Destination table.

<table>
<tr><th>Before Table Source</th><th>Before Table Destination </th> <th>Resulting Destination Table</th></tr>
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
| 1  | A  | A  | **42** |
| 2  | B  | A  | **43** |
| 4  | C  | B  |    |

</td>
</tr>
</table>

#### Table 1: Example data for source and destination and the result after executing example 1.

### Performance

The same scenario could also be coded using the record API, by first looping over all rows in the table "Source" with a filter on field "A2", then for each match calling Get on the destination record, setting the fields, and calling Modify.

The record based solution executes three SQL operations per-row, while the DataTransfer does max two SQL queries all-in-all. Measuring execution timings for both DataTransfer and Record API based solutions, they show a ~200x performance improvement for DataTransfer. These gains will significantly better if the destination table has Modify triggers or if the execution environment has significant latency to SQL.

### Uniqueness in the source table

The join condition is allowed to be specified on arbitrary fields, which leaves the possibility that the set of fields does not produce a unique set of rows on that set of fields. This would lead to a many-to-* relation between the tables, which would require the runtime knowing which row to select, which would at best be selected at random. Instead the runtime will detect this situation and throw an error. [Table 3](#table-3-a-table-for-which-selecting-fields-"a1"-and-"a2"-does-not-produce-a-unique-set-of-rows-based-on-fields-values) shows an example where selecting the fields "A1" and "A2" doesn't produce an unique set of rows, and would therefore lead to a runtime error.

| PK | A1 | A2 | A3 |
|----|----|----|----|
| 1  | **A**  | **A**  | 42 |
| 2  | **A**  | **A**  | 43 |
| 3  | C  | B  | 44 |
| 4  | D  | B  | 45 |

#### Table 3: A table for which selecting fields "A1" and "A2" does not produce a unique set of rows based on fields values.

## CopyRows

Calling CopyRows on the DataTransfer object will insert a row in the destination table for each matching row in the specified source table. The row will be inserted with the fields and constant values selected by calling AddFields or AddConstantField, with values from the destination table, the remaning fields which aren't populated from the other table or constant will be inserted with its field InitValue or the types default value if no InitValue is specified.

If one tries to copy a row from the source table where a row with same primary key exists in the destination table a runtime error will be thrown.  

```AL
local procedure InsertTheRows()
var
    dt: DataTransfer;
    dest : Record Destination;
    src: Record Source;
begin
    dt.SetTables(Database::Source, Database::Destination);
    dt.AddFields(src.FieldNo("PK"), dest.FieldNo("PK"));
    dt.AddFields(src.FieldNo("A3"), dest.FieldNo("B3"));
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

As with CopyFields, CopyRows is a bulk operation so it allows for performant execution doing only a single SQL statement for the entire operation instead of doing multiple per-row. Measurments shows an ~50x performance improvement over the comparable record API based solution.

## See Also

[Upgrading Extensions](devenv-upgrading-extensions.md)  
