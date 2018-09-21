---
title: "Data Security"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: b996870e-306e-4aec-9806-654334995d7f
caps.latest.revision: 13
---
# [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Data Security
The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] security system allows you to control which objects or tables a user can access within each database. You can specify the type of access that each user has to these objects and tables, whether they are able to read, modify, or enter data.  

 You can specify which records are stored in the tables that each user is allowed to access. This means that permissions can be allocated at both the table level and the record level.  
  
 The security system contains information about the permissions that have been granted to each user who can access a particular database.  
  
 This information includes the roles that the users have been assigned, as well as any permissions that they have been granted to individual users.  
  
 There are four different levels of security:  
  
-   Database  
  
-   Company  
  
-   Object  
  
-   Record  
  
Graphically, these can be represented as the layers, where the central layer is the records in the database. 

## Database-Level Security
The first layer of security when you open [!INCLUDE[prodshort](../developer/includes/prodshort.md)] is database security.  
 
After you start [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and attempt to open the database, your credentials are checked. <!-- If you have not been granted permission to open the database then the database is not listed in the [Available Databases](uiref/-$-S_2342-Available-Databases-$-.md) window.--> For more information about granting a user permission to create or work with a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  
  
<!--For more information about how to open a database, see [How to: Open Databases](How-to--Open-Databases.md).-->

## Company-Level Security
After you have gained access to the database, you can open the company that you want to work with.  

### Opening a Company  
In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you can only open companies in the current database that you have been given permission to access. A database can contain several companies. Each company can use its own tables and can also share tables with other companies.  

<!-- 
Select the company that you want to open, choose **OK**, and the company opens. If there are companies in the database that you have not been given permissions to access, you will not be able to see them in this window.  -->

### Managing User Access to Companies  
Users' access to companies is controlled by persmission sets. When you assign a permission set to a user, you can specify a company to restrict the user’s access for that permission set to that specific company. For more information, see [How to: Define Permissions for Users](How-to--Define-Permissions-for-Users.md).

## Object-Level Security
When you open a company in [!INCLUDE[prodshort](../developer/includes/prodshort.md)], your ability to access information is determined by the security system.  
  
Object-level security is the set of permissions on [!INCLUDE[prodshort](../developer/includes/prodshort.md)] objects that constitute a permission set. Permission sets determine the access that users have and the tasks that users can perform on objects in the database.  
  
### Security System Database Objects  
 You can define permissions for all types of objects in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database.  
  
|Object Type|Description|  
|-----------------|-----------------|  
|Table Data|The actual data that is stored in the tables.|  
|Table|The tables themselves.|  
|Pages|The pages that are used to view and enter data.|  
|Report|The reports that are used to present the data.|  
|Codeunit|The codeunits that are used in the database.|  
|XMLport|The XMLports that are used to import and export data.|  
|MenuSuite|The object that contains the menus that are displayed in the navigation pane.|  
|Query|The object that you use to specify a dataset from the database.|  
|System|The system tables in the database that allow the user to make backups, change license files, and so on.|  
  
The various permission sets that exist in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] determine the actions that you can perform on these objects. For more information about permissions, see [Permissions on Database Objects](../developer/devenv-permissions-on-database-objects.md).

## <a name="RecordLevel"></a> Record-Level Security
Record-level security lets you limit the access that a user has to the data in a table.  
  
You implement record-level security in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] by creating security filters on table data. A security filter describes a set of records in a table that a user has permission to access. You can specify, for example, that a user can only read the records that contain information about a particular customer. This means that the user cannot access the records that contain information about other customers.  
  
### Setting Security Filtering Modes  
 When you create security filters, you limit a user's access to data in a table. Therefore, code that requires access to all data in a table fails and the user receives an error message.  
  
 You can resolve potential conflicts with security filters and specify the desired behavior by setting the security filtering mode on Record variables to determine how the security filters are applied. For more information, see [Security Filter Modes](Security-Filter-Modes.md).  
  
### Performance  
Record-level security filters are handled by SQL Server just like other filters that are applied by the user. They do not adversely affect performance unless the security filtering mode is **Validated**. When the security filtering mode for a record is **Validated**, then [!INCLUDE[prodshort](../developer/includes/prodshort.md)] must validate whether each record is in the filter expression.  
  
  
## See Also  

 [Users and Credential Types](../administration/users-credential-types.md)   
 [Database Logins](Database-Logins.md)    
 [Permissions on Database Objects](Permissions-on-Database-Objects.md)   
 [Security Considerations](Security-Considerations.md)
