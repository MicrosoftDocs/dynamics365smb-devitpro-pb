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

The following figure provides a high-level representation of a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution and the components that are involved in the installation of an update.

![Business Central application stack](../developer/media/bc15-architecture-overview.png "Business Central application stack")  

The databases store the application metadata and business data. If you have a single-tenant deployment, this data is stored in a single database. In multitenant deployment, the application metadata is stored in the application database and the business data is stored in one or more tenant databases.

### Application stack
The application is comprised of one or more AL extensions that define the objects (such as table, pages, reports, and codeunits) and code that the make up the business logic. Each extension is compiled and delivered as a .app file, which is published to the Business Central Server instance.

- Base application

    As a minimum, the solution always includes the Base Application. The Base Application contains the objects (such as table, pages, codeunits, and reports) that define the business logic and functionality of the solution. The Base Application can be either the Microsoft Base Application, which is the standard application available on the installation media (DVD), or a customized Base Application, which contains customized code.
- System application

    The Microsoft System Application extension includes functionality that is not related directly related the business logic. For more information, see [Overview of the System Application](../developer/devenv-system-application-overview.md). If you are using the Microsoft Base Application, then your solution uses the System Application. If you have a custom Base Application, your solution may or may not use the System Application. If it does not, you can skip any steps in this article related to the System Application.
- Extensions

    Extensions add functionality and features to the Base Application or System Application. These can be either Microsoft extensions, which are available on the DVD, or third-party extensions, which can either be extensions developed by your organization or another, like an ISV.

### Single-tenant and multitenant deployments

The process for upgrading is very similar for a single-tenant and multitenant deployment. However, there are some inherent differences because with a single-tenant deployment, the application and business data are included in the same database, while with a multitenant deployment, application code is in a separate database (the application database) than the business data (tenant). In the procedures that follow, for a single-tenant deployment, consider references to the *application database* and *tenant database* as the same database. Steps are marked as *Single-tenant only* or *Multitenant only* where applicable.

### Platform versus application update

A platform update does not change the application. It basically involves converting your databases to the new platform and recompiling the existing extensions to ensure that they are compatible with the new platform.

An application update essentially involves publishing new versions of extensions that include the latest application modifications, synchronizing the databases with any schema changes introduced by the new extensions, and updating affected data. The installation media (DVD) includes new versions of the Microsoft Base Application, Microsoft System Application and Microsoft extensions. For a custom Base Application, the DVD also includes the AL source code for the Microsoft Base Application, which you can use to compare and merge updates into your custom application. Third-party extensions for which you do not have a new version for the update will only have to be recompiled.

## PREPARATION

## Download update package

The first thing to do is to download the update package that matches your Business Central solution.

1. Go to the [list of available updates](../deployment/update-versions-15.md) for your on-premises version of Business Central, and then choose the update that you want.
2. From the update page, under the **Resolution** section, select the link for downloading the update, and follow the instructions.
3. On the computer where you downloaded the update .zip file, extract the all the files to a selected location. 

    When extracted, the update includes the DVD folder. This folder contains the full Business Central product, including the Business Central installation program (setup.exe), tools for upgrading to the platform, and the Microsoft extensions, including the AL source.

When this step is completed, you can proceed to update your Business Central solution to the new platform and application.

## Prepare existing databases

1. Backup your databases.

2. Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.

