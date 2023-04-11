---
title: "CompileObjects"
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: bf71a267-45d8-43cf-b881-f0b3976e81e5
caps.latest.revision: 28
---
# CompileObjects
Compiles objects from the specified database.  

## Syntax  

```  
finsql.exe command=compileobjects, [servername=<server>,] [database=<database>,] [filter=<filter>,] [logfile=<path and filename>,] [username=<user name>,] [password=<password>,] [ntauthentication=<yes|no|0|1>,] [synchronizeschemachanges=<yes|no|force>,] [navservername=<server name>,] [navserverinstance=<instance>,] [navservermanagementport=<port>,] [tenant=<tenant ID>]  
```  

#### Parameters  
 *servername*  

 The name of the database server on which you want to run the command.  

 If you do not specify both the *servername* parameter and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  

> [!NOTE]  
>  When you first specify a database server and database to open, either from a command at a command prompt or from a client, the database server and database are stored in the fin.zup file. By default, the fin.zup file is located at C:\\users\\\<*user name*>\\AppData\\Roaming\\.  

 If you do not specify the *servername* parameter but you do specify the *database* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database server name.  

> [!TIP]  
>  To view the name of the server on which the current database is stored, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Server** field for the *servername* parameter.  

 *database*  

 The database in which the objects that you want to compile are stored.  

 If you do not specify both the *servername* parameter and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  

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
>  If User Access Control \(UAC\) is turned on and you do not specify to run the Command Prompt window as Administrator, then the Command Prompt window runs as a standard user. In this case, if you do not specify the *logfile* parameter, then the command fails because the standard user cannot write to the default location of the log file.  

 *filter*  

 A filter on the **Object** table. Use the *filter* parameter to specify which objects to compile. Use a semicolon to separate multiple filters. The only operator that you can use in the filter is '='. The following table shows the fields in the **Object** table on which you can filter.  

|Object table field|Values|Example|  
|------------------------|------------|-------------|  
|Type|Table, Codeunit, Page, Report, XMLport, Query, MenuSuite|Type=Table&#124;Page|  
|ID|Integer or range of integers|ID=50000..50500|  
|Name|Any valid object name|"Name=Cost Entry"|  
|Modified|yes, no, 1, 0|Modified=yes|  
|Compiled|yes, no, 1, 0|Compiled=0|  
|Date|Date, in the numeric format determined by your regional settings|Date=12/1/2012|  
|Time|Time, in the numeric format determined by your regional settings|Time=12:00:00|  
|Version List|Any valid version|Version List=NAVW19.00|  
|Caption|Any valid caption|Caption=Company Information|  
|Locked|Yes, no, 1, 0|Locked=1|  
|Locked By|Domain\\username|"Locked By=CRONUS\\viktor"|  

 If you do not specify a filter, then all objects in the **Object** table are included.  

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

 *synchronizeschemachanges*  

 Specifies how to synchronize table definition changes in the business \(tenant\) database in SQL Server. The following table describes the available options.  

|[!INCLUDE[bp_tableoption](includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|**yes**|Before applying changes to the business data table, [!INCLUDE[nav_server](includes/nav_server_md.md)] validates the changed table definition to check for destructive changes to the table. This includes changes that require that data is deleted in the fields of the business data table which are affected by the changes before the changes can be applied.<br /><br /> -   If there are no destructive changes to the table, then the schema changes are applied to the business data table immediately.<br />-   If there are destructive changes, [!INCLUDE[nav_server](includes/nav_server_md.md)] checks that there are table synchronization instructions in an upgrade codeunit. If there are instructions, then the schema changes are applied to the business database table according to the instructions. If there are no instructions, then an error message appears. The table definition changes are not saved and the schema changes are not applied.|  
|**no**|Table definition changes are saved and compiled in the application but the changes are not validated or applied to the business data table. You synchronize the table schema later by doing one of the following:<br /><br /> -   Save or compile the table from Object Designer in [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] and choose either the **Now - with validation** or **Force** synchronization option.<br />-   Use the **Sync. Schema for All Tables** option on the **Tools** menu.<br />-   Run the Sync-NAVTenant cmdlet from the [!INCLUDE[nav_shell](includes/nav_shell_md.md)].|  
|force|Table definition changes are applied to the business data table schema without validation. For destructive changes, data in columns of the business data table that are affected by changes will be deleted.<br /><br /> This option ignores any table synchronization instructions for the table in upgrade codeunits.|  

 For more information about table schema synchronization, see [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md).  

 *navservername*  

 Specifies the name of the server that hosts the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, such as **MyServer**.  

 *navserverinstance*  

 Specifies the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is being used, such as [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].  

 *navservermanagementport*  

 Specifies the port on the [!INCLUDE[nav_server](includes/nav_server_md.md)] server that the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets access, such as **7045**.  

 *tenant*  

 Specifies the ID of the tenant that is accessed when you run objects from the development environment. If your solution is not set up to deploy in a multitenant deployment architecture, leave the parameter empty.  

## Remarks  
 You use the **CompileObjects** command together with the finsql.exe executable. Finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  

 To compile objects, you must have a developer license.  

## Example  
 This example shows how to run a command to compile all tables and codeunits that have an ID that is greater than or equal to 500 and less than or equal to 1000.  

```  
finsql.exe command=compileobjects, servername=TestComputer01\NAVDEMO, database="Demo Database NAV (10-0)", filter="Type=Table|Codeunit;ID=500..1000"  
```  

## See Also  
 [Compiling Objects](Compiling-Objects.md)   
 [BuildVirtualMetadata](BuildVirtualMetadata.md)   
 [CreateDatabase](CreateDatabase.md)   
 [UpgradeDatabase](UpgradeDatabase.md)   
 [CreateLanguage](CreateLanguage.md)   
 [CreateLanguage](CreateLanguage.md)   
 [DesignObject](DesignObject.md)   
 [ExportObjects](ExportObjects.md)   
 [ImportObjects](ImportObjects.md)   
 [ExportLangModule](ExportLangModule.md)   
 [ImportLangModule](ImportLangModule.md)   
 [ExportTranslate](ExportTranslate.md)   
 [ImportTranslate](ImportTranslate.md)   
 [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md)
