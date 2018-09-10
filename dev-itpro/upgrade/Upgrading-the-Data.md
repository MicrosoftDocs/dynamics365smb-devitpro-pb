---
title: Upgrading the Database
description: This article describes the tasks required for upgrading from the earlier versions of database to Dynamics 365 Business Central.
ms.custom: na
ms.date: 03/05/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.prod: "dynamics-nav-2018"
---
# Upgrading the Data to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

This topic describes the tasks required for upgrading the following database versions to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

## About Data Upgrade

You use data conversion tools provided with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to convert the old data with the old version’s table and field structure, so that it functions together with the new version’s table and field structure. Mainly, only table objects and table data are modified during the data upgrade process. Other objects, such as pages, reports, codeunits, and XMLports are upgraded as part of the application code upgrade process.

The data upgrade process described in this article leads you through the database conversion (technical upgrade) and then the upgrade of the actual data, which is achieved by using the upgrade toolkit/upgrade codeunits.

##  <a name="Prereqs"></a> Prerequisites  
Before you start the upgrade tasks, make sure you meet the following prerequisites:
1.  Your computer uses the same codepage as the data that will be upgraded.

    If you use conflicting codepages, some characters will not display in captions, and you might not be able to access the upgraded database. This is because [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] must remove incorrect metadata characters to complete the data upgrade. In this case, after upgrade, you must open the database in the development environment on a computer with the relevant codepage and compile all objects. This adds the missing characters again.

    Optionally, you can export the captions before the upgrade. For more information, see [How to: Add Translated Strings for Conflicting Text Encoding Formats](How-to--Add-Translated-Strings-for-Conflicting-Text-Encoding-Formats.md).

2.  You have a FOB file(s) that contains the upgraded application code (single-tenant only) and upgrade toolkit. The upgrade toolkit includes upgrade codeunits for handling the data upgrade. The upgrade toolkit can be in the same FOB file as the application code or in a separate FOB file.  

    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

    For W1 versions, you can find the default upgrade toolkit objects in the  **UpgradeToolKit\Data Conversion Tools** folder on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD). Choose the FOB that matches the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] version from which you are upgrading:

    |  Version  |  FOB  |  Remarks  |
    |-----------|-------|-----------|
    |[!INCLUDE[nav7long](../developer/includes/nav7long_md.md)]|Upgrade7001100.FOB|This file can be found on the [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] [Cumulative Update 2 installation media (DVD)](https://support.microsoft.com/en-us/help/4078580/cumulative-update-02-for-microsoft-dynamics-nav-2018-build-20348?preview). It is not available with later cumulative updates.|
    |[!INCLUDE[navsicily](../developer/includes/navsicily_md.md)]|Upgrade7101100.FOB and Upgrade710HF1100.FOB|This file can be found on the [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] [Cumulative Update 2 installation media (DVD)](https://support.microsoft.com/en-us/help/4078580/cumulative-update-02-for-microsoft-dynamics-nav-2018-build-20348?preview). It is not available with later cumulative updates.|
    | [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]| Upgrade8001300.FOB||
    | [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]| Upgrade9001300.FOB||
    |[!INCLUDE[nav2017](../developer/includes/nav2017.md)]| Upgrade10001300.FOB||
    |[!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]| Upgrade11001300.FOB||

    For local versions, you will find the upgrade toolkit objects in the **UpgradeToolKit\Local Objects** folder. The files follow the same naming convention except they include the 2-letter local version, such as **Upgrade11001300.DK.fob** for Denmark or **Upgrade11001300.DE.fob** for Germany.  

3.  You have exported the permission sets (except SUPER) and permissions as XML files.

    To exclude the SUPER permission set when running XMLPort 9171, add the filter `Role ID is <>SUPER`. 

    For more information, see [Exporting and Importing Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ExportPerms).

4. Custom V1 extensions have been converted to V2 extensions.

5.  Install [!INCLUDE[prodshort](../developer/includes/prodshort.md)] components: 

    As a minimum, you must install the following components:
    - Server
    - SQL Server Components
    -  [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)]
    - [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)]
    - AL Development Environment
    - (optionally) [!INCLUDE[admintool](../developer/includes/admintool.md)]

    For more information, see [Installing Business Central Using Setup](../deployment/install-using-setupn.md).

