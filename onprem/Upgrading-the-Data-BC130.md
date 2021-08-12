---
title: Upgrading the Database
description: This article describes the tasks required for upgrading from the earlier versions of database to Dynamics 365 Business Central.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: "dynamics365-business-central"
---
# Upgrading the Data to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]: Single-Tenant Deployment

[See print-friendly quick reference](singletenant-upgrade-checklist.md)


This topic describes the tasks required for upgrading the data of a [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] database to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in a single-tenant deployment. 

## About Data Upgrade

You use data conversion tools provided with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to convert the old data with the old version’s table and field structure, so that it functions together with the new version’s table and field structure. Mainly, only table objects and table data are modified during the data upgrade process. Other objects, such as pages, reports, codeunits, and XMLports are upgraded as part of the application code upgrade process.

The data upgrade process described in this article leads you through the database conversion (technical upgrade) and then the upgrade of the actual data, which is achieved by using the upgrade toolkit/upgrade codeunits.

##  <a name="Prereqs"></a> Prerequisites
  
Before you start the upgrade tasks, make sure you meet the following prerequisites:
1.  Your computer uses the same codepage as the data that will be upgraded.

    If you use conflicting codepages, some characters will not display in captions, and you might not be able to access the upgraded database. This is because [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] must remove incorrect metadata characters to complete the data upgrade. In this case, after upgrade, you must open the database in the development environment on a computer with the relevant codepage and compile all objects. This adds the missing characters again.

    Optionally, you can export the captions before the upgrade. For more information, see [How to: Add Translated Strings for Conflicting Text Encoding Formats](/dynamics-nav/How-to--Add-Translated-Strings-for-Conflicting-Text-Encoding-Formats).

2. Custom V1 extensions used in the old deployment have been converted to V2 extensions.

    For more information, see [Converting Extensions V1 to Extensions V2](../developer/devenv-upgrade-v1-to-v2-overview.md).

3.  You have upgraded the application code, and have the FOB files that contain the upgraded application code and upgrade toolkit. The upgrade toolkit includes upgrade codeunits for handling the data upgrade. The upgrade toolkit can be in the same FOB file as the application code or in a separate FOB file.  

    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

    For W1 versions, you can find the default upgrade toolkit objects in the  **UpgradeToolKit\Data Conversion Tools** folder on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD). Choose the FOB that matches the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version from which you are upgrading:

    |  Version  |  FOB  |  Remarks  |
    |-----------|-------|-----------|
    |[!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]|Upgrade7001100.FOB|This file can be found on the [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] [Cumulative Update 2 installation media (DVD)](https://support.microsoft.com/help/4078580/cumulative-update-02-for-microsoft-dynamics-nav-2018-build-20348?preview). It is not available with later cumulative updates.|
    |[!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]|Upgrade7101100.FOB and Upgrade710HF1100.FOB|This file can be found on the [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] [Cumulative Update 2 installation media (DVD)](https://support.microsoft.com/help/4078580/cumulative-update-02-for-microsoft-dynamics-nav-2018-build-20348?preview). It is not available with later cumulative updates.|
    | [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]| Upgrade8001300.FOB||
    | [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]| Upgrade9001300.FOB||
    |[!INCLUDE[nav2017](../developer/includes/nav2017.md)]| Upgrade10001300.FOB||
    |[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]| Upgrade11001300.FOB||

    For local versions, you will find the upgrade toolkit objects in the **UpgradeToolKit\Local Objects** folder. The files follow the same naming convention except they include the 2-letter local version, such as **Upgrade11001300.DK.fob** for Denmark or **Upgrade11001300.DE.fob** for Germany.  

3.  You have exported the permission sets (except SUPER) and permissions as XML files from the old database.

    To exclude the SUPER permission set when running XMLPort 9171, add the filter `Role ID is <>SUPER`. 

    For more information, see [Exporting and Importing Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ExportPerms).

4.   If the old deployment uses data encryption, you have exported the encryption key file that it used for the data encryption.  

        For more information, see [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md).
5.   \(Optional\) Make a copy of the configuration file (web.config or navsettings.json) for all [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] instances in the old deployment. 

6.  [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has been installed. 

    As a minimum, you must install the following components:
    - Server
    - SQL Server Components
    - [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)]
    - [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]
    - AL Development Environment
    - (optionally) [!INCLUDE[admintool](../developer/includes/admintool.md)]

    For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).
 

> [!NOTE]
>If the old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] application uses Payment Services for Microsoft Dynamics ERP, be aware that this was discontinued in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. This means that most of the objects that are associated with this feature will be deleted during the upgrade. Some objects you will have to manually delete. 

