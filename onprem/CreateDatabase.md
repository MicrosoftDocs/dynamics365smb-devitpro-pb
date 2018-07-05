---
title: "CreateDatabase"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 13ff1577-9ed8-46a5-b96d-ee4123d25c9c
caps.latest.revision: 5
---
# CreateDatabase
Creates a new database for [!INCLUDE[navnow](includes/navnow_md.md)] on an SQL server.  
  
## Syntax  
  
```  
finsql.exe command=createdatabase, [servername=<server>,] [database=<database>,] [collation=<collation>,] [logfile=<path and filename>,] [username=<user name>,] [password=<password>,] [ntauthentication=<yes|no|0|1>]  
```  
  
#### Parameters  
 *servername*  
  
 The name of the database server on which you want to run the command and create the database.  
  
> [!TIP]  
>  To view the name of the server on which the current database is stored, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Server** field for the *servername* parameter.  
  
 *database*  
  
 The name of the new database that you want to create.  
  
> [!TIP]  
>  To view the name of the current database, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Name** field for the *database* parameter.  
  
 *collation*  
  
 The collation to use when you create a new database. The value must be one of the following:  
  
-   A full language culture name. For example, da-DK for Danish or hu-HU for Hungarian. ·  
  
-   A SQL Server collation name without case or accent. For example, Latin1\_General\_100. ·  
  
-   A SQL Server collation name with case and accent. For example, Danish\_Greenlandic\_100\_CS\_AI.  
  
 *logfile*  
  
 The path and file name for the file that contains error messages that result from the command. If there are no errors, then a log file is not created.  
  
 By default, the file is named naverrorlog.txt and is located in the same location as finsql.exe.  
  
 The navcommandresult.txt file, which contains information about the success or failure of the command, is created in the folder that is specified by the *logfile* parameter.  
  
 When you run finsql.exe with a command, the previous log file and result file are deleted.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not specify to run the Command Prompt window as Administrator, then the Command Prompt window runs as a standard user. In this case, if you do not specify the *logfile* parameter, then the command fails because the standard user cannot write to the default location of the log file.  
  
 *username*  
  
 The user name to use to authenticate to the database. The user name must exist in the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not specify to run the Command Prompt window as Administrator, then the Command Prompt window runs as a standard user. In this case, if you do not specify the *username* parameter and the current Windows user is an Administrator, then the command is run as the standard user.  
  
 If you specify the *username* parameter, then you must also specify the *password* parameter and the *ntauthentication* parameter must be **no**.  
  
 For more information about database users and permissions, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  
  
 *password*  
  
 The password to use with the *username* parameter to authenticate to the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  
  
 *ntauthentication*  
  
 Specifies if you want to use NT authentication. The possible values are **yes**, **no**, **1**, or **0**. If you specify the *username* and *password* parameters, then you must specify **ntauthentication=no** or **ntauthentication=0**.  
  
## Remarks  
 You use the **CreateDatabase** command together with the finsql.exe executable. Finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  
  
## Example  
 This example creates a database on a SQL server that is named TestComputer01\\NAVDEMO. The new database is given the name NAV Danish Database and uses the collation da-DK.  
  
```  
finsql.exe command=createdatabase, servername=TestComputer01\NAVDEMO, database="NAV Danish Database", collation=da-dk  
```  
  
## See Also  
 [BuildVirtualMetadata](BuildVirtualMetadata.md)   
 [UpgradeDatabase](UpgradeDatabase.md)   
 [CreateLanguage](CreateLanguage.md)   
 [Compiling Objects](Compiling-Objects.md)   
 [CreateLanguage](CreateLanguage.md)   
 [DesignObject](DesignObject.md)   
 [ExportObjects](ExportObjects.md)   
 [ImportObjects](ImportObjects.md)   
 [ExportLangModule](ExportLangModule.md)   
 [ImportLangModule](ImportLangModule.md)   
 [ExportTranslate](ExportTranslate.md)   
 [ImportTranslate](ImportTranslate.md)   
 [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md)