5.   \(Optional\) Make a copy of the web.config file for all [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] instances for the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)]. With [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)], [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] instances run on Microsoft .NET Core. With this change, the instances now use a .json type file (called navsettings.json) instead of the web.config file.

6.   If the old application uses data encryption, you exported the encryption key file that it used for the data encryption.  

        For more information, see [How to: Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md).  

> [!NOTE]
>If the old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] application uses Payment Services for Microsoft Dynamics ERP, be aware that this was discontinued in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. This means that most of the objects that are associated with this feature will be deleted during the upgrade. Some objects you will have to manually delete. 

##  <a name="SQLBackup"></a> Task 1: Create a full SQL backup of the old database on SQL Server  
 You must create a full backup of the old database in the SQL Server. Alternatively, you can make a copy of the old database and perform the upgrade tasks on the copy.  

 For more information, see [Create a Full Database Backup \(SQL Server\)](http://msdn.microsoft.com/en-us/library/ms187510.aspx).  

## Task 2 Uninstall all extensions in old database 
Open the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)] that matches to old database, and run these commands: 
1.  To get a list of the extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID>
    ```
    
    Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server_md](../developer/includes/nav_server_md.md)] instance that the database connects to. Replace `<TenantID>` with the tenant ID of the database. If you do not have a multitenant server instance, use `default`.

    <!-- In the table that appears, V1 extensions are indicated by `CSIDE` in the `Extension Type` column.-->

    <!-- V1 extensions have `ExtensionType` of `CSIDE`. Make a note of the V1 extensions that you will uninstall because you will reinstall these later, after you upgrade the database.-->
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

For more information, see [[Uploading a License File for a Specific Database](../cside/upload-license-file.md#UploadtoDatabase).  

##  <a name="DeleteObjects"></a> Task 5: Delete all objects except tables from the old database   
In the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] version that matches the database, open the old database, open Object Designer, select all objects except tables, and then choose **Delete**.

You can also use the [DeleteObjects](DeleteObjects.md) command of the finsql.exe.


## Task 7: Clear Dynamics NAV Server instance and debugger breakpoint records from old database
Clear all records from the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in the database in SQL Server.  

1.  Make sure that you stop the old server instance, and close any tools that connect to the database, such as the Dynamics NAV Administration Tool and [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)].
2.  Using SQL Server Management Studio, open and clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables of the old database. For example, you can run the following SQL query:

    ```
    DELETE FROM [<My NAV Database Name>].[dbo].[Server Instance]
    DELETE from [<My NAV Database Name>].[dbo].[Debugger Breakpoint]
    ```

##  <a name="ConvertDb"></a> Task 8: Convert the old database to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] format

If the database is on Azure SQL Database, you must first add your user account to the **dbmanager** database role on master database. This membership is only required for converting the database, and can be removed afterwards. 

To convert the old database to the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] format, open the old database in the new [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)], and follow the conversion instructions.

> [!IMPORTANT]
> Do not run schema synchronization at this time. Choose to run it **later**.


##  <a name="ImportAppObj"></a> Task 9: Import the upgraded application objects
Using [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] for , import the application objects that you want in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. This includes the application objects FOB file (from the application code upgrade) and the upgrade toolkit objects FOB file.

1. Import the application objects FOB file first, and then import the upgrade toolkit FOB file.

    For more information, see [How to: Import Objects](how-to--import-objects.md).

2. **IMPORTANT** When prompted about table synchronization, set the **Synchronize Schema** option to **Later**.  

3. When you import the FOB file, if you experience metadata conflicts, the **Import Worksheet** windows appears.

    Review the Worksheet page. For more information, see [Import Worksheet](../cside/cside-import-worksheet.md).
    
    Choose **Replace All**, and then **OK** to continue.


##  <a name="ConnectToServer"></a> Task 10: Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted database
You use the [!INCLUDE[admintool](../developer/includes/admintool.md)] for  or [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?linkid=401394) in the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] to connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted database.  

The service account that is used by the [!INCLUDE[server](../developer/includes/server.md)] instance must be a member of the **db\_owner** role in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database on SQL Server or Azure SQL Database.

> [!IMPORTANT]  
>  When upgrading a large database, you should increase the **SQL Command Timeout** setting for the [!INCLUDE[server](../developer/includes/server.md)] instance, to avoid timeouts during schema synchronization. The default setting is 30 minutes.  

For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md) and [Giving the account necessary database privileges in SQL Server](../deployment/provision-server-account.md#dbo).

##  <a name="CompSysTables"></a> Task 11: Compile all objects
1. In the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], set it to use the server instance that connects to the database.

    For more information, see [Changing the Server Instance](../cside/cside-change-server-instance.md).  

2. Use the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or finsql.exe to compile all objects. This includes the imported application objects, data tables, and system tables. 

    > [!IMPORTANT]
    >Choose to run schema synchronization later. For example, in Object Designer, choose **Tools**, choose **Compile**, set the **Synchronize Schema** option to **Later**, and then choose **OK**. For more information, see [Compiling Objects](../cside/compiling-objects.md).

3. ([!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)] and earlier only) If you get errors on the following table objects, use the Object Designer to delete the objects because they are no longer used.

    -   Table 470 Job Queue (replaced by the [Task Scheduler](Task-Scheduler.md))
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

##  <a name="RunSync1"></a> Task 12: Run the schema synchronization on the imported objects
Synchronize the database schema with validation.

For example, run the [Sync-NAVTenant]([!INCLUDE[adminshell](../developer/includes/adminshell.md)].  

For more information, see [Synchronizing the Tenant Database and Application Database](../adminsitration/synchronize-tenant-database-and application-database.md).

##  <a name="RunStartNavUpgrade"></a> Task 13: Run the data upgrade process  
A data upgrade runs the upgrade toolkit objects, such as upgrade codeunits and upgrade tables, to migrate business data from the old table structure to the new table structure. You can start the data upgrade from the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] or [!INCLUDE[adminshell](../developer/includes/adminshell.md)].  

> [!NOTE]  
>  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the Start-NavDataUpgrade cmdlet and set the *-SkipCompanyIntitialization* parameter.  


Open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and then run Start-NavDataUpgrade cmdlet as follows:  

```  
Start-NavDataUpgrade -ServerInstance <ServerInstanceName> -Force  
```  

Replace `<ServerInstanceName>` with the name of the [!INCLUDE[server](../developer/includes/server.md)] instance that is connected to the database.  

To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.  

The data upgrade process runs `CheckPreconditions` and `Upgrade` functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the `-SkipCompanyIntitialization` parameter.  

##  <a name="ImportPerms"></a> Task 14: Import upgraded permission sets and permissions by using the Roles and Permissions XMLports  
You import the permission sets and permissions XML files.

1.  Delete all permission sets in the database except the SUPER permission set.  

    In Object Designer, run page 9802 **Permission Sets**, and then delete the permission sets.  

2.  Run XMLport 9171 and XMLport 9172 to import the permission sets and permission XML files.

    For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ImportPerms).

##  <a name="SetLang"></a> Task 15: Set the language of the customer database  
 In the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)], choose **Tools**, choose **Language**, and then select the language of the original customer database.  

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

To use these add-ins, they must be registered in table **2000000069 Client Add-in**. Depending on the version that you upgraded from, all the add-ins might not be registered after the upgrade process. You can register missing control add-ins in the **Control Add-ins** page in the client. The assemblies (.dlls) for these add-ins are in subfolders to the **Add-ins** folder of the [!INCLUDE[server](../developer/includes/server.md)] installation, which by default is [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\Service\Add-ins. For more information, see [How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md).


<!-- deprecated ##  <a name="UploadEncryptionKeys"></a> Task 16: Import Payment Services and Data Encryption Key \(Optional\)  

-   If you want to set up Payment Services for Microsoft Dynamics ERP as before, you must upload the payment service encryption key file that was downloaded previously.  

     You upload the encryption key from the **DO Payment Connection Setup** window in the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] client. For more information, see [DO Payment Connection Setup](assetId:///58e1ceda-e705-41f4-9f28-a027d8b816f9).  

-   If you want to use data encryption as before, you must import the data encryption key file that was exported previously.  

     For more information, see [How to: Export and Import Encryption Keys](How-to--Export-and-Import-Encryption-Keys.md).  -->


## Task 17: Configure pages and reports included in the MenuSuite to be searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)]

The MenuSuite is no longer used to control whether a page or report can be found in the search feature of the Web client. This is now determined by specific properties on the page and report objects.  For more information, see [Making Pages and Reports Searchable After an Upgrade](upgrade-pages-reports-for-search.md).

## Task 18. Transition the custom code in the old codeunit 1 to use the new system event implentation
 
## Task 19: Update the Dynamics NAV Web client configuration file (navsettings.json)
If you have installed the [!INCLUDE[nav_web_server_md](../developer/includes/nav_web_server_md.md)], populate the navsettings.json file for the [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] instance with the settings of the old web.config file.

For more information, see [Configuring Microsoft Dynamics NAV Web Client by Modifying the NavSettings.json File](configure-web-server.md.md).
  
##  <a name="DeleteUpgCodeunits"></a> Task 20: Delete the upgrade objects
At this point, you have upgraded the database to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Now, you can delete the upgrade codeunits and upgrade table objects that you imported in task 9. This task is recommended but not required.  

When you delete tables, on the **Delete** dialog box, set the **Synchronize Schema** option to **Force**.  
##  <a name="DeleteUpgCodeunits"></a> Task 21: Delete the upgrade objects
At this point, you have upgraded the database to [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. Now, you can delete the upgrade codeunits and upgrade table objects that you imported in task 9. This task is recommended but not required.  

##  <a name="AddExtensions"></a> Task 20: Publish and install/upgrade extensions
Complete this task if you are upgrading from a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] deployment that uses V2 extensions or a Denmark (DK) version of [!INCLUDE[nav2017](../developer/includes/nav2017.md)] or earlier. With a Denmark (DK) version, local functionality has been moved from the base application to V2 extensions. [!INCLUDE[prodshort](../developer/includes/prodshort.md)] includes several new extension versions that you can upgrade to. 

1. Publish the system.app and test.app symbol files. 

    If you installed the **AL Development Environment**, you can find the symbol files where your installed the environment, which by default is [!INCLUDE[prodx86installpath](../developer/includes/prodx86installpath.md)]. Otherwise you can find the files in the **ModernDev** folder on the installation media. 

    To publish, open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```

