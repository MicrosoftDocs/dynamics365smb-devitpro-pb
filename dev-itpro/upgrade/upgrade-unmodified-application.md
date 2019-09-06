---
title: Upgrade an unmodified application
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
# Upgrading an unmodified application to [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2019 Wave 2

> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](../developer/includes/vnext_preview.md)] 
>
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.

Use this scenario if you have a Business Central Spring 2019 (version 14.0) application that has not been modified. Your solution might include Microsoft (1st party) extensions and custom extensions (3rd party). With this upgrade, you will replace the C/AL base application with the new Business Central V15.0 base app extension. The result will be a fully upgraded Business Central 2019 Wave 2 (version 15.0) application and platform.

<!-- For this scenario, I am upgrading a BC 14.0 unmodified base application. Because the application was unmodified, I upgraded to the BC 15 base app.-->

 ![Upgrade on unmodified Business Central application](../developer/media/bc15-upgrade-unmodified-app.png "Upgrade on unmodified Business Central application") 


## Single-tenant and multitenant deployments

The process for upgrading the very similar for a single-tenant and multitenant deployment. However, there are some inherent differences because with a single-tenant deployment, the application and business data is included in the same database, while with a multitenant deployment application code is in a separate database (the application database) than the business data (tenant). In the procedures that follow, for a single-tenant deployment, consider references to the *application database* and *tenant database* as the same database. Steps are marked as *Single-tenant only* or *Multitenant only* where applicable.

## Prerequisite

1. Upgrade to the latest Business Central Spring 2019 Cumulative Update (version 14.0). For more information, see [Upgrading to Dynamics 365 Business Central On-Premises](upgrading-to-business-central-on-premises.md)

## Task 1: Install Business Central version 15.0

1. Before you install version 15.0, it can be useful to create desktop shortcuts to the the version 14.0 tools, such as the [!INCLUDE[admintool](../developer/includes/admintool.md)], [!INCLUDE[adminshell](../developer/includes/adminshell.md)], and [!INCLUDE[devshell](../developer/includes/devshell.md)] because the Start menu items for these will be replaced with the version 15.0 tools.

2. Install Business Central version 15.0 components.

    If you did not uninstall version 14.0, then you must either specify different port numbers for components (like the [!INCLUDE[server](../developer/includes/server.md)] instance and web services) during installation, or you must stop the version 14.0 [!INCLUDE[server](../developer/includes/server.md)] instance before you run the installation. Otherwise, you will get an error that the [!INCLUDE[server](../developer/includes/server.md)] failed to install.

    For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

## Task 2: Prepare the version 14.0 application and tenant databases for upgrade

1. Make backup of the databases.
2. Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 14.0 as an administrator.
3. Uninstall all extensions from the all tenants.

    To uninstall an extension, you use the [Uninstall-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet. For example, together with the Get-NAVAPP cndlet, you can uninstall all extensions with a single command:

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version -Tenant default}
    ``` 

    If you have a single tenant deployment, you can omit the `-Tenant` parameter and value.

3. Unpublish all 3rd party extensions.

    To unpublish an extension, use the [Unpublish-NAVAPP cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp):
    ``` 
    Unpublish-NAVApp -ServerInstance BC140 -Name My14Ext -Version 1.0.0.0
    ``` 

4. Unpublish all system, test, and application symbols from the application.

    To unpublish symbols, use the Unpublish-NAVAPP cmdlet with the -SymbolOnly parameter.

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }
    ``` 

