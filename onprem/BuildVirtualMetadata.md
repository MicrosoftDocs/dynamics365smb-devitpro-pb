---
title: "BuildVirtualMetadata"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bbd6a403-863d-44cb-998c-895b4a860ece
caps.latest.revision: 8
---
# BuildVirtualMetadata
Regenerates C\# and metadata information in [!INCLUDE[navnow](includes/navnow_md.md)] virtual tables for a specified language.  

## Syntax  

```  
finsql.exe command=buildvirtualmetadata, langid=<langid>, [servername=<server>,] [database=<database>,] [logfile=<path and filename>,] [username=<user name>,] [password=<password>,] [ntauthentication=<yes|no|0|1>]  
```  

#### Parameters  
 *langid*  

 Specifies the standard Windows three-letter ID of the language for which you want to build the metadata, such as *ENU* or *DAN*.  

 *servername*  

 The name of the database server that hosts the [!INCLUDE[navnow](includes/navnow_md.md)] database and objects that you want to modify. The format of this parameter is \<*computername*>\\\<*database server instance*>.  

 If you do not specify both the *servername* parameter and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  

> [!NOTE]  
>  When you first specify a database server and database to open, either from a command at a command prompt or from a client, the database server and database are stored in the fin.zup file. By default, the fin.zup file is located at C:\\users\\\<*user name*>\\AppData\\Roaming\\.  

 If you do not specify the *servername* parameter but you do specify the *database* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database server name.  

> [!TIP]  
>  To view the name of the server on which the current database is stored, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Server** field for the *servername* parameter.  

 *database*  

 The name of the [!INCLUDE[navnow](includes/navnow_md.md)] database that contains the objects that you want to modify.  

> [!TIP]  
>  To view the name of the current database, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Name** field for the *database* parameter.  

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

## Example  
 This example builds metadata for virtual tables in the *Demo Database* database.  

```  
finsql.exe command=buildvirtualmetadata, servername=TestComputer01\NAVDEMO, database="Demo Database"  
```  

## See Also  
 [CreateDatabase](CreateDatabase.md)   
 [UpgradeDatabase](UpgradeDatabase.md)   
 [Compiling Objects](Compiling-Objects.md)   
 [DeleteObjects](DeleteObjects.md)   
 [DesignObject](DesignObject.md)   
 [ExportObjects](ExportObjects.md)   
 [ImportObjects](ImportObjects.md)   
 [ExportLangModule](ExportLangModule.md)   
 [ImportLangModule](ImportLangModule.md)   
 [ExportTranslate](ExportTranslate.md)   
 [ImportTranslate](ImportTranslate.md)   
 [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md)
