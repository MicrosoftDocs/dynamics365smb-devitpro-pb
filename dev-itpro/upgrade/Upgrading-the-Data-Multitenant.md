---
title: Upgrading the Database to in a Multitenant Deployment
description: This article describes the tasks required for upgrade the data when you have a multitenant deployment. 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
---
# Upgrading the Data to [!INCLUDE[prod_short](../developer/includes/prod_short.md)]: Multitenant Deployment

[See print-friendly quick reference](multitenant-upgrade-checklist.md)

This article describes the tasks required for upgrading data to the latest [!INCLUDE[prod_short](../developer/includes/prod_short.md)] in a multitenant deployment.

## About Data Upgrade

In this scenario, you already have an upgraded application that is mounted on a [!INCLUDE[server](../developer/includes/server.md)]. You will then mount the old tenants on the server instance and perform the data upgrade.

You use data conversion tools provided with [!INCLUDE[prod_short](../developer/includes/prod_short.md)] to convert the old data with the old version's table and field structure, so that it functions together with the new version's table and field structure. Mainly, only table objects and table data are modified during the data upgrade process. Other objects, such as pages, reports, codeunits, and XMLports are upgraded as part of the application code upgrade process.

The data upgrade process described in this article leads you through the database conversion (technical upgrade) and then the upgrade of the actual data, which is achieved by using the upgrade toolkit/upgrade codeunits.

> [!IMPORTANT]  
> Before you begin, read the article [Important Information and Considerations for Before Upgrading](upgrade-considerations.md). This article contains information about limitations and things that might require you to perform extra tasks before you upgrade, such as the use of extensions V1 and the deprecation of codeunit 1. 

##  <a name="Prereqs"></a> Prerequisites

Before you start the upgrade tasks, make sure you have the following prerequisites:

1. Your computer uses the same codepage as the data that will be upgraded.

    If you use conflicting codepages, some characters will not display in captions, and you might not be able to access the upgraded database. This is because [!INCLUDE[prod_short](../developer/includes/prod_short.md)] must remove incorrect metadata characters to complete the data upgrade. In this case, after upgrade, you must open the database in the development environment on a computer with the relevant codepage and compile all objects. This adds the missing characters again.
 
2. (Upgrading from [!INCLUDE[navnow](../developer/includes/navnow_md.md)] only) Custom V1 extensions used in [!INCLUDE[navnow](../developer/includes/navnow_md.md)] have been converted to V2 extensions.

    For more information, see [Converting Extensions V1 to Extensions V2](../developer/devenv-upgrade-v1-to-v2-overview.md).

3. [!INCLUDE[prod_short](../developer/includes/prod_short.md)] has been installed with the upgraded application and upgrade toolkit.

    As a minimum, you must install the following components:
    - [!INCLUDE[server](../developer/includes/server.md)] instance connected to the application database.
    - [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] for [!INCLUDE[prod_short](../developer/includes/prod_short.md)]
    - AL Development Environment
        
        This installs the required system and test symbols for V2 extensions.
    - [!INCLUDE[admintool](../developer/includes/admintool.md)] (optional)
    - [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] (not required for upgrade). 
    
    For more information about upgrading the application code, see [Upgrading the Application Code](Upgrading-the-Application-Code.md).

4. Permission sets (except SUPER) and permissions have been exported from the old tenant database.

    - When upgrading from [!INCLUDE[navnow](../developer/includes/navnow_md.md)]

      To export permission sets and permissions, you run running XMLPort 9171 and 9172.

      It is important that you exclude the SUPER permission set when running XMLPort 9171. You can do this by adding the filter `Role ID is <>SUPER`.

      For more information, see [Exporting and Importing Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ExportPerms).

    - When upgrading from an earlier version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)]

        In the client, search for and open the **Permission Sets** page, select the user-defined permission sets that you want to keep, and then choose **Export Permission Sets**.

5. If the old application uses data encryption, you have the encryption key file that it used for the data encryption.  

    For more information, see [Export and Import Encryption Keys](how-to-export-and-import-encryption-keys.md). 

> [!NOTE]
> If the old [!INCLUDE[navnow](../developer/includes/navnow_md.md)] application uses Payment Services for Microsoft Dynamics ERP, be aware that this was discontinued in [!INCLUDE[nav2017](../developer/includes/nav2017.md)]. This means that most of the objects that are associated with this feature will be deleted during the upgrade. Some objects you will have to manually delete. 

