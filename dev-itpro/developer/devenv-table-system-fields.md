---
title: "Table System fields"
description: Description of the table System fields.
author: jswymer
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
--- 

# System Fields

System fields are fields that are automatically included in every table object by the platform. [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] includes the following system fields:

- SystemId
- Data audit fields
- Timestamp

System fields are assigned numbers in the range 2000000000-2147483647. This range is reserved for system fields. You'll get a design-time error if you give a field a number in this range.

## <a name="systemid"></a>SystemId field

[!INCLUDE[2019_releasewave2](../includes/2019_releasewave2.md)]

The **SystemId** field is a GUID data type field that specifies a unique, immutable (read-only) identifier for records in the table. The **SystemId** field has the following characteristics and behavior:

- All records must have a value in the **SystemId** field.
- You can assign your own value when a record is inserted in the database. Otherwise, the platform will automatically generate and assign a value.
- Once the **SystemId** has been set, it can't be changed.
- There's always a unique secondary key on the **SystemId** field to ensure records don't have identical field values.
- The **SystemId** field is given the field number 2000000000.

The **SystemId** field is exposed in the platform code and for AL code, allowing you to code against it. For example:

- The [Insert(Boolean, Boolean)](methods-auto/record/record-insert-boolean-boolean-method.md) lets you specify the **SystemId** value for a record, instead of using one assigned by the platform:

    ```AL
    myRec.SystemId := '{B6666666-F5A2-E911-8180-001DD8B7338E}';  
    myRec.Insert(true, true);
    ```

- The [GetBySystemId(Guid)](methods-auto/record/record-getbysystemid-method.md) uses the **SystemId** to get a record:

    ```AL
    id := myRec.GetBySystemId('{B6666666-F5A2-E911-8180-001DD8B7338E}';  
    ```

- The [SystemIdNo()](methods-auto/recordref/recordref-systemidno-method.md) gets the field number used by the **SystemId** field in the table:

    ```AL
    myRec.OPEN(DATABASE::MyTable);
    SystemIdFieldNo := myRec.SystemIdNo();
    ```
- The [TableRelation](properties/devenv-tablerelation-property.md) lets you use the **SystemId** field to set up table relationships:

    ```AL
    field(1; MyField; Guid)
    {
        DataClassification = ToBeClassified;
        TableRelation = Customer.SystemId;
    }
    ```

- The **SystemId** field can be used as a binding key to an API:

    ```AL
    page 50100 "Customer Entity"
    {
        PageType = API;
        ApplicationArea = All;
        UsageCategory = Administration;
        SourceTable = Customer;
        ODataKeyFields = SystemId;
        ...
    ```

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

- If the **SystemId** field is specified in a Web Service POST request, the OData stack persists the value in the database.
- The **SystemId** field can be used as part of a (non-primary) key.
- You can show the **SystemId** field as a field on a page.
- You can link FactBoxes/page parts using the **SystemId** field.

## <a name="audit"></a>Data audit fields

[!INCLUDE[2020_releasewave2](../includes/2020_releasewave2.md)]

Every table in [!INCLUDE[prod_short](includes/prod_short.md)] includes the following four system fields, which can be used for auditing records:

|Field name (in AL) |Column name (in database)|Data type|Field number|Description|
|-------------------|-------------------------|---------|------------|-----------|
|SystemCreatedAt|$systemCreatedAt |DateTime|2000000001|Specifies the data and time that the record was created.|
|SystemCreatedBy  |$systemCreatedBy |GUID |2000000002|Specifies security ID (SID) of the user that created the record.|
|SystemModifiedAt|$systemModifiedAt |DateTime|2000000003|Specifies the data and time that the record was last modified.|
|SystemModifiedBy|$systemModifiedBy |GUID|2000000004|Specifies the SID of the user that last modified the record|

#### Runtime characteristics

At runtime, the data audit fields have the following characteristics and behavior: 

