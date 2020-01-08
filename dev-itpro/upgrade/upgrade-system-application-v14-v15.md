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
author: jswymer
ms.service: "dynamics365-business-central"
ROBOTS: NOINDEX
---
# Upgrade to Version 15.0 System Application

> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.

Follow this path when you have a customized Business Central version 14 application that you want to upgrade to use the version 15 System Application and platform. With this process, you will convert the entire application from C/AL to AL and refactor the application to use the System Application extension.

<!-- For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance, which include some customization on C/AL objects in the base application and a custom extension that modified the Item table. is proecess will convert the entire BC 14 custom application to an Extension on the BC 15 platform.-->

!["Upgrade to system application in Business Central](../developer/media/bc15-system-application-14-customized-app.png "Upgrade to system application in Business Central")

In version 15.0, application functionality that is not related to the business logic has been moved into separate modules that are combined into an extension known as the System Application. For an introduction to the System Application, see [Overview of the System Application](../developer/devenv-system-application-overview.md).

#### Single-tenant and multitenant deployments

The process for upgrading the very similar for a single-tenant and multitenant deployment. However, there are some inherent differences because with a single-tenant deployment, the application and business data are included in the same database, while with a multitenant deployment application code is in a separate database (the application database) than the business data (tenant). In the procedures that follow, for a single-tenant deployment, consider references to the *application database* and *tenant database* as the same database. Steps are marked as *Single-tenant only* or *Multitenant only* where applicable.

## Prerequisites

1. Upgrade to Business Central Spring 2019 [Cumulative Update 4](https://support.microsoft.com/help/4518535) (version 14).

   If your current deployment is already running cumulative update 5 (version 14.6), we recommend to wait until the first cumulative update for version 15 is released.

  For more information, see [Upgrading to Dynamics 365 Business Central On-Premises](upgrading-to-business-central-on-premises.md).

## Task 1:  Revert customizations made to the system application objects. 

The new system application extension includes several table objects that will replace table objects in your current base application. <!--The easiest transition is when the table definitions in the system application are identical to their counterparts in your custom base application. In this case, there is no extra work involved; only the sections that follow. -->The table definitions in the system application are based on the table definitions that were part of the standard C/AL base application for version 14. Before you can uptake the system application, you must ensure that the schemas (data structure) of these tables in your tenant database can be synchronized with the table definitions (metadata) in the system application. This means that, if additive changes where made to one of these tables in the past you will have to revert these changes. For more information, see [Reverting Customizations to System Application Objects](upgrade-revert-system-application-objects-customizations.md).

<!--
introduces any destructive changes to the table definitions (metadata), then you need determine how to handle these changes. Otherwise, you will run into problems when synchronizing the custom application with the tenant database later in the upgrade process, because the table schemas (data structure) in the SQL database will no longer match the table definitions in the custom base application.

Destructive changes occur when the following modifications were made to a custom base application table object in the past:
-->

## Task 2: Install [!INCLUDE[prodlong](../developer/includes/prodlong.md)] version 15

1. Before you install version 15, it can be useful to create desktop shortcuts to the the version 14.0 tools, such as the [!INCLUDE[admintool](../developer/includes/admintool.md)], [!INCLUDE[adminshell](../developer/includes/adminshell.md)], and [!INCLUDE[devshell](../developer/includes/devshell.md)] because the Start menu items for these will be replaced with the version 15.0 tools.

2. Install all components of Business Central 2019 release wave 2 (version 15).

    If you did not uninstall version 14.0, then you must either specify different port numbers for components (like the [!INCLUDE[server](../developer/includes/server.md)] instance and web services) during installation, or you must stop the version 14.0 [!INCLUDE[server](../developer/includes/server.md)] instance before you run the installation. Otherwise, you will get an error that the [!INCLUDE[server](../developer/includes/server.md)] failed to install.

    For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

3. Copy version 14 CodeViewer add-in to the version 15 server installation

    Copy the **CodeViewer** folder from the **Add-ins** folder of the Business Central version 14 RoleTailored client installation (C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\140\RoleTailored Client\Add-ins) to the **Add-ins** folder of the Business Central 150 Server installation (C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\Add-ins). Replace the existing folder and files, if any.
        
    In version 15.0, CodeViewer is no longer used, but it is required because of references that exist in the converted application. If you omit this step, you might get compilation errors later.

## Task 3: Convert the application code to AL and transition to the system application

1. Convert the application code to AL.

    For more information, see [Code Conversion from C/AL to AL](devenv-code-conversion.md).

2. Transition code to use the system application.

    For more information, see [Transitioning to the System Application](upgrade-uptake-system-application.md).

## Task 4: Prepare the version 14 application and tenant databases for upgrade

The next task is to prepare the application and tenant databases for upgrade. These step are done on the version 14 deployment environment and using the version 14 [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

1. Make backup of the database.
2. Make sure that you have access to the extension packages for all published extensions.

    You will need these later to publish and install the extensions again.
3. Uninstall all extensions from the old tenants.

    Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 14.0 as an administrator). To uninstall an extension, you use the [Uninstall-NAVApp](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet. For example, together with the Get-NAVAppInfo cmdlet, you can uninstall all extensions with a single command:

    ``` 
    Get-NAVAppInfo -ServerInstance <BC14 server instance> -Tenant <tenant ID> | % { Uninstall-NAVApp -ServerInstance <BC14 server instance> -Name $_.Name -Version $_.Version -Tenant <tenant ID>}
    ``` 

    If you have a single tenant deployment, you can omit the `-Tenant` parameter and value. 

3. Unpublish all extensions from the application server instance.

    To unpublish extensions, use the [Unpublish-NAVAPP cmdlet](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp). Together with the [Get-NAVAppInfo cmdlet](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo?view=businesscentral-ps), you can uninstall all extensions from the tenant using a single command:

    ```
    Get-NAVAppInfo -ServerInstance <BC14 server instance> | % { Unpublish-NAVApp -ServerInstance <BC14 server instance> -Name $_.Name -Version $_.Version }
    ```

4. Unpublish all system, test, and application symbols.

    To unpublish symbols, use the Unpublish-NAVAPP cmdlet with the `-SymbolsOnly` switch.

    ``` 
    Get-NAVAppInfo -ServerInstance <BC14 server instance> -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance <BC14 server instance> -Name $_.Name -Version $_.Version }
    ```    

    [What are symbols?](upgrade-overview-v15.md#Symbols)  

5. (Multitenant only) Dismount the tenants from the application server instance.

    To dismount a tenant, use the [Dismount-NAVTenant](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```
    Dismount-NAVTenant -ServerInstance <BC14 server instance> -Tenant <tenant ID>
    ```

6. Stop the server instance.

    ```
    Stop-NAVServerInstance -ServerInstance <BC14 server instance>
    ```

## Task 5: Convert the version 14.0 application database to the version 15.0 platform

This task runs a technical upgrade on the application database to convert it from the version 14.0 platform to the version 15.0 platform. The conversion updates the system tables of the database to the new schema (data structure) and provides the latest platform features and performance enhancements.

1. Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 15.0 as an administrator.
2. Run the [Invoke-NAVApplicationDatabaseConversion cmdlet](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.management/invoke-navapplicationdatabaseconversion) to start the conversion:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer <database server>\<database instance> -DatabaseName "<BC14 database name>"
    ```
    When completed, a message like the following displays in the console:

    ```
    DatabaseServer      : .\BCDEMO
    DatabaseName        : Demo Database BC (14-0)
    DatabaseCredentials :
    DatabaseLocation    :
    Collation           :
    ```

## Task 6: Connect and configure the version 15 server for app migration

When you installed version 15 in **Task 2**, a version 15 [!INCLUDE[server](../developer/includes/server.md)] instance was created. In this task, you change server configuration settings that are required to complete the upgrade. Some of the changes are only required for version 14 to version 15.0 upgrade and can be reverted after you complete the upgrade.

1. Set the server instance to connect to the application database.

    ```
    Set-NAVServerConfiguration -ServerInstance <BC15 server instance> -KeyName DatabaseName -KeyValue "<BC14 database name>"
    ```
    
    In a single tenant deployment, this will mount the tenant automatically. For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md).

<!--
2. Configure the server instance to synchronize only the system application objects with tenants.

    This is done by setting the `FeatureSwitchOverrides` parameter to `forceSystemOnlyBaseSync`.

    ```
    Set-NAVServerConfiguration <BC15 server instance> -KeyName "FeatureSwitchOverrides" -KeyValue "forceSystemOnlyBaseSync"
    ```

    This is required in order to synchronize tenants later in the upgrade process. This is required because the application database still contains the old metadata for the C/AL application objects, and these should not be synchronized with the tenant. By making this change, only system objects will by synchronized with the tenant. If you omit this step, you will get conflicts because of duplicate object IDs.
-->

2. Configure the server instance for migrating extensions by setting the `DestinationAppsForMigration` key.

    ```
    Set-NAVServerConfiguration -ServerInstance <server instance name> -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"63ca2fa4-4f03-4f2b-a480-172fef340d3f", "name":"System Application", "publisher": "Microsoft"},{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"}, {"appId":"<test library extension app ID>", "name":"<test library extension name>", "publisher": "<test library publisher>"}]]'
    ```

    This setting serves the following purposes:
    
    - When you run the data upgrade on a tenant, the server will run the data upgrade for the base and system application extensions. In addition, the base and system applications will be automatically installed on the tenant.
    - It enables you to re-publish extensions that have not been rebuilt on version 15 with a dependency on the base and system applications. This typically includes the third-party extensions that were used in your version 14. When you publish the extensions, the extension manifests are automatically modified with a dependency on the base and system applications.

3. Disable task scheduler on the server instance for purposes of upgrade.

    ```
    Set-NavServerConfiguration -ServerInstance <BC15 server instance> -KeyName "EnableTaskScheduler" -KeyValue false
    ```
    Be sure to re-enable this after upgrade if needed.

4. Restart the server instance.

    ```
    Restart-NAVServerInstance -ServerInstance <BC15 server instance>
    ```

## Task 7: Publish system symbols, system application, base application, and test library extensions

In this task, you will publish extensions to the version 15.0 server instance. Publishing an extension adds the extension to the application database that is mounted on the server instance, making it available for installing on tenants later. Publishing updates internal tables, compiles the components of the extension behind-the-scenes, and builds the necessary metadata objects that are used at runtime.

The steps in this task continue to use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 15.0 that you started in the previous task.

1. Publish the system symbols extension for version 15.

    The symbols extension contains the required platform symbols that the base application depends on. The symbols extension package is called **System.app**. You find it where the **AL Development Environment** is installed, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment.  

    ```
    Publish-NAVApp -ServerInstance <BC15 server instance> -Path "<path to the System.app file>" -PackageType SymbolsOnly
    ```

2. Publish the **System Application** extension (Microsoft_System Application.app).

    You find the (Microsoft_System Application.app in the **Applications\System Application\Source** folder of installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance <server instance name> -Path "<path to Microsoft_System Application.app>"
    ```
    [What is the System Application?](upgrade-overview-v15.md#SystemApplication)

3. Publish the custom base application extension that you created in **Task 2**.

    ```
    Publish-NAVApp -ServerInstance <BC15 server instance> -Path "<path to the base application extension package file>"
    ```

3. Publish the test library extension if you created one in **Task 2**.

    ```
    Publish-NAVApp -ServerInstance <BC15 server instance> -Path "<path to the test library extension package file>"
    ```

## Task 8: Upgrade the tenant databases

1. Synchronize system application and base application extensions with the tenant database.

    With this step, the base application takes ownership of the database tables. When completed, in SQL Server, the table names will be suffixed with the base application extension ID.
2. Install system application extension, followed by the base application extension.
3. Run the data upgrade on the tenant database.

   To run the data upgrade, run the [Start-NavDataUpgrade cmdlet](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) with the `-FunctionExecutionMode Serial`, `-SkipAppVersionCheck`, and `-Force` parameters, for example:

    ```
    Start-NAVDataUpgrade -ServerInstance BC150 -Tenant default -FunctionExecutionMode Serial -SkipAppVersionCheck -Force
    ```

## Task 9: Publish and install customization extensions

Now, you can publish and install the Microsoft and 3rd-party extensions that were published and installed on the tenant before the upgrade.

1. Configure the version 15 server instance for migrating extensions.

    With this task, you configure the version 15 server so that the Microsoft and 3rd party extensions that were installed in the version 14 deployment can be reinstalled. You will do this by configuring the `DestinationAppsForMigration` parameter of the serve instance with information about the custom base application and test library. Specifically, you need the appId, name, and publisher assigned to these extensions. With the `DestinationAppsForMigration` parameter set, when you publish the Microsoft and 3rd party extensions, the server instance will automatically modify the manifest of the extensions to include the dependency on the base application and test library extension, allowing them to be published.

    1. Set the `DestinationAppsForMigration` parameter for the server instance configuration to include the information about the custom base application and test library (is used). For example:<!-- skip this step for now in single tenant-->
    
        ```
        Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"Base Application", "publisher": "Microsoft"},{"appId":"7914d8cb-58b7-4fda-8261-8b4f217c184d", "name":"TestLibrary", "publisher": "Default publisher"}]'
        ```
    2. Restart the server instance.
2. Publish the extension.
3. Synchronize the extension with the tenant database.
4. Install the extension on the tenant.
5. Repeat steps 3 and 4 for each tenant.

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