4. Generate the application symbol references by using the finsql.exe file:

    1. Make sure that **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) is set on the [!INCLUDE[server](../developer/includes/server.md)] instance.

        For more information, see [Configuring Dynamics NAV Server](../administration/configure-server-instance.md).
    2. Open a command prompt, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and then run the following command:

        ```
        finsql.exe Command=generatesymbolreference, Database=<MyDatabaseName>, ServerName=<DatabaseServerName>\<DatabaseInstance>
        ```

        Replace values for the `Database` and `ServerName` settings to suit.

        > [!NOTE]  
        >  This command does not generate a file. It populates the **Object Metadata** table in the database.
    2. When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time. You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**. 
    
        When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred. 
            
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](developer/devenv-running-cside-and-al-side-by-side.md).

5. Publish new versions of any Microsoft extensions that were published on the old environment.

    The new versions are found in the the `\Extensions` folder of the installation media (DVD).

    > [!IMPORTANT]
    > For a Denmark (DK) local version, if you are upgrading from Dynamics NAV 2017 or earlier, you must publish the following extensions to get the local functionality: 

    |Name|Publisher|Version|
    |----|---------|-------|
    |Payroll Data Import Definitions (DK)|    Microsoft| |
    |Payment and Reconciliation Formats (DK)| Microsoft| |
    |Tax File Formats (DK)| Microsoft| |

    To publish extensions, follow these steps:

    1. From the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], run the following command for each extension.

        ```
        Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
        ```
           
    2.  For each Extension V2, run the following command to synchronize its schema with the database:

        ```    
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```

    For more information about publishing extensions, see [Publish and Install an Extension](developer/devenv-how-publish-and-install-an-extension-v2.md).
