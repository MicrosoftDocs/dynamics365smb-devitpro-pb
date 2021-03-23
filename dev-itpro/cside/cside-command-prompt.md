---
title: "Using the Development Environment from the Command Prompt"
author: jswymer
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: jswymer
---
# Using the Development Environment from the Command Prompt
>[!NOTE]
> [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] is [!INCLUDE[2019_releasewave2_deprecated](../includes/2019_releasewave2_deprecated.md)].

You can start the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] by running finsql.exe at the command prompt. You can also use the finsql.exe command to run the several development tasks without using the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] client.  

  By default, finsql.exe is located at [!INCLUDE[navnow_x86install](../developer/includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  

## finsql.exe Command Syntax  

The finsql.exe has the following syntax.  

```  
finsql.exe [command=<command> | designobject=<object type> <object ID>][,servername=<server>][,collation=<collation>][,database=<database>][,file=<file>][,filter=<filter>][,generatesymbolreference=<yes|no>][,importaction=<default|overwrite|skip|0|1|2>][,langid=<ID>][,logfile=<logfile>][,navservername=<name>][,navserverinstance=<instance>][,navservermanagementport=<port>][,ntauthentication=<yes|no|0|1>][,objectcache=<cache>][,password=<password>][,showalldesignercolumns=<yes|no|0|1>][,suppressbuildsearchindex=<yes|no|0|1>][,synchronizeschemachanges=<yes|no|force>][,temppath=<path>][,tenant=<tenant ID>][,unicode=<yes|no|0|1>][,useoldeditor=<yes|no>][,username=<user name>][,suppresselevationcheck=<yes|no|0|1>] 
``` 

### Syntax Key  
The following table describes the notation that is used to indicate syntax.  

|Notation|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|--------------|---------------------------------------|  
|Text without brackets|Parameters that you must type as shown.|  
|\<>|A placeholder for values that you must supply. Don't include the brackets in the value.|  
|\[\]|Optional parameters. Don't include the brackets.|  
|&#124;|A set of values from which to choose. Use one of the options and don't include `&#124;` in the value.|  

### Information about building commands  

- The parameters that you'll use depend on the command that you're running as determined by the *command* and *designobjects* parameters.  

- You can place parameters in any order after finsql.exe. 

- Separate each parameter with a comma. 

## finsql.exe Parameters  
 The following table describes the parameters that you can use with finsql.exe.  

|Parameter|Description|Related command|  
|---------------|-----------------|---------------------|  
|collation|The collation to use when you create a new database. The value must be one of the following values:<br /><br /> \*  A full language culture name. For example, da-DK for Danish or hu-HU for Hungarian.<br /><br /> \*  A SQL Server collation name without case or accent. For example, Latin1\_General\_100.<br /><br /> \*  A SQL Server collation name with case and accent. For example, Danish\_Greenlandic\_100\_CS\_AI.<br /><br /> Use this optional parameter when you create a database with the *command=createdatabase* parameter.|[CreateDatabase](#CreateDatabase)|  
|command|The development command that you want to run. The possible values are as follows:<br /><br /> [BuildVirtualMetadata](#BuildVirtualMetadata)<br />[CreateDatabase](#CreateDatabase)<br />[UpgradeDatabase](#UpgradeDatabase)<br /> [CompileObjects](#CompileObjects)<br />[DeleteObjects](#DeleteObjects)<br />[ExportObjects](#ExportObjects)<br />[ImportObjects](#ImportObjects)<br />[ExportLangModule](#ExportLangModule)<br />[ImportLangModule](#ImportLangModule)<br />[ExportTranslate](#ExportTranslate)<br />[ImportTranslate](#ImportTranslate)<br />[ExportToNewSyntax](#ExportToNewSyntax)<br />[GetBuildVersion](#GetBuildVersion)<br /> [GenerateSymbolReference](#GenerateSymbolReference)|Not applicable|  
|database|If you use the *command=CreateDatabase* parameter, then the *database* parameter specifies the name of the new database that you want to create. In this case, the *database* parameter is required.<br /><br /> For all other commands, the *database* parameter specifies the database that you want to open.<br /><br /> If you don't specify both the *servername* and the *database* parameter, then the database server and database that are stored in the zup file are used. If you don't specify the *database* parameter but you do specify the *servername* parameter, then the **Open Database** window opens so that you can specify the database name.<br /><br /> For more information, see [Saving Setup Parameters in the Zup File](/dynamics-nav/saving-setup-parameters-in-the-zup-file).|All|  
|designobject|See [DesignObject](#DesignObject)|Not applicable|  
|file|The path and file name of the file that is used for exporting data to or importing data from. The file type depends on the command.|[CreateDatabase](#CreateDatabase)<br /><br /> [ExportObjects](#ExportObjects)<br /><br /> [ImportObjects](#ImportObjects)<br /><br /> [ExportLangModule](#ExportLangModule)<br /><br /> [ImportLangModule](#ImportLangModule)<br /><br /> [ExportTranslate](#ExportTranslate)<br /><br /> [ImportTranslate](#ImportTranslate)|  
|filter|A filter on the **Object** table.<br /><br /> Use this parameter to specify which objects the command applies to.|[CompileObjects](#CompileObjects)<br /><br /> [CreateLanguage](#CreateLanguage)<br /><br /> [ExportObjects](#ExportObjects)<br /><br /> [ExportTranslate](#ExportTranslate)|  
|id|Specifies the path and file name of the zup file for storing setup parameters. By default, the setup parameters are stored in and retrieved from the fin.zup file. If you specify the *id* parameter, then the setup parameters are stored in and retrieved from a file that is named \<*id*>.zup.<br /><br /> By default, the fin.zup file is located at C:\\users\\*\<user name>*\\AppData\\Roaming\\. To change the location of the .zup file, specify the path and ID in the *id* parameter.<br /><br /> For example, the following command sets the path and file name of the zup file to C:\\mynavfin.zup:<br /><br /> `finsql.exe id="C:\mynavfin.zup"`<br /><br /> For more information, see [Saving Setup Parameters in the Zup File](/dynamics-nav/saving-setup-parameters-in-the-zup-file).|None. You use this parameter as a stand-alone parameter with the finslg.exe.|  
|import action|Specifies how to handle conflicts with existing objects when you import from a fob file. The possible values are:<br /><br /> \* **default** or **0** \(default\) – If there's a conflict, then an error is logged in the log file and no objects from the file are imported.<br /><br /> \* **overwrite** or **1** – If there's a conflict, then overwrite the existing object with the object in the import file.<br /><br /> \* **skip** or **2** - If there's a conflict, then skip the object. The existing object remains unchanged.|[ImportObjects](#ImportObjects)|  
|langid|Specifies the standard Windows three-letter ID of the language.|[CreateLanguage](#CreateLanguage)<br /><br /> [ExportLangModule](#ExportLangModule)|  
|logfile|Specifies the path and file name for the file that contains error messages that result from running finsql.exe with the *command* parameter. If there are no errors, then a log file isn't created.|All|  
|navservername|Specifies the name of the server that hosts the [!INCLUDE[server](../developer/includes/server.md)] instance, such as *MyServer*.|[CompileObjects](#CompileObjects)<br /><br /> [DeleteObjects](#DeleteObjects)<br /><br /> [ImportObjects](#ImportObjects)|  
|navserverinstance|Specifies the [!INCLUDE[server](../developer/includes/server.md)] instance that is being used, such as [!INCLUDE[nav_server_instance](../developer/includes/nav_server_instance_md.md)].|[CompileObjects](#CompileObjects)<br /><br /> [DeleteObjects](#DeleteObjects)<br /><br /> [ImportObjects](#ImportObjects)|  
|navservermanagementport|Specifies the port on the [!INCLUDE[server](../developer/includes/server.md)] that the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Windows PowerShell cmdlets access, such as *7045*.|[CompileObjects](#CompileObjects)<br /><br /> [DeleteObjects](#DeleteObjects)<br /><br /> [ImportObjects](#ImportObjects)|  
|ntauthentication|Specifies if you want to use NT authentication. The possible values are **yes**, **no**, **1**, or **0**. If you specify the *username* and *password* parameters, then you must specify **ntauthentication=no** or **ntauthentication=0**.|All|  
|objectcache|Specifies the size of the object cache, in kilobytes. Objects such as code, descriptions, and windows that are used on the computer that is running the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] are stored in the object cache.<br /><br /> The default value is 32000.<br /><br /> For example, the following command sets the object cache to 50000:<br /><br /> `finsql.exe objectcache=50000`<br /><br /> You can also set the object cache from the **Options** window in the Tools menu of the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)].|None. You use this as a stand-alone parameter with the finsql.exe.|  
|password|Specifies the password to use with the *username* parameter to authenticate to the database. If you don't specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.|All|  
|servername|Specifies the name of the database server.<br /><br /> If you don't specify both the *servername* parameter and the *database* parameter, then the database server and database that are stored in the .zup file are used. If you don't specify the *servername* parameter but you do specify the *database* parameter, then the **Open Database** window opens so that you can specify the database server name.<br /><br /> For more information, see [Saving Setup Parameters in the Zup File](/dynamics-nav/saving-setup-parameters-in-the-zup-file).|All|  
|synchronizeschemachanges|Synchronizes table schema changes for all tables in the database. This is useful when you upgrade from an earlier version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] or when you made changes to a table or multiple tables previously and chose to synchronize later. For more information, see [Synchronizing the Tenant Database with the Application Database](../administration/synchronize-tenant-database-and-application-database.md).|All|  
|temppath|Specifies the path of the location to store temporary files that are created while [!INCLUDE[prod_short](../developer/includes/prod_short.md)] runs. These files are automatically deleted when [!INCLUDE[prod_short](../developer/includes/prod_short.md)] is closed.<br /><br /> By default, these files are put in the Temp folder for the user, such as \<C:\\Users\\*\<user name>*\\AppData\\Local\\Temp>.<br /><br /> For example, the following command sets the temporary file path to C:\\Temp:<br /><br /> `finsql.exe temppath="c:\temp"`<br /><br /> You can also set the temporary file path from the **Options** window in the Tools menu of the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)].|None. You use this as a stand-alone parameter with the finsql.exe.|  
|tenant|Specifies the ID of the tenant that is accessed when you run objects from the development environment. If your solution isn't set up to deploy in a multitenant deployment architecture, leave the parameter empty.|[CompileObjects](#CompileObjects)<br /><br /> [DeleteObjects](#DeleteObjects)<br /><br /> [ImportObjects](#ImportObjects)|  
|unicode|Specifies if you want to open the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] with Unicode enabled.<br /><br />Add the `unicode=1` parameter to finsql.exe if your application objects contain strings such as €, and you want to compile and use the objects on computers with different codepages. |None. This parameter isn't relevant when you use command because the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] doesn't open.|  
|useoldeditor|Specifies whether to use the C/AL Editor that was available in [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)] and earlier versions. The C/AL Editor was redesigned in [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)].<br /><br /> To use the old editor, specify the parameter as `useoldeditor=yes` or `useoldeditor`.<br /><br /> To use the new editor, omit the parameter or specify it as `useoldeditor=no`.|None. This parameter isn't relevant when you use command because the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] doesn´'t open.|  
|username|The user name to use to authenticate to the database. The user name must exist in the database. If you don't specify a user name and password, then the command uses the Windows user name and password of the current user to authenticate to the database.<br /><br /> **Alert:** If User Access Control \(UAC\) is turned on and you don't specify to run the Command Prompt window as Administrator, the Command Prompt runs as a standard user. In this case, if you don't specify the *username* parameter and the current Windows user is an Administrator, then the command is run as the standard user.<br /><br /> If you specify the *username* parameter, then you must also specify the *password* parameter and the *Reauthentication* parameter must be **no** or **0**.|All|  
|  showalldesignercolumns |  Specifies whether to hide or show the **Visible** and **ApplicationArea** columns in Page Designer. The possible values are: **no**, **0**, **yes**, and **1**.</br></br> **no** or **0** - Hides the columns. This value is the default setting.</br></br>**yes** or **1** - Shows the column. </br></br>**Note**: This parameter is only relevant the first time the development environment is opened for a new installation. If the development environment has been opened before, this parameter is ignored. The column setup parameters are retrieved from the fin.zup file that is used by the development environment. By default, the fin.zup file is located in the  C:\Users\[username]\AppData\Roaming folder.|  All|
|suppresselevationcheck|Specifies whether to check that finsql.exe is running in elevated mode (as an administrator). If not in elevated mode, you get a warning that proceeding might cause errors. You are given the option to continue or cancel.</br></br>The possible values are: **no**, **0**, **yes**, and **1**.</br></br> **no** or **0** runs the check. This value is the default setting.</br></br>**yes** or **1** suppresses the check.|[UpgradeDatabase](#UpgradeDatabase)</br></br>Database conversion|

## <a name="BuildVirtualMetadata"></a>BuildVirtualMetadata
Regenerates C\# and metadata information in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] virtual tables for a specified language.  

### Syntax  

```  
finsql.exe command=buildvirtualmetadata,langid=<langid>[,servername=<server>][,database=<database>][,logfile=<path and filename>][,username=<user name>][,password=<password>][,ntauthentication=<yes|no|0|1>]  
```  

### Example  
 This example builds metadata for virtual tables in the *Demo Database* database.  

```  
finsql.exe command=buildvirtualmetadata,servername=TestComputer01\BCDEMO,database="Demo Database"  
```  

## <a name="CreateDatabase"></a>CreateDatabase
Creates a new database for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on an SQL server.  
  
### Syntax  
  
```  
finsql.exe command=createdatabase[,servername=<server>][,database=<database>][,collation=<collation>][,logfile=<path and filename>][,username=<user name>][,password=<password>][,ntauthentication=<yes|no|0|1>]  
```  

*collation*  
  
 The collation to use when you create a new database. The value must be one of the following:  
  
- A full language culture name. For example, da-DK for Danish or hu-HU for Hungarian.  
- A SQL Server collation name without case or accent. For example, Latin1\_General\_100.
- A SQL Server collation name with case and accent. For example, Danish\_Greenlandic\_100\_CS\_AI.  
  
### Example  
 This example creates a database on a SQL server that is named TestComputer01\\BCDEMO. The new database is given the name NAV Danish Database and uses the collation da-DK.  
  
```  
finsql.exe command=createdatabase,servername=TestComputer01\BCDEMO,database="NAV Danish Database",collation=da-dk  
```  

## <a name="CompileObjects"></a>CompileObjects
Compiles objects from the specified database.  

### Syntax  

```  
finsql.exe command=compileobjects[,servername=<server>][,database=<database>][,filter=<filter>][,logfile=<path and filename>][,username=<user name>][,password=<password>][,ntauthentication=<yes|no|0|1>][,synchronizeschemachanges=<yes|no|force>][,navservername=<server name>][,navserverinstance=<instance>][,navservermanagementport=<port>][,tenant=<tenant ID>]  
```  

*synchronizeschemachanges*  

Specifies how to synchronize table definition changes in the business \(tenant\) database in SQL Server. The following table describes the available options.  

|[!INCLUDE[bp_tableoption](../developer/includes/bp_tableoption_md.md)]|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|  
|----------------------------------|---------------------------------------|  
|**yes**|Before applying changes to the business data table, [!INCLUDE[server](../developer/includes/server.md)] validates the changed table definition to check for destructive changes to the table. It includes changes that require data is deleted in the fields of the business data table that are affected by the changes before the changes can be applied.<br /><br /> -   If there are no destructive changes to the table, then the schema changes are applied to the business data table immediately.<br />-   If there are destructive changes, [!INCLUDE[server](../developer/includes/server.md)] checks that there are table synchronization instructions in an upgrade codeunit. If there are instructions, then the schema changes are applied to the business database table according to the instructions. If there are no instructions, then an error message appears. The table definition changes aren't saved and the schema changes aren't applied.|  
|**no**|Table definition changes are saved and compiled in the application but the changes aren't validated or applied to the business data table. You synchronize the table schema later by doing one of the following steps:<br /><br /> -   Save or compile the table from Object Designer in [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] and choose either the **Now - with validation** or **Force** synchronization option.<br />-   Use the **Sync. Schema for All Tables** option on the **Tools** menu.<br />-   Run the Sync-NAVTenant cmdlet from the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)].|  
|force|Table definition changes are applied to the business data table schema without validation. For destructive changes, data in columns of the business data table that are affected by changes will be deleted.<br /><br /> This option ignores any table synchronization instructions for the table in upgrade codeunits.|  

 For more information about table schema synchronization, see [Synchronizing the Tenant Database with the Application Database](../administration/synchronize-tenant-database-and-application-database.md).  

*navservername*  

 Specifies the name of the server that hosts the [!INCLUDE[server](../developer/includes/server.md)] instance, such as **MyServer**.  

*navserverinstance*  

 Specifies the [!INCLUDE[server](../developer/includes/server.md)] instance that is being used, such as [!INCLUDE[nav_server_instance](../developer/includes/nav_server_instance_md.md)].  

 *navservermanagementport*  

 Specifies the port on the [!INCLUDE[server](../developer/includes/server.md)] server that the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Windows PowerShell cmdlets access, such as **7045**.  

 *tenant*  

 Specifies the ID of the tenant that is accessed when you run objects from the development environment. If your solution isn't set up to deploy in a multitenant deployment architecture, leave the parameter empty.  

### Remarks  
 You use the **CompileObjects** command together with the finsql.exe executable. finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](../developer/includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  

 To compile objects, you must have a developer license.  

### Example  
 This example shows how to run a command to compile all tables and codeunits that have an ID that is greater than or equal to 500 and less than or equal to 1000.  

```  
finsql.exe command=compileobjects,servername=TestComputer01\BCDEMO,database="Demo Database BC",filter="Type=Table|Codeunit;ID=500..1000"  
```  

## <a name="CreateLanguage"></a>CreateLanguage
Creates captions on [!INCLUDE[prod_short](../developer/includes/prod_short.md)] objects for a specified language.  
  
### Syntax  
  
```  
finsql.exe command=createlanguage,langid=<langid>[,servername=<server>][,database=<database>][,filter=<filter>][,logfile=<path and filename>][,username=<user name>][,password=<password>][,ntauthentication=<yes|no|0|1>]  
```  

### Parameters  
 *langid*  
  
 Specifies the standard Windows three-letter ID of the language that you want to add captions for. 
  
### Remarks  
 The CreateLanguage command adds a language caption entry in the [CaptionML Property](../developer/properties/devenv-CaptionML-Property.md) of the controls in the objects that you specify. By default, the caption is the same value as the [Name Property](../developer/properties/devenv-properties.md) of the control.  
  
> [!NOTE]  
>  After you run the command, you must to compile the modified objects. For more information, see [CompileObjects](#CompileObjects).  
  
### Example  
 This example adds captions for Danish \(DAN\) on all table and page objects with IDs from 1 to 10000 in the *BC Danish Database*.  
  
```  
finsql.exe command=createlanguage,langid=DAN,servername=TestComputer01\BCDEMO,database="BC Danish Database",filter="Table|Page;ID=1..10000"  
```  

## <a name="DeleteObjects"></a>DeleteObjects
Deletes objects from the specified [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  

### Syntax  

```  
finsql.exe command=deleteobjects[,servername=<server>][,database=<database>][,filter=<filter>][,logfile=<path and filename>][,username=<user name>][,password=<password>][,ntauthentication=<yes|no|0|1>][,synchronizeschemachanges=<yes|no|force>][,navservername=<server name>][,navserverinstance=<instance>][,navservermanagementport=<port>][,tenant=<tenant ID>]  
```  

### Remarks  
 When you run the command, objects are deleted without a warning or confirmation prompt.  

### Example  
 This example shows how to run the DeleteObjects command to delete all tables and codeunits that have an ID that is greater than or equal to 500 and less than or equal to 1000.  

```  
finsql.exe command=deleteobjects,servername=TestComputer01\BCDEMO,database="Demo Database BC",filter="Type=Table|Codeunit;ID=500..1000"  
```  

## <a name="DesignObject"></a>DesignObject
Opens the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] and opens the specified object for design.  

### Syntax  

```  
finsql.exe designobject=<object type> <object ID>[,servername=<server>][,database=<database>][,username=<user name>][,password=<password>][,ntauthentication=<yes|no|0|1>]  
```  

*designobject*  

 The type and ID of the object that you want to design. This parameter is required. The possible values of the object type are:  

- Table  

- Page  

- Report  

- Codeunit  

- Query  

- XMLport  

  The possible values of the object ID are 0 and any ID of an existing object. If you specify 0 for the object ID, then you open a new object to design.  

### Example  
This example shows how to run a command to open the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] and open Page Designer to design page 21,  **Customer Card**.  

```  
finsql.exe servername=TestComputer01\BCDEMO,database="Demo Database BC",designobject=Page 21  
```

## <a name="ExportLangModule"></a>ExportLangModule
Exports a language module from the specified database to a file.  

### Syntax  

```  
finsql.exe command=exportlangmodule,file=<exportfile>,langid=<langid>[,servername=<server>][,database=<database>][,logfile=<path and filename>][,username=<username>][,password=<password>][,ntauthentication=<yes|no|1|0>]  
```  

### Parameters  
 *file*  

 Specifies the path and file name to which you want to export the language module. This parameter is required.  

 Give the file name the extension *.flm*, for example, *C:\\ENUlanguagemodule.flm*.  

 *langid*  

 Specifies the standard Windows three-letter ID of the language that you want to export, such as *ENU* or *DAN*.  

 *ENU* is the default value. If you don't specify the *langid* parameter, then the language module for *ENU* is exported.  


### Remarks  
 The language isn't deleted from the database.  

### Example  
 This example shows how to run the ExportLangmodule command to export a language module for Danish \(DAN\) from the *Demo Database NAV \(10-0\)* database.  

```  
finsql.exe command=exportlangmodule,langid=DAN,file=C:\DANlanguagemodule.flm,servername=TestComputer01\BCDEMO,database="Demo Database BC",username=dbadmin,password=P@ssword,ntauthentication=no,logfile=C:\ExportDANlanguagemoduleLog.txt  
```

## <a name="ExportObjects"></a>ExportObjects
Exports objects from the specified database.  

### Syntax  

```  
finsql.exe command=exportobjects,file=<exportfile>[,servername=<server>][,database=<database>][,logfile=<path and filename>][,filter=<filter>][,username=<username>][,password=<password>][,ntauthentication=<yes|no|1|0>]  
```  

### Parameters  
 *file*  

 The path and file name to which you export objects. This parameter is required. You can export objects to one of the following file types:  

- txt  

- fob  

  You specify the file type by the file name extension in the *file* parameter.  

### Remarks  
 You use the **ExportObjects** command with the finsql.exe from a command prompt. finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](../developer/includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  

 To export objects to a txt file, you must have a developer license. To export objects to a fob file, you can have either an end-user license or a developer license.  

 You can specify parameters in any order.  

### Example  
 This example shows how to run a command to export all queries in a given ID range, using the specified user name and password.  

```  
finsql.exe command=exportobjects,file=C:\QueryExport.txt,servername=TestComputer01\BCDEMO,database="Demo Database BC",filter="Type=Query;ID=50001..50010",username=dbadmin,password=P@ssword,ntauthentication=no,logfile=C:\QueryExportLog.txt  
```

## <a name="ExportToNewSyntax"></a>ExportToNewSyntax
Export application objects to a .txt file in the syntax that is supported by the Txt2Al conversion tool. The Txt2Al conversion tool enables you to convert [!INCLUDE[prod_short](../developer/includes/prod_short.md)] objects that are written in the C/AL language (using the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)]) to the AL (.al) format. 

### Syntax  

```  
finsql.exe command=exporttonewsyntax,file=<filename.txt>[,servername=<server>][,database=<database>][,filter=<filter>][,logfile=<path and filename>][,username=<username>][,password=<password>][,ntauthentication=<yes|no|1|0>]  
```  

### Parameters  
 *file*  

 Specifies the path and name of the text file to export to the AL-supported syntax, for example, *C:\\objects.txt*. This parameter is required.  


### Example  
 The following example exports the table **225** from the Demo Database NAV database:
 
```
finsql.exe command=exporttonewsyntax,file=exportedobjects.txt,database="Demo Database NAV",servername=.\BCDEMO ,filter=type=table;ID=225
```
  
## <a name="ExportTranslate"></a>ExportTranslate
Exports UI text strings of objects from a specified [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database to a text file.  

### Syntax  

```  
finsql.exe command=exporttranslate,file=<exportfile>[,servername=<server>][,database=<database>][,filter=<filter>][,logfile=<path and filename>][,username=<username>][,password=<password>][,ntauthentication=<yes|no|1|0>]  
```  

### Parameters  
 *file*  

 Specifies the path and name of the text file in which to export the text strings, for example *C:\\translatestrings.txt*. This parameter is required.  

### Remarks  
 You can use this command for translating text strings in multilanguage setup of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. This command exports all text strings that are associated with objects. It includes text strings that are defined by for properties of the objects in all languages. For more information, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files in Dynamics NAV](/dynamics-nav/how-to--add-translated-strings-by-importing-and-exporting-multilanguage-files). 

### Example  
 This example shows how to run the ExportTranslate command to export text strings from the *Demo Database BC* database to a txt type file that has the path and file name *C:\\bctextstrings.txt*.  

```  
finsql.exe command=exporttranslate,file=C:\bctextstrings.txt,servername=TestComputer01\BCDEMO,database="Demo Database BC"  
```  

## <a name="GenerateSymbolReference"></a>Generatesymbolreference
 
Generates object symbols for developing against the objects in the AL Development Environment. 

### Syntax
```
finsql.exe command=generatesymbolreference,Database=<database name>,servername=<servername>
```

### Example
```
finsql.exe Command=generatesymbolreference,Database="Demo Database BC",ServerName=.\BCDEMO
```

## <a name="GetBuildVersion"></a>GetBuildVersion
Gets the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] product name and build version number that is currently installed and saves the information to a txt type file.  
  
