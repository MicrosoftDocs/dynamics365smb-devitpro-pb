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

The database management system, which is SQL Server, keeps track of data in a table using a primary key. The primary key is composed of up to 16 fields in a record. The combination of values in fields in the primary key makes it possible to uniquely identify each record. 

## Primary keys
  
The primary key determines the logical order in which records are stored, regardless of their physical placement.  

Logically, records are stored sequentially in ascending order and are sorted by the primary key. Before adding a new record to a table, SQL Server checks if the information in the record's primary key fields is unique and only then inserts the record into the correct logical position. Records are sorted dynamically so the database is always structurally correct. This allows for fast data manipulation and retrieval.  

A table description contains a list of keys. A key is a sequence of one or more field IDs from the table. Up to 40 keys can be associated to a table. The first key in the list is the primary key.  

The primary key is always active, and SQL Server keeps the table sorted in primary key order and rejects records with duplicate values in primary key fields. Therefore, the values in the primary key must always be unique. Note that it is not the value in each field in the primary key that must be unique, but it is the combination of values in all fields that make up the primary key.  

> [!NOTE]  
> In the development environment, it is technically possible to create a primary key based on up to 20 fields. However, because of SQL Server limitations, only the first 16 are used.

## Secondary keys
  
A secondary key is implemented on SQL Server using an additional structure that is called an *index*. This is like an index that is used in textbooks. A textbook index alphabetically lists important terms at the end of a book. Next to each term are page numbers. You can quickly search the index to find a list of page numbers (addresses), and you can locate the term by searching the specified pages. The index is an exact indicator that shows where each term occurs in the textbook.  

When you define a secondary key and mark it as enabled, an index is automatically maintained on SQL Server. The index reflects the sorting order that is defined by the key. Several secondary keys can be active at the same time.  

A secondary key can be changed to be disabled, which does not occupy database space, and does not use time during updates to maintain its index. Disabled keys can be re-enabled, although this can be time-consuming because SQL Server must scan the whole table to rebuild the index.  

The fields that make up the secondary keys do not always contain unique data, and SQL Server does not reject records with duplicate data in secondary key fields. If two or more records contain identical information in the secondary key, then SQL Server uses the primary key for the table to resolve this conflict.

### Unique secondary keys

A key definition includes the [Unique](properties/devenv-unique-property.md) property that you can use to create a unique constraint on the table in SQL Server. A unique key ensures that records in a table do not have identical field values. With a unique key, when table is validated, the key value is checked for uniqueness. If the table includes records with duplicate values, the validation fails. Another benefit of unique indexes is providing information to the query optimizer that helps produce more efficient execution plans.

Like primary keys, you can create unique secondary keys that are comprised of multiple fields. In this case, it's the combination of the values in the secondary key that must be unique. For example, if you have a **Customer** table, you could create a unique key for the **Name**, **Address**, and **City** fields to make sure that there are no customers that have the same combination of values for these fields.

Unlike primary keys, it is possible to define multiple unique secondary keys on a table. 

> [!NOTE]  
> The `Unique` property is not supported in table extension objects.

### System keys
There is always a unique secondary key on the **SystemId** field.

## Clustered and non-clustered keys

A key definition includes the [Clustered](properties/devenv-clustered-property.md) property that you use to create a clustered index. A clustered index determines the physical order in which records are stored in the table. Based on the key value, records are sorted in ascending order. Using a clustered key can speed up the retrieval of records.

There can be only one clustered index per table. By default the primary is configured as a clustered key.

> [!NOTE]  
> The `Clustered` property is not supported in table extension objects.

## Sort orders and secondary keys
  
The following example shows how the primary key influences the sort order when a secondary key is active. The Customer table includes four entries (records), and the records in the Customer table have two fields: Customer Number and Customer Name.  

The following is the key list for the Customer table.  

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

If you select the secondary key for sorting, then the order is based on the contents of the Customer Name field. Because the contents of these fields are not unique, the records must be sub-sorted according to the primary key.  

|Customer Name|Customer Number|  
|-------------------|---------------------|  
|Customer A|002|  
|Customer B|003|  
|Customer C|001|  
|Customer C|004|  

> [!NOTE]  
> The two records that have the same Customer Name value are sorted by Customer Number.  

## How keys affect performance

Searching for specific data is easier if several keys have been defined and maintained for the table that holds the desired data. The indexes for each key provide specific views that enable quick, flexible searches. There are advantages and disadvantages to using many keys, as demonstrated in the following table.  

|If you|Performance improves when you|Performance slows when you|  
|------|-----------------------------|--------------------------|  
|Increase the number of secondary keys that are marked as active.|Retrieve data in several different sorting sequences because the data is already sorted.|Enter data because indexes for each secondary key must be maintained.|  
|Decide to use only a few keys.|Enter data because a minimal number of indexes are maintained.|Retrieve data. You may have to define or reactivate the secondary keys to get the appropriate sorting. Depending on the size of the database, this can take some time, because the index must be rebuilt.|  

The decision whether to use a few or many keys is not easy. The choice of appropriate keys and the number of active keys to use should be the best compromise between maximizing the speed of data retrieval and maximizing the speed of data updates (operations that insert, delete, or modify data). In general, it may be worthwhile to deactivate complex keys if they are rarely used.  

The overall speed depends on the following factors:  

- Size of the database.  

- Number of active keys.  

- Complexity of the keys.  

- Number of records in your tables.  

- Speed of your computer and its hard disk.  

## Defining new keys

You define keys in AL code of a table object. To define keys, add the `keys` keyword after the `fields` definition, and then add a `key` keyword for each key:

```
keys
{
    key(Name; Fields)
    {

    }
    key(Name; Fields)
    {

    }
}
```

Replace `Name` with descriptive text that you want to use to identify the key. Replace `Field` with the name of a field that you want to use as the key. If you want to include multiple fields in a single key, separate each field with a comma.

The first `key` keyword defines the primary key. Subsequent `key` keywords define secondary keys.

### Key properties

There are several properties that configure the behavior of a key, such as the [Enabled](properties/devenv-enabled-property.md), [Clustered](properties/devenv-clustered-property.md), and [Unique](properties/devenv-unique-property.md) properties:

```
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

## Restrictions on key modifications

When developing a new version of an extension, be aware of the following restrictions to avoid schema synchronization errors that prevent you from publishing the new version:

- Do not delete primary keys.
- Do not add or remove primary key fields, nor change their order.
- Do not change properties of existing primary keys.
- Do not add additional unique keys.
- Do not add additional clustered keys.
- Do not add keys that are fields of the base table.

<!--
[-]Do not delete existing keys. // You can delete non primarty keys
[-] Do not add or remove fields, nor change their order. // Also ok to change non PK
[-] Do not change properties of existing keys. // Non PK can be changed
Do not add additional unique keys. // still true
Do not add additional clustered keys. // still true
Do not add keys that are fields of the base table. // still true

-->
## See Also

[Tables Overview](devenv-tables-overview.md)  
[Table Object](devenv-table-object.md)  
[Table Extension Object](devenv-table-ext-object.md)  
[SystemId Field](devenv-table-system-fields.md#systemid)  
