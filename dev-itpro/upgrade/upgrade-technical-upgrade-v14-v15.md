---
title: Technical Upgrade 
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
# Technical Upgrade to [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2019 Wave 2

> [!IMPORTANT]  
> [!INCLUDE[vnext_preview](../developer/includes/vnext_preview.md)] 
>
> Please note that this topic is a draft in progress. We are still working on adding more details to the steps described in this topic.

Use this process when you have a customized Business Central application that you want to upgrade to the Business Central Wave 2 platform. This will not upgrade the application to the latest version. With this process, you will convert the entire application from C/AL to an base application extension.

<!-- For this scenario, I used a BC 14.0 modified base application on a BC 14.0 server instance, which include some customization on C/AL objects in the base application and a custom extension that modified the Item table. is proecess will convert the entire BC 14 custom application to an Extension on the BC 15 platform.-->

 ![Upgrade on customized Business Central application](../developer/media/bc15-upgrade-customized-app.png "Upgrade on customize Business Central application")  
 
## Prerequisites

1. Upgrade to Business Central Spring 2019.

## Install [!INCLUDE[prodlong](../developer/includes/prodlong.md)] 2019 Wave 2 (version 15.0)

1. Before you install version 15.0, it can be useful to create desktop shortcuts to the the version 14.0 tools, such as the [!INCLUDE[admintool](../developer/includes/admintool.md)], [!INCLUDE[adminshell](../developer/includes/adminshell.md)], and [!INCLUDE[devshell](../developer/includes/devshell.md)] because the Start menu items for these will be replaced with the version 15.0 tools.

2. Install all components of Business Central 2019 Wave 2 (version 15) bu using setup.exe.

    > [!IMPORTANT]
    > Because of dependencies, we recommend that for upgrade , you install all components available. Also, there is currently a known issue with the Microsoft.Office.Interop.Word.dll. After installation, you must copy the Microsoft.Office.Interop.Word.dll from the C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\RoleTailored Client folder to the C:\Program Files\Microsoft Dynamics 365 Business Central\150\Service\Add-ins folder.

    For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

## Task 1: Convert your application from C/AL to AL

The first thing to do is convert your solution from C/AL to AL. For more information, see [Code Conversion from C/AL to AL](devenv-code-conversion.md).

## Task 2: Prepare the application database for technical upgrade

1. Make backup of the database.
2. Uninstall all extensions from the old tenants.

    Use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for Business Central Spring 2019 (run as an administrator):

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -Tenant default | % { Uninstall-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version -Tenant default}
    ``` 
3. Unpublish all system and application symbols.

    ``` 
    Get-NAVAppInfo -ServerInstance BC140 -SymbolsOnly | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }
    ```     
4. Unpublish all extensions from the application.

   You can use the Get-NAVAppInfo and Unpublish-NAVApp cmdlets as follows:

    ```
    Get-NAVAppInfo -ServerInstance BC140 | % { Unpublish-NAVApp -ServerInstance BC140 -Name $_.Name -Version $_.Version }
    ```

5. (Multitenant only) Dismount the tenants. and stop server instance.

   ```
   Dismount-NAVTenant BC140 -Tenant default
   ```
6. Stop the server instance.

## Task 3: Upgrade the application database to the version 15.0 platform

This step will upgrade the system tables of the application to the version 15 platform. Start the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for 2019 Wave 2 as an administrator, and run this command:

```
Invoke-NAVApplicationDatabaseConversion -DatabaseServer .\BCDEMO -DatabaseName "Demo Database BC (14-0)"
``` 

## Task 4: Publish the base application, symbols, and extensions

1. Connect a version 15.0 server instance to the application database.

    In a single tenant deployment, this will mount the tenant automatically.

2. Configure the server instance to migrate Microsoft and 3rd party extensions to the use the new base application extension. 

    ```
    Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "DestinationAppsForMigration" -KeyValue '[{"appId":"437dbf0e-84ff-417a-965d-ed2bb9650972", "name":"BaseApp", "publisher": "Microsoft"},{"appId":"e3d1b010-7f32-4370-9d80-0cb7e304b6f0", "name":"TestToolKit2", "publisher": "Default publisher"}]'
    ```

    This will configure the server instance to automatically install the base application and test application on tenants after the data upgrade. Alternatively, you can omit this step, in which case you will have to manually install the extensions manually.

3. Configure the server instance to synchronize only the base application with tenants.

    ```
     Set-NAVServerConfiguration -ServerInstance BC150 -KeyName "FeatureSwitchOverrides" -KeyValue "forceSystemOnlyBaseSync"
    ```

2. Increase the application version to the version that you gave the custom base application:

    ``` 
    Set-NAVApplication BC150 -ApplicationVersion 15.0.34982.0 -force
    ``` 
    
    At this point, the tenant state is **OperationalWithSyncPending**.
3. Publish platform system symbols.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment\System.app" -PackageType SymbolsOnly
    ```
4. Publish the custom base application extension:

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\CusomtBaseApp2\Microsoft_BaseApp_15.0.34982.0.app" -SkipVerification
    ```

4. Publish the Microsoft and 3rd party extensions.

    Publish the Microsoft and 3rd party extensions that were published to the old application.

    ```
    Publish-NAVApp -ServerInstance BC150 -Path "C:\Users\jswymer\Documents\AL\My14Extension\Default publisher_My14Extension_1.0.0.4.app" -SkipVerification
    ```

## Task 5: Synchronize and upgrade the tenants

If you have a multitenant deployment, perform these steps for each tenant.

1. (Multitnent only) Mount the tenant.

    ```
    Mount-NAVTenant -ServerInstance BC150 -Tenant default -DatabaseName "Demo Database BC (14-0)" -DatabaseServer navdevvm-0127 -DatabaseInstance BCDEMO
    ```

2. Synchronize the tenant.
  
    ```
    Sync-NAVTenant -ServerInstance BC150 -tenant default
    ```

    When completed the tenant state is **OperationalDataUpgradePending**.

3. Synchronize the tenant with the base application extension (BaseApp):

    ```
    Sync-NAVApp -ServerInstance BC150 -Name "BaseApp" -Version 15.0.34982.0 -tenant default
    ```

    This will append tables in database with extension IDs.

5. Upgrade the tenant data.

    ```
    Start-NAVDataUpgrade -ServerInstance BC150 -FunctionExecutionMode Serial -Force -SkipCompanyInitialization
    ```

6. (Single tenant only) When upgrade is completed, restart the server instance.

    You will see that the custom base application has been installed on the tenant. 


The application should now be accessible from the client.

## Task 6: Synchronize and install Microsoft and 3rd party extensions on the tenants

Now, you can publish the Microsoft and 3rd-party extensions that were published in the old solution. For each extension, do the following steps:

1. Synchronize the extension with the tenant:
    ```
    Sync-NAVApp -ServerInstance BC150 -Tenant default -Name My14Extension -Version 1.0.0.4
    ```

2. Install the extension on the tenant:

    ```
    Install-NAVApp -ServerInstance BC150 -Tenant default -Name My14Extension -Version 1.0.0.4
    ```


## See Also  
[Upgrading the Data](Upgrading-the-Data.md)   
[Upgrading to Business Central](upgrading-to-business-central.md)  
