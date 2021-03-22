---
title: Install an update
description: This article describes the tasks required for getting the monthly update applied to your Dynamics 365 Business Central on-premises.
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---
# Installing a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] 2019 Release Wave 2 Update

This article describes how to install an update for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises. An update is a cumulative set of files that includes all hotfixes and regulatory features that have been released for Business Central.

You can choose to update only the platform or both the platform and application code. Therefore, the installation guidelines are separated into PLATFORM tasks and APPLICATION tasks.

## Overview

The following figure provides a high-level representation of a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment and the components that are involved in the installation of an update.

![Business Central application stack](../developer/media/bc15-architecture-overview.png "Business Central application stack")  

The databases store the application metadata and business data. If you have a single-tenant deployment, this data is stored in a single database. In multitenant deployment, the application metadata is stored in the application database and the business data is stored in one more tenant databases. 

### Application stack
The application is comprised of one or more AL extensions that define the objects (such as table, pages, reports, and codeunits) and code the make up the business logic. Each extension is compiled and delivered as a .app file, which is published to the Business Central Server instance.

- As a minimum, the deployment includes the base application. The base application can be either the Microsoft base application, which is the standard application available on the installation media (DVD), or a customized base application, which contains customized code.
- The Microsoft system application extension includes functionality that is not related directly related the business logic. For more information, see [Overview of the System Application](../developer/devenv-system-application-overview.md). Your deployment may or may not use the Microsoft system application.
- Customization extensions add functionality and features to the base application or system application. These can be either Microsoft extensions, which are available on the DVD, or third-party extensions, which can either extension developed by your organization or other, like an ISV.

### Platform versus application update
A platform update does not change the application. It basically involves converting your databases to the new platform and recompiling the existing extensions to ensure that they are compatible with the new platform.

An application update essentially involves publishing new versions of extensions that include the latest application modifications, and then synchronizing the databases with any schema changes introduced by the new extensions. The installation media (DVD) includes new versions of the Microsoft base application, Microsoft system application and Microsoft extensions. For a custom base application, the DVD also includes the AL source code for the Microsoft base application, which you can use to compare and merge updates into your custom application. Third-party extensions for which you do not have a new version for the update will only have to be recompiled. 

## Download the update package

The first thing to do is to download the update package that matches your Business Central deployment.

1. Go to the [list of available updates](../deployment/update-versions-15.md) for your on-premises version of Business Central, and then choose the update that you want.
2. From the update page, under the **Resolution** section, select the link for downloading the update, and follow the instructions.
3. On the computer where you downloaded the update .zip file, extract the all the files to a selected location. 

    When extracted, the update includes the DVD folder. This folder contains the full Business Central product, including the Business Central installation program (setup.exe), tools for upgrading to the platform, and the Microsoft extensions, including the AL source.

When this step is completed, you can proceed to update your Business Central deployment to the new platform and application.

## Prepare the existing databases

1. Backup your databases.

