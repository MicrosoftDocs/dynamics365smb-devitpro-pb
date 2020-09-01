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

Tables are the core objects used to store data in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. No matter how data is registered in the product - from a web service to a finger swipe on the phone app, the results of that transaction will be recorded in a table. 

The structure of a table has four sections:

- The first block contains metadata for the overall table, such as the table type.
- The fields section describes the data elements that make up the table, such as their name and the type of data they can store.
- The keys section contains the definitions of the keys that the table needs to support.
- The final section details the triggers and code that can run on the table.

> [!IMPORTANT]  
> Only tables with the [Extensible Property](properties/devenv-extensible-property.md) set to **true** can be extended.

> [!NOTE]  
> Extension objects can have a name with a maximum length of 30 characters.

> [!IMPORTANT]  
> System and virtual tables can't be extended. System tables are created in the ID range of 2.000.000.000 and above. For more information about object ranges, see [Object Ranges](devenv-object-ranges.md).

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

System fields are fields that are automatically included in every table object by the platform. [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md) includes the following system fields:

- SystemId
- Data audit fields
- Timestamp

These system fields are described in the sections that follow.  

System fields are assigned numbers in the range 2000000000-2147483647. This range is reserved for system fields. You'll get a design-time error if you give a field a number in this range.

### <a name="systemid"></a>SystemId field

[!INCLUDE[2019_releasewave2](../includes/2019_releasewave2.md)]

The **SystemId** field is a GUID data type field that specifies a unique, immutable (read-only) identifier for records in the table. The **SystemId** field has the following characteristics and behavior:

- All records must have a value in the **SystemId** field.
- You can assign your own value when a record is inserted in the database. Otherwise, the platform will automatically generate and assign a value.
- Once the **SystemId** has been set, it can't be changed.
- There's always a unique secondary key on the **SystemId** field to ensure records don't have identical field values.
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

### Data Audit Fields

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

Every table in [!INCLUDE[prodshort](includes/prodshort.md)] includes the following four system fields, which can be used for auditing records:

- SystemCreatedAt

   Specifies the data and time that the record was created
- SystemCreatedBy

  Specifies security ID (SID) of the user that created the record 
- SystemModifiedAt

  Specifies the data and time that the record was last modified.
- SystemModifiedBy

  Specifies the SID of the user that last modified the record

#### Static characteristics

The data audit fields have the following static characteristics:

|Field name (in AL) |Column name (in database)|Data type|Field number|Description|
|-------------------|-------------------------|---------|------------|-----------|
|SystemCreatedAt|$systemCreatedAt |DateTime|2000000001|Specifies the data and time that the record was created.|
|SystemCreatedBy  |$systemCreatedBy |GUID |2000000002|Specifies security ID (SID) of the user that created the record.|
|SystemModifiedAt|$systemModifiedAt |DateTime|2000000003|Specifies the data and time that the record was last modified.|
|SystemModifiedBy|$systemModifiedBy |GUID|2000000004|Specifies the SID of the user that last modified the record|

#### Runtime characteristics

At runtime, the data audit fields have the following characteristics and behavior: 

-  The platform will automatically generate and assign values as follows:

   - After all  [OnBeforeInsert](triggers/devenv-onbeforeinsert-trigger.md) and [OnBeforeModify](triggers/devenv-onbeforemodify-trigger.md) triggers are run
   - After the [OnInsert](triggers/devenv-oninsert-trigger.md) and [OnModify](triggers/devenv-onmodify-trigger.md) triggers are run
   - Before all [OnAfterInsert](triggers/devenv-onafterinsert-trigger.md) and [OnAfterModify](triggers/devenv-onaftermodify-trigger.md) triggers are run

    > [!NOTE]
    > You can assign the values, but the values written to the database are always provided by the platform.

- When a new record is created, before calling Insert, the audit fields are given blank GUIDs and blank dates as values.

- When a record is first inserted, the fields are populated with actual values.

    The $systemCreatedBy and $systemModifiedBy fields are given the same value. So are the $systemCreatedAt  and $systemModifiedAt fields.

    The $systemCreatedBy and $systemCreatedAt fields won't change after this point.