##  <a name="SQLBackup"></a> Task 1: Create a full SQL backup of the old database on SQL Server  

Create a full backup of the old database in the SQL Server. Alternatively, you can make a copy of the old database and perform the upgrade tasks on the copy.  

For more information, see [Create a Full Database Backup \(SQL Server\)](https://msdn.microsoft.com/library/ms187510.aspx).  

## Task 2 Uninstall all extensions in old database
 
Open the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)] that matches to old database, and run these commands:
 
1.  To get a list of the extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant default
    ```
    
    Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server_md](../developer/includes/nav_server_md.md)] instance that the database connects to.


2. For each extension, run this command to uninstall it:

    ```
    Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```
    Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server_md](../developer/includes/nav_server_md.md)] instance that the database connects to.
    
    Replace `<Name>` and `<N.N.N.N>` with the name and version of the Extension V1 as it appeared in the previous step.

    Alternately, to remove them all at once, you can run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant default | % { Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name $_.Name -Version $_.Version }
    ```

##  <a name="UploadLicense"></a> Task 3: Upload the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] partner license to the old database  
By using the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] that matches the old database, upload the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] license to the database.

For more information, see [[Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md#UploadtoDatabase).  

##  <a name="DeleteObjects"></a> Task 4: Delete all objects except tables from the old database   
In the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] version that matches the database, open the old database, open Object Designer, select all objects except tables, and then choose **Delete**.

You can also use the [DeleteObjects](/dynamics-nav/deleteobjects
) command of the finsql.exe.

## <a name="ClearServer"></a>Task 5: Clear server instance and debugger breakpoint records from old database
Clear all records from the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in the database in SQL Server.  

1.  Make sure that you stop the old server instance, and close any tools that connect to the database, such as the Dynamics NAV Administration Tool and [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)].
2.  Using SQL Server Management Studio, open and clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables of the old database. For example, you can run the following SQL query:

    ```
    DELETE FROM [<My NAV Database Name>].[dbo].[Server Instance]
    DELETE from [<My NAV Database Name>].[dbo].[Debugger Breakpoint]
    ```

##  <a name="ConvertDb"></a> Task 6: Convert the old database to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] format

If the database is on Azure SQL Database, you must first add your user account to the **dbmanager** database role on master database. This membership is only required for converting the database, and can be removed afterwards. 

To convert the old database to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] format, open the old database in the new [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], and follow the conversion instructions.

For more information about how to open a database, see [Open a Database](../cside/cside-open-database.md).

> [!IMPORTANT]
> Do not run schema synchronization at this time. Choose to run it **later**.


##  <a name="ImportAppObj"></a> Task 7: Import the upgraded application objects
Using [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], import the application objects that you want in the database. This includes the application objects FOB file (from the application code upgrade) and the upgrade toolkit objects FOB file.

1. Import the application objects FOB file first, and then import the upgrade toolkit FOB file.

    For more information, see [Importing Objects](../cside/cside-import-objects.md).

2. **IMPORTANT** When prompted about table synchronization, set the **Synchronize Schema** option to **Later**.  

3. When you import the FOB file, if you experience metadata conflicts, the **Import Worksheet** windows appears.

    Review the Worksheet page. For more information, see [Import Worksheet](../cside/cside-import-worksheet.md).
    
    Choose **Replace All**, and then **OK** to continue.


##  <a name="ConnectToServer"></a> Task 8: Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted database