<!--

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
            
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](../developer/devenv-running-cside-and-al-side-by-side.md).

 
4. <a name="PublishNew"></a>Publish new versions of the Microsoft extensions.

    The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] installation media (DVD) includes several new versions of Microsoft extensions (that is, extensions that have **Microsoft** as the publisher). If your old deployment uses these extensions, you have to upgrade the old versions to the new versions.

    > [!IMPORTANT]
    > For Denmark (DK) and German (DE) versions. Some of the local functionality has been moved from the base application to extensions.
    >
    > If you are upgrading from a Denmark (DK) version of Dynamics NAV 2017 or earlier, you must publish and install the following extensions to get the local functionality:
    >
    >|Name|Extension package|
    >|----|---------|
    >|Payroll Data Import Definitions (DK)| ImportDKPayroll.app| 
    >|Payment and Reconciliation Formats (DK)|FIK.app |
    >|Tax File Formats (DK)| VATReportsDK.app|
    >
    > If you are upgrading from a German (DE) version of Dynamics NAV or [!INCLUDE[prod_short](../developer/includes/prod_short.md)] October 2018 (Cumulative Update 2 or earlier), you must publish and install the following extensions to get the local functionality:
    >
    >|Name|Extension package|
    >|----|---------|
    >|ELSTER VAT Localization for Germany| Elster.app|

    The new versions are found in the `\Extensions` folder of the installation media.

    To publish the new extension version, run the [Publish-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) cmdlet: 

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
    ```


5. Upload a [!INCLUDE[prod_short_md](../developer/includes/prod_short.md)] partner license

    For more information, see [Uploading a License](../cside/cside-upload-license-file.md).      
-->

## Prepare the tenant database for data upgrade

You perform these tasks on each tenant that you want to upgrade.

1. Backup the tenant database.

    Create a full backup of the old database in the SQL Server. Alternatively, you can make a copy of the old database and perform the upgrade tasks on the copy.  

    For more information, see [Create a Full Database Backup \(SQL Server\)](/sql/relational-databases/backup-restore/create-a-full-database-backup-sql-server).  

2. (Dynamics NAV upgrade only) Uninstall all V1 extensions.

    Make sure that all V1 extensions are uninstalled. Open the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)] that matches to old database, and run these commands:
 
    1. To get a list of the V1 extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <OldServerInstanceName> -Tenant <TenantID>
    ```
    
    V1 extensions are indicated by `CSIDE` in the `Extension Type` column.
    2. For each extension, run the [Uninstall-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet to uninstall it:

    ```
    Uninstall-NAVApp -ServerInstance <OldServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

3. Dismount the tenant.

    Before you upgrade the tenant, you must dismount it from the old server instance. To dismount the tenant, run the [Dismount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```
    Dismount-NAVTenant -ServerInstance <OldServerInstanceName> -Tenant <TenantID>
    ```

## Run the data upgrade on the tenant

You perform these tasks on each tenant that you want to upgrade.

1. Mount the tenant.

    Mount the tenant on the new [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the newly application database. To mount the tenant, use the [Mount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant) cmdlet:

    ```
    Mount-NAVTenant -ServerInstance <ServerInstanceName> -DatabaseName <Database name> -DatabaseServer <server\instance> -Tenant <TenantID> -AllowAppDatabaseWrite
    ```
    
    > [!IMPORTANT]
    > You must use the same tenant ID for the tenant that was used in the old deployment; otherwise you will get an error when mounting or syncing the tenant. If you want to use a different ID for the tenant, you can either use the `-AlternateId` parameter now or after upgrading, dismount the tenant, then mount it again using the new ID and the `OverwriteTenantIdInDatabase` parameter.  
    
    > [!NOTE]  
    > For upgrade, we recommend that you use the `-AllowAppDatabaseWrite` parameter. After upgrade, you can dismount and mount the tenant again without the parameter if needed.

2. Synchronize the tenant.
 
    Synchronize the tenant database schema with validation by running the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. 

    ```
    Sync-NAVTenant -ServerInstance <ServerInstanceName> -Tenant <TenantID>
    ```

    When completed, the tenant should have the status **OperationalDataUpgradePending** or, if there are published extensions with newer versions than on the tenant, **OperationalSyncPending**. To verify this, run the following cmdlet:

    ```
    Get-NAVTenant -ServerInstance <ServerInstanceName> -tenant default -ForceRefresh
    ```

3. If there are published extensions with newer versions than on the tenant, synchronize all published extensions with the tenant database.
    
    Synchronize the schema with the database by running the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet for each extension version:

    ```    
    Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> -Tenant <TenantID>
    ```

    Or, to synchronize all published extensions using one command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID> | % { Sync-NAVApp -ServerInstance <ServerInstanceName> -Name $_.Name -Version $_.Version }
    ```

    When completed, the tenant should have the status **OperationalDataUpgradePending**.
4. Run the data upgrade.

    A data upgrade runs the upgrade toolkit objects, such as upgrade codeunits and upgrade tables, to migrate business data from the old table structure to the new table structure. It will also upgrade the published extensions. 

    1. Open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and then run [Start-NavDataUpgrade](/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet as follows:  

    ```  
    Start-NavDataUpgrade -ServerInstance ServerInstanceName> -FunctionExecutionMode Serial -ContinueOnError  
    ```  
    
    Replace `<ServerInstanceName>` with the name of the [!INCLUDE[server](../developer/includes/server.md)] instance that is connected to the database.
    
    > [!NOTE]  
    >  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the `Start-NavDataUpgrade` with the `-SkipCompanyIntitialization` parameter. 
    
    To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.  

    The data upgrade process runs `CheckPreconditions` and `Upgrade` functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the `-SkipCompanyIntitialization` parameter.

    2. Check for and resolve upgrade errors.
    
        Run the following command to get a list of any errors that have occurred:
    
        ``` 
        Get-NAVDataUpgrade ServerInstanceName> -ErrorOnly
        ``` 
    
        Resolve the errors before going to the next step.  

5. Install extensions on the tenant.

    Install the desired extensions on the tenant by running the [Install-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) cmdlet:

    ```    
    Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

## Post-upgrade tasks

1. Import permission sets and permissions

   Import the permission sets and permissions XML files that you exported from the old database as follows:

    - For upgrade from [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)]:

        1. Open table **2000000004 Permission Sets** in the client, and delete all permission sets except SUPER.

            > [!NOTE]
            > You are only required to delete those permission sets that also included in the permission sets XML file that you will import. Because if you try to import a permission set with the same name as on already in the database, you will get an error. 
        2. Run XMLport **9171** and XMLport **9172** to import the permission sets and permission XML files.

        For more information, see [How to: Export and Import Permission Sets and Permissions](how-to--import-export-permission-sets-permissions.md#ImportPerms).

    - For upgrade from an earlier [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version:

        1. In the client, search for and open the **Permission Sets** page.
        2. Delete all user-defined permissions.
        3. Choose **Import Permission Sets**, then select the permissions set file that you exported previously.

2. Import encryption keys.

    For more information, see [Exporting and Importing Encryption Keys](how-to-export-and-import-encryption-keys.md).

3.  (Optional) Update Web Server instance configuration file

    If you have installed the [!INCLUDE[webserver](../developer/includes/webserver.md)], populate the navsettings.json file for the [!INCLUDE[webserver](../developer/includes/webserver.md)] instance with the settings of the old web.config file or navsettings.json.
    
    - If the old deployment used a web.config file, then you have to manually change the settings in the navsetting.json file that is used on the new [!INCLUDE[webserver](../developer/includes/webserver.md)] instance.
    
    - If you upgraded from [!INCLUDE[prod_short](../developer/includes/prod_short.md)] October 2018, you can replace the navsettings.json file on the new [!INCLUDE[webserver](../developer/includes/webserver.md)] instance with the old file. However, as of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] April 2019, the following  settings are now configured under a root element called `ApplicationIdSettings` instead of the root element `NAVWebSettings`.
    
        - `AndroidPrivacy`
        - `AndroidSoftwareLicenseTerms`
        - `AndroidThirdPartyNotice`
        - `BaseHelpUrl`
        - `BaseSettingsSectionName`
        - `CommunityLink`
        - `FeedbackLink`
        - `IosPrivacy`
        - `IosSoftwareLicenseTerms`
        - `IosThirdPartyNotice`
        - `KeyboardShortcutsLink`
        - `PrivacyLink`
        - `LegalLink`
        - `SignInHelpLink`

        If the old navsettings.json file uses any of these settings, then you will have to move them from the `NAVWebSettings` element to the `ApplicationIdSettings` element.

    For more information about the navsettings.json file, see [Configuring Business Central Web Server Instances](../administration/configure-web-server.md).
3. Upload the customer license.

    For more information, see [Uploading the License File](../cside/cside-upload-license-file.md)

## See Also  
 [Upgrading the Application Code](Upgrading-the-Application-Code.md)   
 [Upgrading to Business Central](upgrading-to-business-central.md)