5. (Multitenant only) Dismount the tenants from the application server instance.

    To dismount a tenant, use the [Dismount-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```
    Dismount-NAVTenant -ServerInstance BC140 -Tenant default
    ```
5. Stop the server instance.

    ```
    Stop-NAVServerInstance -ServerInstance BC140
    ```

## Task 3: Upgrade the version 14.0 application database to the version 15.0 platform

This task runs a technical upgrade on the application database to convert it from the version 14.0 platform to the version 15.0 platform. The conversion updates the system tables of the database to the new schema (data structure) and provides the latest platform features and performance enhancements.

1. Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 15.0 as an administrator.
2. Run the Invoke-NAVApplicationDatabaseConversion cmdlet to start the conversion:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer .\BCDEMO -DatabaseName "Demo Database BC (14-0)"
    ```

## Task 4: Publish the base application, symbols, and other extensions

In this task, you will publish extensions to the version 15.0 server instance. Publishing an extension adds the extension to the application database that is mounted on the server instance, making it available for installing on tenants later on. Publishing updates internal tables, compiles the components of the extension behind-the-scenes, and builds the necessary metadata objects that are used at runtime.

The steps in this task continue to use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 15.0 that you started in the previous task.

1. Configure the version 15.0 server instance, which you installed earlier, to prepare for upgrading the application.

    1. Set the server instance to connect to the application database.
    
            ```
            Set-NAVServerConfiguration -ServerInstance BC150 -KeyName DatabaseName -KeyValue "Demo Database BC (14-0)"
            ```
            
            In a single tenant deployment, this will mount the tenant automatically. For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md).

    3. Configure the server instance to migrate 3rd party extensions to the use the new base application and system application extensions. 

        ```
        Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"},{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"}]'
        ```
        <!-- with test
        ```
        Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"e3d1b010-7f32-4370-9d80-0cb7e304b6f0", "name":"TestToolKit2", "publisher": "Default publisher"}]'
        ```-->
        This will configure the server instance to modify the manifest of extensions with a dependency on the base application and automatically install the base application <!--and test application--> on tenants after the data upgrade. Alternatively, you can omit this step, in which case you will have to manually install the extensions manually.
        <!-- maybe not required-->
    4. Configure the server instance to synchronize only the system application objects with tenants.
    
        This is done by setting the `FeatureSwitchOverrides` parameter to `forceSystemOnlyBaseSync`.
    
        ```
        Set-NAVServerConfiguration BC150 -KeyName "FeatureSwitchOverrides" -KeyValue "forceSystemOnlyBaseSync"
        ```
    
        This is required in order to synchronize tenants later in the upgrade process. This is required because the application database still contains the old metadata for the C/AL application objects, and these should not be synchronized with the tenant. By making this change, only system objects will by synchronized with the tenant. If you omit this step, you will get conflicts because of duplicate object IDs.
    
    5. Temporarily disable task scheduler on the server instance for purposes of upgrade.
    
        ```
        Set-NavServerConfiguration -ServerInstance BC150 -KeyName "EnableTaskScheduler" -KeyValue false
        ```
    6. Restart the server instance.
    
        ```
        Restart-NAVServerInstance -ServerInstance BC150
        ```
2. Increase the application version of the application database, and restart the server instance.

    Use the [Set-NAVApplication](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navapplication) cmdlet to increase the application version number of the database to the version 15.0 application version.

    ```
    Set-NAVApplication BC150 -ApplicationVersion 15.0.34737.0 -force
    ```

    ```
    Restart-NAVServerInstance -ServerInstance BC150
    ```
3. Publish version 15 system symbols extension.

    The symbols extension contains the required platform symbols that the base application depends on. The symbols extension package is called **System.app**. You find it where the **AL Development Environment** is installed, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment.  

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
    
    [What are symbols?](upgrade-overview-v15.md#Symbols) 
4. Publish the **System Application** extension (Microsoft_System Application.app).

    You find the (Microsoft_System Application.app in the **Applications\System Application\Source** folder of installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\W1DVD\Applications\System Application\Source\Microsoft_System Application.app"
    ```
   <!-- 
   ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\15.x\35986\W1DVD\Applications\System Application\Source\Microsoft_System Application.app"
    ```
    -->
    [What is the System Application?](upgrade-overview-v15.md#Symbols) 
5. Publish the Business Central base application extension (Microsoft_Base Application.app).

    The **Base Application** extension contains the application business objects. You find the (Microsoft_Base Application.app in the **Applications\BaseApp\Source** folder of installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\W1DVD\Applications\BaseApp\Source\Microsoft_Base Application.app"
    ```
   <!--
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\15.x\35986\W1DVD\Applications\BaseApp\Source\Microsoft_Base Application.app"
    ```
    -->
6. Publish the new versions of Microsoft extensions that were used before upgrade.

    You find the extensions in the **Applications** folder of the installation media (DVD). 
    
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\W1DVD\Applications\SalesAndInventoryForecast\Source\SalesAndInventoryForecast.app"
    ```

   <!--   
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\15.x\35986\W1DVD\Applications\SalesAndInventoryForecast\Source\SalesAndInventoryForecast.app"
    ```
    -->
7. Publish the 3rd-party extensions that were used before upgrade.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\AL\My14Ext\Default publisher_My14Ext_1.0.0.0.app"
    ```

   <!--  
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\My14Ext\Default publisher_My14Ext_1.0.0.2.app -Skip"
    ```
    -->

## Task 5: Synchronize the tenant

In this task, you will synchronize the tenant's database schema any schema changes in the application database and extensions. Upgrading data updates the actual data that is stored in the tables of the tenant database to the schema changes that have been made to tables in application database. 

If you have a multitenant deployment, perform these steps for each tenant.

1. (Multitenant only) Mount the tenant to the version 15.0 server instance.

    To mount the tenant, use the [Mount-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/mount-navtenant) cmdlet:
    
    ```
    Mount-NAVTenant -ServerInstance BC150 -DatabaseName "Demo Database BC (14-0) -DatabaseServer .\BCDEMO -Tenant tenant1 -AllowAppDatabaseWrite
    ```
    
    > [!IMPORTANT]
    > You must use the same tenant ID for the tenant that was used in the old deployment; otherwise you will get an error when mounting or syncing the tenant. If you want to use a different ID for the tenant, you can either use the `-AlternateId` parameter now or after upgrading, dismount the tenant, then mount it again using the new ID and the `OverwriteTenantIdInDatabase` parameter.  
    
    > [!NOTE]  
    > For upgrade, we recommend that you use the `-AllowAppDatabaseWrite` parameter. After upgrade, you can dismount and mount the tenant again without the parameter if needed.

2. Synchronize the tenant with the application database.

    Use the [Sync-NAVTenant](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet:

    ```  
    Sync-NAVTenant -ServerInstance BC150 -Mode Sync -Tenant default
    ```
    
    With a single-tenant deployment, you can omit the `-Tenant` parameter and value.

    At this stage, the tenant state is **OperationalDataUpgradePending**.

3. Synchronize the tenant with the **System Application** extension (Microsoft_System Application):

    Use the [Sync-NAVApp](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name "System Application" -Version 15.0.35986.0
    ```