You use the [!INCLUDE[admintool](../developer/includes/admintool.md)] or [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?linkid=401394) in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] to connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted database.  

The service account that is used by the [!INCLUDE[server](../developer/includes/server.md)] instance must be a member of the **db\_owner** role in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database on SQL Server or Azure SQL Database.

For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md) and [Giving the account necessary database privileges in SQL Server](../deployment/provision-server-account.md#dbo).

> [!IMPORTANT]  
>  When upgrading a large database, you should increase the **SQL Command Timeout** setting for the [!INCLUDE[server](../developer/includes/server.md)] instance, to avoid timeouts during schema synchronization. The default setting is 30 minutes.  


##  <a name="CompSysTables"></a> Task 9: Compile all objects

1. In the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], set it to use the server instance that connects to the database.

    For more information, see [Changing the Server Instance](../cside/cside-change-server-instance.md).  

2. Use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or finsql.exe to compile all objects. This includes the imported application objects, data tables, and system tables. 

    > [!IMPORTANT]
    >Choose to run schema synchronization later. For example, in Object Designer, choose **Tools**, choose **Compile**, set the **Synchronize Schema** option to **Later**, and then choose **OK**. For more information, see [Compiling Objects](../cside/cside-compiling-objects.md).

3. ([!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)] and earlier only) If you get errors on the following table objects, use the Object Designer to delete the objects because they are no longer used.

    -   Table 470 Job Queue (replaced by the [Task Scheduler](../developer/devenv-Task-Scheduler.md))
    -   Table 824 DO Payment Connection Details
    -   Table 825 DO Payment Connection Setup
    -   Table 827 DO Payment Credit Card
    -   Table 828 DO Payment Credit Card Number
    -   Table 829 DO Payment Trans. Log Entry
    -   Table 1510 Notification Template

    
    When you delete a table object, in the **Delete** confirmation dialog box that appears, set the **Synchronize Schema** option to **Force**.
    
    > [!IMPORTANT] 
    > In this step, it is very important that you do not use the **Sync. Schema For All Tables** option from the **Tools** menu.
      
4.  ([!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)] and earlier only) If the old database includes test runner codeunits, you will get errors on these codeunits that the OnBeforeTestRun and OnAfterTestRun trigger signatures are not valid. To fix these issues, you change the signature of the OnBeforeTestRun and OnAfterTestRun triggers to include the *TestPermission* parameter.

    For more information, see [Resolving OnBeforeTestRun and OnAfterTestRun Trigger Errors When Converting a Database](Resolve-OnBeforeTestRun-OnAfterTestRun-Compile-Errors.md).

    The triggers for codeunit **130400 CAL Test Runner** and **130402 CAL Command Line Test Runner** will be updated for you during the data upgrade.

## Task 10: Increase the application version of the database

If you are upgrading from [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)], you must increase the application version that is assigned to the database.

Use the [Set-NAVApplication](/powershell/module/microsoft.dynamics.nav.management/set-navapplication) cmdlet of the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] to increase the application version number of the database from its current version.

To see the current version, use the following command:

```
Get-NAVApplication -ServerInstance <ServerInstanceName> 

```

To change the version, use the following command:

```
Set-NAVApplication -ServerInstance <ServerInstanceName> -ApplicationVersion <N.N.N.N> -Force
```

For example, if the old version was `11.0.24279.0`, then you could change the version to `13.0.24279.0`.
 
##  <a name="RunSync1"></a> Task 11: Run the schema synchronization on the imported objects

Synchronize the database schema with validation.

For example, run the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. 

```
Sync-NAVTenant -ServerInstance <ServerInstanceName>
```
 
For more information, see [Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md).

##  <a name="RunStartNavUpgrade"></a> Task 12: Run the data upgrade process  
A data upgrade runs the upgrade toolkit objects, such as upgrade codeunits and upgrade tables, to migrate business data from the old table structure to the new table structure. You can start the data upgrade from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  

