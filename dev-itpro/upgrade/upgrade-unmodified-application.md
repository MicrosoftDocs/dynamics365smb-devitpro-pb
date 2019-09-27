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
author: jswymer
ms.service: "dynamics365-business-central"
---
# Upgrading an unmodified application to [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2019 Release Wave 2
<!--
> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](../developer/includes/vnext_preview.md)] 
>
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.
-->
Use this scenario if you have a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Spring 2019 (referred to as version 14) application that does not include any code customization. Your solution might include Microsoft (1st party) extensions and custom extensions (3rd party). With this upgrade, you will replace the C/AL base application with the new [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2019 release wave 2 base application extension. The result will be a fully upgraded Business Central 2019 release wave 2 (referred to as version 15) application and platform.

<!-- For this scenario, I am upgrading a BC 14.0 unmodified base application. Because the application was unmodified, I upgraded to the BC 15 base app.-->

 ![Upgrade on unmodified Business Central application](../developer/media/bc15-upgrade-unmodified-app.png "Upgrade on unmodified Business Central application") 


#### Single-tenant and multitenant deployments

The process for upgrading the very similar for a single-tenant and multitenant deployment. However, there are some inherent differences because with a single-tenant deployment, the application and business data is included in the same database, while with a multitenant deployment application code is in a separate database (the application database) than the business data (tenant). In the procedures that follow, for a single-tenant deployment, consider references to the *application database* and *tenant database* as the same database. Steps are marked as *Single-tenant only* or *Multitenant only* where applicable.

## Prerequisite

1. Upgrade to the latest Business Central Spring 2019 Cumulative Update (version 14). For more information, see [Upgrading to Dynamics 365 Business Central On-Premises](upgrading-to-business-central-on-premises.md)

## Task 1: Install Business Central version 15

1. Before you install version 15, it can be useful to create desktop shortcuts to the the version 14.0 tools, such as the [!INCLUDE[admintool](../developer/includes/admintool.md)], [!INCLUDE[adminshell](../developer/includes/adminshell.md)], and [!INCLUDE[devshell](../developer/includes/devshell.md)] because the Start menu items for these will be replaced with the version 15 tools.

2. Install Business Central version 15 components.

    If you do not uninstall version 14, then you must either specify different port numbers for components (like the [!INCLUDE[server](../developer/includes/server.md)] instance and web services) during installation, or you must stop the version 14.0 [!INCLUDE[server](../developer/includes/server.md)] instance before you run the installation. Otherwise, you will get an error that the [!INCLUDE[server](../developer/includes/server.md)] failed to install.

    For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

## Task 2: Prepare the version 14 application and tenant databases for upgrade

1. Make backup of the databases.
2. Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 14 as an administrator.
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

## Task 3: Upgrade the version 14 application database to the version 15 platform

This task runs a technical upgrade on the application database to convert it from the version 14 platform to the version 15 platform. The conversion updates the system tables of the database to the new schema (data structure) and provides the latest platform features and performance enhancements.

1. Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 15 as an administrator.
2. Run the Invoke-NAVApplicationDatabaseConversion cmdlet to start the conversion:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer .\BCDEMO -DatabaseName "Demo Database BC (14-0)"
    ```

## Task 4: Connect and configure the version 15 server instance to the application

When you installed version 15 in **Task 1**, a version 15 [!INCLUDE[server](../developer/includes/server.md)] instance was created. In this task, you change server configuration settings that are required to complete the upgrade. Some of the changes are only required for version 14 to version 15.0 upgrade, and can be reverted after you complete the upgrade.

1. Set the server instance to connect to the application database.

    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName DatabaseName -KeyValue "Demo Database BC (14-0)"
    ```
    
    In a single tenant deployment, this will mount the tenant automatically. For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md).

2. Disable task scheduler on the server instance for purposes of upgrade.

    ```
    Set-NavServerConfiguration -ServerInstance BC150 -KeyName "EnableTaskScheduler" -KeyValue false
    ```
    Be sure to re-enable this after upgrade if needed.
3. Restart the server instance.

    ```
    Restart-NAVServerInstance -ServerInstance BC150
    ```
<!--
## Task 4: Configure the version 15 server instance 

When you installed version 15 in **Task 1**, a version 15 [!INCLUDE[server](../developer/includes/server.md)] instance was created. In this task, you change some of the server configuration settings that are required to complete the upgrade. Some of the changes are only required for version 14 to version 15 upgrade, and can be reverted after you complete the upgrade.

