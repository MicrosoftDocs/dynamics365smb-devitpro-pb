---
title: Data Security in Business Central
description: Learn about the four different levels of data security in Business Central. Also learn how you control access to data. 
ms.date: 11/19/2025
ms.topic: reference
author: jswymer
---

# Data security in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] security system allows you to control which objects or tables a user can access within each database. You can specify the type of access that each user has to these objects and tables, whether they're able to read, modify, or enter data.  

You can specify which records are stored in the tables that each user is allowed to access. This means that permissions can be allocated at both the table level and the record level.  
  
The security system contains information about the permissions that are granted to each user who can access a particular database.  
  
This information includes the roles that the users are assigned, and any permissions that they're granted to individual users.  
  
There are four different levels of security:  
  
- Database  
- Company  
- Object  
- Record  
  
Graphically, these levels can be represented as the layers, where the central layer is the records in the database.

![Security overview.](../developer/media/security-overview.png "Security overview")

## [Database-level security](#tab/database-level)

The first layer of security when you open [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is database security.  

After you start [!INCLUDE[prod_short](../developer/includes/prod_short.md)] and attempt to open the database, your credentials are checked. Learn more about granting a user permission to create or work with a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database in [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  

### Database logins

Users get a database sign in when they have their own user ID and password in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The user must enter the user ID and password to access the database.  
  
> [!NOTE]  
> Database logins are only valid for connecting to the database from the [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  
  
#### How database logins work
  
Users must also have a sign-in on SQL Server. SQL Server has its own authentication of the user's ID and password. SQL Server checks whether a SQL Server sign-in with this user's ID and password is created.  
  
A SQL Server administrator with a SQL Server tool must first create the sign-in. If a SQL Server sign-in isn't set up, authentication fails and the user receives an error. Learn more in [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  
  
The server grants the user access after authenticating their sign-in. Database security then validates the user's permissions by checking the database user accounts on the server. The user's database user account determines the permissions the user receives for various objects within the database, such as tables. This account also contains information about any extra permissions the user might have to alter the database itself.

## [Company-level security](#tab/company-level)

After you gain access to the database, you can open the company that you want to work with.  

### Opening a company
  
In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], you can only open companies in the current database that you have permission to access. A database can contain several companies. Each company can use its own tables and can also share tables with other companies.  

### Managing user access to companies
  
Permission sets control users' access to companies. When you assign a permission set to a user, you can specify a company to restrict the user's access for that permission set to that specific company. Learn more in [Managing Users and Permissions](/dynamics365/business-central/ui-how-users-permissions) in the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] application help.

## [Object-level security](#tab/object-level)

When you open a company in [!INCLUDE[prod_short](../developer/includes/prod_short.md)], the security system determines your ability to access information.  
  
Object-level security is the set of permissions on [!INCLUDE[prod_short](../developer/includes/prod_short.md)] objects that constitute a permission set. Permission sets determine the access that users have and the tasks that users can perform on objects in the database.  
  
### Security system database objects
  
 You can define permissions for all types of objects in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  
  
|Object Type|Description|  
|-----------------|-----------------|  
|Table Data|The actual data that is stored in the tables.|  
|Table|The tables themselves.|  
|Pages|The pages that are used to view and enter data.|  
|Report|The reports that are used to present the data.|  
|Codeunit|The codeunits that are used in the database.|  
|XMLport|The XMLports that are used to import and export data.|  
|Query|The object that you use to specify a dataset from the database.|  
|System|The system tables in the database that allow the user to make backups, change license files, and so on.|  
  
The various permission sets that exist in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] determine the actions that you can perform on these objects. For more information about permissions, see [Permissions on Database Objects](../developer/devenv-permissions-on-database-objects.md).

### Permissions on database objects

This section provides an overview of permissions and permission sets in [!INCLUDE[prod_short](../developer/includes/prod_short.md)]  
  
#### Permissions

If you're granted permission to read a page, then you can open the page and view the data that it displays. If, however, you don't have write permission, you aren't allowed to enter data into this page.  
  
Sometimes, when you open a page it displays information from several tables. To access this page, you must have permission to view all the data displayed by the page. You might not have permission to read directly from all the tables that the page uses. In this case, you must have indirect permission to read from the tables in question. Indirect permission to a table means that you can't open the table and read it. You can only view the data it contains indirectly through another object, such as a page or report, that you have direct permission to access.  
  
[!INCLUDE[prod_short](../developer/includes/prod_short.md)] has many standard predefined security permission sets. You can use the permission sets as defined or you can change a permission set to suit your particular needs. You can also create your own permission sets and assign them the permissions that you want.  
  
#### Permissions on objects  
  
|Permission|Description|  
|----------------|-----------------|  
|Read|You can read this object.|  
|Insert|You can insert data into this object.|  
|Modify|You can modify data in this object.|  
|Delete|You can delete data from this object.|  
|Execute|You can run this object.|

Learn more in [Permissions on Database Objects](../developer/devenv-permissions-on-database-objects.md).

## [Record-level security](#tab/record-level)

Record-level security lets you limit the access that a user has to the data in a table.  
  
You implement record-level security in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] by creating security filters on table data. A security filter describes a set of records in a table that a user has permission to access. You can specify, for example, that a user can only read the records that contain information about a particular customer. In this case, the user can't access the records that contain information about other customers. Learn more in [Security Filter Modes](Security-Filters.md).
  
### Performance
  
SQL Server handles record-level security filters just like other filters that the user applies. The filters don't adversely affect performance unless the security filtering mode is **Validated**. When the security filtering mode for a record is **Validated**, then [!INCLUDE[prod_short](../developer/includes/prod_short.md)] must validate whether each record is in the filter expression.

### Built-in data audit fields

Every [!INCLUDE[prod_short](../developer/includes/prod_short.md)] table has built-in audit fields: Created On/Created By and Last Modified On/Modified By. These fields capture who created a record and when, and who last modified it. These fields provide an audit trail for changes to any data.

Learn more in [Data audit fields](../developer/devenv-table-system-fields.md#audit).

---

## Related information  

[Customer-managed encryption key](security-online.md#customer-managed-encryption-key)  
[Users and credential types](../administration/users-credential-types.md)  
[Security considerations](Security-Considerations.md)  
