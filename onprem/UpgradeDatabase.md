---
title: "UpgradeDatabase"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 5ccd436d-5938-4fe5-b35e-4f7a39f215e8
caps.latest.revision: 7
---
# UpgradeDatabase
Upgrades an existing [!INCLUDE[navnow](includes/navnow_md.md)] database.  
  
## Syntax  
  
```  
finsql.exe command=upgradedatabase, servername=<server>, database=<database>[, logfile=<path and filename>,] [username=<user name>,] [password=<password>,] [ntauthentication=<yes|no|0|1>]  
```  
  
#### Parameters  
 *servername*  
  
 The name of the database server and server instance on which you want to run the command and upgrade the database.  
  
> [!TIP]  
>  To view the name of the server on which the current database is stored, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Server** field for the *servername* parameter.  
  
 *database*  
  
 The name of the database that you want to upgrade.  
  
> [!TIP]  
>  To view the name of the current database, on the **File** menu, choose **Database**, and then choose **Information**. Use the value of the **Database Name** field for the *database* parameter.  
  
 *logfile*  
  
 The path and file name for the file that contains error messages that result from the command. If there are no errors, then a log file is not created.  
  
 By default, the file is named naverrorlog.txt and is located in the same location as finsql.exe.  
  
 The navcommandresult.txt file, which contains information about the success or failure of the command, is created in the folder that is specified by the *logfile* parameter.  
  
 When you run finsql.exe with a command, the previous log file and result file are deleted.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not specify to run the **Command Prompt** window as Administrator, then the **Command Prompt** window runs as a standard user. In this case, if you do not specify the *logfile* parameter, then the command fails because the standard user cannot write to the default location of the log file.  
  
 *username*  
  
 The user name to use to authenticate to the database. The user name must exist in the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you do not specify to run the **Command Prompt** window as Administrator, then the **Command Prompt** window runs as a standard user. In this case, if you do not specify the *username* parameter and the current Windows user is an Administrator, then the command is run as the standard user.  
  
 If you specify the *username* parameter, then you must also specify the *password* parameter and the *ntauthentication* parameter must be **no**.  
  
 For more information about database users and permissions, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).  
  
 *password*  
  
 The password to use with the *username* parameter to authenticate to the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.  
  
 *ntauthentication*  
  
 Specifies if you want to use NT authentication. The possible values are **yes**, **no**, **1**, or **0**. If you specify the *username* and *password* parameters, then you must specify **ntauthentication=no** or **ntauthentication=0**.  
  
## Remarks  
 You use the **UpgradeDatabase** command together with the finsql.exe executable when you want to convert a database from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] to the new version. For example, if you are upgrading several databases, you can create scripts that help you repeat the steps. Finsql.exe is the executable file that runs the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]RoleTailored Client\\.  
  
> [!IMPORTANT]  
>  The upgrade is not completed when you have run this command. You must compile all objects, and you must connect to a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Converting a Database](Converting-a-Database.md).  
  
## Example  
 This example upgrades the *NAV Danish Database* database on the *TestComputer01\\NAVDEMO* SQL Server instance.  
  
```  
finsql.exe command=upgradedatabase, servername=TestComputer01\NAVDEMO, database="NAV Danish Database"  
```  
  
## See Also  
 [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md)   
 [Converting a Database](Converting-a-Database.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
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