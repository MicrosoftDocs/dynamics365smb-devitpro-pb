---
title: Full Upgrade from Business Central version 14.0 to version 15.0 
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 08/21/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
manager: edupont
ms.service: "dynamics365-business-central"
ROBOTS: NOINDEX
---
# Full Upgrade from Business Central version 14.0 to version 15.0  [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2019 Wave 2

> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](../developer/includes/vnext_preview.md)] 
>
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.

Use this process when you have a customized Business Central application that you want to upgrade to the Business Central Wave 2 application and platform. With this process, you will convert the entire application from C/AL to AL and refactor to use the system application layer extension.

<!-- For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance, which include some customization on C/AL objects in the base application and a custom extension that modified the Item table. is proecess will convert the entire BC 14 custom application to an Extension on the BC 15 platform.-->

 ![Upgrade on customized Business Central application](../developer/media/bc15-full-upgrade-customized-app.png "Upgrade on customize Business Central application")  
 
 

#### Single-tenant and multitenant deployments

The process for upgrading the very similar for a single-tenant and multitenant deployment. However, there are some inherent differences because with a single-tenant deployment, the application and business data are included in the same database, while with a multitenant deployment application code is in a separate database (the application database) than the business data (tenant). In the procedures that follow, for a single-tenant deployment, consider references to the *application database* and *tenant database* as the same database. Steps are marked as *Single-tenant only* or *Multitenant only* where applicable.

## Prerequisites

1.  Upgrade to the latest Business Central Spring 2019 Cumulative Update (version 14.0). For more information, see [Upgrading to Dynamics 365 Business Central On-Premises](upgrading-to-business-central-on-premises.md)


## Task 1: Install [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2019 release wave 2 (version 15.0)

1. Before you install version 15.0, it can be useful to create desktop shortcuts to the the version 14.0 tools, such as the [!INCLUDE[admintool](../developer/includes/admintool.md)], [!INCLUDE[adminshell](../developer/includes/adminshell.md)], and [!INCLUDE[devshell](../developer/includes/devshell.md)] because the Start menu items for these will be replaced with the version 15.0 tools.

2. Install all components of Business Central 2019 release wave 2 (version 15).

    If you did not uninstall version 14.0, then you must either specify different port numbers for components (like the [!INCLUDE[server](../developer/includes/server.md)] instance and web services) during installation, or you must stop the version 14.0 [!INCLUDE[server](../developer/includes/server.md)] instance before you run the installation. Otherwise, you will get an error that the [!INCLUDE[server](../developer/includes/server.md)] failed to install.

    > [!IMPORTANT]
    > Because of dependencies, we recommend that for upgrade , you install all components available. Also, there is currently a known issue with the Microsoft.Office.Interop.Word.dll. After installation, you must copy the Microsoft.Office.Interop.Word.dll from the C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\RoleTailored Client folder to the C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\Add-ins folder.

    For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

## Task 2: Convert your version 14 application from C/AL to AL

The first thing to do is convert your solution from C/AL to AL. For more information, see [Code Conversion from C/AL to AL](devenv-code-conversion.md).

## Task 3: Merge version 14.0 AL code with version 15.0 AL code

Tools? What version of txt2al.exe?

How?

Who knows?






## Task 4: Uptake System Application 

In version 15.0, application functionality that is not related to the business logic has been moved into separate modules that are combined into an extension known as the System Application. For an introduction to the System Application, see [Breaking the monolith: Introducing the Business Central System Application](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/09/introducing-the-dynamics-365-business-central-system-application/).

How? 
- Remove system application objects from base application
- Refactor base application to use system application

## Move customizations into extensions

How to move custom table to extension, and migrate data?
How to move custom fields from base application table to extension,, amd move data?

## Task 4: Prepare the application database for technical upgrade

1. Make backup of the database.
2. Uninstall all extensions from the old tenants.

    Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 14.0 as an administrator). To uninstall an extension, you use the [Uninstall-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet. For example, together with the Get-NAVAPP cndlet, you can uninstall all extensions with a single command:

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version -Tenant default}
    ``` 

    If you have a single tenant deployment, you can omit the `-Tenant` parameter and value. 

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version -Tenant default}
    ``` 
3. Unpublish all system, test, and application symbols.

    To unpublish symbols, use the [Unpublish-NAVAPP cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp):

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }
    ```    

    [What are symbols?](upgrade-overview-v15.md#Symbols)  
4. Unpublish all extensions from the application.

    ```
    Get-NAVAppInfo -ServerInstance BC140 | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }
    ```

5. (Multitenant only) Dismount the tenants from the application server instance.

    To dismount a tenant, use the [Dismount-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```
    Dismount-NAVTenant -ServerInstance BC140 -Tenant default
    ```

4. Stop the server instance.

    ```
    Stop-NAVServerInstance -ServerInstance BC140
    ```

## Task 4: Upgrade the application database to the version 15.0 platform

This task converts an application database from the version 14.0 platform to the version 15.0 platform. The conversion updates the system tables of the database to the new schema (data structure) and provides the latest platform features and performance enhancements.

1. Run a technical upgrade on the application database.

    Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 15.0 as an administrator, and run the Invoke-NAVApplicationDatabaseConversion cmdlet:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer .\BCDEMO -DatabaseName "Demo Database BC (14-0)"
    ```

## Task 5: Publish the base application, symbols, and other extensions

In this task, you will publish extensions to the version 15.0 server instance. Publishing an extension adds the extension to the application database that is mounted on the server instance, making it available for installing on tenants later on. Publishing updates internal tables, compiles the components of the extension behind-the-scenes, and builds the necessary metadata objects that are used at runtime.
1. Connect a version 15.0 server instance to the application database.

    In a single tenant deployment, this will mount the tenant automatically.

