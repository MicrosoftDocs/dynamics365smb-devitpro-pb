---
title: Tables Overview 
description: Tables are the objects in which you store and manipulate data, and you create pages and reports in order to access and view the data in the tables.
ms.custom: na
ms.date: 10/20/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8d5a55e2-1089-4eac-ace1-6a3cdf07b218
caps.latest.revision: 7
manager: edupont
---
# Tables in Microsoft Dynamics NAV
Tables are the fundamental objects in any database. They are the objects in which you store and manipulate data. This is true no matter what kind of data you need to manage. When you create a new database, you begin by building the tables. Later, you create pages and reports in order to access and view the data in the tables.  
  
 The following sections provide an overview of how to locate Help about designing tables in [!INCLUDE[navnow](includes/navnow_md.md)].  
  
## Creating Tables  
 This section explains how to design tables to store your data and set up table descriptions that can ease sophisticated data manipulation.  
  
|To|See|  
|--------|---------|  
|Learn about the [!INCLUDE[navnow](includes/navnow_md.md)] approach to tables in database design.|[Overview of Tables](Overview-of-Tables.md)|  
|Design and develop a basic table in [!INCLUDE[navnow](includes/navnow_md.md)].|[How to: Create a Table](How-to--Create-a-Table.md)|  
|Decide which field data type to apply to your data.|[Field Data Types](Field-Data-Types.md) and [Data Format Considerations](Data-Format-Considerations.md)|  
|Apply table and field properties and create effective table descriptions.|[How to: View or Modify Properties on a Table or Field](How-to--View-or-Modify-Properties-on-a-Table-or-Field.md)|  
|Connect table data through primary and secondary keys.|[Table Keys](Table-Keys.md)|  
|Learn about [!INCLUDE[navnow](includes/navnow_md.md)] features designed to speed up data manipulation and computation.|[Accessing Microsoft Dynamics NAV Tables with External Tools](Accessing-Microsoft-Dynamics-NAV-Tables-with-External-Tools.md)|  
  
## Using Triggers in Database Design  
 [!INCLUDE[navnow](includes/navnow_md.md)] supports setting up actions to take place in response to specific events. These are known as triggers. The following topics help to explain how [!INCLUDE[navnow](includes/navnow_md.md)] implements this feature of database design.  
  
|To|See|  
|--------|---------|  
|Learn about the set of triggers that [!INCLUDE[navnow](includes/navnow_md.md)] supports for tables and fields.|[Table and Field Triggers](Table-and-Field-Triggers.md)|  
|Create a table trigger.|[How to: Define or Modify Table or Field Triggers](How-to--Define-or-Modify-Table-or-Field-Triggers.md)|  
|See reference information about specific triggers.|[Triggers](Triggers.md)|  
  
## Designing Relationships Between Tables  
 In [!INCLUDE[navnow](includes/navnow_md.md)], the primary way to establish a connection between tables is to use the **TableRelation** property. The following topics go into detail about how this works.  
  
|To|See|  
|--------|---------|  
|Get a brief introduction to relational database design in [!INCLUDE[navnow](includes/navnow_md.md)].|[Setting Relationships Between Tables](Setting-Relationships-Between-Tables.md)|  
|Understand the extra steps SQL Server requires to use the **TableRelation** property.|[Maintaining Table Relationships on SQL Server](Maintaining-Table-Relationships-on-SQL-Server.md)|  
  
## Understanding SQL Server and Linked Objects  
 [!INCLUDE[navnow](includes/navnow_md.md)] supports special handling for SQL Server Object tables. You can find help on linked objects in the following topics.  
  
|To|See|  
|--------|---------|  
|Learn about the **LinkedObject** table property.|[Creating Table Definitions from SQL Server Objects (Linked Objects)](Creating-Table-Definitions-from-SQL-Server-Objects--Linked-Objects-.md)|  
|Work with other data sources, including Microsoft Excel and Oracle databases.|[Accessing Objects in Other Databases or on Linked Servers](Accessing-Objects-in-Other-Databases-or-on-Linked-Servers.md)|  
  
## See Also  
 [Special Tables](Special-Tables.md)   
 [Development](Development.md)