2. Uninstall all extensions from the all tenants.

    To uninstall an extension, you use the [Uninstall-NAVApp](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet. For example, together with the Get-NAVAPP cmdlet, you can uninstall all extensions with a single command:

    ``` 
    Get-NAVAppInfo -ServerInstance <server instance name> -Tenant <tenant ID> | % { Uninstall-NAVApp -ServerInstance <server instance name> -Name $_.Name -Version $_.Version -Tenant <tenant ID>}
    ``` 
    If you have a single tenant deployment, you can omit the `-Tenant` parameter and value.

3. (Multitenant only) Dismount the tenants from the application database.

    To dismount a tenant, use the [Dismount-NAVTenant](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```
    Dismount-NAVTenant -ServerInstance <BC14 server instance> -Tenant <tenant ID>
    ```

## Install Business Central components of the update

From the installation media (DVD), run setup.exe to install Business Central. As a minimum, install the following components: Server, Web Server Components, SQL Server Components, and AL Development Environment (optional).

For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

## PLATFORM

Follow the next few tasks to convert your database to the new platform of the update. In a multitenant deployment, this includes the application and tenant databases. The conversion updates the system tables of the database to the new schema (data structure) and provides the latest platform features and performance enhancements.

In addition, to ensure that the existing published extensions work on the new platform, you will recompile the extensions. 

## Convert the database to the new platform

1. Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.
2. Run the [Invoke-NAVApplicationDatabaseConversion cmdlet](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.management/invoke-navapplicationdatabaseconversion) to start the database conversion to the new platform.

    In a multitenant deployment, run this cmdlet against the application database.

    ```
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer <database server name>\<database server instance> -DatabaseName "<database name>"
    ```
        
    When completed, a message like the following displays in the console:

    ```
    DatabaseServer      : .\BCDEMO
    DatabaseName        : Demo Database BC (15-0)
    DatabaseCredentials :
    DatabaseLocation    :
    Collation           :
    ```

## Connect the server instance to the database

1. Connect the server instance to connect to the database.

    ```
    Set-NAVServerConfiguration -ServerInstance <server instance> -KeyName DatabaseName -KeyValue "<database name>"
    ```

    In a multitenant deployment, this is the application database. For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md).

2. Restart the server instance.

    ```
    Restart-NAVServerInstance -ServerInstance <server instance>
    ```

## Recompile published extensions

You must compile all published extensions against the new platform. To compile an extension, use the [Repair-NAVApp](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp) cmdlet, For example:

```  
Repair-NAVApp -ServerInstance <server instance> -Name <extension name> -Version <extension name>
```

To compile all published extensions at once, you can use this command:

```  
Get-NAVAppInfo -ServerInstance <server instance> | Repair-NAVApp  
``` 

## Synchronize the tenant

1. (Multitenant only) Mount the tenant to the new Business Central Server instance.

    You will have to do this step and the next for each tenant. For more information, see [Mount or Dismount a Tenant](../administration/mount-dismount-tenant.md).
 
2. Synchronize the tenant.
  
    Use the [Sync-NAVTenant](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet:

    ```  
    Sync-NAVTenant -ServerInstance <server instance> -Tenant <tenant ID> -Mode Sync
    ```

    For a single-tenant deployment, you can either set the `<tenant ID>` to `default` or omit the `-Tenant <tenant ID>` parameter. For more information about syncing, see [Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md).

    At this point, the application is running on the latest platform.

## APPLICATION

Follow the next tasks to update the application code to the new features and hotfixes. This includes publishing new versions of the system application extension (if it was used in old deployment), the base application extension, and any add-on extensions (Microsoft and third- party) that were used in the old deployment.

> [!NOTE]
> If a license update is required for a regulatory feature, customers can download an updated license from CustomerSource (see [How to Download a Microsoft Dynamics 365 Business Central License from CustomerSource](https://docs.microsoft.com/dynamics/s-e/)), and partners can download their customers' updated license from VOICE (see [How to Download a Microsoft Dynamics 365 Business Central Customer License from VOICE](https://mbs.microsoft.com/partnersource/deployment/documentation/howtoarticles/howtodownloadcustomernavlicense.htm)).

## Upgrade the system application

Follow these steps if your existing deployment uses the Microsoft system application.

1. Publish the **System Application** extension (Microsoft_System Application.app).

    You find the (Microsoft_System Application.app in the **Applications\System Application\Source** folder of installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance <server instance name> -Path "<path to Microsoft_System Application.app>"

2. Synchronize the tenant(s) with the **System Application** extension (Microsoft_System Application):

    Use the [Sync-NAVApp](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

    ```
    Sync-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name "System Application" -Version <extension version>
    ```

    Replace `<extension version>` with the exact version of the published System Application.
    
    > [!TIP]
    > To get a list of all published extensions, along with their names and versions, use the [Get-NAVAppInfo cmdlet](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo).
    
3. Run the data upgrade on the system application.

    To run the data upgrade, use the [Start-NavAppDataUpgrade](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```
    Start-NAVAppDataUpgrade -ServerInstance <server instance name> -Name "System Application" -Version <extension version>
    ```

    Upgrading data updates the data that is stored in the tables of the tenant database to the schema changes that have been made to tables of the system application.

## Upgrade the base application

### Microsoft base application

Follow these steps if your existing deployment uses the Microsoft base application.

1. Publish the Business Central base application extension (Microsoft_Base Application.app).

    The **Base Application** extension contains the application business objects. You find the Microsoft_Base Application.app in the **Applications\BaseApp\Source** folder of installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance <server instance name> -Path "<path to Microsoft_Base Application.app>"
    ```
2. Synchronize the tenant with the Business Central base application extension (Microsoft_BaseApp):

    ```
    Sync-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name "Base Application" -Version <extension version>
    ```
    Replace `<extension version>` with the exact version of the published Base Application.

    With this step, the base app takes ownership of the database tables. When completed, in SQL Server, the table names will be suffixed with the base app extension ID. This process can take several minutes.
3. Run the data upgrade on the base application.

    To run the data upgrade, use the [Start-NavAppDataUpgrade](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```
    Start-NAVAppDataUpgrade -ServerInstance <server instance name> -Name "System Application" -Version <extension version>
    ```
    Upgrading data updates the data that is stored in the tables of the tenant database to the schema changes that have been made to tables of the base application.

### Upgrade a custom base application

If you have a custom base application instead of the Microsoft base application, and you want the new application features and hotfixes that are included in the Microsoft base application, then you will have to merge the modifications made in the Microsoft base application into your custom base application and create a new version of your custom base application.

The source code for the new Microsoft base application version is in the **Base Application.Source.zip** file, which is on  the installation media (DVD), in the **Applications\BaseApp\Source** folder. You can use this together with the previous Microsoft base application source code and your custom application source to compare and merge into a new custom application version.

After you have created the new version of your custom application, you publish it to the application server instance, then synchronize and run the data upgrade on the tenants.

##  <a name="AddExtensions"></a>Upgrade add-on extensions

The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD) includes several new versions of Microsoft extensions (that is, extensions that have **Microsoft** as the publisher). If your old deployment uses these extensions, you should upgrade the current versions to the new versions. In addition, some 

If the old deployment used third-party extensions, and you still want to use them, they must be compiled to work on the new platform. If you have the source for these extensions, you build and compile a new version of the extension by using the AL development environment, and then you upgrade to new version as described in the next procedure. Otherwise, you can compile the current published versions of the extensions. 

## Upgrade Microsoft extensions

The general steps for this task are listed below. For detailed steps, see [Publishing, Upgrading, and Installing Extensions During Upgrade](upgrade-publish-extensions.md).

1. Publish the new extension versions from the installation media (DVD).
    
    This includes new versions of Microsoft extensions that you already have used on your application. The new extension versions are found in the `\Extensions` folder of the installation media (DVD).

    ```
    Publish-NAVApp -ServerInstance <server instance name> -Path <path to extension package file>
    ```

3. Synchronize the tenant database with the schema changes of the extensions.

    ```
    Sync-NavApp -ServerInstance <server instance name> -Name  <extension name>  -Version <extension version> -Tenant <tenant ID>
    ```
4. Upgrade the data associated with the Microsoft extensions. This step will automatically install the new version on the tenant

    ```
    Start-NAVAppDataUpgrade -ServerInstance <server instance name> -Name <extension name> -Version <extension version>
    ``` 

## Recompile and install published third-party extensions

This ensures that the extensions work on the new platform and application versions.

1. Compile the published extension by running the [Repair-NAVApp](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp) cmdlet:

    ```
    Repair-NAVApp -ServerInstance <server instance> -Name <extension name> -Version <version>
    ```

3. Synchronize the tenant with the extension.

    ```
    Sync-NAVApp -ServerInstance <server instance name> -Name <extension name> -Version <extension version>
    ```
4. Install the extension.

    ```
    Install-NAVApp -ServerInstance <server instance name> -Name <extension name> -Version <extension version>
    ```

## ADDITIONAL TASKS

## Publish the new system symbols for the update

This step is not required for the application at runtime, but it will be needed for developing extension against the new platform.

1. Unpublish the existing system symbols.

    ```
    Unpublish-NAVApp -ServerInstance <server instance> -Name System -version <version>
    ```
2. Publish the new system symbols extension for the update.

    The symbols extension contains the required platform symbols that the base application depends on. The symbols extension package is called **System.app**. If you have installed the **AL Development Environment**, you can find the file in the installation folder, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment. Or, it is also on the installation media (DVD) in the ModernDev\program files\Microsoft Dynamics NAV\150\AL Development Environment folder.

    ```
    Publish-NAVApp -ServerInstance <server instance> -Path "<path to the System.app file>" -PackageType SymbolsOnly
    ```
## See Also

[Dynamics 365 Business Central On-Premises Release Wave 2 Updates](../deployment/update-versions-15.md)  
[Upgrading to Dynamics 365 Business Central 2019 Release Wave 2](upgrade-overview-v15.md)  
[Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md)  
[Version numbers in Business Central](../administration/version-numbers.md)  
[Publish and Install an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md)  