### Syntax  
  
```  
finsql.exe command=getbuildversion,file=<versionfile>[,logfile=<path and filename>]  
```  
  
### Parameters  
 *file*  
  
 Specifies the folder path and file name of the text file, for example *C:\\bcbuildversion.txt*, in which to save the build information. This parameter is required.  
  
 *logfile*  
  
 The folder path and file name of a text file, for example *C:\\bcbuildversionlog.txt*, in which to save error messages that result from the command. If there are no errors when you run the command, then a log file isn't created.  
  
### Remarks  
 When you run the command, a file that contains information about the success or failure of the command is automatically created. The file has the name *navcommandresult.txt*. If you specify the *logfile* parameter, then the *navcommandresult.txt* file is created in the folder that is specified by the *logfile* parameter. If you don't specify the *logfile* parameter, the file is created in the same location as finsql.exe file, which by default is [!INCLUDE[navnow_x86install](../developer/includes/navnow_x86install_md.md)]\\RoleTailored Client.  
  
> [!NOTE]  
>  If User Access Control \(UAC\) is turned on and you don't run the command prompt as an Administrator, then the command prompt window runs as a standard user. In this case, if you don't specify the *logfile* parameter, then the command fails because the standard user cannot write to the default location of the finsql.exe file.  
  
### Example  
 This example shows how to run the GetBuildVersions command to get the product name and version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] that is currently installed on the computer. The example saves the build version information to a txt type file that has the path and file name *C:\\temp\\navbuildversion.txt*. The example also specifies a log file that has the path and file name *C:\\temp\\bcbuildversionlog.txt*  
  