3. (Single-tenant only) Uninstall all extensions from the all tenants.

    In this step, you uninstall the Base Application, System Application (if used), and any other extensions that are currently installed on the database.

    1. Get a list of installed extensions.
    
        This step is optional, but it can be useful to the names and versions of the extensions.

        To get a list of installed extensions, use the [Get-NAVAppInfo cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo).

        ```powershell 
        Get-NAVAppInfo -ServerInstance <server instance name> -Tenant <tenant ID>
        ``` 

        For a multitenant deployment, replace `<tenant ID>` with the ID of the tenant. For a single-tenant deployment, set `<tenant ID>` to `default`. 
    2. Uninstall the extensions.
    
        To uninstall an extension, you use the [Uninstall-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet.
    
        ```powershell 
        Uninstall-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name <extensions name> -Version <extension version> -Force
        ```
        
        Replace  `<extension name>` and `<extension version>` with the exact name and version the installed extension. For single-tenant deployment, set `<tenant ID>` to `default` or omit the `-Tenant` parameter.

        For example, together with the Get-NAVApp cmdlet, you can uninstall all extensions with a single command:

        ```powershell 
        Get-NAVAppInfo -ServerInstance <server instance name> -Tenant <tenant ID> | % { Uninstall-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name $_.Name -Version $_.Version -Force}
        ```
4. Unpublish the existing system symbols.

    To unpublish the system symbols, use the [Unpublish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp) as f:
    
    ```
    Unpublish-NAVApp -ServerInstance <server instance> -Name System -version <version>
    ```

    [What are symbols?](upgrade-overview-v15.md#Symbols).

5. (Multitenant only) Dismount the tenants from the application database.

    To dismount a tenant, use the [Dismount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```powershell
    Dismount-NAVTenant -ServerInstance <server instance> -Tenant <tenant ID>
    ```

## Install Business Central components

From the installation media (DVD), run setup.exe to uninstall the current Business Central components and install the Business Central components included in the update. 

1. Stop the [!INCLUDE[server](../developer/includes/server.md)] instance.

    ```powershell
    Stop-NAVServerInstance -ServerInstance <server instance>
    ```
2. Run setup.exe to uninstall your current version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].
3. Run setup.exe again to install components of the update.

    1. Follow setup pages until you get to the **Microsoft [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Setup** page.
    2. Select **Advance installation options** > **Choose an installation option** > **Custom**.
    3. On the **Customize the installation** page, select the following components as a minimum:

        - AL Development Environment (optional but recommended)
        - Server
        - Web Server Components.
    3. Select **Next**.
    4. On the **Specify parameters** page, set the fields as needed.

        > [!IMPORTANT]
        > Clear the **SQL Database** field so that it is blank. At this time, do not set this to the database that you want to update; otherwise, the installation of the [!INCLUDE[server](../developer/includes/server.md)] will fail. You will connect the database to the [!INCLUDE[server](../developer/includes/server.md)] later after it is converted to the new platform.

        <!--
        > [!IMPORTANT]
        > Make sure that you set the **SQL Database** to something other than the name of your database, so that your database is not overwritten.-->
    5. Select **Apply** to complete the installation.

For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

## PLATFORM UPDATE

Follow the next few tasks to convert your database to the new platform of the update. In a multitenant deployment, this includes the application and tenant databases. The conversion updates the system tables of the database to the new schema (data structure) and provides the latest platform features and performance enhancements.

In addition, to ensure that the existing published extensions work on the new platform, you will recompile the extensions.

## Convert existing database to new platform

1. Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.
2. Run the [Invoke-NAVApplicationDatabaseConversion cmdlet](/powershell/module/microsoft.dynamics.nav.management/invoke-navapplicationdatabaseconversion) to start the database conversion to the new platform.

    In a multitenant deployment, run this cmdlet against the application database.

    ```powershell
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

## Connect server instance to database

1. Connect the server instance to connect to the database.

    ```powershell
    Set-NAVServerConfiguration -ServerInstance <server instance> -KeyName DatabaseName -KeyValue "<database name>"
    ```

    In a multitenant deployment, this is the application database. For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md).

2. Restart the server instance.

    ```powershell
    Restart-NAVServerInstance -ServerInstance <server instance>
    ```
## Publish the new system symbols

Use the Publish-NAVApp cmdlet to publish the new symbols extension package, which is called **System.app**. If you have installed the **AL Development Environment**, you can find the file in the installation folder, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment. Or, it is also on the installation media (DVD) in the ModernDev\program files\Microsoft Dynamics NAV\150\AL Development Environment folder.

```
Publish-NAVApp -ServerInstance <server instance> -Path "<path to the System.app file>" -PackageType SymbolsOnly
```
## Recompile published extensions

You must compile all published extensions against the new platform.

> [!NOTE]
> If you plan on updating the application you can skip this step for extensions for which you have new versions built on the new platform. For example, this includes Microsoft extensions that are on the DVD.  

1. To compile an extension, use the [Repair-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp) cmdlet, For example:

    ```powershell  
    Repair-NAVApp -ServerInstance <server instance> -Name <extension name> -Version <extension name>
    ```
    
    To compile all published extensions at once, you can use this command:
    
    ```powershell  
    Get-NAVAppInfo -ServerInstance <server instance> | Repair-NAVApp  
    ```
2. Restart the server instance.

    ```powershell
    Restart-NAVServerInstance -ServerInstance <server instance>
    ```

## Synchronize tenant

1. (Multitenant only) Mount the tenant to the new Business Central Server instance.

    You will have to do this step and the next for each tenant. For more information, see [Mount or Dismount a Tenant](../administration/mount-dismount-tenant.md).
 
2. Synchronize the tenant.
  
    Use the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet:

    ```powershell  
    Sync-NAVTenant -ServerInstance <server instance> -Tenant <tenant ID> -Mode Sync
    ```

    For a single-tenant deployment, you can either set the `<tenant ID>` to `default` or omit the `-Tenant <tenant ID>` parameter. For more information about syncing, see [Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md).


> [!NOTE]
> At this point, if you want to update the application, you can skip the next step and proceed [APPLICATION](#Application).   

## (Single-tenant only) Reinstall extensions

In this task, you reinstall the base same extensions that were installed on the tenant prior to the update. If you are planning on updating the application, then you only perform this step on third-party extensions.

To install an extension, you use the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp).

1. If your solution uses the System Application, install this first.

    ```powershell 
    Install-NAVApp -ServerInstance <server instance> -Name "System Application" -Version <extension version>
    ```
    Replace `<extension version>` with the exact version of the published System Application.

2. Install the Base Application.

    ```powershell
    Install-NAVApp -ServerInstance <server instance> -Name "Base Application" -Version <extension version>
    ```
    Replace `<extension version>` with the exact version of the published System Application.
3. Install other extensions, including Microsoft and third-party extensions.
    
    ```powershell
    Install-NAVApp -ServerInstance <server instance name> -Name <extension name> -Version <extension version>
    ```
At this point, your solution has been updated to the latest platform.

## <a name="Application"></a> APPLICATION UPDATE

Follow the next tasks to update the application code to the new features and hotfixes. This includes publishing new versions of the System Application extension (if it was used in old solution), the Base Application extension, and any add-on extensions (Microsoft and third- party) that were used in the old solution.

> [!NOTE]
> If a license update is required for a regulatory feature, customers can download an updated license from CustomerSource (see [How to Download a Microsoft Dynamics 365 Business Central License from CustomerSource](https://mbs.microsoft.com/customersource/northamerica/NAV/learning/documentation/how-to-articles/downloadnavlicensecs)), and partners can download their customers' updated license from VOICE (see [How to Download a Microsoft Dynamics 365 Business Central Customer License from VOICE](https://mbs.microsoft.com/partnersource/northamerica/deployment/documentation/how-to-articles/howtodownloadcustomernavlicense)).

## Upgrade System Application

Follow these steps if your existing solution uses the Microsoft System Application; if not, you can skip this procedure.

1. Publish the **System Application** extension (Microsoft_System Application.app).

    You find the (Microsoft_System Application.app in the **Applications\System Application\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance <server instance name> -Path "<path to Microsoft_System Application.app>"
    ```
2. Synchronize the tenant(s) with the **System Application** extension (Microsoft_System Application):

    Use the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

    ```powershell
    Sync-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name "System Application" -Version <extension version>
    ```

    Replace `<extension version>` with the exact version of the published System Application.
    
    > [!TIP]
    > To get a list of all published extensions, along with their names and versions, use the [Get-NAVAppInfo cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo).
    
3. Run the data upgrade on the System Application.

    To run the data upgrade, use the [Start-NavAppDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance <server instance name> -Tenant <tenant ID> -Name "System Application" -Version <extension version>
    ```

    Upgrading data updates the data that is stored in the tables of the tenant database to the schema changes that have been made to tables of the System Application.

## Upgrade Base Application

### Microsoft Base Application

Follow these steps if your existing solution uses the Microsoft Base Application.

1. Publish the Business Central Base Application extension (Microsoft_Base Application.app).

    The **Base Application** extension contains the application business objects. You find the Microsoft_Base Application.app in the **Applications\BaseApp\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance <server instance name> -Path "<path to Microsoft_Base Application.app>"
    ```
2. Synchronize the tenant with the Business Central Base Application extension (Microsoft_BaseApp):

    ```powershell
    Sync-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name "Base Application" -Version <extension version>
    ```
    Replace `<extension version>` with the exact version of the published Base Application.

    With this step, the base app takes ownership of the database tables. When completed, in SQL Server, the table names will be suffixed with the base app extension ID. This process can take several minutes.
3. Run the data upgrade on the Base Application.

    To run the data upgrade, use the [Start-NavAppDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance <server instance name> -Tenant <tenant ID> -Name "Base Application" -Version <extension version>
    ```

    Upgrading data updates the data that is stored in the tables of the tenant database to the schema changes that have been made to tables of the Base Application.

### Upgrade custom Base Application

If you have a custom Base Application instead of the Microsoft Base Application, and you want the new application features and hotfixes that are included in the Microsoft Base Application, then you will have to merge the modifications made in the Microsoft Base Application into your custom Base Application and create a new version of your custom Base Application.

The source code for the new Microsoft Base Application version is in the **Base Application.Source.zip** file, which is on  the installation media (DVD), in the **Applications\BaseApp\Source** folder. You can use this together with the previous Microsoft Base Application source code and your custom application source to compare and merge into a new custom application version.

After you have created the new version of your custom application, you publish it to the application server instance, then synchronize and run the data upgrade on the tenants.

##  <a name="AddExtensions"></a>Upgrade Microsoft extensions

If your old solution used Microsoft extensions (that is, extensions that have **Microsoft** as the publisher), then you upgrade these to the new versions that are available on the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] installation media (DVD). The new versions are in the **Applications** folder, which contains a sub-folder for each extension. The extension package (.app file) that you need for publishing the extension is in the **Source** folder, for example, **Applications\SalesAndInventoryForecast\Source\SalesAndInventoryForecast.app**.

The general steps for this task are listed below. For detailed steps, see [Publishing, Upgrading, and Installing Extensions During Upgrade](upgrade-publish-extensions.md).

1. Publish the new extension versions from the installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance <server instance name> -Path <path to extension package file>
    ```

3. Synchronize the tenant database with the schema changes of the extensions.

    ```powershell
    Sync-NavApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name <extension name> -Version <extension version> -Tenant <tenant ID>
    ```
4. Upgrade the data associated with the Microsoft extensions. This step will automatically install the new version on the tenant

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance <server instance name> -Tenant <tenant ID> -Name <extension name> -Version <extension version>
    ``` 

## Upgrade Third-Party extensions

If the old solution used third-party extensions, and you still want to use them, they must be compiled to work on the new platform, and then re-installed on tenants.

Alternatively, if you have the source for these extensions, you can build and compile a new version of the extension by using the AL development environment, and then you upgrade to the new version as described in the previous task.

<!--
### Recompile and install published third-party extensions

Complete the following on existing 3rd-party extensions for which you do not have new versions built on the new platform.

1. Compile the published extension by running the [Repair-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp) cmdlet:

    ```powershell
    Repair-NAVApp -ServerInstance <server instance> -Name <extension name> -Version <version>
    ```

3. Synchronize the tenant with the extension.

    ```powershell
    Sync-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name <extension name> -Version <extension version>
    ```

4. (Single-tenant only) Install the extension.

    ```powershell
    Install-NAVApp -ServerInstance <server instance name> -Tenant <tenant ID> -Name <extension name> -Version <extension version>
    ```

## ADDITIONAL TASKS

## Publish the new system symbols for the update

This step is not required for the application at runtime, but it will be needed for developing extension against the new platform.

1. Unpublish the existing system symbols.

    ```
    Unpublish-NAVApp -ServerInstance <server instance> -Name System -version <version>
    ```
2. Publish the new system symbols extension for the update.

    The symbols extension contains the required platform symbols that the Base Application depends on. The symbols extension package is called **System.app**. If you have installed the **AL Development Environment**, you can find the file in the installation folder, which by default is C:\Program Files (x86)\Microsoft Dynamics 365 Business Central\150\AL Development Environment. Or, it is also on the installation media (DVD) in the ModernDev\program files\Microsoft Dynamics NAV\150\AL Development Environment folder.

    ```
    Publish-NAVApp -ServerInstance <server instance> -Path "<path to the System.app file>" -PackageType SymbolsOnly
    ```
-->
## See Also

[Dynamics 365 Business Central On-Premises Release Wave 2 Updates](../deployment/update-versions-15.md)  
[Upgrading to Dynamics 365 Business Central 2019 Release Wave 2](upgrade-overview-v15.md)  
[Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md)  
[Version numbers in Business Central](../administration/version-numbers.md)  
[Publish and Install an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md)  