The platform will automatically generate and assign values according to the following triggers:

- After all [OnBeforeInsert](triggers-auto/tableextension/devenv-onbeforeinsert-tableextension-trigger.md) and [OnBeforeModify](triggers/tableextension/devenv-onbeforemodifytableextension-trigger.md) triggers are run
- After the [OnInsert](triggers-auto/tableextension/devenv-oninsert-tableextension-trigger.md) and [OnModify](triggers-auto/tableextension/devenv-onmodify-tableextension-trigger.md) triggers are run
- Before all [OnAfterInsert](triggers-auto/tableextension/devenv-onafterinsert-tableextension-trigger.md) and [OnAfterModify](triggers-auto/tableextension/devenv-onaftermodify-tableextension-trigger.md) triggers are run

> [!NOTE]
> You can assign the values, but the values written to the database are always provided by the platform.

Fields are populated as follows:

- When a new record is created, before calling Insert, the audit fields are given blank GUIDs and blank dates as values.

- When a record is first inserted, the fields are populated with actual values.

    The $systemCreatedBy and $systemModifiedBy fields are given the same value. So are the $systemCreatedAt  and $systemModifiedAt fields.

    The $systemCreatedBy and $systemCreatedAt fields won't change after this point.

- When a record is updated, the $systemModifiedBy and $systemModifiedAt fields are changed.

The platform won't populate audit field values in these cases:

- Copying company. The values in the tables of the company being copied stay the same, and the values are copied to the tables of the new company.
- Synchronizing the table schema with the application.

> [!NOTE]
> Audit fields can't be imported with configuration packages.

#### In AL

The data audit fields are exposed in AL code. As a developer, the audit fields give you an easy and performant way to program against historical data. For example, you can write AL queries that return data changes since a specific date and time.

The following methods are available on the [RecordRef](methods-auto/recordref/recordref-data-type.md) data type:

|Method|Description|
|------|-----------|
|[SystemCreatedAtNo](methods-auto/recordref/recordref-systemcreatedatno-method.md)|Gets the field number that is used by the **SystemCreatedAt** field. |
|[SystemCreatedByNo](methods-auto/recordref/recordref-systemcreatedbyno-method.md)|Gets the field number that is used by the **SystemCreatedBy** field.|
|[SystemModifiedAtNo](methods-auto/recordref/recordref-systemmodifiedatno-method.md)|Gets the field number that is used by the **SystemModifiedAt** field.|
|[SystemModifiedByNo](methods-auto/recordref/recordref-systemmodifiedbyno-method.md)|Gets the field number that is used by the **SystemModifiedBy** field.|

There are a couple points of interest you should know:

- If a record is copied into a temporary table, the data audit field values are copied as well. The values aren't changed by the server when calling a modify or insert method.  
- It's possible to use audit fields in a key. The platform doesn't automatically index these fields in any way.

## <a name="timestamp"></a> Timestamp field

The **timestamp** field contains row version numbers for records, as maintained in SQL Server. The **timestamp** field is hidden. But, you can expose it by using [SqlTimestamp Property](properties/devenv-sqltimestamp-property.md). You're then able to write code against it, add filters, and so on, similar to any other field in a table. However, you can't write to the **timestamp** field.  
  
A typical use of the **timestamp** field is for synchronizing data changes in tables. It lets you identify records that have changed since the last synchronization. For example, you can read all the records in a table, then store the highest **timestamp** value. Later, you can query and retrieve records that have a higher **timestamp** value than the stored value.  
  
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

[Table Object](devenv-table-object.md)  
[AL Development Environment](devenv-reference-overview.md)  
[Table Overview](devenv-tables-overview.md)  
[Table Extension Object](devenv-table-ext-object.md)  
[SqlTimestamp Property](properties/devenv-sqltimestamp-property.md)  
[Table Keys](devenv-table-keys.md)  
[Table Properties](properties/devenv-table-properties.md)  
