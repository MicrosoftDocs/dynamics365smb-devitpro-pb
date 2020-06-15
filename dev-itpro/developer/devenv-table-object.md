---
title: "Table Object"
description: "Description of the table object."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 06/11/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
--- 

# Table Object

Tables are the core objects used to store data in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Regardless of how data is registered in the product - from a web service to a finger swipe on the phone app, the results of that transaction will be recorded in a table. 

The structure of a table has four sections. The first block contains metadata for the overall table; the table type. The fields section describes the data elements that make up the table; their name and the type of data they can store. The keys section contains the definitions of the keys that the table needs to support. The final section details the triggers and code that can run on the table.

> [!IMPORTANT]  
> Only tables with the [Extensible Property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!IMPORTANT]  
> System and virtual tables cannot be extended. System tables are created in the ID range of 2.000.000.000 and above. For more information about object ranges, see [Object Ranges](devenv-object-ranges.md).

## Snippet support
Typing the shortcut `ttable` will create the basic layout for a table object when using the [!INCLUDE[d365al_ext_md](../includes/d365al_ext_md.md)] in Visual Studio Code.


[!INCLUDE[intelli_shortcut](includes/intelli_shortcut.md)]

## Table example

This table stores address information and it has four fields; `Address`, `Locality`, `Town/City`, and `County`.

```
table 50104 Address
{
    Caption = 'Sample table';
    DataPerCompany = true;

    fields
    {
        field(1; Address; Text[50])
        {
            Description = 'Address retrieved by Service';
        }
        field(2; Locality; Text[30])
        {
            Description = 'Locality retrieved by Service';
        }
        field(3; "Town/City"; Text[30])
        {
            Description = 'Town/City retrieved by Service';
        }
        field(4; County; Text[30])
        {
            Description = 'County retrieved by Service';

            trigger OnValidate();
            begin
                ValidateCounty(County);
            end;

        }
    }
    keys
    {
        key(PrimaryKey; Address)
        {
            Clustered = TRUE;
        }
    }

    var
        Msg: Label 'Hello from my method';

    trigger OnInsert();
    begin

    end;

    procedure MyMethod();
    begin
        Message(Msg);
    end;
}
```

## System fields

System fields are fields that are automatically included in every table object by the platform.

System fields are assigned numbers in the range 2000000000-2147483647. This range is reserved for system fields. You will get an design-time error if you give a field a number in this range.

### <a name="systemid"></a>SystemId field

[!INCLUDE[2019_releasewave2](../includes/2019_releasewave2.md)]

The **SystemId** field is a GUID data type field that specifies a unique, immutable (read-only) identifier for records in the table. The **SystemId** field has the following characteristics and behavior:

- All records must have a value in the **SystemId** field.
- You can assign your own value when a record is inserted in the database; otherwise the platform will automatically generate and assign a value.
- Once the **SystemId** has been set, it cannot be changed.
- There is always a unique secondary key on the **SystemId** field to ensure records do not have identical field values.
- The **SystemId** field is given the field number 2000000000.

The **SystemId** field is exposed in the platform code and for AL code, allowing you to code against it. For example:

- The [Insert(Boolean, Boolean)](methods-auto/record/record-insert-boolean-boolean-method.md) lets you specify the **SystemId** value for a record, instead of using one assigned by the platform:

    ```
    myRec.SystemId := '{B6666666-F5A2-E911-8180-001DD8B7338E}';  
    myRec.Insert(true, true);
    ```

- The [GetBySystemId(Guid)](methods-auto/record/record-getbysystemid-method.md) uses the **SystemId** to get a record:

    ```
    id := myRec.GetBySystemId('{B6666666-F5A2-E911-8180-001DD8B7338E}';  
    ```

- The [SystemIdNo()](methods-auto/recordref/recordref-systemidno-method.md) gets the field number used by the **SystemId** field in the table:

    ```
    myRec.OPEN(DATABASE::MyTable);
    SystemIdFieldNo := myRec.SystemIdNo();
    ```
- The [TableRelation](properties/devenv-tablerelation-property.md) lets you use the **SystemId** field to set up table relationships:

    ```
    field(1; MyField; Guid)
    {
        DataClassification = ToBeClassified;
        TableRelation = Customer.SystemId;
    }
    ```

- The **SystemId** field can be used as a binding key to an API:

    ```
    page 50100 "Customer Entity"
    {
        PageType = API;
        ApplicationArea = All;
        UsageCategory = Administration;
        SourceTable = Customer;
        ODataKeyFields = SystemId;
        ...
    ```

### <a name="timestamp"></a> Timestamp field

The **timestamp** field contains row version numbers for records, as maintained in SQL Server. The **timestamp** field is hidden, but you can expose it by using [SqlTimestamp Property](properties/devenv-sqltimestamp-property.md), and then write code against it, add filters, and so on, similar to any other field in a table. However, you cannot write to the **timestamp** field.  
  
A typical use of the **timestamp** field is for synchronizing data changes in tables, when you want to identify records that have changed since the last synchronization. For example, you can read all the records in a table, and then store the highest **timestamp** value. Later, you can query and retrieve records that have a higher **timestamp** value than the stored value.  
  
#### Expose the timestamp field  
 
1. Add a field that has the data type `BigInteger`.
  
     Specify a name for the field, such as `Record Time Stamp`. You can specify any valid name for field, but you cannot use `timestamp` because this is a reserved name.  
  
2.  Set the `SqlTimestamp` property to `true`.

    For example:

    ```
    field(3; "Record Time Stamp"; BigInteger)
    {
        SqlTimestamp = true;
    }


## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Table Overview](devenv-tables-overview.md)  
[Table Extension Object](devenv-table-ext-object.md)  
[SqlTimestamp Property](properties/devenv-sqltimestamp-property.md)  
[Table Keys](devenv-table-keys.md)  
[Table Properties](properties/devenv-table-properties.md)  