<!--
6.  Upgrade the V1 extensions that you uninstalled previously in Task 3 by reinstalling them. From the [!INCLUDE[adminshell](../developer/includes/adminshell.md)], run the following commands: 

    1. To get a list of the published extensions on the server instance, run this command:
    
        ```
        Get-NAVAppInfo -ServerInstance <ServerInstanceName>
        ```

    2. To determine which V1 extensions to install, inspect the list that appears, and compare it with the list that you gathered in Task 3. V1 extensions are indicated by `Extension Type : CSIDE`.
    
        -   If there is only one version of an extension, which matches the version in the old list, then go to step 6c to reinstall the version. 
        -   If there is a newer version of an extension and its `Extension Type` is also `CSIDE`, then go to step 6c to install and upgrade to the newer V1 extension. 
        -   If there is a newer version of an extension but its `Extension Type` is `ModernDev`, then go to step 6d to upgrade the old V1 extension to the V2 extension. 

    3. For each V1 Extension that you want to reinstall or upgrade, run this command:
    
        ```  
        Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> –Tenant <TenantID>
        ```
    
        Replace `<Name>` and `<N.N.N.N>` with the name and version of the Extension V1 as it appeared in the previous step. For `<TenantID>`, in single-tenant deployments, you either specify `default` or you omit the `–Tenant` parameter.
        
        This will upgrade the V1 extensions.

        Optionally, if you installed a newer version of an extension, unpublish the old version: 
         
        ```
        Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```
    4.  For each V1 Extension that you want to upgrade to a V2 Extension, run these commands:

        ```
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        Start-NAVAppDataUpgrade -ServerInstance DynamicsNAV -Name ProswareStuff -Version <N.N.N.N>
        ``` 
        This will upgrade the V2 extensions.

        Optionally, unpublish the V1 extension.
          
        ```
        Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```
