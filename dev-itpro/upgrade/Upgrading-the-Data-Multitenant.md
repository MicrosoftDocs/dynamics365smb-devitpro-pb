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

[See print-friendly quick reference](multitenant-upgrade-checklist.md)

This article describes the tasks required for upgrading data to the latest [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in a multitenant deployment.

## About Data Upgrade

In this scenario, you already have an upgraded application that is mounted on a [!INCLUDE[server](../developer/includes/server.md)]. You will then mount the old tenants on the server instance and perform the data upgrade.

You use data conversion tools provided with [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to convert the old data with the old version’s table and field structure, so that it functions together with the new version’s table and field structure. Mainly, only table objects and table data are modified during the data upgrade process. Other objects, such as pages, reports, codeunits, and XMLports are upgraded as part of the application code upgrade process.

The data upgrade process described in this article leads you through the database conversion (technical upgrade) and then the upgrade of the actual data, which is achieved by using the upgrade toolkit/upgrade codeunits.


##  <a name="Prereqs"></a> Prerequisites  
Before you start the upgrade tasks, make sure you have the following prerequisites:

1. Your computer uses the same codepage as the data that will be upgraded.

    If you use conflicting codepages, some characters will not display in captions, and you might not be able to access the upgraded database. This is because [!INCLUDE[prodshort](../developer/includes/prodshort.md)] must remove incorrect metadata characters to complete the data upgrade. In this case, after upgrade, you must open the database in the development environment on a computer with the relevant codepage and compile all objects. This adds the missing characters again.
 
2. Custom V1 extensions used in [!INCLUDE[navnow](../developer/includes/navnow_md.md)] have been converted to V2 extensions.

    For more information, see [Converting Extensions V1 to Extensions V2](../developer/devenv-upgrade-v1-to-v2-overview.md).

3.  [!INCLUDE[prodshort](../developer/includes/prodshort.md)] has been installed with the upgraded application.

    As a minimum, you must install the following components:
    - [!INCLUDE[server](../developer/includes/server.md)] instance connected to the application database.
    - [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]
    - AL Development Environment
        
        This installs the required system and test symbols for V2 extensions.
    - [!INCLUDE[admintool](../developer/includes/admintool.md)] (optional)
    - [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] (not required for upgrade). 
    
    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

4. Obtain the .app packages for V2 extension versions currently published on the old deployment.

    To get a list of the extensions that are published, you can run the [Get-NAVAppInfo](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo) cmdlet of the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)]:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> 
    ```

5. Get the upgrade toolkit for the application version.

    The upgrade toolkit includes upgrade codeunits for handling the data upgrade.
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

6.  Permission sets (except SUPER) and permissions have been exported from the old tenant database.

    To exclude the SUPER permission set when running XMLPort 9171, add the filter `Role ID is <>SUPER`. 

    For more information, see [Exporting and Importing Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ExportPerms).


7.   If the old application uses data encryption, you have the encryption key file that it used for the data encryption.  

    For more information, see [Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md). 

8. Prepare for transitioning from codeunit 1.

    For more information, see [Transitioning from Codeunit 1](transition-from-codeunit1.md).

> [!NOTE]
> If the old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] application uses Payment Services for Microsoft Dynamics ERP, be aware that this was discontinued in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. This means that most of the objects that are associated with this feature will be deleted during the upgrade. Some objects you will have to manually delete. 

## <a name="AddExtensions"></a>Prepare the application for data upgrade

1. Import upgrade toolkit.

    For more information, see [Importing Objects](../cside/cside-import-objects.md).

2. Publish the system and test symbols.
  
    Symbols are a prerequisite for extensions. If you installed the **AL Development Environment**, you can find the symbol files where your installed the environment, which by default is [!INCLUDE[prodx86installpath](../developer/includes/prodx86installpath.md)]. Otherwise, you can find the files in the **ModernDev** folder on the installation media. 

    To publish the symbols, open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```

3. Generate the application symbol references by using the finsql.exe file as follows:

    1. Make sure that **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) is set on the [!INCLUDE[server](../developer/includes/server.md)] instance.

        For more information, see [Configuring Dynamics NAV Server](../administration/configure-server-instance.md).
    2. Open a command prompt as an administrator, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and then run the following command:

        ```
        finsql.exe Command=generatesymbolreference, Database="<MyDatabaseName>", ServerName=<DatabaseServerName>\<DatabaseInstance>
        ```

        Replace values for the `Database` and `ServerName` settings to suit.

        > [!NOTE]  
        >  This command does not generate a file. It populates the **Object Metadata** table in the database.

    3. When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time. You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**. 
    
        When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred. 
            
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](developer/devenv-running-cside-and-al-side-by-side.md).

 
4. Publish the V2 extension versions that were published on the old environment

    For each extension version, run the the [Publish-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) cmdlet of the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
    ```
5. Publish new versions of the Microsoft extensions

    The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD) includes several new versions of Microsoft extensions (that is, extensions that have **Microsoft** as the publisher). If your old deployment uses these extensions, you have to upgrade the old versions to the new versions.

    > [!IMPORTANT]
    > If you are upgrading from a Denmark (DK) version of Dynamics NAV 2017 or earlier, you must publish and install the following extensions to get the local functionality:
    >
    >|Name|Extension package|
    >|----|---------|
    >|Payroll Data Import Definitions (DK)| ImportDKPayroll.app| 
    >|Payment and Reconciliation Formats (DK)|FIK.app |
    >|Tax File Formats (DK)| VATReportsDK.app|

    The new versions are found in the the `\Extensions` folder of the installation media.

    To publish the new extension version, run the [Publish-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) cmdlet: 

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
    ```

