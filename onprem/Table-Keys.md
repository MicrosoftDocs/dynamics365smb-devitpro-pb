---
title: "Table Keys"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 973de351-209a-44b7-b8f6-7218a1fa69e6
caps.latest.revision: 20
---
# Table Keys
The database management system, which is SQL Server, keeps track of each field by using the field number and the record's primary key. The primary key is composed of up to 16 fields in a record. The combination of values in fields in the primary key makes it possible to uniquely identify each record.  

## Primary Keys  
 The primary key determines the logical order in which records are stored, regardless of their physical placement.  

 Logically, records are stored sequentially in ascending order and are sorted by the primary key. Before adding a new record to a table, SQL Server checks if the information in the record's primary key fields is unique and only then inserts the record into the correct logical position. Records are sorted dynamically so the database is always structurally correct. This allows for fast data manipulation and retrieval.  

 A table description contains a list of keys. A key is a sequence of one or more field IDs from the table. Up to 40 keys can be associated to a table. The first key in the list is the primary key.  

 The primary key is always active, and SQL Server keeps the table sorted in primary key order and rejects records with duplicate values in primary key fields. Therefore, the values in the primary key must always be unique. Note that it is not the value in each field in the primary key that must be unique, but it is the combination of values in all fields that make up the primary key.  

## Secondary Keys  
 A secondary key uses an additional structure that is called an *index*. This is like an index that is used in textbooks. A textbook index alphabetically lists important terms at the end of a book. Next to each term are page numbers. You can quickly search the index to find a list of page numbers \(addresses\), and you can locate the term by searching the specified pages. The index is an exact indicator that shows where each term occurs in the textbook.  

 When you define a secondary key and mark it as active, an index is automatically maintained and reflects the sorting order that is defined by the key. Several secondary keys can be active at the same time.  

 A secondary key can be changed into an inactive key, which does not occupy database space, and does not use time during updates to maintain its index. Inactive keys can be reactivated, although this can be time-consuming because SQL Server must scan the whole table to rebuild the index.  

 The fields that make up the secondary keys do not always contain unique data, and SQL Server does not reject records with duplicate data in secondary key fields. If two or more records contain identical information in the secondary key, then SQL Server uses the primary key for the table to resolve this conflict.  

## Sort Orders and Secondary Keys  
 The following example shows how the primary key influences the sort order when a secondary key is active. The Customer table includes four entries \(records\), and the records in the Customer table have two fields: Customer Number and Customer Name.  

 The following is the key list for the Customer table.  

|Key|Key type|Definition|  
|---------|--------------|----------------|  
|1|Primary|Customer Number|  
|2|Secondary|Customer Name|  

 When you sort by the primary key, the Customer table resembles the following table.  

|Customer Number|Customer Name|  
|---------------------|-------------------|  
|001|Customer C|  
|002|Customer A|  
|003|Customer B|  
|004|Customer C|  

 If you select the secondary key for sorting, then the order is based on the contents of the Customer Name field. Because the contents of these fields are not unique, the records must be subsorted according to the primary key.  

|Customer Name|Customer Number|  
|-------------------|---------------------|  
|Customer A|002|  
|Customer B|003|  
|Customer C|001|  
|Customer C|004|  

 Note that the two records that have the same Customer Name value are sorted by Customer Number.  

## How Keys Affect Performance  
 Searching for specific data is easier if several keys have been defined and maintained for the table that holds the desired data. The indexes for each key provide specific views that enable quick, flexible searches. There are advantages and disadvantages to using many keys, as demonstrated in the following table.  

|If you|Performance improves when you|Performance slows when you|  
|------------|-----------------------------------|--------------------------------|  
|Increase the number of secondary keys that are marked as active.|Retrieve data in several different sorting sequences because the data is already sorted.|Enter data because indexes for each secondary key must be maintained.|  
|Decide to use only a few keys.|Enter data because a minimal number of indexes are maintained.|Retrieve data. You may have to define or reactivate the secondary keys to get the appropriate sorting. Depending on the size of the database, this can take some time, because the index must be rebuilt.|  

 The decision whether to use a few or many keys is not easy. The choice of appropriate keys and the number of active keys to use should be the best compromise between maximizing the speed of data retrieval and maximizing the speed of data updates \(operations that insert, delete, or modify data\). In general, it may be worthwhile to deactivate complex keys if they are rarely used.  

 The overall speed depends on the following factors:  

-   Size of the database.  

-   Number of active keys.  

-   Complexity of the keys.  

-   Number of records in your tables.  

-   Speed of your computer and its hard disk.  

## See Also  
 [How to: Define Primary and Secondary Keys](How-to--Define-Primary-and-Secondary-Keys.md)   
 [Table Keys and Performance](Table-Keys-and-Performance.md)