-->
7. If upgrading from a Denmark (DK) version of [!INCLUDE[nav2017](../developer/includes/nav2017.md)] or earlier, install the following extensions.

    |Name|Publisher|Version|
    |----|---------|-------|
    |Payroll Data Import Definitions (DK)|    Microsoft| 1.0.19502.0 (or later)|
    |Payment and Reconciliation Formats (DK)| Microsoft| 1.0.19502.0 (or later)|
    |Tax File Formats (DK)| Microsoft| 1.0.19502.0 (or later)|

    For each Extension V2, run this command:

    ```
    Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> 
    ```
7. (Optional) Unpublish unwanted older extension versions: 
         
        ```
        Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```
8. Repair your custom V2 extensions to make them work with the new platform. 

    Use the [Repair-NAVApp cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) of the [!INCLUDE[navnowlong_md](../developer/includes/navnowlong_md.md)] Administration Shell to compile the published extensions to make sure they are work with the new platform and application.

    For example, you can run the following command to recompile all extensions:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> | Repair-NAVApp
    ```
   



<!-- 
7.  Upgrade V2 extensions that are currently installed: 

    1. To get a list of the installed V2 extensions, run this command:
    
        ```
        Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID>
        ```
        
        Replace `<ServerInstanceName>` with the name of the [!INCLUDE[nav_server_md](../developer/includes/nav_server_md.md)] instance that the database connects to. Replace `<TenantID>` with the tenant ID of the database. If you do not have a multitenant server instance, use `default`.
        
        V2 extensions are indicated by `Extension Type : ModernDev`.
    2. For each Extension V2 that you want to upgrade, run these commands:

        ```
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        Start-NAVAppDataUpgrade -ServerInstance DynamicsNAV -Name ProswareStuff -Version <N.N.N.N>
        ``` 
    
        This will upgrade the V2 extensions.
-->

## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Automating the Upgrade Process using Sample Windows PowerShell Scripts](Automating-the-Upgrade-Process-using-Sample-Windows-PowerShell-Scripts.md)   
 [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md)   
 [Upgrading to Microsoft Dynamics NAV](Upgrading-to-Microsoft-Dynamics-NAV.md)
