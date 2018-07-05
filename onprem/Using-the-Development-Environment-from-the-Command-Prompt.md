---
title: "Using the Development Environment from the Command Prompt"
author: edupont04
ms.custom: na
ms.date: 12/01/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cab838ef-0247-4d36-ac42-5c2fd5d7ebbe
ms.author: edupont
---
# Using the Development Environment from the Command Prompt
You can start the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] by running finsql.exe at the command prompt. You can also use the finsql.exe command to perform the following development tasks without using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]:  

-   Create databases  

-   Upgrade databases  

-   Compile objects  

-   Delete objects  

-   Export objects  

-   Import objects  

-   Export language modules  

-   Import language modules  

-   Export text strings for translation  

-   Import translated text strings  

-   Build metadata for application objects.  

-   Set the object cache.  

-   Set the temporary file location.  

-   Enable Unicode for the development environment  

-   Set the path and file name of the ZUP file for storing setup parameters.  

-   Get the [!INCLUDE[navnow](includes/navnow_md.md)] build version.  

 By default, finsql.exe is located at [!INCLUDE[navnow_x86install](includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  

## Finsql.exe Command Syntax  
 The finsql.exe has the following syntax.  

```  
Finsql.exe [command=<command> | designobject=<object type> <object ID>,] [servername=<server>,] [database=<database>,] [collation=<collation>,] [file=<file>,] [filter=<filter>], [importaction=<default|overwrite|skip|0|1|2>,] [langid=<ID>,] [logfile=<logfile>,] [navservername=<name>,] [navserverinstance=<instance>,] [navservermanagementport=<port>,] [ntauthentication=<yes|no|0|1>,] [objectcache=<cache>,] [password=<password>,] [temppath=<path>,] [tenant=<tenant ID>,] [username=<user name>,] [synchronizeschemachanges=<yes|no|force>, ] [useoldeditor=<yes|no>,] [showalldesignercolumns=<yes|no|0|1>]  
```  

### Syntax Key  
 The following table describes the notation that is used to indicate syntax.  

|Notation|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|Text without brackets|Parameters that you must type as shown.|  
|\<>|A placeholder for values that you must supply. Do not include the brackets in the value.|  
|\[ \]|Optional parameters. Do not include the brackets.|  
|&#124;|A set of values from which to choose. Use one of the options and do not include `&#124;` in the value.|  

### Information about building commands  

-   The parameters that you use will depend on the command that you are running as determined by the *command* and *designobjects* parameters.  

-   You can place parameters in any order after finsql.exe.  

## Finsql.exe Parameters  
 The following table describes the parameters that you can use with finsql.exe.  

|Parameter|Description|Related command|  
|---------------|-----------------|---------------------|  
|collation|The collation to use when you create a new database. The value must be one of the following:<br /><br /> \*  A full language culture name. For example, da-DK for Danish or hu-HU for Hungarian.<br /><br /> \*  A SQL Server collation name without case or accent. For example, Latin1\_General\_100.<br /><br /> \*  A SQL Server collation name with case and accent. For example, Danish\_Greenlandic\_100\_CS\_AI.<br /><br /> Use this optional parameter when you create a database with the *command=createdatabase* parameter.|[CreateDatabase](CreateDatabase.md)|  
|command|The development command that you want to run. The possible values are as follows:<br /><br /> \* [BuildVirtualMetadata](BuildVirtualMetadata.md)<br /><br /> \* [CreateDatabase](CreateDatabase.md)<br /><br /> \* [UpgradeDatabase](UpgradeDatabase.md)<br /><br /> \* [CompileObjects](CompileObjects.md)<br /><br /> \* [DeleteObjects](DeleteObjects.md)<br /><br /> \* [ExportObjects](ExportObjects.md)<br /><br /> \* [ImportObjects](ImportObjects.md)<br /><br /> \* [ExportLangModule](ExportLangModule.md)<br /><br /> \* [ImportLangModule](ImportLangModule.md)<br /><br /> \* [ExportTranslate](ExportTranslate.md)<br /><br /> \* [ImportTranslate](ImportTranslate.md)<br /><br /> \* [ExportToNewSyntax](ExportToNewSyntax.md)<br /><br /> \* [GetBuildVersion](GetBuildVersion.md)<br /><br /> If you specify this parameter and run a command, then the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] does not open.|Not applicable|  
|database|If you use the *command=CreateDatabase* parameter, then the *database* parameter specifies the name of the new database that you want to create. In this case, the *database* parameter is required.<br /><br /> For all other commands, the *database* parameter specifies the database that you want to open.<br /><br /> If you do not specify both the *servername* and the *database* parameter, then the database server and database that are stored in the .zup file are used. If you do not specify the *database* parameter but you do specify the *servername* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database name.<br /><br /> For more information, see [Saving Setup Parameters in the Zup File](Saving-Setup-Parameters-in-the-Zup-File.md).|All|  
|designobject|The type and ID of the object that you want to design. The possible values of the object type are as follows:<br /><br /> \* Table<br /><br /> \* Page<br /><br /> \* Report<br /><br /> \* Codeunit<br /><br /> \* Query<br /><br /> \* XMLport<br /><br /> The possible values of the object ID are 0 and any ID of an existing object. If you specify 0 for the object ID, then you open a new object to design.<br /><br /> For more information, see [DesignObject](DesignObject.md).|Not applicable|  
|file|The path and file name of the file that is used for exporting data to or importing data from. The file type depends on the command.|[CreateDatabase](CreateDatabase.md)<br /><br /> [ExportObjects](ExportObjects.md)<br /><br /> [ImportObjects](ImportObjects.md)<br /><br /> [ExportLangModule](ExportLangModule.md)<br /><br /> [ImportLangModule](ImportLangModule.md)<br /><br /> [ExportTranslate](ExportTranslate.md)<br /><br /> [ImportTranslate](ImportTranslate.md)|  
|filter|A filter on the **Object** table.<br /><br /> Use this parameter to specify which objects the command applies to.|[CompileObjects](CompileObjects.md)<br /><br /> [CreateLanguage](CreateLanguage.md)<br /><br /> [ExportObjects](ExportObjects.md)<br /><br /> [ExportTranslate](ExportTranslate.md)|  
|id|Specifies the path and file name of the .zup file for storing setup parameters. By default, the setup parameters are stored in and retrieved from the fin.zup file. If you specify the *id* parameter, then the setup parameters are stored in and retrieved from a file that is named \<*id*>.zup.<br /><br /> By default, the fin.zup file is located at C:\\users\\*\<user name>*\\AppData\\Roaming\\. To change the location of the .zup file, specify the path and ID in the *id* parameter.<br /><br /> For example, the following command sets the path and file name of the .zup file to C:\\mynavfin.zup:<br /><br /> `finsql.exe id="C:\mynavfin.zup"`<br /><br /> For more information, see [Saving Setup Parameters in the Zup File](Saving-Setup-Parameters-in-the-Zup-File.md).|None. You use this as a stand-alone parameter with the finslg.exe.|  
|importaction|Specifies how to handle conflicts with existing objects when you import from a .fob file. The possible values are:<br /><br /> \* **default** or **0** \(default\) – If there is a conflict, then an error is logged in the log file and no objects from the file are imported.<br /><br /> \* **overwrite** or **1** – If there is a conflict, then overwrite the existing object with the object in the import file.<br /><br /> \* **skip** or **2** - If there is a conflict, then skip the object. The existing object remains unchanged.|[ImportObjects](ImportObjects.md)|  
|langid|Specifies the standard Windows three-letter ID of the language.|[CreateLanguage](CreateLanguage.md)<br /><br /> [ExportLangModule](ExportLangModule.md)|  
|logfile|Specifies the path and file name for the file that contains error messages that result from running finsql.exe with the *command* parameter. If there are no errors, then a log file is not created.|All|  
|navservername|Specifies the name of the server that hosts the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, such as *MyServer*.|[CompileObjects](CompileObjects.md)<br /><br /> [DeleteObjects](DeleteObjects.md)<br /><br /> [ImportObjects](ImportObjects.md)|  
|navserverinstance|Specifies the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is being used, such as [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)].|[CompileObjects](CompileObjects.md)<br /><br /> [DeleteObjects](DeleteObjects.md)<br /><br /> [ImportObjects](ImportObjects.md)|  
|navservermanagementport|Specifies the port on the [!INCLUDE[nav_server](includes/nav_server_md.md)] that the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets access, such as *7045*.|[CompileObjects](CompileObjects.md)<br /><br /> [DeleteObjects](DeleteObjects.md)<br /><br /> [ImportObjects](ImportObjects.md)|  
|ntauthentication|Specifies if you want to use NT authentication. The possible values are **yes**, **no**, **1**, or **0**. If you specify the *username* and *password* parameters, then you must specify **ntauthentication=no** or **ntauthentication=0**.|All|  
|objectcache|Specifies the size of the object cache, in kilobytes. Objects such as code, descriptions, and windows that are used on the computer that is running the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] are stored in the object cache.<br /><br /> The default value is 32000.<br /><br /> For example, the following command sets the object cache to 50000:<br /><br /> `finsql.exe objectcache=50000`<br /><br /> You can also set the object cache from the **Options** window in the Tools menu of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. For more information, see [Options](uiref/-$-S_2355-Options-$-.md),|None. You use this as a stand-alone parameter with the finsql.exe.|  
|password|Specifies the password to use with the *username* parameter to authenticate to the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.|All|  
|servername|Specifies the name of the database server.<br /><br /> If you do not specify both the *servername* parameter and the *database* parameter, then the database server and database that are stored in the .zup file are used. If you do not specify the *servername* parameter but you do specify the *database* parameter, then the [Open Database](uiref/-$-S_2335-Open-Database-$-.md) window opens so that you can specify the database server name.<br /><br /> For more information, see [Saving Setup Parameters in the Zup File](Saving-Setup-Parameters-in-the-Zup-File.md).|All|  
|synchronizeschemachanges|Synchronizes table schema changes for all tables in the database. This is useful when you upgrade from an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] or when you made changes to a table or multiple tables previously and chose to synchronize later. For more information, see [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md).|All|  
|temppath|Specifies the path of the location to store temporary files that are created while [!INCLUDE[navnow](includes/navnow_md.md)] runs. These files are automatically deleted when [!INCLUDE[navnow](includes/navnow_md.md)] is closed.<br /><br /> By default, these files are put in the Temp folder for the user, such as \<C:\\Users\\*\<user name>*\\AppData\\Local\\Temp>.<br /><br /> For example, the following command sets the temporary file path to C:\\Temp:<br /><br /> `finsql.exe temppath="c:\temp"`<br /><br /> You can also set the temporary file path from the **Options** window in the Tools menu of the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. For more information, see [Options](uiref/-$-S_2355-Options-$-.md),|None. You use this as a stand-alone parameter with the finsql.exe.|  
|tenant|Specifies the ID of the tenant that is accessed when you run objects from the development environment. If your solution is not set up to deploy in a multitenant deployment architecture, leave the parameter empty.|[CompileObjects](CompileObjects.md)<br /><br /> [DeleteObjects](DeleteObjects.md)<br /><br /> [ImportObjects](ImportObjects.md)|  
|unicode|Specifies if you want to open the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] with Unicode enabled.<br /><br />Add the `unicode=1` parameter to finsql.exe if your application objects contain strings such as €, and you want to be able to compile and use the objects on computers with different codepages. |None. This parameter is not relevant when you use command because the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] does not open.|  
|useoldeditor|Specifies whether to use the C/AL Editor that was available in [!INCLUDE[navcrete](includes/navcrete_md.md)] and earlier versions. The C/AL Editor was redesigned in [!INCLUDE[navcorfu](includes/navcorfu_md.md)].<br /><br /> To use the old editor, specify the parameter as `useoldeditor=yes` or `useoldeditor`.<br /><br /> To use the new editor, omit the parameter or specify it as `useoldeditor=no`.|None. This parameter is not relevant when you use command because the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] does not open.|  
|username|The user name to use to authenticate to the database. The user name must exist in the database. If you do not specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.<br /><br /> **Alert:** If User Access Control \(UAC\) is turned on and you do not specify to run the Command Prompt window as Administrator, then the Command Prompt window runs as a standard user. In this case, if you do not specify the *username* parameter and the current Windows user is an Administrator, then the command is run as the standard user.<br /><br /> If you specify the *username* parameter, then you must also specify the *password* parameter and the *ntauthentication* parameter must be **no** or **0**.<br /><br /> For more information about database users and permissions, see [Setting Database Owner and Security Administration Permissions](Setting-Database-Owner-and-Security-Administration-Permissions.md).|All|  
|  showalldesignercolumns |  Specifies whether to hide or show the **Visible** and **ApplicationArea** columns in Page Designer. The possible values are: **no**, **0**, **yes**, and **1**.</br></br> **no** or **0** - Hides the columns. This is the default setting.</br></br>**yes** or **1** - Shows the column. </br></br>**Note** This parameter is only relevant the very first time the development environment is opened for a new installation. If the development environment has been opened before, this parameter is ignored, and the  column setup parameters are retrieved from the fin.zup file that is used by the development environment. By default, the fin.zup file is located in the  C:\Users\[username]\AppData\Roaming folder.|  All|


## See Also  
 [Development Environment Commands](Development-Environment-Commands.md)   
 [Saving Setup Parameters in the Zup File](Saving-Setup-Parameters-in-the-Zup-File.md)   
 [Designing Application Objects](Designing-Application-Objects.md)
