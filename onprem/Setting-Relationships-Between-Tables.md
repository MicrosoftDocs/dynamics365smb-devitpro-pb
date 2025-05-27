---
title: "Setting Relationships Between Tables"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 547b41cd-e0ca-4288-94c0-4143928b2c30
caps.latest.revision: 11
---
# Setting Relationships Between Tables
It is common to distinguish among the following types of relationships between tables in relational database design:  
  
-   One-to-many relationships  
  
-   Many-to-many relationships  
  
-   One-to-one relationships  
  
 The one-to-many relationship is the most common. If your database design model indicates that you need to set up a many-to-many relationship, then your design is probably inefficient. You can typically break down a many-to-many relationship into two one-to-many relationships. A one-to-one relationship is usually not optimal and can often be avoided by combining the two tables.  
  
## Using Relationships  
 If your database contains tables with related data, then you can define a relationship between them. You relate tables by specifying one or more fields that contain the same value in related records. These matching fields often have the same name in each table. You can use relationships to:  
  
-   Validate data entries.  
  
-   Perform lookup functions in other tables.  
  
-   Propagate changes automatically from one table to other tables.  
  
> [!NOTE]  
>  For performance reasons, in pages that use the Field virtual table, the **RelationFieldNo** field is blank for fields with complex table relations. To parse all fields that have any table relationships in the **Field** virtual table is time consuming. Accordingly, data such as complex table relations is not available in windows such as the [!INCLUDE[rim](includes/rim_md.md)] configuration worksheet. For more information, see [Field Virtual Table](Field-Virtual-Table.md).  
  
## Table Relationships and the TableRelation Property  
 Table relationships are defined in [!INCLUDE[navnow](includes/navnow_md.md)] with the **TableRelation** property. This property allows you to define both simple and advanced table relations.  
  
> [!NOTE]  
>  You can define a relationship only to a field that is a member of the primary key group.  
  
 Advanced table relations are typically prefixed with a conditional statement and include filters. The following syntax is for table relations.  
  
```  
<TableRelation> ::=  
   <TableNo>[.<FieldNo>] [WHERE ( <TableFilters> )] |  
   IF ( <Conditions> ) <TableNo>[.<FieldNo>]  
   [WHERE( <TableFilters> )] ELSE <TableRelation>  
<Conditions> ::=  
   <TableFilters>  
<TableFilters>::=  
   [<TableFilter> {,<TableFilter>}]  
<TableFilter>::=  
   <DstFieldNo>=CONST(<FieldConst>) |  
   <DstFieldNo>=FILTER(<Filter>)  
```  
  
 The following table describes each of the symbols.  
  
|Symbol|Description|  
|------------|-----------------|  
|TableNo|Specifies the related table.|  
|FieldNo|Specifies a field in the related table.|  
|Conditions|Table relations can be conditional.|  
|TableFilters|A list of table filters.|  
|TableFilter|A constant expression or a filter expression.|  
|DstFieldNo|Specifies the destination field number.|  
|Filter|A filter expression, such as 10&#124;20..30.|  
  
## Examples of Table Relationships  
 For example, you have an **Orders** table that stores orders and a **Salesperson** table that stores the names of all salespeople in your company. In the **Orders** table, you can include a **Salesperson** field that identifies the salesperson. By setting up a relationship between these two tables, you can check whether the **Salesperson** field in the **Orders** table contains a valid code.  
  
 ![](media/NAV_ADG_7_Diag_7.png "NAV\_ADG\_7\_Diag\_7")  
  
 For example, you have a **Vendors** table with all your vendors and a **Currency Code** table. You can create a relationship between a **Currency Code** field in the **Vendors** table and the **Currency Code** table. This will allow users to look up information about valid currency codes.  
  
 Furthermore, if you change one of the currency codes in the **Currency Code** table, then the change is automatically propagated to all tables that refer to this code.  
  
## See Also  
 [How to: Create a Table Relationship](How-to--Create-a-Table-Relationship.md)   
 [Maintaining Table Relationships on SQL Server](Maintaining-Table-Relationships-on-SQL-Server.md)   
 [How to: Synchronize Table and SQL Server Relationships](How-to--Synchronize-Table-and-SQL-Server-Relationships.md)   
 [Overview of Tables](Overview-of-Tables.md)