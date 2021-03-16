---
title: "Converting a Database to Dynamics 365 Business Central - Technical Upgrade"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---
# Converting a Database to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Spring 2019  - Technical Upgrade

[See print-friendly quick reference](technical-upgrade-checklist.md)

This article describes how to convert a database from one of the following versions to the latest [!INCLUDE[prod_short](../developer/includes/prod_short.md)] platform:

-   [!INCLUDE[navcrete](../developer/includes/navcrete_md.md)]
-   [!INCLUDE[navcorfu](../developer/includes/navcorfu_md.md)]
-   [!INCLUDE[nav2017](../developer/includes/nav2017.md)] 
-   [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] 
<!--
-   [!INCLUDE[prod_short](../developer/includes/prod_short.md) October 2018 and later CU.
-->
This article can also be used to update your current [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database to the latest cumulative update (CU) platform.

## Overview
### About technical upgrade and database conversion

Converting a database, which is often referred to as a *technical upgrade*, changes the database so that it works on the latest [!INCLUDE[prod_short](../developer/includes/prod_short.md)] platform. The conversion updates the system tables of the old database to the new schema (data structure), and upgrades of all reports to support Report Viewer 2015. It provides you with the latest platform features and performance enhancements.

The process is slightly different when you have multitenant deployment compared to a single-tenant deployment. The steps that follow indicate the differences where applicable.

> [!IMPORTANT]  
> Before you begin, read the article [Important Information and Considerations for Before Upgrading](upgrade-considerations.md). This article contains information about limitations in a technical upgrade, such as using V1 extensions or [!INCLUDE[crm_md](../developer/includes/crm_md.md)] integration.
>
> If you are upgrading a single-tenant database to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Cumulative Update 02, 03, 04, or 05, read [Tenant synchronization issue with technical upgrade to Business Central Cumulative Updates 02–05](https://community.dynamics.com/business/b/businesscentraldevitpro/archive/2019/03/29/technical-upgrade-to-business-central-cumulative-updates-02-05-tenant-synchronization-issue) on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] for Partners blog before starting the upgrade.  

### Tools
To complete the steps in the article, you will use the following tools:

- [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] (the version that matches your old database and the new version) 

- [!INCLUDE[nav_admin](../developer/includes/nav_admin_md.md)] and/or [!INCLUDE[admintool](../developer/includes/admintool.md)]

- SQL Server Management Studio

## Task 1: ([!INCLUDE[navnow](../developer/includes/navnow_md.md)] upgrade only) Preparation

1. Transition from the use of codeunit 1

    With [!INCLUDE[prod_short](../developer/includes/prod_short.md)], codeunit 1 Application Management is no longer used and has been replaced. For more information, see [Transitioning from Codeunit 1](transition-from-codeunit1.md). To prepare for this change when doing a technical upgrade, do the following:

    1. If you have any custom code in codeunit 1, export the existing codeunit 1 as a .fob or .txt file.
    2. Go to [Codeunit 1 Replacement](codeunit1-replacement.md), and make a .txt file that includes the replacement code for codeunit 1. You will use this file later.

2. <a name="convertv1extensions"></a>Convert V1 extensions to V2 extensions

    [!INCLUDE[prod_short](../developer/includes/prod_short.md)] does not support V1 extensions. If you are updating a [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database that includes custom V1 extensions, and you want to continue to use them, you have to convert them to V2 extensions. For more information, see [Converting Extensions V1 to Extensions V2](../developer/devenv-upgrade-v1-to-v2-overview.md).

    V1 extensions that are produced by Microsoft (first-party extensions, publisher=Microsoft) are now available as V2 extensions on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] installation media (DVD), so you do not have to convert these. If you want to keep the functionality provided and data collected by these V1 extensions, you will have to publish the V2 versions as part of the technical upgrade later in Task 4. 

    You will have to uninstall all V1 extension to successfully completes the technical upgrade.

## Task 2: Preparing the Old Database

Before you convert the old database to [!INCLUDE[prod_short](../developer/includes/prod_short.md)], complete the following steps.

1. Make a copy of the old database or create full database backup. 

    For more information, see [Create a Full Database Backup \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkID=296465).

2. <a name="uninstallextensions"></a> For single-tenant mode, uninstall all extensions. For multitenant mode, uninstall all V1 extensions.

    You can do this from **Extension Management** page in the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] client or by using the [Uninstall-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet of the [!INCLUDE[nav_shell](../developer/includes/nav_shell_md.md)]. 

    To get a list of the extensions that are installed, run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant <TenantID>
    ```

    For a single-tenant mode, set the `-Tenant` parameter to `default`. V1 extensions are indicated by `ExtensionType: CSIDE`. 

    For each extension, run this command to uninstall it:

    ```
    Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

    Alternately, to remove them all at once, you can run this command:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> -Tenant default | % { Uninstall-NAVApp -ServerInstance <ServerInstanceName> -Name $_.Name -Version $_.Version }
    ```

3. Unpublish extensions versions that you do not want to use in the upgraded database. This is optional and typically done for V1 extensions because they are no longer supported.

    For example:
    ```
    Unpublish-NAVApp -ServerInstance dynamicsnav110 -Name System -Version 11.0.12925.0 
    ```

4. <a name="compilesync"></a>Open the [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)] that matches the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] or [!INCLUDE[prod_short](../developer/includes/prod_short.md)] version of the old database, and then connect to the old application database.  

     For more information, see [Open Databases](../cside/cside-open-database.md).  

5. In Object Designer, verify that all objects are compiled and no objects are locked.  

     For more information about compiling objects, see [Compiling Objects](../cside/cside-compiling-objects.md).

     If one or more objects are locked, the conversion process cannot update the database version number. As a result, the conversion does not complete. For more information, see [Locking and Unlocking Objects](../cside/cside-lock-unlock-objects.md).

6. On the **Tools** menu, choose **Build Server Application Objects**, and then choose the **Yes** button.  

7. If any errors occur, they are shown in the **Error List** window. Make sure that you address all compilation errors before you continue.  

8. Run the schema synchronization with validation to synchronize the database schema changes.  

    For more information, see [Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md).

9. <a name="uploadlicense"></a>Upload the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Partner license to the database.  

    For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md#UploadtoDatabase).  

    > [!IMPORTANT]  
    >  The license that you upload must be a developer license. During the conversion, the [!INCLUDE[nav_dev_short](../developer/includes/nav_dev_short_md.md)] will convert the report objects that are stored in the old database to the RDL format.  

10. <a name="dismounttenant"></a>(Multitenant only) Dismount tenants.

    Use the  [!INCLUDE[nav_admin](../developer/includes/nav_admin_md.md)] or [Dismount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet of the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)] to dismount all tenants from the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance.

    ```
    Dismount-NAVTenant -ServerInstance <serverinstance> -Tenant <tenantID>
    ```

11. Stop the [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] instance, and close the [!INCLUDE[nav_dev_short_md](../developer/includes/nav_dev_short_md.md)].

    You can use the [!INCLUDE[nav_admin](../developer/includes/nav_admin_md.md)] or [Set-NAVServerInstance](https://go.microsoft.com/fwlink/?linkid=401395) cmdlet of the [!INCLUDE[nav_shell_md](../developer/includes/nav_shell_md.md)].

    To use the Set-NAVServerInstance cmdlet, run the following command:
    ```
    Set-NAVServerInstance –ServerInstance <ServerInstanceName> -Stop
    ```

12. <a name="clearsql"></a>Clear all records from the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables in the old application database in SQL Server.  

    Using SQL Server Management Studio, open and clear the **dbo.Server Instance** and  **dbo.Debugger Breakpoint** tables of the old database. For example, you can run the following SQL query:

    ```
    DELETE FROM [<My NAV Database Name>].[dbo].[Server Instance]
    DELETE FROM [<My NAV Database Name>].[dbo].[Debugger Breakpoint]
    ```
13. Close all to connections to the database.

    This includes but is not limited to [!INCLUDE[navnow](../developer/includes/navnow_md.md)] client tools and SQL Server Management Studio.
 
## Task 3: Run Technical Upgrade on the Old Database
  
Next, you will convert the old database so that it can be used with [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

> [!TIP]  
>  If you want to write a script that helps you convert databases, you can use the Invoke-NAVDatabaseConversion function in the [!INCLUDE[devshell](../developer/includes/devshell.md)].

> [!IMPORTANT]  
> Before you run the technical upgrade, delete any corrupt databases that are on the same SQL Server instance as the database that you intend to upgrade. Otherwise, when you run the database conversion, you will get the error "The Symbol Reference field on the Object Metadata table does not exist in the SQL Server table or view.".    

1. If the database is on Azure SQL Database, add your user account to the **dbmanager** database role on the master database.

    This membership is only required for converting the database, and can be removed afterwards. 

2. Install [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  

    Run the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)], and install the following components as a minimum:
    -  Server
    -  SQL Server Database Components
    -  Administration Tool
    -  [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)]

    > [!IMPORTANT]  
    > For a multitenant installation, configure the [!INCLUDE[server](../developer/includes/server.md)] instance to be a multitenant instance.

3. <a name="convertdb"></a>Run the newly installed [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] as an administrator.

    - If the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] is already connected to the old application database, a dialog box about converting the database appears. Go to the next step.
    
    - Otherwise, connect to the old application database that you prepared in the previous task, and then go to the next step.

    For more information, see [Open Databases](../cside/cside-open-database.md).

    > [!IMPORTANT]  
    > If you do not run the development environment as an administrator, you will get an error and the conversion will be stopped.

4. In the dialog box that appears, read the instructions about converting the database carefully because this action cannot be reversed. When you are ready, choose the **OK** button, and then choose the **OK** button to confirm that you want to convert the database.  

    [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)] will now convert the database. This includes an upgrade of system tables and reports.  

5. When you are notified that the conversion was successful, choose the **OK** button.

6. <a name="controladdins"></a>If the database references any assemblies \(such as client control add-ins\) that are not included on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] installation media \(DVD\), then add the assemblies to the Add-ins folder on [!INCLUDE[server](../developer/includes/server.md)].   

    For [!INCLUDE[server](../developer/includes/server.md)], the default path is the [!INCLUDE[prodinstallpath](../developer/includes/prodinstallpath.md)]\\Service\\Add-ins folder.

7. <a name="connectserver"></a>Connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted database.

    Use the [!INCLUDE[admintool](../developer/includes/admintool.md)] or the [Set-NAVServerConfiguration cmdlet](https://go.microsoft.com/fwlink/?linkid=401394) to connect a [!INCLUDE[server](../developer/includes/server.md)] instance to the converted database.  

    > [!IMPORTANT]
    > The service account that is used by the [!INCLUDE[server](../developer/includes/server.md)] instance must be a member of the **db\_owner** role in the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database on SQL Server or Azure SQL Database.

    For more information, see [Connect a Server Instance to a Database](../administration/connect-server-to-database.md) and [Giving the account necessary database privileges in SQL Server](../deployment/provision-server-account.md#dbo).  

8. Go to the [!INCLUDE[nav_dev_short_md](../developer/includes/nav_dev_short_md.md)], and set it to use the [!INCLUDE[server](../developer/includes/server.md)] instance that connects to the database.

    For more information, see [Change the Server Instance](../cside/cside-change-server-instance.md). 

9. If upgrading from Dynamics NAV, import the codeunit 1 replacement text file you created earlier.
10. Compile all objects without table schema synchronizing (**Synchronize Schema** set to **Later**); you will do this later.  

    For more information, see [Compiling Objects](../cside/cside-compiling-objects.md).

11. <a name="fixerrors"></a>Fix compilation errors.  

    If any errors occur, they are shown in the **Error List** window. For help on resolving the errors, see the following:

    - [Resolving Compilation Errors ](resolve-compile-errors-when-converting-dynamics-nav-2018-Database.md)

    You can find all objects which did not compile in the **Object Designer** window, by setting a field filter on the **Compiled** field. 

12. Recompile V2 extensions that you uninstalled previously.

    Use the [Repair-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp) of the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] to compile the published extensions to make sure they are work with the new platform.

    For example, you can run the following command to recompile all extensions:

    ```
    Get-NAVAppInfo -ServerInstance <ServerInstanceName> | Repair-NAVApp
    ```

13. <a name="mounttenant"></a>(Multitenant only) Mount the tenant.

    Use the [Mount-NAVTenant cmdlet](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant).

    ```
    Mount-NAVTenant -ServerInstance <serverinstance> -Tenant <tenantID> -DatabaseName <tenantdatabasename>
    ```

    `-AllowAppDatabaseWrite` is optional but is required for some post-upgrade tasks, like upgrading the control add-ins. When you are done upgrading, you can dismount and mount the tenant without this parameter as needed.

14.  <a name="synctenant"></a>Run the schema synchronization with validation to complete the database conversion.  

     For more information, see [Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md).

## <a name="extensions"></a>Task 4: Post-upgrade

1. <a name="JSaddins"></a>Upgrade Javascript-based control add-ins to new versions.

    The [!INCLUDE[server](../developer/includes/server.md)] installation includes new versions of Microsoft-provided Javascript-based control add-ins, such as the Business Chart control add-in. If you application is using any of these add-ins, you must upgrade them to the new versions as follow:

    1. Open the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] client.
    2. Search for and open the **Control Add-ins** page.
    3. Choose **Actions** > **Control Add-in Resource** > **Import**.
    4. Locate and select the .zip file for the control add-in and choose **Open**.

        The .zip files are located in the **Add-ins** folder of the [!INCLUDE[server](../developer/includes/server.md)] installation. There is a sub-folder for each add-in. For example, the path to the Business Chart control add-in is `C:\Program Files\Microsoft Dynamics 365 Business Central\140\Service\Add-ins\BusinessChart\Microsoft.Dynamics.Nav.Client.BusinessChart.zip`.
    5. After you have imported all the new control add-in versions, restart Web Server instance.

2. <a name="installv2extensions"></a>(Single tenant only) Install the V2 extensions that you uninstalled previously.

    Use the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) to compile the published extensions to make sure they are work with the new platform.

    For each V2 extension, run the following command to install it:

    ```
    Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> 
    ```

3. (Dynamics NAV 2017 or 2018 upgrade only) If the old database used first-party V1 extensions (publisher Microsoft), then you should publish and install the corresponding V2 extensions that are found on the installation media (DVD). For example, **Sales and Inventory Forecast** and **PayPal Payment Standards** were available as V1 extensions. Now, they are available as V2 extensions.  

    1. <a name="PublishSymbols"></a>Publish the system.app and test.app symbol files.

        If you installed the **AL Development Environment**, you can find the symbol files where you installed the environment, which by default is [!INCLUDE[prodx86installpath](../developer/includes/prodx86installpath.md)]. Otherwise, you can find the files in the **ModernDev** folder on the installation media. 

        To publish the symbols, open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and run the following command for each of the symbol files:

        ```
        Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
        ```

    2. <a name="GenerateSymbols"></a>Generate the application symbol references by using the finsql.exe file.

        Open a command prompt as an administrator, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and then run the following command:

        ```
        finsql.exe Command=generatesymbolreference,  ServerName=<DatabaseServerName>\<DatabaseInstance>, Database="<MyDatabaseName>"
        ```

        Replace values for the `Database` and `ServerName` settings to suit.

        If the application database contains test objects (ID 130000-139999), then make sure to exclude these objects when generating symbols. You can do this by using the `-Filter` parameter and running the command twice:

        ```
        finsql.exe command=generatesymbolreference, ServerName=<DatabaseServerName>\<DatabaseInstance>, Database="<MyDatabaseName>, filter="Object ID=1..129999"
        ```

        ```
        finsql.exe command=generatesymbolreference, ServerName=<DatabaseServerName>\<DatabaseInstance>, Database="<MyDatabaseName>, filter="Object ID=140000..1999999999"
        ```

        > [!NOTE]  
        >  This command does not generate a file. It populates the **Object Metadata** table in the database.

        When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time. You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**. 
    
        When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred. 
            
        For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](../developer/devenv-running-cside-and-al-side-by-side.md).

    3. Configure the **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) setting on the [!INCLUDE[server](../developer/includes/server.md)] instance, and restart the instance.

        For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).

    4. Publish the new V2 extension by running the [Publish-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) cmdlet for each extension: 

        ```
        Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
        ```
           
    5. Synchronize the schema with the database by running the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet for each extension:

        ```    
        Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
        ```

    6. For each V2 extension, run the following command to install it:

        ```
        Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N> 
        ```

4. (Dynamics NAV upgrade only) Transition the custom code in the old codeunit 1 to use the new system event implementation.

    For more information, see [Transitioning from Codeunit 1](transition-from-codeunit1.md).

5. ([!INCLUDE[navcorfu_md](../developer/includes/navcorfu_md.md)] upgrade only) Modify C/AL code to ensure that the **My Settings** page works properly in the [!INCLUDE[nav_web_md](../developer/includes/nav_web_md.md)].

    For more information, see [Resolving My Settings Page Implementation After a Database Conversion](Resolve-MySettings-Page-After-Upgrade.md).

6. ([!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] upgrade only) Configure pages and reports included in the MenuSuite to be searchable in the [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)].

    The MenuSuite is no longer used to control whether a page or report can be found in the search feature of the Web client. This is now determined by specific properties on the page and report objects.  For more information, see [Making Pages and Reports Searchable in [!INCLUDE[d365fin_web_md.md](../developer/includes/d365fin_web_md.md)] After an Upgrade](upgrade-pages-report-for-search.md).

7. Build the object search index to make objects able to be searched from **Tell Me** in the client. If you completed step 6, you can skip this step.

    In the **Tools** menu of the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)], select **Build Object Search Index**.

8. Upload the customer license to the converted database.  

    For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md#UploadtoDatabase).  

    You have now completed the conversion of the database to be accessed from [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. To test the converted database, you can connect it to the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Server instance that is used by [!INCLUDE[navnow](../developer/includes/navnow_md.md)] clients, and then open a client.

## Database and Windows collations

Starting from SQL Server 2008, SQL Server collations are fully aligned with the collations in Windows Server. If you upgrade to [!INCLUDE[prod_short](../developer/includes/prod_short.md)] from [!INCLUDE[nav_2009_long](../developer/includes/nav_2009_long_md.md)], the step to convert the database includes upgrading the database from using SQL collations to using Windows collation. This collation change provides users with the most up-to-date and linguistically accurate cultural sorting conventions. For more information, see [Collation and Unicode Support](https://go.microsoft.com/fwlink/?LinkID=247971).  

## See Also
  
[Upgrading the Application Code](Upgrading-the-Application-Code.md) [Upgrading the Data](Upgrading-the-Data.md)  
[Upgrading to Business Central](Upgrading-to-business-central.md) 