```  
finsql.exe command=getbuildversion,file=C:\temp\navbuildversion.txt,logfile= C:\temp\bcbuildversionlog.txt  
```  
  
 The build version file, in this case *bcbuildversion.txt*, includes information that is similar to the following:  
  
 `Product Name: Business Central`  
  
 `Product Version: 13.0.38865.0` 

## <a name="ImportLangModule"></a>ImportLangModule
Imports a language module from a file to the specified [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  

### Syntax  

```  
finsql.exe command=importlangmodule,file=<importfile>[,servername=<server>][,database=<database>][,filter=<filter>][,logfile=<path and filename>][,username=<username>][,password=<password>][,ntauthentication=<yes|no|1|0>] 
```  

### Parameters  
 *file*  

 Specifies the path and file name of the language module to import. This parameter is required.  

 The file name should have the extension *.flm*, for example, *C:\\ENUlanguagemodule.flm*.  

### Remarks  
 You can specify parameters in any order.  

### Example  
 This example shows how to run the ImportLangModule command to import a language module for Danish \(DAN\) to the *Demo Database NAV \(10-0\)* database. The language module file path is *C:\\DANlanguagemodule.flm*.  

```  
finsql.exe command=importlangmodule,file=C:\DANlanguagemodule.flm,servername=TestComputer01\BCDEMO,database="Demo Database BC"  
```

## <a name="ImportObjects"></a>ImportObjects
Imports objects from a file to the specified database.  
  
### Syntax  
  
```  
finsql.exe command=importobjects,file=<importfile>[,servername=<server>][,database=<database>][,logfile=<path and filename>][,importaction=<default|overwrite|skip|0|1|2>][,username=<username>][,password=<password>][,ntauthentication=<yes|no|1|0>][,synchronizeschemachanges=<yes|no|force>][,navservername=<server name>][,navserverinstance=<instance>][,navservermanagementport=<port>][,suppressbuildsearchindex=<yes|no|1|0>][,tenant=<tenant ID>]  
```

### Parameters  
 *file*  
  
 The path and file name from which you import objects. This parameter is required. The file must have a fob or txt file name extension.  
  
 *importaction*  
  
 Specifies how to handle conflicts with existing objects when you import from a fob file. The possible values are:  
  
-   **default** or **0** \(default\) – If there's a conflict, then an error is logged in the log file and no objects from the file are imported.  
  
-   **overwrite** or **1** – If there's a conflict, then overwrite the existing object with the object in the import file.  
  
-   **skip** or **2** - If there's a conflict, then skip the object. The existing object remains unchanged.  
  
> [!WARNING]  
>  If you import from a txt file and there's a conflict, then the objects in the import file overwrite the existing objects in the database.  
  
> [!NOTE]  
>  After you import an object from a txt file, you must compile the object before you use it. If you import an object from a fob file, then the object is compiled automatically after it is imported. 

*suppressbuildsearchindex*  

When importing objects from a fob file, specifies whether the command will also build the object search index. The parameter has the following values:

-   **no** or **0** \(default\) - the search index isn't built.
-   **yes** or **1** – the search index isn't built.

 Building the search index makes sure that pages and reports, which are properly configured for search, can be found by the **Tell Me** feature in the client (for more information, see [Adding Pages and Reports to Tell Me](../developer/devenv-al-menusuite-functionality.md). Building the search index will add time to the import operation.
 
Setting `suppressbuildsearchindex=yes` can be useful if you're importing several fob files. In which case, for example, you could use `suppressbuildsearchindex=yes` parameter on all `import` commands except the last one. Or, you can skip the search index from the command, and run it afterward from the [!INCLUDE[nav_dev_long_md.md](../developer/includes/nav_dev_long_md.md)] by selecting **Tools** > **Build Object Search Index**.
  
 ### Remarks  
 You use the **ImportObjects** command with the finsql.exe from a command prompt. finsql.exe is the executable file that runs the development environment. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](../developer/includes/navnow_x86install_md.md)]\\RoleTailored Client\\.  
  
 To import objects from a txt file, you must have a developer license. To import objects from a fob file, you can have either an end-user license or a developer license.  
 

