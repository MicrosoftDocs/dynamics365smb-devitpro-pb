---
title: Upgrade Application Code
description: The article explains how to upgrade the application code and how to merge code from different versions of the application.
ms.custom: na
ms.date: 04/01/2019
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

Use this scenario if you have a Business Central application that has not been modified. Your solution might include Microsoft (1st party) extensions and custom extensions (3rd party). With this upgrade, you will replace the C/AL base application with the new Business Central V15.0 base app extension. The result will be a fully upgraded application and platform on V15.0.

<!-- For this scenario, I am upgrading a BC 14.0 unmodified base application. Because the application was unmodified, I upgraded to the BC 15 base app.-->

 ![Upgrade on unmodified Business Central application](../developer/media/bc15-upgrade-unmodified-app.png "Upgrade on unmodified Business Central application") 

## Prerequisite

1. Upgrade to the latest Business Central Spring 2019 Cumulative Update (version 14.0).

## Task 1: Prepare the version 14.0 application and tenant databases for upgrade

1. Make backup of the databases.
2. Uninstall all extensions from the tenants.

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version -Tenant default}
    ``` 
3. Unpublish all system, test, and application symbols from the application.

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }
    ``` 
4. (Multitenant only) Dismount the tenants from the application server instance.
5. Stop the server instance.

## Task 2: Upgrade the version 14.0 application to the version 15.0 platform
     
1. Run a technical upgrade on the application.

    Start [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for 2019 Wave 2 as an administrator, and run the Invoke-NAVApplicationDatabaseConversion cmdlet:

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer .\BCDEMO -DatabaseName "Demo Database BC (14-0)"
    ```

## Task 3: Upgrade the application

1. Connect a version 15.0 server instance to the application database, and then start the server instance.
2. Increase the application version of the application database.

    ```
    Set-NAVApplication BC150 -ApplicationVersion 15.0.34737.0 -force
    ```
3. Configure the server instance to synchronize only the base application with tenants.

    ```
     Set-NAVServerConfiguration bc150 -KeyName "FeatureSwitchOverrides" -KeyValue "forceSystemOnlyBaseSync"
    ```
4. Publish version 15 system symbols extension.

    The symbols extension package is called **System.app**. You find it where the **AL Development Environment** is installed, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment.  

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
5. Publish the System Application extension (Microsoft_System Application_15.0.34737.0.app).

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_System Application_15.0.34737.0.app" -SkipVerification
    ```

6. Publish the Business Central base application extension (Microsoft_BaseApp_15.0.34737.0.app).

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\w1Build\Extensions\W1\Microsoft_BaseApp_15.0.34737.0.app" -SkipVerification
    ```

## Task 4: Synchronize and upgrade the tenants

If you have a multitenant deployment, perform these steps for each tenant.

1. (Multitenant only) Mount the tenant to the version 15.0 server instance.
2. Synchronize the tenant with the application.

    ```  
    Sync-NAVTenant -ServerInstance BC150 -Tenant default
    ```

    At this stage, the tenant state is **OperationalDataUpgradePending**.

4. Synchronize the tenant with the System Application extension (Microsoft_System Application_15.0.34737.0):

    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name "System Application" -Version 15.0.34737.0
    ```
5. Synchronize the tenant with the Business Central Base Application extension (BaseApp):
    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name "BaseApp" -Version 15.0.34737.0 -Mode ForceSync
    ```

    This can take several minutes.

    <!--**Error:**

    Got this error the second time:
    
    ```
    Sync-NAVApp BC150 -Name "BaseApp" -Version 15.0.34737.0
    Sync-NAVApp : Table Invoice Post. Buffer :: Unsupported field change.
    Field:Additional Grouping Identifier; Change:LengthChanged
    Table Incoming Document :: Unsupported field change. Field:URL1; Change:Remove
    Table Incoming Document :: Unsupported field change. Field:URL2; Change:Remove
    Table Incoming Document :: Unsupported field change. Field:URL3; Change:Remove
    Table Incoming Document :: Unsupported field change. Field:URL4; Change:Remove
    At line:1 char:1
    + Sync-NAVApp BC150 -Name "BaseApp" -Version 15.0.34737.0
    + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        + CategoryInfo          : InvalidOperation: (:) [Sync-NAVApp], InvalidOper
       ationException
        + FullyQualifiedErrorId : MicrosoftDynamicsNavServer$BC150/nav-systemappli
       cation,Microsoft.Dynamics.Nav.Apps.Management.Cmdlets.SyncNavApp
    ```
    
    To fix this I synced again using `-mode forcesync`.

    -->
    

6. Upgrade the tenant data.

    ```
    Start-NAVDataUpgrade -ServerInstance BC150 -Tenant default -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
    ```        

    This step upgrades the data and installs the System Application and BaseApp extensions on the tenant. If you do not want to install the extensions, use the `-ExcludeExtensions` parameter. In this, case you will have to manually install these extensions before you complete the next step or to open the application in the client.

    To view the progress of the data upgrade, you can run Get-NavDataUpgrade cmdlet with the `–Progress` switch.
    
    When completed, the tenant state should be **Operational**.

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

## Task 5: Publish and upgrade Microsoft extensions

Complete this task to upgrade any Microsoft extensions that were used in the previous version to new versions that are available on the installation media. Do the following steps for each extension.

1. Publish the extension.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path c:"\\vedfssrv01\DynNavFS\Ship\W1\Main\34737\W1DVD\Extensions\SalesAndInventoryForecast.app" -SkipVerification
    ```
2. Synchronize the tenant with the extension. 

    ```
    Sync-NAVAapp BC150 -Name "Sales and Inventory Forecast" -Version 15.0.34737.0
    ```
3. Upgrade the tenant data to the extension.

    ```
    Start-NAVAppDataUpgrade BC150 -Name "Sales and Inventory Forecast" -Version 15.0.34737.0
    ```

## Task 6: Publish and install 3rd party extensions

Complete this task if you have 3rd-party extensions to upgrade. The extensions must be modified to work with base application extension. There are two ways to do this. You can either modify the extension code or configure the version 15 server instance to handle this.

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
4. Synchronize the tenant with the extension:

    ```
    Sync-NAVApp BC150 -Name My14Extension -Version 1.0.0.3
    ```
5. Install the extension:

    ```
    Install-NAVApp BC150 -Name My14Extension -Version 1.0.0.3
    ```

## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