> [!NOTE]  
>  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the Start-NavDataUpgrade cmdlet and set the *-SkipCompanyIntitialization* parameter.  


Open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and then run [Start-NavDataUpgrade](/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet as follows:  

```  
Start-NavDataUpgrade -ServerInstance <ServerInstanceName>  
```  

Replace `<ServerInstanceName>` with the name of the [!INCLUDE[server](../developer/includes/server.md)] instance that is connected to the database.  

To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.  

The data upgrade process runs `CheckPreconditions` and `Upgrade` functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the `-SkipCompanyIntitialization` parameter.  

##  <a name="ImportPerms"></a> Task 13: Import upgraded permission sets and permissions

Import the permission sets and permissions XML files that you exported from the old database as follows:

1.  Delete all permission sets in the database except the SUPER permission set.  

    In Object Designer, run page 9802 **Permission Sets**, and then delete the permission sets except SUPER.  

2.  Run XMLport 9171 and XMLport 9172 to import the permission sets and permission XML files.

    For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ImportPerms).

##  <a name="UploadEncryptionKeys"></a> Task 14: Import Data Encryption Key \(Optional\)  

If you want to use data encryption as before, you must import the data encryption key file that was exported previously.  

For more information, see [Exporting and Importing Encryption Keys](how-to-export-and-import-encryption-keys.md). 

##  <a name="SetLang"></a> Task 15: Set the language of the customer database

In the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)], choose **Tools**, choose **Language**, and then select the language of the original customer database.  

##  <a name="AddControlAddins"></a> Task 16: Register client control add-ins  
The database is now fully upgraded and is ready for use. However, [!INCLUDE[prodshort](../developer/includes/prodshort.md)] includes the following client control add-ins.
-   Microsoft.Dynamics.Nav.Client.BusinessChart  
-   Microsoft.Dynamics.Nav.Client.DynamicsOnlineConnect
-   Microsoft.Dynamics.Nav.Client.FlowIntegration
-   Microsoft.Dynamics.Nav.Client.OAuthIntegration
-   Microsoft.Dynamics.Nav.Client.PageReady  
-   Microsoft.Dynamics.Nav.Client.PingPong  
-   Microsoft.Dynamics.Nav.Client.PowerBIManagement
-   Microsoft.Dynamics.Nav.Client.RoleCenterSelector
-   Microsoft.Dynamics.Nav.Client.SocialListening  
-   Microsoft.Dynamics.Nav.Client.TimelineVisualization
-   Microsoft.Dynamics.Nav.Client.VideoPlayer  
-   Microsoft.Dynamics.Nav.Client.WebPageViewer

To use these add-ins, they must be registered in table **2000000069 Client Add-in**. Depending on the version that you upgraded from, all the add-ins might not be registered after the upgrade process. You can register missing control add-ins in the **Control Add-ins** page in the client. The assemblies (.dlls) for these add-ins are in subfolders to the **Add-ins** folder of the [!INCLUDE[server](../developer/includes/server.md)] installation, which by default is [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\Service\Add-ins. For more information, see [How to: Register a Windows Client Control Add-in](/dynamics-nav/How-to--Register-a-Windows-Client-Control-Add-in).

<!--
## Task 17: Configure pages and reports included in the MenuSuite to be searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)]

The MenuSuite is no longer used to control whether a page or report can be found in the search feature of the Web client. This is now determined by specific properties on the page and report objects.  For more information, see [Making Pages and Reports Searchable After an Upgrade](upgrade-pages-report-for-search.md).

## Task 18. Transition the custom code from old codeunit 1 to use the new implementation

For more information, see [Transitioning from Codeunit 1](transition-from-codeunit1.md).  -->
 
## Task 17: Update the Web Server instance configuration file (navsettings.json)
If you have installed the [!INCLUDE[webserver](../developer/includes/webserver.md)], populate the navsettings.json file for the [!INCLUDE[webserver](../developer/includes/webserver.md)] instance with the settings of the old web.config file or navsettings.json.

For more information, see [Configuring Business Central Web Server Instances](../administration/configure-web-server.md).
  
##  <a name="DeleteUpgCodeunits"></a> Task 18: Delete the upgrade objects

At this point, you have upgraded the database to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Now, you can delete the upgrade codeunits and upgrade table objects that you imported in task 9. This task is recommended but not required.  

When you delete tables, on the **Delete** dialog box, set the **Synchronize Schema** option to **Force**.  

##  <a name="AddExtensions"></a> Task 19: Publish and install/upgrade extensions
Complete this task if you are upgrading from a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] deployment that uses V2 extensions or a Denmark (DK) version of [!INCLUDE[nav2017](../developer/includes/nav2017.md)] or earlier.