- When a record is updated, the $systemModifiedBy and $systemModifiedAt fields are changed.

- The following operations won't change the values of audit fields:

  - Copy company. The values in the tables of the company being copied stay the same, and the values are copied to the tables of the new company.
  - Synchronizing the table schema with the application.

- Audit fields can't be imported with configuration packages.

#### In AL 

The data audit fields are exposed in AL code. As a developer, the audit fields give you an easy and performant way to program against historical data. For example, you could write AL queries that return data that has changed since a specific date and time.

The following methods are available on the [RecordRef](methods-auto/recordref/recordref-data-type) data type:

|Method|Description|
|------|-----------|
|[SystemCreatedAtNo](methods-auto/recordref/recordref-systemcreatedatno-method.md)|Gets the field number that is used by the **SystemCreatedAt** field. |
|[SystemCreatedByNo](methods-auto/recordref/recordref-systemcreatedbyno-method.md)|Gets the field number that is used by the **SystemCreatedBy** field.|
|[SystemModifiedAtNo](methods-auto/recordref/recordref-systemmodifiedatno-method.md)|Gets the field number that is used by the **SystemModifiedAt** field.|
|[SystemModifiedByNo](methods-auto/recordref/recordref-systemmodifiedbyno-method.md)|Gets the field number that is used by the **SystemModifiedBy** field.|

There are a couple points of interest you should know:

- If a record is copied into a temporary table, the data audit field values are copied as well. The values aren't changed by the server when calling a modify or insert method.  
- It's possible to use audit fields in a key. The platform doesn't automatically index these fields in any way.

### <a name="timestamp"></a> Timestamp field

The **timestamp** field contains row version numbers for records, as maintained in SQL Server. The **timestamp** field is hidden. But, you can expose it by using [SqlTimestamp Property](properties/devenv-sqltimestamp-property.md). You're then able to write code against it, add filters, and so on, similar to any other field in a table. However, you can't write to the **timestamp** field.  
  
A typical use of the **timestamp** field is for synchronizing data changes in tables, when you want to identify records that have changed since the last synchronization. For example, you can read all the records in a table, and then store the highest **timestamp** value. Later, you can query and retrieve records that have a higher **timestamp** value than the stored value.  
  
#### Expose the timestamp field  
 
1. Add a field that has the data type `BigInteger`.
  
     Specify a name for the field, such as `Record Time Stamp`. You can specify any valid name for field, but you can't use `timestamp` because it's a reserved name.  
  
2.  Set the `SqlTimestamp` property to `true`.

    For example:

    ```
    field(3; "Record Time Stamp"; BigInteger)
    {
        SqlTimestamp = true;
    }

Alternatively, you can use a [FieldRef Data Type](methods-auto/fieldref/fieldref-data-type.md) variable to access the timestamp value of a record, as follows:

1.    Create a [RecordRef Data Type](methods-auto/recordref/recordref-data-type.md) variable that references the record in a table for which you want to retrieve its timestamp.

2.    Use the [Field Method](methods-auto/recordref/recordref-field-method.md) on the **RecordRef** variable to get the **FieldRef** for the field that has the number 0. This field contains the timestamp value.

The following example shows how to retrieve the timestamp value for the first record in the `Customer` table. **RecordRef** and **FieldRef** are [RecordRef Data Type](methods-auto/recordref/recordref-data-type.md) and [FieldRef Data Type](methods-auto/fieldref/fieldref-data-type.md) variables, respectively.

```
RecordRef.Open(DATABASE::Customer);
RecordRef.FindFirst();
FieldRef := RecordRef.Field(0);
Message(Format(FieldRef.Value()));
```

## See Also
[AL Development Environment](devenv-reference-overview.md)  
[Table Overview](devenv-tables-overview.md)  
[Table Extension Object](devenv-table-ext-object.md)  
[SqlTimestamp Property](properties/devenv-sqltimestamp-property.md)  
[Table Keys](devenv-table-keys.md)  
[Table Properties](properties/devenv-table-properties.md)  