2. Configure the server instance to migrate Microsoft and 3rd party extensions to the use the new base application extension. 

    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"e3d1b010-7f32-4370-9d80-0cb7e304b6f0", "name":"TestToolKit2", "publisher": "Default publisher"}]'
    ```
    <!-- with test
    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"e3d1b010-7f32-4370-9d80-0cb7e304b6f0", "name":"TestToolKit2", "publisher": "Default publisher"}]'
    ```-->
    This will configure the server instance to modify the manifest of extensions with a dependency on the base application and automatically install the base application <!--and test application--> on tenants after the data upgrade. Alternatively, you can omit this step, in which case you will have to manually install the extensions manually.

3. Configure the server instance to synchronize only the system application objects with tenants.

    This is done by setting the `FeatureSwitchOverrides` parameter to `forceSystemOnlyBaseSync`. 

    ```
    Set-NAVServerConfiguration BC150 -KeyName "FeatureSwitchOverrides" -KeyValue "forceSystemOnlyBaseSync"
    ```

    This is required in order to synchronize tenants later in the upgrade process. This is required because the application database still contains metadata for the C/AL application objects, and these should not be synchronized with the tenant. By making this change, only system application objects will by synchronized with the tenant. If you omit this step, you will get conflicts because of duplicate object IDs.

4. Restart the server instance.

    ```
    Restart-NAVServerInstance BC150
    ```
5. Increase the application version of the application database.

    Use the [Set-NAVApplication](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navapplication) cmdlet to increase the application version number of the database to the version 15.0 application version.

    ```
    Set-NAVApplication BC150 -ApplicationVersion 15.0.34737.0 -force
    ```

    At this point, the tenant state is **OperationalWithSyncPending**.

6. Publish the version 15 system symbols extension.

    The symbols extension contains the required platform symbols that the base application depends on. The symbols extension package is called **System.app**. You find it where the **AL Development Environment** is installed, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment.  

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
7. Publish the custom base application extension that you created:

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\CusomtBaseApp2\Microsoft_BaseApp_15.0.34982.0.app" -SkipVerification
    ```

8. Publish the Microsoft and 3rd party extensions.

    Publish the Microsoft and 3rd party extensions that were published to the old application.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.4.app" -SkipVerification
    ```

## Task 6: Synchronize and upgrade the tenants

In this task, you will complete two processes on the tenant: synchronizing and upgrading data. Synchronizing a tenant updates the database schema in a tenant database with any schema changes in the application database. The application database contains tables that define the application. The tenant database must contain the SQL Server tables that the application prescribes. Upgrading data updates the actual data that is stored in the tables of the tenant database to the schema changes that have been made to tables in application database.

If you have a multitenant deployment, perform these steps for each tenant.

1. (Multitenant only) Mount the tenant.

    ```
    Mount-NAVTenant -ServerInstance BC150 -Tenant default -DatabaseName "Demo Database BC (14-0)" -DatabaseServer navdevvm-0127 -DatabaseInstance BCDEMO
    ```

2. Synchronize the tenant.
  
    Use the [Sync-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet:

    ```  
    Sync-NAVTenant -ServerInstance BC150 -Tenant default
    ```
    
    With a single-tenant deployment, you can omit the `-Tenant` parameter and value.

    At this stage, the tenant state is **OperationalDataUpgradePending**.

3. Synchronize the tenant with the base application extension (BaseApp).

    Use the [Sync-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

    ```
    Sync-NAVApp -ServerInstance BC150 -Name "BaseApp" -Version 15.0.34982.0 -tenant default
    ```

    With this step, the base app takes ownership of the database tables. When completed, in SQL Server, the table names will be suffixed with the base app extension ID.


5. Upgrade the tenant data.

    Use the [Start-NavDataUpgrade](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet:

    ```
    Start-NAVDataUpgrade -ServerInstance BC150 -Tenant default -FunctionExecutionMode Serial
    ```

    This step upgrades the data and installs the System Application and BaseApp extensions on the tenant. If you do not want to install the extensions, use the `-ExcludeExtensions` parameter. In this, case you will have to manually install these extensions before you complete the next step or to open the application in the client.

    > [!TIP]  
    >  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the `Start-NavDataUpgrade` with the `-SkipCompanyIntitialization` parameter. 

    The data upgrade process runs `CheckPreconditions` and `Upgrade` functions in the upgrade codeunits. If any of the preconditions are not met or an upgrade function fails, you must correct the error and resume the data upgrade process. If CheckPreconditions and Upgrade functions are executed successfully, codeunit 2 is automatically run to initialize all companies in the database unless you set the `-SkipCompanyIntitialization` parameter.

    To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch. When completed, the tenant state should be **Operational**.

6. (Single tenant only) When upgrade is completed, restart the server instance.

    You will see that the custom base application has been installed on the tenant. 

The application should now be accessible from the client.

## Task 7: Synchronize and install Microsoft and 3rd party extensions on the tenants

Now, you can install the Microsoft and 3rd-party extensions that were previously installed before the upgrade. For each extension, do the following steps:

1. Synchronize the extension with the tenant:
    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name My14Extension -Version 1.0.0.4
    ```

2. Install the extension on the tenant:

    Use the [Install-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) cmdlet: 
    ```
    Install-NAVApp -ServerInstance BC150 -Tenant default -Name My14Extension -Version 1.0.0.4
    ```

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