1. Set the server instance to connect to the application database.

    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName DatabaseName -KeyValue "Demo Database BC (14-0)"
    ```
    
    In a single tenant deployment, this will mount the tenant automatically. For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md).

2. Configure the server instance to migrate 3rd party extensions to the use the new base application and system application extensions. 

    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"},{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"}]'
    ```
    <!-- with test
    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"e3d1b010-7f32-4370-9d80-0cb7e304b6f0", "name":"TestToolKit2", "publisher": "Default publisher"}]'
    ```
    This will configure the server instance to modify the manifest of extensions with a dependency on the base application and automatically install the base application <!--and test application-- on tenants after the data upgrade. Alternatively, you can omit this step, in which case you will have to manually install the extensions manually.

3. Configure the server instance to synchronize only the system application objects with tenants.

    This is done by setting the `FeatureSwitchOverrides` parameter to `forceSystemOnlyBaseSync`.

    ```
    Set-NAVServerConfiguration BC150 -KeyName "FeatureSwitchOverrides" -KeyValue "forceSystemOnlyBaseSync"
    ```

    This is required in order to synchronize tenants later in the upgrade process. This is required because the application database still contains the old metadata for the C/AL application objects, and these should not be synchronized with the tenant. By making this change, only system objects will by synchronized with the tenant. If you omit this step, you will get conflicts because of duplicate object IDs.

4. Temporarily disable task scheduler on the server instance for purposes of upgrade.

    ```
    Set-NavServerConfiguration -ServerInstance BC150 -KeyName "EnableTaskScheduler" -KeyValue false
    ```
5. Restart the server instance.

    ```
    Restart-NAVServerInstance -ServerInstance BC150
    ```
-->
## Task 5: Publish the platform symbols, system application, and base application extensions

In this task, you will publish extensions to the version 15 server instance. Publishing an extension adds the extension to the application database that is mounted on the server instance, making it available for installing on tenants later on. Publishing updates internal tables, compiles the components of the extension behind-the-scenes, and builds the necessary metadata objects that are used at runtime.

The steps in this task continue to use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 15 that you started in the previous task.
<!--
1. Increase the application version of the application database, and restart the server instance.

    Use the [Set-NAVApplication](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/set-navapplication) cmdlet to increase the application version number of the database to the version 15 application version.

    ```
    Set-NAVApplication BC150 -ApplicationVersion 15.0.34737.0 -force
    ```

    ```
    Restart-NAVServerInstance -ServerInstance BC150
    ```
-->
1. Publish version 15 system symbols extension.

    The symbols extension contains the required platform symbols that the base application depends on. The symbols extension package is called **System.app**. You find it where the **AL Development Environment** is installed, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment.  

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
    
    [What are symbols?](upgrade-overview-v15.md#Symbols) 
2. Publish the **System Application** extension (Microsoft_System Application.app).

    You find the (Microsoft_System Application.app in the **Applications\System Application\Source** folder of installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\W1DVD\Applications\System Application\Source\Microsoft_System Application.app"
    ```
   <!-- 
   ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\15.x\35986\W1DVD\Applications\System Application\Source\Microsoft_System Application.app"
    ```
    -->
    [What is the System Application?](upgrade-overview-v15.md#SystemApplication) 
3. Publish the Business Central base application extension (Microsoft_Base Application.app).

    The **Base Application** extension contains the application business objects. You find the (Microsoft_Base Application.app in the **Applications\BaseApp\Source** folder of installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\W1DVD\Applications\BaseApp\Source\Microsoft_Base Application.app"
    ```
   <!--
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\15.x\35986\W1DVD\Applications\BaseApp\Source\Microsoft_Base Application.app"
    ```
    -->
<!--
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\W1DVD\Applications\SalesAndInventoryForecast\Source\SalesAndInventoryForecast.app"
    ```

   <!--   
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\15.x\35986\W1DVD\Applications\SalesAndInventoryForecast\Source\SalesAndInventoryForecast.app"
    ```
    -->
<!--
7. Publish the 3rd-party extensions that were used before upgrade.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\AL\My14Ext\Default publisher_My14Ext_1.0.0.0.app"
    ```

   <!--  
    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\My14Ext\Default publisher_My14Ext_1.0.0.2.app -Skip"
    ```
    -->

## Task 6: Synchronize the tenant, system application, and base application extensions

In this task, you will synchronize the tenant's database schema any schema changes in the application database and extensions. Upgrading data updates the actual data that is stored in the tables of the tenant database to the schema changes that have been made to tables in application database. 

If you have a multitenant deployment, perform these steps for each tenant.

1. (Multitenant only) Mount the tenant to the version 15 server instance.

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
<!--
6. Synchronize the tenant with Microsoft and 3rd-party extensions.

    For each extension, run the Sync-NAVApp cmdlet: 

    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name "Sales And Inventory Forecast" -Version 15.0.35986.0
    ```
-->

## Task 7: Install system application and base application extensions

If you have a multitenant deployment, perform these steps for each tenant.

1. Install the system application extension on the tenant.

    To install the extension, you use the [Install-NAVApp cmdlet](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp). 

    ```
    Install-NAVApp -ServerInstance BC150 -Name "System Application" -Version 15.0.35986.0
    ```
