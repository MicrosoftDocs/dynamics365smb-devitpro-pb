---
title: "Using Linked Objects"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: fc7527c2-8ede-4b6e-8e0e-e2ac6ad22521
caps.latest.revision: 9
---
# Using Linked Objects
When you are using a linked object, you should take the following into account:  
  
-   The name of the SQL Server object that includes any company prefix and \($\) separator must match exactly with the name of the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table.  
  
-   You must be a member of the db\_owner fixed database role in the current database.  
  
-   The service account of [!INCLUDE[nav_server](includes/nav_server_md.md)] must have permission to access the SQL database table. If accessing objects in other databases or on linked servers, such as a Microsoft Access database or Excel spreadsheet, then the service account must also have permission to access to these sources.  
  
-   As is the case with regular [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] tables, the object must exist in the current database and be owned by a user in the database who is a member of the db\_owner fixed database role. A SQL Server view can be used to access objects outside the current database \(including those residing on separate servers\) or owned by other users. For more information, see [Accessing Objects in Other Databases or on Linked Servers](Accessing-Objects-in-Other-Databases-or-on-Linked-Servers.md).  
  
-   [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] will automatically grant the required SQL Server permissions on the object so that you can access it in the same way that regular [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] tables are accessed. It will then be subject to permissions assigned in the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] security system.  
  
-   The object being linked must have a SQL Server table definition that is compatible with the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table definition.  
  
-   A view that cannot be updated in SQL Server \(for example one containing computed/converted columns or unions\) will also be read-only if it is used as a linked object from [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)]. With SQL Server 2000, you can write Instead-Of triggers to define the logic that allows such a view to be updated. This logic is not part of [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)].  
  
## Rules for Using Linked Objects  
  
|**Object modification**|**Rule**|  
|-----------------------------|--------------|  
|Column type|All columns in the object must be type compatible with those named in the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table definition. It is not necessary to name all the columns in the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table definition. For more information about type compatibility, see [Identifiers, Data Types, and Data Formats](Identifiers--Data-Types--and-Data-Formats.md).|  
|SumIndexField technology|SumIndexFields cannot be defined for any object type.|  
|View or system tables|If the object is a view or system table, a primary key must be defined, and any secondary keys may also be defined if required. These keys will only be used in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)]. They will have no effect on a view, its underlying objects in SQL Server, or on a system table. It is important that the data in the columns named in the primary key is unique. This will not be enforced as a physical constraint by the view or system table in SQL Server. However, [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] will order the data as though a primary key was physically defined. [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] relies on this uniqueness in order to correctly identify and order records.|  
|View objects|If the object is a view, it can have only one column of the SQL Server timestamp type, but it does not need to have any unless BLOB fields are present in the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table definition. A timestamp column must exist in a user table.|  
|User table or view|An IDENTITY column can be used in a user table or a view. [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] will ignore this column when inserting records into the table. This allows the IDENTITY column to be used as intended. Similarly, a computed column in a user table is also ignored. For a view, a column defined on a computed table column cannot be used if insert operations are required.|  
|Temporary table|You cannot link to a SQL Server temporary table.|  
|Multilanguage views|Multilanguage views are not created or maintained for linked objects.|  
  
## Redesigning a Linked Object Table Definition  
 After an object has been linked, [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] treats it like a regular table. However, depending on the object type, SQL Server may prevent certain operations from taking place. For example, a non-updateable view cannot be updated in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)], and a SQL Server error message appears if you attempt to do this. The ability to redesign the object from within [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] is limited; these limitations are as follows:  
  
-   The object cannot be renamed by changing the table definition name or the company name.  
  
-   No fields in the table definition can be renamed.  
  
-   New fields can be added if they exist in the view and existing fields can be deleted. In either case, the definition of the view in SQL Server is not changed.  
  
-   The primary and secondary key definitions can be changed. Also, new keys can be added and existing keys can be deleted.  
  
-   The [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] field data types can be modified provided that the new type remains compatible with the column type in the view.  
  
-   A linked user table can undergo any design changes that are applicable to a regular table that is created from within [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)].  
  
-   If the DataPerCompany property of the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] table definition is changed, it will result in an attempt to link to a new object. This new object will be based on the new company name. The previously linked SQL Server object will no longer be linked by the table definition.  
  
-   The LinkedObject table property can only be changed from Yes to No for a user table.  
  
## See Also  
 [Creating Table Definitions from SQL Server Objects \(Linked Objects\)](Creating-Table-Definitions-from-SQL-Server-Objects--Linked-Objects-.md)
