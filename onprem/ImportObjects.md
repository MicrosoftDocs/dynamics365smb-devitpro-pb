---
title: "ImportObjects"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 0025a5a2-500c-4464-92c4-48dda418e1df
caps.latest.revision: 22
---
# ImportObjects
Imports objects from a file to the specified database.  
  
## Syntax  
  
```  
finsql.exe command=importobjects, file=<importfile>, [servername=<server>,] [database=<database>,] [logfile=<path and filename>,] [importaction=<default|overwrite|skip|0|1|2>,] [username=<username>,] [password=<password>,] [ntauthentication=<yes|no|1|0>,] [synchronizeschemachanges=<yes|no|force>,] [navservername=<server name>,] [navserverinstance=<instance>,] [navservermanagementport=<port>,] [tenant=<tenant ID>]  
```  
  
#### Parameters  
 *file*  
  
 The path and file name from which you import objects. This parameter is required. The file must have a .fob or .txt file name extension.  
  
 *servername*  
  
 The name of the database server on which you want to run the command. The format of this parameter is \<*computername*>\\\<*database server instance*>.  
  
 If you do not specify both the *servername* and the *database* parameter, then the database server and database that are stored in the fin.zup file are used.  
  
> [!NOTE]  
>  When you first specify a database server and database to open, either from a command at a command prompt or from a client, the database server and database are stored in the fin.zup file. By default, the fin.zup file is located at C:\\users\\\<*user name*>\\AppData\\Roaming\\.  
  
 If you do not specify the *servername* parameter but you do specify the *database* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database server name.  
  
> [!TIP]  
>  To view the name of the server on which the current database is stored, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Server** field for the *servername* parameter.  
  
 *database*  
  
 The database in which the objects that you want to compile are stored.  
  
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
  
 When you run finsql.exe with a command, the previous log file is deleted.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not specify to run the Command Prompt window as Administrator, then the Command Prompt window runs as a standard user. In this case, if you do not specify the *logfile* parameter, then the command fails because the standard user cannot write to the default location of the log file.  
  
 *importaction*  
  
 Specifies how to handle conflicts with existing objects when you import from a .fob file. The possible values are:  
  
-   **default** or **0** \(default\) – If there is a conflict, then an error is logged in the log file and no objects from the file are imported.  
  
-   **overwrite** or **1** – If there is a conflict, then overwrite the existing object with the object in the import file.  
  
-   **skip** or **2** - If there is a conflict, then skip the object. The existing object remains unchanged.  
  
> [!WARNING]  
>  If you import from a .txt file and there is a conflict, then the objects in the import file overwrite the existing objects in the database.  
  
> [!NOTE]  
>  After you import an object from a .txt file, you must compile the object before you use it. If you import an object from a .fob file, then the object is compiled automatically after it is imported.  
  
 *username*  
  
 The user name to use to authenticate to the database. The user name must exist in the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on, and you do not specify to run the Command Prompt window as Administrator, then the Command Prompt window runs as a standard user. In this case, if you do not specify the *username* parameter, then even if the current Windows user is an Administrator, the command is run as the standard user.  
  
 If you specify the **username** parameter, then you must also specify the **password** parameter and the **ntauthentication** parameter must be **no** or **0**.  
  
 For more information about database users and permissions, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  
  
 *password*  
  
 The password to use with the **username** parameter to authenticate to the database. If you do not specify a username and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  
  
 *ntauthentication*  
  
 Specifies whether to use NT authentication. The possible values are **yes**, **no**, **1**, or **0**. If you specify the **username** and **password** parameters, then you must specify **ntauthentication=no** or **ntauthentication=0**.  
  
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
 You use the **ImportObjects** command with the finsql.exe from a command prompt. Finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  
  
 To import objects from a .txt file, you must have a developer license. To import objects from a .fob file, you can have either an end-user license or a developer license.  
  
 You can specify parameters in any order.  
  
## Example  
 This example shows how to run a command to import the objects from a .fob file into [!INCLUDE[navnow](includes/navnow_md.md)]. If any of the objects to import already exist in the database, then overwrite them with the objects from the import file.  
  
```  
finsql.exe command=importobjects, file=C:\NewObjects.fob, servername=TestComputer01, database="Demo Database NAV (9-0)", ImportAction=overwrite  
```  
  
## See Also  
 [How to: Import Objects](How-to--Import-Objects.md)   
 [BuildVirtualMetadata](BuildVirtualMetadata.md)   
 [CreateDatabase](CreateDatabase.md)   
 [UpgradeDatabase](UpgradeDatabase.md)   
 [CreateLanguage](CreateLanguage.md)   
 [CompileObjects](CompileObjects.md)   
 [DeleteObjects](DeleteObjects.md)   
 [DesignObject](DesignObject.md)   
 [ExportObjects](ExportObjects.md)   
 [ImportObjects](ImportObjects.md)   
 [ExportLangModule](ExportLangModule.md)   
 [ImportLangModule](ImportLangModule.md)   
 [ExportTranslate](ExportTranslate.md)   
 [ImportTranslate](ImportTranslate.md)   
 [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md)
