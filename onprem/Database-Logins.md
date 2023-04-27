---
title: "Database Logins"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 449018fc-6bcf-4726-ad1a-b521d0cf8d55
caps.latest.revision: 12
---
# Database Logins
Users are given a database login when they have their own user ID and password in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)]. The user must enter the user ID and password to access the database.  
  
> [!NOTE]  
>  Database logins are only valid for connecting to the database from the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
## How Database Logins Work  
 Users must also have a login on SQL Server. SQL Server has its own authentication of the user’s ID and password. SQL Server does this by checking whether a SQL Server login with this user’s ID and password has been created.  
  
 This login must first be created by a SQL Server administrator, with a SQL Server tool. If a SQL Server login has not been set up, authentication fails and the user receives an error. For more information, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  
  
 The user is granted access to the server after their login has been authenticated. Database security then validates the user’s permissions by checking the database user accounts on the server. The permissions that the user has been granted to the various objects within the database, such as tables, are determined by the information contained in the user’s database user account. This account also contains information about any additional permissions that the user may have been granted to alter the database itself.  
  
## See Also  
 [Security and Protection](Security-and-Protection.md)   
 [Users and Credential Types](Users-and-Credential-Types.md)   
 [Company-Level Security](Company-Level-Security.md)