The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD) includes several new versions of Microsoft extensions (that is, extensions that have **Microsoft** as the publisher). If your old deployment uses these extensions, you have to upgrade the current versions to the new versions.

In addition, other extensions used in the old deployment that you still want to use must be repaired to work on the new platform.

> [!IMPORTANT]
> If you are upgrading from a Denmark (DK) version of Dynamics NAV 2017 or earlier, you must publish and install the following extensions to get the local functionality:
>
>|Name|Extension package|
>|----|---------|
>|Payroll Data Import Definitions (DK)| ImportDKPayroll.app| 
>|Payment and Reconciliation Formats (DK)|FIK.app |
>|Tax File Formats (DK)| VATReportsDK.app|

1. To get list of the extensions currently published on the application, run the following command from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]:

    ```
    Get-NAVAppinfo -ServerInstance <ServerInstanceName>
    ```
2. <a name="PublishSymbols"></a>Publish the system.app and test.app symbol files.

    If you installed the **AL Development Environment**, you can find the symbol files where your installed the environment, which by default is [!INCLUDE[prodx86installpath](../developer/includes/prodx86installpath.md)]. Otherwise, you can find the files in the **ModernDev** folder on the installation media. 

    To publish the symbols, open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```

3. <a name="GenerateSymbols"></a>Generate the application symbol references by using the finsql.exe file as follows:

    1. Make sure that **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) is set on the [!INCLUDE[server](../developer/includes/server.md)] instance.

        For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).
    2. Open a command prompt as an administrator, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and then run the following command:

        ```
        finsql.exe Command=generatesymbolreference, Database="<MyDatabaseName>", ServerName=<DatabaseServerName>\<DatabaseInstance>
        ```

        Replace values for the `Database` and `ServerName` settings to suit.

        > [!NOTE]  
        >  This command does not generate a file. It populates the **Object Metadata** table in the database.

    3. When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time. You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**. 
    
        When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred. 
            
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](../developer/devenv-running-cside-and-al-side-by-side.md).

4. Upgrade the Microsoft extensions that were published in the old deployment to new versions.

    The new versions are found in the `\Extensions` folder of the installation media. To upgrade to the new extension versions, follow these steps from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for each extension:

    1. Publish the new extension version by running the [Publish-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) cmdlet: 

        ```
        Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
        ```
           
    2.  Synchronize the schema with the database by running the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

        ```    
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```
    3. Upgrade the data of the extensions by running the [Start-NAVAppDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

        ```
        Start-NAVAppDataUpgrade -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ``` 

        Apart from upgrading the data, this command will install the new extension version.
    For more information about publishing extensions, see [Publish and Install an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md).


5. Repair, synchronize, and install other published extension versions that you still want to use, but have not been upgraded to new versions. 

    For each extension, complete the following steps from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]: 

    1. Compile the extension to make it work with the new platform by running the [Repair-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) cmdlet.

        ```
        Repair-NAVApp -ServerInstance <ServerInstanceName> -Name <Extension Name> -Version <N.N.N.N>
        ```
   2. Synchronize the schema with the database by running the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

        ```    
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```

    3. Install the extension by running the [Install-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) cmdlet:

        ```    
        Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```
   
6. (Optional) Unpublish unused extension versions by running the [Unpublish-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp): 
         
    ```
    Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Upgrading to Business Central](upgrading-to-business-central.md)
