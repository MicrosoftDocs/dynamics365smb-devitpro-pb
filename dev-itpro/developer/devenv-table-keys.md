---
title: "Table Keys"
description: Learn about table keys in Business Central
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 973de351-209a-44b7-b8f6-7218a1fa69e6
author: jswymer
---

# Table Keys

The database management system, which is SQL Server, uses keys to identify rows in a table. Keys identify the rows by combining one or more columns of a table. SQL also uses indexes to speed up data retrieval from rows in a table. This article explains how to create  keys and indexes for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] tables from AL code.

## Keys in AL

In AL, a key definition is a sequence of one or more field IDs from a table. You can define keys in table objects and table extension objects, depending on the type of key. There are two types of keys: primary and secondary.

- Primary keys

    A primary key uniquely identifies each record in a table. Every table has a primary key, and there can only be one primary key per table. Primary keys are defined on table objects only. In SQL, table extension objects inherit the primary key of the table object they extend (the base table object). So any key that you define in a table extension object is considered a secondary key.
- Secondary keys

    Secondary keys create indexes in SQL. They're defined in both table objects and table extension objects. You can define multiple secondary keys for a single table object and table extension object.

    A key in table extension object can include fields from the base table object or the table extension object. There are some limitations, however. For more information, see [Limitations and Restrictions](#limits).

## Primary keys

The primary key keeps track of data in a table. The primary key is composed of up to 16 fields in a record. The combination of values in fields in the primary key makes it possible to uniquely identify each record. In AL, the first key defined in a table object is the primary key. The primary key determines the logical order in which records are stored, no matter the physical placement of the fields in the table object.

Logically, records are stored sequentially in ascending order and sorted by the primary key. Before adding a new record to a table, SQL Server checks if the information in the record's primary key fields is unique. If so, it then inserts the record into the correct logical position. Records are sorted dynamically so the database is always structurally correct. This sorting allows for fast data manipulation and retrieval.  

The primary key is always active. SQL Server keeps the table sorted in primary key order and rejects records with duplicate values in primary key fields. That's why the values in the primary key must always be unique. It's not the value in each field in the primary key that must be unique. Instead, it's the combination of values in all fields that make up the primary key.  

> [!NOTE]  
> In the development environment, it's technically possible to create a primary key based on up to 20 fields. However, because of SQL Server limitations, only the first 16 are used.

## Secondary keys

In a table object, any keys defined after the primary key are called *secondary keys*. All keys defined in a table extension object are considered secondary keys.

A secondary key is implemented on SQL Server using a structure that is called an *index*. This structure is like an index that is used in textbooks. A textbook index alphabetically lists important terms at the end of a book. Next to each term are page numbers. You can quickly search the index to find a list of page numbers (addresses), and you can locate the term by searching the specified pages. The index is an exact indicator that shows where each term occurs in the textbook.  

When you define a secondary key and mark it as [enabled](properties/devenv-enabled-property.md), an index is automatically maintained on SQL Server. The index reflects the sorting order that is defined by the key. Several secondary keys can be active at the same time.  

A secondary key can be disabled so that it doesn't occupy database space or use time during updates to maintain its index. Disabled keys can be re-enabled, although this operation can be time-consuming because SQL Server must scan the whole table to rebuild the index.  

The fields that make up the secondary keys don't always contain unique data. SQL Server doesn't reject records with duplicate data in secondary key fields. So if two or more records contain identical information in the secondary key, SQL Server uses the table's primary key to resolve this conflict.

### Unique secondary keys

A key definition includes the [Unique](properties/devenv-unique-property.md) property that you can use to create a unique constraint on the table in SQL Server. A unique key ensures that records in a table don't have identical field values. With a unique key, when table is validated, the key value is checked for uniqueness. If the table includes records with duplicate values, the validation fails. Another benefit of unique indexes is providing information to the query optimizer that helps produce more efficient execution plans.

You can create unique secondary keys that are composed of multiple fields, like with primary keys. In this case, it's the combination of the values in the secondary key that must be unique. Consider the **Customer** table, for example. Suppose you wanted to make sure there are no customers that have the same combination of values for the **Name**, **Address**, and **City** fields. You could create a unique key for these fields.

Unlike primary keys, it's possible to define multiple unique secondary keys on a table.

> [!NOTE]  
> The `Unique` property isn't supported in table extension objects.

### System keys
There's always a unique secondary key on the **SystemId** field.

## Clustered and non-clustered keys

A key definition includes the [Clustered](properties/devenv-clustered-property.md) property that you use to create a clustered index. A clustered index determines the physical order in which records are stored in the table. Based on the key value, records are sorted in ascending order. Using a clustered key can speed up the retrieval of records.

There can be only one clustered index per table. By default the primary is configured as a clustered key.

> [!NOTE]  
> The `Clustered` property isn't supported in table extension objects.

## Sort orders and secondary keys
  
The following example shows how the primary key influences the sort order when a secondary key is active. The Customer table includes four entries (records), and the records in the Customer table have two fields: Customer Number and Customer Name.  

The following table includes the key list for the Customer table.  

|Key|Key type|Definition|  
|---|--------|----------|  
|1|Primary|Customer Number|  
|2|Secondary|Customer Name|  

When you sort by the primary key, the Customer table resembles the following table.  

|Customer Number|Customer Name|  
|---------------------|-------------------|  
|001|Customer C|  
|002|Customer A|  
|003|Customer B|  
|004|Customer C|  

If you select the secondary key for sorting, then the order is based on the contents of the Customer Name field. Because the contents of these fields aren't unique, the records must be subsorted according to the primary key.  

|Customer Name|Customer Number|  
|-------------------|---------------------|  
|Customer A|002|  
|Customer B|003|  
|Customer C|001|  
|Customer C|004|  

> [!NOTE]  
> The two records that have the same Customer Name value are sorted by Customer Number.  

## How keys affect performance

Searching for specific data is easier if several keys are defined and maintained for the table that holds the wanted data. The indexes for each key provide specific views that enable quick and flexible searches. There are advantages and disadvantages to using many keys, as demonstrated in the following table.  

|If you|Performance improves when you|Performance slows when you|  
|------|-----------------------------|--------------------------|  
|Increase the number of secondary keys that are marked as active.|Retrieve data in several different sorting sequences because the data is already sorted.|Enter data because indexes for each secondary key must be maintained.|  
|Decide to use only a few keys.|Enter data because a minimal number of indexes are maintained.|Retrieve data. You may have to define or reactivate the secondary keys to get the appropriate sorting. Depending on the size of the database, this operation can take some time, because the index must be rebuilt.|  

The decision whether to use a few or many keys isn't easy. The appropriate keys and the number of active keys to use is a compromise between maximizing the speed of data retrieval and data updates (operations that insert, delete, or modify data). In general, it may be worthwhile to deactivate complex keys if they're rarely used.  

The overall speed depends on the following factors:  

- Size of the database.  

- Number of active keys.  

- Complexity of the keys.  

- Number of records in your tables.  

- Speed of your computer and its hard disk.  

## Defining new keys

To define keys, add the `keys` keyword after the `fields` definition, and then add a `key` keyword for each key:

```AL
keys
{
    key(Name1; Fields)
    {

    }
    key(Name2; Fields)
    {

    }
}
```

Replace `Name` with descriptive text that you want to use to identify the key. Replace `Field` with the name of a field that you want to use as the key. If you want to include multiple fields in a single key, separate each field with a comma.

In a table object, the first `key` keyword defines the primary key. Subsequent `key` keywords define secondary keys.

The following code illustrates simple example for a table object and table extension object.

```AL
table 50120 MyBaseTable
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; MyBaseField1; Integer)
        {
            DataClassification = ToBeClassified;
        }

        field(2; MyBaseField2; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; MyBaseField1) //primary key
        {
            Clustered = true;
        }
        key(Key1; MyBaseField2)
        {
        }
    }
}
```

```AL
tableextension 50121 MyBaseTableExt extends MyBaseTable
{
    fields
    {
        field(3; MyExtField1; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(4; MyExtField2; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(ExtKey1; MyExtField1)
        {
        }
        key(ExtKey2; MyBaseField1, MyBaseField2)
        {
        }
        // The following key isn't allowed because it contains fields from base table and table extension
        //key(ExtKey3; MyBaseField1, MyExtField2)
        //{
        //}
    }
}
```

### Key properties

There are several properties that configure the behavior of a key, such as the [Enabled](properties/devenv-enabled-property.md), [Clustered](properties/devenv-clustered-property.md), and [Unique](properties/devenv-unique-property.md) properties:

```AL
keys
{
    key(PrimaryKey; ID)
    {
        Clustered = true;
    }
    key(CustomerInfo; Name,Address,City)
    {
        Unique = true;
    }
   key(Currency; Currency Code)
    {    
        Enabled = false;
    }
}
```

For a more information about the different key properties, see [Key Properties](properties/devenv-key-properties.md).

## <a name="limits"></a>Limitations and Restrictions

### Keys in table extension objects

In table extension objects, you can define multiple keys, just like in a table object. However, the following limitations apply:

- In [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2020 release wave 2 and earlier, keys in table extension objects can only include fields from the table extension object itself.
- In [!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 and later, keys in table extension objects can include fields from the base table object and table extension object. However, a single key can't include fields from both the base table object and table extension object. In other words, each key must contain fields from either the base table object or the table extension object.

### Total number of keys

Up to 40 keys can be associated with a table.

### Key modifications

When developing a new version of an extension, be aware of the following restrictions to avoid schema synchronization errors that prevent you from publishing the new version:

- Don't delete primary keys.
- Don't add or remove primary key fields, nor change their order.
- Don't change properties of existing primary keys.
- Don't add more unique keys.
- Don't add more clustered keys.
- Don't add keys that are fields of the base table.

<!--
[-]Don't delete existing keys. // You can delete non primarty keys
[-] Don't add or remove fields, nor change their order. // Also ok to change non PK
[-] Don't change properties of existing keys. // Non PK can be changed
Don't add additional unique keys. // still true
Don't add additional clustered keys. // still true
Don't add keys that are fields of the base table. // still true

-->
## See Also
[Key Properties](properties/devenv-key-properties.md)
[Tables Overview](devenv-tables-overview.md)  
[Table Object](devenv-table-object.md)  
[Table Extension Object](devenv-table-ext-object.md)  
[SystemId Field](devenv-table-system-fields.md#systemid)  