5. Synchronize the tenant with the Business Central Base Application extension (Microsoft_BaseApp):

    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name "Base Application" -Version 15.0.35986.0
    ```
    
    With this step, the base app takes ownership of the database tables. When completed, in SQL Server, the table names will be suffixed with the base app extension ID. This process can take several minutes.
<!--
    > [!IMPORTANT] 
    > Usually, you will use the `-Mode Sync` switch instead of `-Mode ForceSync`. However, currently the upgrade code is not available. So you must use `-Mode ForceSync`otherwise you will not be able to synchronize the tenant because of destructive changes, specifically with the Invoice Post. Buffer and Incoming Document tables. 

-->
6. Synchronize the tenant with Microsoft and 3rd-party extensions.

    For each extension, run the Sync-NAVApp cmdlet: 

    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name "Sales And Inventory Forecast" -Version 15.0.35986.0
    ```

## Task 7: Upgrade the tenant data

Upgrading data updates the data that is stored in the tables of the tenant database to the schema changes that have been made to tables in application database and extensions. This step will also automatically install the **System Application** and **Base Application** extensions on the tenant.

1. To run the data upgrade, use the [Start-NavDataUpgrade](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet:

    ```
    Start-NAVDataUpgrade -ServerInstance BC150 -Tenant default -FunctionExecutionMode Serial -SkipCompanyInitialization -SkipAppVersionCheck -Force
    ```        
    
    This step upgrades the data and installs the System Application and BaseApp extensions on the tenant. If you do not want to install the extensions, use the `-ExcludeExtensions` parameter. In this, case you will have to manually install these extensions before you complete the next step or to open the application in the client.
    
    > [!TIP]  
    >  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the `Start-NavDataUpgrade` with the `-SkipCompanyIntitialization` parameter.
    
    To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.
    
    When completed, the tenant state should be **Operational**.
2. (Single tenant only) When upgrade is completed, restart the server instance.

    You will see that the custom base application has been installed on the tenant. 
3. Upgrade the tenant data to the Microsoft and 3rd party extensions.

    For each extension, run the Start-NAVAppDataUpgrade cmdlet.

    ```
    Start-NAVAppDataUpgrade  -ServerInstance BC150 -Name "Sales and Inventory Forecast" -Version 15.0.35986.0
    ```

<!--
15. The upgrade installs System Application on the tenant. If it does not, manually install it on the tenant.

    ```
    Install-NAVApp BC150 -Name "System Application" -Version 15.0.34737.0
    ```
16. Install base application extension on the tenant:

    ```
    Install-NAVApp BC150 -Name "BaseApp" -Version 15.0.34737.0
    ```
-->
<!--
## Task 6: Synchronize and upgrade Microsoft extensions on the tenants

Complete this task to upgrade any Microsoft extensions that were used in the previous version to new versions that are available on the installation media. Do the following steps for each extension, and for each tenant in a multitenant deployment.

<!--
1. Publish the extension.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path c:"\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\W1DVD\Extensions\SalesAndInventoryForecast.app" -SkipVerification
    ```
-->
<!--
1. Synchronize the tenant with the extension. 

    ```
    Sync-NAVApp -ServerInstance BC150 -Name "Sales and Inventory Forecast" -Version 15.0.35926.0
    ```
2. Upgrade the tenant data to the extension.

    ```
    Start-NAVAppDataUpgrade  -ServerInstance BC150 -Name "Sales and Inventory Forecast" -Version 15.0.35926.0
    ```
-->

## Task 8: Install 3rd party extensions

For each extension, run the Install-NAVApp cmdlet:

```
Install-NAVApp BC150 -Name My14Extension -Version 1.0.0.3
```

At this point, the upgrade is complete, and you should be able to open the client.

## Post-upgrade tasks

1. Enable task scheduler on the server instance, if needed.
2. (Multitenant only) If you used the `-AllowAppDatabaseWrite` parameter when mounting tenants, dismount the tenants, and then mount again without the `-AllowAppDatabaseWrite`. 

<!-- The extensions must be modified to work with base application extension. <!--There are two ways to do this. You can either modify the extension code or configure the version 15 server instance to handle this.-->

<!--
### Modify extension code

1. Upgrade the extension package to reference the base app and system app.

    1. Open the project in Visual Studio Code.
    2. Download the symbols.
    3. Modify the `dependencies` parameter in the app.json file to include dependencies on the base app and system app: 

        ```
        "dependencies": [      {
        "appId": "63ca2fa4-4f03-4f2b-a480-172fef340d3f",
        "publisher": "Microsoft",
        "name": "System Application",
        "version": "15.0.0.0"
        },
        {
        "appId": "437dbf0e-84ff-417a-965d-ed2bb9650972",
        "publisher": "Microsoft",
        "name": "BaseApp",
        "version": "15.0.0.0"
        }]
        ```

    4. Build the project.

2. Publish the 3rd-party extension:

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.3.app" -SkipVerification
    ```
3. Synchronize the tenant with the extension:

    ```
    Sync-NAVApp BC150 -Name My14Extension -Version 1.0.0.3
    ```
4. Upgrade the data to the extension:

    ```
    Start-NAVAppDataUpgrade BC150 -Name My14Extension -Version 1.0.0.3
    ```    

    This upgrades the data and installs the extension version.

### Configure server instance

1. Unpublish all 3rd party extensions.

2. Configure the version 15.0 server instance.

    Using the Set-NAVServerConfiguration cmdlet, set the `DestinationAppsForMigration` parameter to identify the BaseApp ans System Application as follows:

    ```
    Set-NAVServerConfiguration BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"} ]'
    ```

    Restart the server instance.

2. Publish 3rd-party extensions that were previously published:

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.3.app" -SkipVerification
    ```

-->
<!--
1. Synchronize the tenant with the extension:

    ```
    Sync-NAVApp BC150 -Name My14Ext -Version 1.0.0.0

   ```
-->
<!--
. Install the extension:

    ```
    Install-NAVApp BC150 -Name My14Extension -Version 1.0.0.3
    ```
-->

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
