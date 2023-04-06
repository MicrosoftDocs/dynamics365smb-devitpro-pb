---
title: "Accessing Objects in Other Databases or on Linked Servers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3f9989fc-78ed-4f39-8251-caf6c672f01b
caps.latest.revision: 10
---
# Accessing Objects in Other Databases or on Linked Servers
You can access objects outside the current database or server from [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] by linking to an appropriately defined view in the current database. You can create a view definition outside of [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] that accesses data on SQL Server linked servers, which can access heterogeneous data sources. This could, for example, involve performing a join of an Oracle table, a Microsoft Office Access table, or a Microsoft Office Excel spreadsheet.  
  
 To access objects in other databases or on linked servers you must comply with the following rules:  
  
-   You must set the **LinkedInTransaction** table property to **No** in order to use a view referring to objects outside of the current database. The ability to modify data in these objects is dependent on the data providers that the objects refer to.  
  
-   You must be a member of the db\_owner fixed database permission set in the current database to access objects in other databases or on linked servers.  
  
-   The service account of [!INCLUDE[nav_server](includes/nav_server_md.md)] must have permission to access the SQL database table. If accessing objects in other databases or on linked servers, such as a Microsoft Access database or Excel spreadsheet, then the service account must also have permission to access to these sources.  
  
-   All security permissions for objects in another database or on linked servers must be granted outside [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] to the appropriate SQL Server logins.  
  
-   If a linked object refers to a view that accesses objects that are stored in another database on the same server, this view must be treated as though it were accessing a linked server.  
  
## See Also  
 [Creating Table Definitions from SQL Server Objects \(Linked Objects\)](Creating-Table-Definitions-from-SQL-Server-Objects--Linked-Objects-.md)