2. Install the base application extension on the tenant.

    ```
    Install-NAVApp -ServerInstance BC150 -Name "Base Application" -Version 15.0.35986.0
    ```

    At this point, the base application is upgraded to the version 15 platform and is operational. You should be able to open the application in the client.

## Task 8: Upgrade the tenant data

Upgrading data updates the data that is stored in the tables of the tenant database to the schema changes that have been made to tables in application database and extensions. This step will also automatically install the **System Application** and **Base Application** extensions on the tenant.

1. To run the data upgrade, use the [Start-NavDataUpgrade](https://docs.microsoft.com/en-us/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet:

    ```
    Start-NAVDataUpgrade -ServerInstance BC150 -Tenant default -FunctionExecutionMode Serial -SkipAppVersionCheck -Force
    ```        
    
    <!--
    This step upgrades the data and installs the System Application and BaseApp extensions on the tenant. If you do not want to install the extensions, use the `-ExcludeExtensions` parameter. In this, case you will have to manually install these extensions before you complete the next step or to open the application in the client.
    
    > [!TIP]  
    >  In the last phase of data upgrade, all companies will be initialized by running codeunit 2 Company Initialization. This is done automatically. If you want to skip company initialization, then use the `Start-NavDataUpgrade` with the `-SkipCompanyIntitialization` parameter.
    -->
2. To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.
    
    When completed, the tenant state should be **Operational**.


## Task 9: Upgrade to the new versions of Microsoft extensions

Complete this task to upgrade any Microsoft extensions that were used in your deployment to new versions that are available on the installation media (DVD). The new versions are located in the **Application** folder of the DVD. There is a folder for each extension, and the extension package (.app file) is located in the **Source** folder. 

Do the following steps for each extension, and for each tenant in a multitenant deployment.

1. Publish the extension.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path c:"DVD\Applications\Applications\SalesAndInventoryForecast\Source\SalesAndInventoryForecast.app" -SkipVerification
    ```

2. Synchronize the tenant with the extension. 

    ```
    Sync-NAVApp -ServerInstance BC150 -Name "Sales and Inventory Forecast" -Version 15.0.35926.0
    ```
3. Upgrade the tenant data to the extension.

    ```
    Start-NAVAppDataUpgrade  -ServerInstance BC150 -Name "Sales and Inventory Forecast" -Version 15.0.35926.0
    ```
4. (Multitentant only) Repeat steps 2 and 3 for each tenant.


## Task 10: Configure the version 15 server instance for migrating 3rd party extensions

Complete this task if you have any 3rd party extensions that were installed in the version 14 deployment so that they can be published abd installed on tenants. You configure the `DestinationAppsForMigration` parameter of the version 15 server instance with information about the base application (specifically, the appId, name, and publisher). With the `DestinationAppsForMigration` parameter set, when you publish the 3rd party extensions, the server instance will automatically modify the manifest of the extensions to include the dependency on the base application, allowing them to be published.

1. Get the appId, name, and publisher of the base application.

    ```
    Get-NAVAppInfo BC150
    ```
2. Set the `DestinationAppsForMigration` parameter for the server instance configuration to include the information about the custom base application and test library (is used). For example:<!-- skip this step for now in single tenant-->

    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"}]'
    ```
3. Restart the server instance.

<!--

2. (Single tenant only) When upgrade is completed, restart the server instance.

    You will see that the custom base application has been installed on the tenant. 
3. Upgrade the tenant data to the Microsoft and 3rd party extensions.

    For each extension, run the Start-NAVAppDataUpgrade cmdlet.

    ```
    Start-NAVAppDataUpgrade  -ServerInstance BC150 -Name "Sales and Inventory Forecast" -Version 15.0.35986.0
    ```
-->
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

-->

## Task 9: Publish, synchronize and install 3rd party extensions

Complete the following steps for each extension.

1. Publish the extension.

    ```
    Publish-NAVApp bc150 -Path "C:\AL\My14Ext\Default publisher_My14Extension_1.0.0.0.app"
    ```

2. Synchronize the tenant with the extension. 

    ```
    Sync-NAVApp -ServerInstance BC150 -Name "My14Extension" -Version 1.0.0.0
    ```
3. Install the extension. 

    ```
    Install-NAVApp BC150 -Name My14Extension -Version 1.0.0.0
    ```
4. (Multitentant only) Repeat steps 2 and 3 for each tenant.

At this point, the upgrade is complete, and you should be able to open the client.

## Post-upgrade tasks

1. Enable task scheduler on the server instance.
2. (Multitnenat only) For tenants other than the tenant that you use for administration purposes, if you mounted the tenants using the `-AllowAppDatabaseWrite` parameter, dismount the tenants, then mount them again without using the `-AllowAppDatabaseWrite` parameter.

<!--
    Start-NAVAppDataUpgrade  -ServerInstance BC150 -Name "Sales and Inventory Forecast" -Version 15.0.35926.0
    ```


## Task 8: Install 3rd party extensions

For each extension, run the Install-NAVApp cmdlet:

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