### Example  
 This example shows how to run a command to import the objects from a fob file into [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. If any of the objects to import already exist in the database, then overwrite them with the objects from the import file.  
  
```  
finsql.exe command=importobjects,file=C:\NewObjects.fob,servername=TestComputer01,database="Demo Database BC",ImportAction=overwrite  
```  
## <a name="ImportTranslate"></a>ImportTranslate
Imports UI text strings for objects from a text file to a specified [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  

### Syntax  

```  
finsql.exe command=importtranslate,file=<importfile>[,servername=<server>][,database=<database>][,filter=<filter>][,logfile=<path and filename>][,username=<username>][,password=<password>][,ntauthentication=<yes|no|1|0>]  
```  

### Parameters  
 *file*  

 Specifies the path and name of the text file that contains the text strings to import, for example *C:\\translatestrings.txt*. This parameter is required.  

### Remarks  
 You can use this command for translating text strings in multilanguage setup of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. The contents of the text file must be compatible with [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. Therefore, the text file will typically have originated from a text file that was previously exported from the database, and then modified. For more information, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files in Dynamics NAV](/dynamics-nav/how-to--add-translated-strings-by-importing-and-exporting-multilanguage-files).

### Example  
 This example shows how to run the ImportTranslate command to import text strings from a text file to the *Demo Database NAV \(10-0\)* database. The text file that has the path and file name *C:\\bctextstrings.txt*.  

```  
finsql.exe command=importtranslate,file=C:\bctextstrings.txt,servername=TestComputer01\BCDEMO,database="Demo Database BC"  
```  

## <a name="UpgradeDatabase"></a>UpgradeDatabase
Upgrades an existing [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database.  
  
### Syntax  
  
```  
finsql.exe command=upgradedatabase, servername=<server>, database=<database>[, logfile=<path and filename>][,username=<user name>][,password=<password>][,ntauthentication=<yes|no|0|1>][,suppresselevationcheck=<yes|no|0|1>]   
```  
  
### Remarks  
 You use the **UpgradeDatabase** command together with the finsql.exe executable when you want to convert a database from an earlier version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to the new version. For example, if you are upgrading several databases, you can create scripts that help you repeat the steps. finsql.exe is the executable file that runs the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]. By default, finsql.exe is located at [!INCLUDE[navnow_x86install](../developer/includes/navnow_x86install_md.md)]RoleTailored Client\\.  
  
> [!IMPORTANT]  
>  The upgrade isn't completed when you have run this command. You must compile all objects, and you must connect to a [!INCLUDE[server](../developer/includes/server.md)] instance. For more information, see [Converting a Database](../upgrade/Converting-a-Database.md).  
  
### Example  
 This example upgrades the *NAV Danish Database* database on the *TestComputer01\\BCDEMO* SQL Server instance.  
  
```  
finsql.exe command=upgradedatabase,servername=TestComputer01\BCDEMO,database="BC Danish Database"  
```  
 
## See Also