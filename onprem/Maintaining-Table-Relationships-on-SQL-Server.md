---
title: "Maintaining Table Relationships on SQL Server"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8d05fd7b-5132-48a3-8089-67528185c4cb
caps.latest.revision: 6
---
# Maintaining Table Relationships on SQL Server
The [TableRelation Property](TableRelation-Property.md) in [!INCLUDE[nav_2009_short](includes/nav_2009_short_md.md)] can be represented in SQL Server by table relationships known as foreign key constraints. These table relationships are metadata about the tables and are only intended for modeling and diagramming; they are not used to enforce data integrity. The foreign key constraints are disabled.  
  
 The table relationships in SQL Server can be accessed with external tools that can use this information to generate diagrams illustrating the structure of the database.  
  
 You can use the **Maintain Relationships** option on the **Integration** tab of the **Alter Database** window to enable and disable the table relationships on SQL Server. For more information, see [Altering Databases - Integration Tab](Altering-Databases---Integration-Tab.md).  
  
## Requirements  
 There are certain requirements that must be met before a [TableRelation Property](TableRelation-Property.md) can be represented on SQL Server.  
  
 To maintain a table relationship:  
  
-   The fields forming the relationship must be of the same data type in both of the related tables. This also applies to any fields that are specified in the Table Filter field. Text and code fields are compatible as long as they have the same length.  
  
-   The [SQL Data Type Property](SQL-Data-Type-Property.md) of code fields must be the same in both tables.  
  
-   The table filter that is part of the table relationship must contain only the FIELD filter type. Table filters of the CONST and FILTER filter type cannot be created on SQL Server.  
  
-   Conditional relationships have one SQL Server relationship for each condition, as long as all of the criteria listed here are met by each condition.  
  
## See Also  
 [Setting Relationships Between Tables](Setting-Relationships-Between-Tables.md)