6. Upload a [!INCLUDE[prodshort_md](../developer/includes/prodshort.md)] partner license

    For more information, see [Uploading a License](../cside/cside-upload-licencse-file.md).      

## Prepare the tenant database for data upgrade

You perform these tasks on each tenant that you want to upgrade.

1. Backup the tenant database.

    Create a full backup of the old database in the SQL Server. Alternatively, you can make a copy of the old database and perform the upgrade tasks on the copy.  

    For more information, see [Create a Full Database Backup \(SQL Server\)](http://go.microsoft.com/fwlink/?LinkID=296465).  

2. Uninstall all V1 extensions.

    Make sure that all V1 extensions are uninstalled. Open the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)] that matches to old database, and run these commands:
 
    1. To get a list of the V1 extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <OldServerInstanceName> -Tenant <TenantID>
    ```
    
    V1 extensions are indicated by `CSIDE` in the `Extension Type` column.
    2. For each extension, run the [Uninstall-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet to uninstall it:

    ```
    Uninstall-NAVApp -ServerInstance <OldServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

3. Dismount the tenant.

    Before you upgrade the tenant, you must dismount it from the old server instance. To dismount the tenant, run the [Dismount-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```
    Dismount-NAVTenant -ServerInstance <OldServerInstanceName> -Tenant <TenantID>
    ```

## Run the data upgrade on the tenant

You perform these tasks on each tenant that you want to upgrade.

1. Mount the tenant.

    Mount the tenant on the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the application database. To mount the tenant, use the [Mount-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/mount-navtenant) cmdlet:

    ```
    Mount-NAVTenant -ServerInstance <ServerInstanceName> -Tenant <TenantID> --AllowAppDatabaseWrite 
    ```
    > [!NOTE]  
    > For upgrade, we recommend that you use the `-AllowAppDatabaseWrite` parameter. After upgrade, you can dismount and mount the tenant again without the parameter if needed.


2. Synchronize the tenant.
 
    Synchronize the tenant database schema with validation by running the the [Sync-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. 

    ```
    Set-NAVTenant -ServerInstance <ServerInstanceName> -Tenant <TenantID>
    ```

3. Synchronize all published extensions.
    
    Synchronize the schema with the database by running the [Sync-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet for each extension version:

    ```    
    Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

4. Run the data upgrade.

    A data upgrade runs the upgrade toolkit objects, such as upgrade codeunits and upgrade tables, to migrate business data from the old table structure to the new table structure. It will also upgrade the published extensions. 

    You can start the data upgrade by running the  run [Start-NavDataUpgrade](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]:

    ```  
    Start-NavDataUpgrade -ServerInstance <ServerInstanceName>   
    ```  

     **Important:** If you have extensions, then you must run the data upgrade so that it executes functions in the serial mode.

    ```  
    Start-NavDataUpgrade -ServerInstance <ServerInstanceName> -FunctionExecutionMode Serial 
    ```  

    To view the progress of the data upgrade, you can run [Get-NavDataUpgrade](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/get-navdataupgrade) cmdlet with the `–Progress` switch. 

    The data upgrade process runs `CheckPreconditions` and `Upgrade` functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the `-SkipCompanyIntitialization` parameter.  

5. Install extensions.

    Install the desired extensions on the tenant by running the [Install-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) cmdlet:

    ```    
    Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```


## Post-upgrade tasks

1. Transition custom code that used codeunit 1 to use the management codeunits.

    For more information, see [Transitioning from Codeunit 1](transition-from-codeunit1.md).

2. Import permissions and permission sets.

    Import the permission sets and permissions XML files that you exported from the old database as follows:

    1.  Delete all permission sets in the database except the SUPER permission set.  

        In Object Designer, run page 9802 **Permission Sets**, and then delete the permission sets except SUPER.  

    2.  Run XMLport 9171 and XMLport 9172 to import the permission sets and permission XML files.

        For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ImportPerms).
3. Import encryption keys.

    For more information, see [Exporting and Importing Encryption Keys](how-to-export-and-import-encryption-keys.md).


4. Configure pages and reports included in the MenuSuite to be searchable in the Web client.

    The MenuSuite is no longer used to control whether a page or report can be found in the search feature of the Web client. This is now determined by specific properties on the page and report objects.  For more information, see [Making Pages and Reports Searchable After an Upgrade](upgrade-pages-reports-for-search.md).
5. Upload the customer license.

    For more information, see [Uploading the License File](../cside/cside-upload-license-file.md)



## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Upgrading to Microsoft Dynamics NAV](upgrading-to-business-central.md)
