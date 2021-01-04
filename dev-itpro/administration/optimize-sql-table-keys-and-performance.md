---
title: Table Keys and Performance
description: AL code searches through a subset of the record in a table, consider what keys define the tables and write code that optimizes the keys.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: f64156c7-0319-40ef-adfa-2c1d4ee1b852
caps.latest.revision: 15
manager: edupont
---
# Table Keys and Performance in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]
When you write AL code that searches through a subset of the records in a table, you must consider what keys are defined for the table and write code that optimizes for the keys. For example, the entries for a specific customer are usually a small subset of a table containing entries for all the customers.  

## Defining Keys to Improve Performance  
 The time that it takes to complete a loop through a subset of records depends on the size of the subset. If a subset cannot be located and read efficiently, then performance deteriorates.  

 To maximize performance, you must define the keys in the table that support the code that you run. You must then specify these keys correctly in your code.  

 For example, to retrieve the entries for a specific customer, you apply a filter to the Customer No. field in the Cust. Ledger Entry table. To run the code efficiently on Microsoft SQL Server, you must define a key in the table that has Customer No. as the first field.  

 The table could have the following keys:  

-   Entry No.  

-   Customer No.,Posting Date  

 The following is an example of code that finds a subset of records.  

```  
SETRANGE("Customer No.",'1000');  
IF FIND('-') THEN  
REPEAT  
UNTIL NEXT = 0;  
```  

 SQL Server automatically chooses which index to use in order to retrieve data in the most efficient way. SQL Server calculates the cost of retrieving data using different indexes and then chooses the path that has the smallest cost. For [!INCLUDE[prod_short](../developer/includes/prod_short.md)], that calculation is based only on the statistical distribution of values in a column.  

 For example, if a table contains 1000 rows and a column in the table contains either the value 0 or the value 1, then that column is said to have a low selectivity. If instead a column contained the values ranging from 1 to 500 then the column is said to have a high selectivity. In the following code example, SQL Server chooses an index that contains the HighSelectivityColumn and then sorts the rows by the LowSelectivityColumn.  

```  
SETCURRENTKEY("LowSelectivityColumn");   
SETFILTER("LowSelectivityColumn",'1');   
SETFILTER("HighSelectivityColumn",'777');   
FIND('-')  

```  

## See Also  
 [Data Access](optimize-sql-data-access.md)   
 [Bulk Inserts](optimize-sql-bulk-inserts.md)   
 [AL Database Methods and Performance on SQL Server](optimize-sql-al-database-methods-and-performance-on-server.md)   
 [Query Objects and Performance](optimize-sql-query-objects-and-performance.md)
