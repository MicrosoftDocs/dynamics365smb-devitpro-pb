---
title: "Login Stored Procedure"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e51414a7-0414-43f7-9069-00f2ce3f459f
caps.latest.revision: 12
---
# Login Stored Procedure
A login stored procedure is a stored procedure that you can use to perform predefined functions after a user logs on to the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. A typical function would be to generate a message that informs the user that the database is currently in single-user mode so that an administrator can perform database maintenance tasks and is therefore inaccessible.  

 The login stored procedure is run immediately after the user has logged on to SQL Server and opened a database, and before [!INCLUDE[navnow](includes/navnow_md.md)] performs any tasks including executing C/AL triggers.  

> [!NOTE]  
>  In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance does not call login stored procedures. The [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] does call login stored procedures.  

## Creating the Stored Procedure  
 The stored procedure is created in the database and has a predefined name and a list of parameters.  

 The stored procedure is called `[sp_$ndo$loginproc]` and has the following characteristics:  

-   It takes two `VARCHAR` parameters: the name of the application and the [!INCLUDE[navnow](includes/navnow_md.md)] version number. These parameters must be declared as part of the stored procedure but do not have to be used.  

-   It can perform transactions. [!INCLUDE[navnow](includes/navnow_md.md)] uses a `COMMIT` to flush any outstanding transactions after the stored procedure has finished executing.  

-   The `RAISERROR` statement can be used to display an error message in [!INCLUDE[navnow](includes/navnow_md.md)] and prevent the user from accessing the database.  

-   The `PRINT` statement can be used to display a warning in [!INCLUDE[navnow](includes/navnow_md.md)] and let the user access the database.  

-   If the stored procedure returns a value, it is ignored.  

-   If the stored procedure does not exist, no action is taken by [!INCLUDE[navnow](includes/navnow_md.md)] and the login process continues.  

### Example 1  
 The following code example displays a warning message in [!INCLUDE[navnow](includes/navnow_md.md)] and permits the login.  

```  
IF EXISTS (SELECT name FROM sysobjects  
WHERE name = 'sp_$ndo$loginproc' AND type = 'P')  
DROP PROCEDURE [sp_$ndo$loginproc]  
GO  
CREATE PROCEDURE [sp_$ndo$loginproc]  
@appname VARCHAR(64) = NULL,  
@appversion VARCHAR(16) = NULL  
AS  
BEGIN  
PRINT 'The system will be unavailable on April 1, 2013.'  
END  
GO  
GRANT EXECUTE ON [sp_$ndo$loginproc] TO public  
GO  
```  

### Example 2  
 The following code example displays an error message in [!INCLUDE[navnow](includes/navnow_md.md)] and prevents the login.  

```  
IF EXISTS (SELECT name FROM sysobjects  
WHERE name = 'sp_$ndo$loginproc' AND type = 'P')  
DROP PROCEDURE [sp_$ndo$loginproc]  
GO  
CREATE PROCEDURE [sp_$ndo$loginproc]  
@appname VARCHAR(64) = NULL,  
@appversion VARCHAR(16) = NULL  
AS  
BEGIN  
IF SUSER_SNAME() IN ('ACCOUNTS\jim', 'SALES\bill')  
RAISERROR ('Contact the system administrator.', 11, 1)  
END  
GO  
GRANT EXECUTE ON [sp_$ndo$loginproc] TO public  
GO  
```  

## See Also  
 [Table Keys and Performance](Table-Keys-and-Performance.md)   
 [Bulk Inserts](Bulk-Inserts.md)   
 [C/AL Database Functions and Performance on SQL Server](C-AL-Database-Functions-and-Performance-on-SQL-Server.md)
