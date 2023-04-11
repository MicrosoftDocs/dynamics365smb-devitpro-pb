---
title: "ExportObjects"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 3aa7629a-ced2-461d-8322-59347ec5d4f4
caps.latest.revision: 19
---
# ExportObjects
Exports objects from the specified database.  

## Syntax  

```  
finsql.exe command=exportobjects, file=<exportfile>, [servername=<server>,] [database=<database>,] [logfile=<path and filename>,] [filter=<filter>,] [username=<username>,] [password=<password>,] [ntauthentication=<yes|no|1|0>]  
```  

#### Parameters  
 *file*  

 The path and file name to which you export objects. This parameter is required. You can export objects to one of the following file types:  

-   .txt  

-   .fob  

 You specify the file type by the file name extension in the *file* parameter.  

 *servername*  

 The name of the database server on which you want to run the command. The format of this parameter is \<*computername*>\\\<*database server instance*>.  

 If you do not specify both the *servername* and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  

> [!NOTE]  
>  When you first specify a database server and database to open, either from a command at a command prompt or from a client, the database server and database are stored in the fin.zup file. By default, the fin.zup file is located at C:\\users\\\<*user name*>\\AppData\\Roaming\\.  

 If you do not specify the *servername* parameter but you do specify the *database* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database server name.  

> [!TIP]  
>  To view the name of the server on which the current database is stored, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Server** field for the *servername* parameter.  

 *database*  

 The database in which the objects that you want to export are stored.  

 If you do not specify both the *servername* and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  

> [!NOTE]  
>  When you first specify a database server and database to open, either from a command at a command prompt or from a client, the database server and database are stored in the fin.zup file. By default, the fin.zup file is located at C:\\users\\\<*user name*>\\AppData\\Roaming\\.  

 If you do not specify the *database* parameter but you do specify the *servername* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database name.  

> [!TIP]  
>  To view the name of the current database, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Name** field for the *database* parameter.  

 *logfile*  

 The path and file name for the file that contains error messages that result from the command. If there are no errors, then a log file is not created.  

 By default, the file is named naverrorlog.txt and is located in the same location as finsql.exe.  

 The navcommandresult.txt file, which contains information about the success or failure of the command, is created in the folder that is specified by the *logfile* parameter.  

 When you run finsql.exe with a command, the previous log file and result file are deleted.  

> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not specify to run the command prompt window as Administrator, then the command prompt window runs as a standard user. In this case, if you do not specify the *logfile* parameter, then the command fails because the standard user cannot write to the default location of the log file.  

 *filter*  

 A filter on the **Object** table. Use the *filter* parameter to specify which objects to compile. Use a semicolon to separate multiple filters. The only operator that you can use in the filter is '='. The following table shows the fields in the **Object** table on which you can filter.  

|Object table field|Values|Example|  
|------------------------|------------|-------------|  
|Type|Table, Codeunit, Page, Report, XMLport, Query|Type=Table&#124;Page|  
|ID|Integer or range of integers|ID=50000..50500|  
|Name|Any valid object name|"Name=Cost Entry"|  
|Modified|yes, no, 1, 0|Modified=yes|  
|Compiled|yes, no, 1, 0|Compiled=0|  
|Date|Date, in the numeric format determined by your regional settings|"Date=12/1/2016"|  
|Time|Time, in the numeric format determined by your regional settings|"Time=12:00:00"|  
|Version List|Any valid version|"Version List=NAVW17.00"|  
|Caption|Any valid caption|"Caption=Company Information"|  
|Locked|Yes, no, 1, 0|Locked=1|  
|Locked By|Domain\\username|"Locked By=CRONUS\\viktor"|  

 If you do not specify a filter, then all objects in the **Object** table are included.  

 *username*  

 The user name to use to authenticate to the database. The user name must exist in the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  

> [!NOTE]  
>  If User Access Control \(UAC\) is turned on, and you do not specify to run the command prompt window as Administrator, then the command prompt window runs as a standard user. In this case, if you do not specify the *username* parameter, then even if the current Windows user is an Administrator, the command is run as the standard user.  

 If you specify the *username* parameter, then you must also specify the *password* parameter and the *ntauthentication* parameter must be **no**.  

 For more information about database users and permissions, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  

 *password*  

 The password to use with the *username* parameter to authenticate to the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  

 *ntauthentication*  

 Specifies whether to use NT authentication. The possible values are **yes**, **no**, **1**, or **0**. If you specify the *username* and *password* parameters, then you must specify **ntauthentication=no** or **ntauthentication=0**.  

## Remarks  
 You use the **ExportObjects** command with the finsql.exe from a command prompt. Finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  

 To export objects to a .txt file, you must have a developer license. To export objects to a .fob file, you can have either an end-user license or a developer license.  

 You can specify parameters in any order.  

## Example  
 This example shows how to run a command to export all queries in a given ID range, using the specified user name and password.  

```  
finsql.exe command=exportobjects, file=C:\QueryExport.txt, servername=TestComputer01\NAVDEMO, database="Demo Database NAV (10-0)", filter="Type=Query;ID=50001..50010", username=dbadmin, password=P@ssword, ntauthentication=no, logfile=C:\QueryExportLog.txt  
```  

## See Also  
 [BuildVirtualMetadata](BuildVirtualMetadata.md)   
 [CreateDatabase](CreateDatabase.md)   
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
 [How to: Export Objects](How-to--Export-Objects.md)
