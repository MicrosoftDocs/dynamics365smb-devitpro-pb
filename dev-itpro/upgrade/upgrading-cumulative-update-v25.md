---
title: Install a version 25 update
description: This article describes the tasks required for getting the monthly version 25 update applied to your Dynamics 365 Business Central on-premises.
ms.custom: bap-template
ms.date: 09/04/2024
ms.reviewer: jswymer
ms.topic: conceptual
ms.author: jswymer
author: jswymer
---
# Installing a [!INCLUDE[prod short](../developer/includes/prod_short.md)] 2024 release wave 2 update

This article describes how to install an update for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises. An update is a set of files that includes all hotfixes and regulatory features that have been released for Business Central.

You can choose to update only the platform or both the platform and application code. The installation guidelines are separated into PLATFORM tasks and APPLICATION tasks.

## Overview

The following figure provides a high-level representation of a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution and the components that are involved in the installation of an update.

![Business Central application stack.](../developer/media/bcv25-architecture-overview.svg "Business Central application stack")  

The databases store the application metadata and business data. If you have a single-tenant deployment, this data is stored in a single database. A multitenant deployment stores the application metadata in the application database and the business data in one or more tenant databases.

### Application stack

The application includes AL extensions that define the objects and code that makes up the business logic. For example, objects include tables, report, pages, codeunits, and more. Each extension is compiled and delivered as an .app file, which is published to the Business Central Server instance.

- System Application extension

    The Microsoft System Application extension includes functionality that isn't directly related the business logic. For more information, see [Overview of the System Application](../developer/devenv-system-application-overview.md). When using the Microsoft Base Application, your solution uses the System Application. With a custom Base Application, your solution may or may not use the System Application. If it doesn't, you can skip any steps in this article related to the System Application.

- Business Foundation extension

   This extension was introduced in version 24 and currently contains objects and logic for number series, which was previously part of the base application. It's expected to contain more functionality in future releases.

- Base application extension

    As a minimum, the solution always includes the Base Application. The Base Application contains the objects (such as table, pages, codeunits, and reports) that define the business logic and functionality of the solution. The Base Application can be either the Microsoft Base Application or a customized Base Application. The Microsoft Base Application is the standard application that is on the installation media (DVD). A customized Base Application is an application that includes customized code.

- Application extension

    The Application extension logically encapsulates all of the extensions making up a solution, for example, version `25.0.0.0` of the base and system application package files, and it provides a convenient way to define and refer to this solution identity. This extension is required for Microsoft extensions, but is optional for third-party extensions. For more information, see [The Microsoft_Application.app File](../developer/devenv-application-app-file.md).

- Customization extensions

    Customization extensions add functionality and features to the Base Application or System Application. Extensions can be either Microsoft extensions or third-party extensions. Microsoft extensions are available on the DVD. Third-party extensions are extensions developed by your organization or by another organization, like an ISV.

### Single-tenant and multitenant deployments

[!INCLUDE[upgrade_single_vs_multitenant](../developer/includes/upgrade_single_vs_multitenant.md)]

[!INCLUDE[server-web-server-instances-upgrade](../developer/includes/server-web-server-instances-upgrade.md)]

### Platform versus application update

A platform update doesn't change the application. It involves converting your databases to the new platform and recompiling the existing extensions to ensure that they're compatible with the new platform.

> [!IMPORTANT]
> A platfrom update from 25.1 or 25.0 to later versions isn't supported.

An application update involves:

- Publishing new versions of extensions that include the latest application modifications
- Synchronizing the databases with any schema change introduced by the new extensions
- Updating affected data.

The installation media (DVD) includes new versions of Microsoft's Base Application, System Application, and extensions. The DVD also includes the AL source code for the Microsoft Base Application. This code useful if you have a custom base application. You can use the code to compare and merge updates into your application. You'll only have to recompile third-party extensions that you don't have a new version to publish.

## Preparation

### PowerShell variables used in tasks

Many of the steps in this article use PowerShell cmdlets, which require that you provide values for various parameters. To make it easier for copying or scripting in PowerShell, the steps use the following variables for parameter values. Replace the text between the `" "` with the correct values for your environment.

```powershell
$BcServerInstance = "The name of the Business Central server instance, for example: BC250"
$TenantId = "The ID of the tenant to be upgraded. If not using a multitenant server instance, set the variable to default, or omit -Tenant parameter."
$TenantDatabase = "The name of the Business Central tenant database to be upgraded, for example: Demo Database BC (25-0)" 
$ApplicationDatabase = "The name of the Business Central application database in a multitenant environment, for example: My BC App DB." 
$DatabaseServer= "The SQL Server instance that hosts the databases. The value has the format server_name\instance_name, For example: localhost\BCDEMO"
$SystemAppPath = "The file path and name of the System Application extension for the update, for example: C:\DVD\Applications\system application\Source\\Microsoft_System Application.app"
$BusFoundAppPath = "The file path and name of the Business Foundation extension for the update, for example: C:\DVD\Applications\BusinessFoundation\Source\Microsoft_Business Foundation.app"
$BaseAppPath = "The file path and name of the Base Application extension for the update, for example: C:\DVD\Applications\BaseApp\Source\Microsoft_Base Application.app"
$ApplicationAppPath = "The path and file name to the Application application extension for the update, for example: C:\DVD\Applications\Application\Source\Microsoft_Application.app"
$NewBcVersion = "The version number for the update, for example: 25.1.39901.0"
$ExtPath = "The path and file name to an extension package" 
$ExtName = "The name of an extension"
$ExtVersion = "The version of an extension, for example, 1.0.0.0"
$AddinsFolder = "The file path to the Add-ins folder of Business Central Server installation, for example: C:\Program Files\Microsoft Dynamics 365 Business Central\230\Service\Add-ins"
$PartnerLicense= "The file path and name of the partner license"
$CustomerLicense= "The file path and name of the customer license"
```

### Download update package

The first thing to do is to download the update package that matches your Business Central solution.

1. Go to the [list of available updates](../deployment/update-versions-25.md) for your on-premises version of Business Central. Then, choose the update that you want.
2. From the update page, under the **Resolution** section, select the link for downloading the update, and follow the instructions.
3. On the computer where you downloaded the update .zip file, extract the all the files to a selected location. 

    When extracted, the update includes the DVD folder. This folder contains the full Business Central product. For example, the folder includes the Business Central installation program (setup.exe), tools for upgrading to the platform, and the Microsoft extensions.

When this step is completed, you can continue to update your Business Central solution to the new platform and application.

[!INCLUDE[upgrade-copy-configuration-files](../developer/includes/upgrade-copy-configuration-files.md)]

### Prepare existing databases

1. Back up your databases.

1. Run the [!INCLUDE[admin shell](../developer/includes/adminshell.md)] as an administrator.

1. (Single-tenant only) Uninstall all extensions from the all tenants.

    In this step, you uninstall the Base Application, System Application (if used), and any other extensions that are currently installed on the database.

    1. Get a list of installed extensions.

        This step is optional, but it can be useful to the names and versions of the extensions.

        To get a list of installed extensions, use the [Get-NAVAppInfo cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo).

        ```powershell 
        Get-NAVAppInfo -ServerInstance $BcServerInstance
        ``` 

    1. Uninstall the extensions.

        To uninstall an extension, you use the [Uninstall-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/uninstall-navapp) cmdlet.

        ```powershell 
        Uninstall-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name <extensions name> -Version $ExtVersion -Force
        ```

        Replace  `$ExtName` and `$ExtVersion` with the exact name and version the installed extension. For single-tenant deployment, set `$TenantId` to `default` or omit the `-Tenant` parameter.

        For example, together with the Get-NAVApp cmdlet, you can uninstall all extensions with a single command:

        ```powershell 
        Get-NAVAppInfo -ServerInstance $BcServerInstance -Tenant $TenantId | % { Uninstall-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name $_.Name -Version $_.Version -Force}
        ```

1. Unpublish the existing system symbols.

    To unpublish the system symbols, use the [Unpublish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp) as follows:

    ```powershell
    Unpublish-NAVApp -ServerInstance $BcServerInstance -Name System
    ```

    [What are symbols?](upgrade-overview-v15.md#Symbols).

1. (Multitenant only) Dismount the tenants from the application database.

    To dismount a tenant, use the [Dismount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/dismount-navtenant) cmdlet:

    ```powershell
    Dismount-NAVTenant -ServerInstance $BcServerInstance -Tenant $TenantId
    ```

## Task 1: Install Business Central components

From the installation media (DVD), run setup.exe to uninstall the current Business Central components and install the Business Central components included in the update. 

1. Stop the [!INCLUDE[server](../developer/includes/server.md)] instance.

   ```powershell
   Stop-NAVServerInstance -ServerInstance $BcServerInstance
   ```

1. Run setup.exe to uninstall your current version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)].

1. Run setup.exe again to install components of the update.

    1. Follow setup pages until you get to the **Microsoft [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Setup** page.
    1. Select **Advanced installation options** > **Choose an installation option** > **Custom**.
    1. On the **Customize the installation** page, select the following components as a minimum:

        - AL Development Environment (optional but recommended)
        - Server
        - Web Server Components.

          > [!NOTE]
          > When install the Web Server Components, a [!INCLUDE[webserverinstance](../developer/includes/webserverinstance.md)] instance with the same name that you define for the [!INCLUDE[server](../developer/includes/server.md)] instance will be created on Internet Information Services (IIS). If you're existing deployment has multiple web server instances that you want to reuse, you'll have to upgrade these instances later in this article.

    1. Select **Next**.
    1. On the **Specify parameters** page, set the fields as needed.

        > [!IMPORTANT]
        > Clear the **SQL Database** field so that it is blank. At this time, do not set this to the database that you want to update; otherwise, the installation of the [!INCLUDE[server](../developer/includes/server.md)] will fail. You will connect the database to the [!INCLUDE[server](../developer/includes/server.md)] later after it is converted to the new platform.

    1. Select **Apply** to complete the installation.

For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).

## Task 1: Convert existing database to new platform

Follow the next few tasks to convert your database to the new platform of the update. A multitenant deployment includes the application and tenant databases. Running the database conversion will:

- Update the system tables of the database to the new schema (data structure)
- Provide the latest platform features and performance enhancements
- Automatically publish the system symbols for the new platform

Also, to ensure that the existing published extensions work on the new platform, you'll recompile the extensions.

1. Run the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator.

   [!INCLUDE[open-admin-shell](../developer/includes/open-admin-shell.md)]

1. Run the [Invoke-NAVApplicationDatabaseConversion cmdlet](/powershell/module/microsoft.dynamics.nav.management/invoke-navapplicationdatabaseconversion) to start the database conversion to the new platform.

    ```powershell
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer $DatabaseServer -DatabaseName $TenantDatabase|$ApplicationDatabase -Force
    ```

    For example, in a single tenant deployment:

    ```powershell
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer $DatabaseServer -DatabaseName $TenantDatabase -Force
    ```

    In a multitenant deployment, run this cmdlet against the application database. For example:

    ```powershell
    Invoke-NAVApplicationDatabaseConversion -DatabaseServer $DatabaseServer -DatabaseName $ApplicationDatabase -Force
    ```

    When completed, a message like the following displays in the console:

    ```powershell
    DatabaseServer      : .\BCDEMO
    DatabaseName        : Demo Database BC (25-0)
    DatabaseCredentials :
    DatabaseLocation    :
    Collation           :
    ```

    > [!NOTE]
    > Depending on the update that you're installing, you might get a message similar to the following:
    >
    > `Invoke-NAVApplicationDatabaseConversion : A technical upgrade of database <database name> on server '.\<database instance>' cannot be run, because the database's application version 'NNNNNN' is greater than or equal to the platform version 'NNNNNN'`
    >
    > This isn't an error. This message is recorded as a warning in the event log as well. This message indicates that the application database is already compatible with the new platform, which happens when the update does not make any schema changes to the system tables.
    >
    > You'll see this message if you ran the cmdlet without the `-Force` parameter. Run the cmdlet again, but be sure to include `-Force` parameter.

## Task 3: Connect server instance to database

1. (Multitenant only) Enable the server instance as a multitenant instance:

    ```powershell
    Set-NAVServerConfiguration -ServerInstance $BcServerInstance -KeyName Multitenant -KeyValue true
    ```

1. Connect the server instance to connect to the database.

    ```powershell
    Set-NAVServerConfiguration -ServerInstance $BcServerInstance -KeyName DatabaseName -KeyValue $ApplicationDatabase
    ```

    In a multitenant deployment, the database is the application database. For more information, see [Connecting a Server Instance to a Database](../administration/connect-server-to-database.md).

1. Restart the server instance.

    ```powershell
    Restart-NAVServerInstance -ServerInstance $BcServerInstance
    ```

## <a name="UploadLicense"></a>Task 4: Import [!INCLUDE[prod_short](../developer/includes/prod_short.md)] partner license  

To import the license, use the [Import-NAVServerLicense cmdlet](/powershell/module/microsoft.dynamics.nav.management/import-navserverlicense). You'll have to restart the server instance afterwards:

```powershell
Import-NAVServerLicense -ServerInstance $BcServerInstance -LicenseFile $PartnerLicense
Restart-NAVServerInstance -ServerInstance $BcServerInstance
```

For more information, see [Uploading a License File for a Specific Database](../cside/cside-upload-license-file.md#UploadtoDatabase).  

## Task 6: Publish new extension versions (application upgrade only)

In this task, you publish the new extension versions. As minimum, you publish the new base application and system application extensions from the installation media (DVD). You also publish new versions of any Microsoft and non-Microsoft extensions that were used on your old deployment.

Publishing an extension adds the extension to the application database that is mounted on the server instance. Once published, it's available for installing on tenants. This task updates internal tables, compiles the components of the extension behind-the-scenes, and builds the necessary metadata objects that are used at runtime.

The steps in this task continue to use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] for version 25 that you started in the previous task.

1. Publish the **System Application** extension (Microsoft_System Application.app).

    You find the (Microsoft_System Application.app in the **Applications\System Application\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path $SystemAppPath
    ```

    [What is the System Application?](upgrade-overview-v15.md#SystemApplication)
1. Publish the Business Foundation extension (Microsoft_Business Foundation.app).

    You find the Microsoft_Business Foundation.app in the **Applications\BusinessFoundation\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path $BusFoundAppPath
    ```

1. Publish the Business Central base application extension (Microsoft_Base Application.app).

    The **Base Application** extension contains the application business objects. You find the (Microsoft_Base Application.app in the **Applications\BaseApp\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path $BaseAppPath
    ```

1. Publish the Microsoft_Application extension.

    For more information about this extension, see [The Microsoft_Application.app File](../developer/devenv-application-app-file.md).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path $ApplicationAppPath
    ```

1. Publish the new versions of Microsoft extensions.

    In this step, you publish new versions of Microsoft extensions that were used on your old deployment. You find the extensions in the **Applications** folder of the installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path "<path to Microsoft extension>"
    ```

    For example:

    ```powershell
    Publish-NAVApp -ServerInstance BC250 -Path "C:\W1DVD\Applications\ReportLayouts\Source\Microsoft__Exclude_ReportLayouts.app"
    ```

    > [!NOTE]
    > A new extension for report layouts, called **_Exclude_ReportLayouts**, was added in version 20. If you're coming from a version earlier than version 20, make sure to publish and install this extension to get the latest report layout features described at [Get Started Creating Report Layouts](/dynamics365/business-central/ui-get-started-layouts).

1. Publish new versions of non-Microsoft extensions. Be sure to include new extensions that contain custom permission sets as AL objects.

    If you have new versions of these extensions, built on the Business Central version 25, then publish the new versions.  

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path "<path to extension>"
    ```

## Task 5: Recompile extensions not built on new update version

Complete this task when you have extensions that aren't built on the Business Central version you're upgrading to. This step is required if you're doing a plaform update only. Otherwise, you can skip it.

[!INCLUDE[repair_runtime_packages](../developer/includes/repair_runtime_packages.md)]

Do this step for any published extension versions that aren't built on version 25, and you want to reinstall on tenants. These extensions must be recompiled to work with version 25. To recompile the extensions, use the [Repair-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp) cmdlet:

```powershell  
Repair-NAVApp -ServerInstance $BcServerInstance -Name <extension name> -Version <extension name>
```

For example, to recompile all non-Microsoft extensions, you can run the following command:

```powershell  
Get-NAVAppInfo -ServerInstance $BcServerInstance | Where-Object {$_.Publisher -notlike 'Microsoft'} | Repair-NAVApp
```

Restart the [!INCLUDE[server](../developer/includes/server.md)] when completed.

```powershell
Restart-NAVServerInstance -ServerInstance $BcServerInstance
```

## Task 5: Synchronize tenant

Synchronize the tenant's database schema with any schema changes in the application database and extensions. If you have a multitenant deployment, do these steps for each tenant.

1. (Multitenant only) Mount the tenant to the version 20 server instance.

    To mount the tenant, use the [Mount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/mount-navtenant) cmdlet:

    ```powershell
    Mount-NAVTenant -ServerInstance $BcServerInstance -DatabaseName $TenantDatabase -DatabaseServer $DatabaseServer -Tenant $TenantId -AllowAppDatabaseWrite
    ```

    > [!IMPORTANT]
    > You must use the same tenant ID for the tenant that was used in the old deployment; otherwise you'll get an error when mounting or syncing the tenant. If you want to use a different ID for the tenant, you can either use the `-AlternateId` parameter now or after upgrading, dismount the tenant, then mount it again using the new ID and the `OverwriteTenantIdInDatabase` parameter.  
    >
    > For upgrade, set the `-AllowAppDatabaseWrite` parameter. After upgrade, you can dismount and mount the tenant again without the parameter if needed.

    At this stage, the tenant state is OperationalWithSyncPending.
1. Synchronize the tenant with the application database.

    Use the [Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/sync-navtenant) cmdlet:

    ```powershell  
    Sync-NAVTenant -ServerInstance $BcServerInstance -Mode Sync -Tenant $TenantId
    ```

    For a single-tenant deployment, you can either set the `$TenantId` to `default` or omit the `-Tenant $TenantId` parameter. For more information about syncing, see [Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md).

1. Synchronize the tenant with the **System Application** extension. 

    Use the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "System Application" -Version $NewBCVersion
    ```

    Replace `$NewBCVersion` with the exact version of the published System Application. To get the version, you can use the [Get-NAVAppInfo cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo).

1. Synchronize the tenant with the Business Foundation extension.

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "Business Foundation" -Version $NewBCVersion
    ```

   Replace `$NewBCVersion` with the exact version of the published Base Application.

1. Synchronize the tenant with the Business Central Base Application extension.

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "Base Application" -Version $NewBCVersion
    ```

   Replace `$NewBCVersion` with the exact version of the published Base Application.

   > [!IMPORTANT]
   > If you're upgrading a Czech (CZ) language version, you must use the `-Mode ForceSync` parameter to force synchronize the base application; otherwise, synchronization errors occur. For more information, go to [Removed table fields in base application cause sync errors](known-issues.md#removed-table-fields-in-the-czech-cz-base-application-cause-sync-errors).

1. Synchronize the tenant with the [Application](../developer/devenv-application-app-file.md) extension.

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "Application" -Version $NewBCVersion
    ```

1. Synchronize the tenant with Microsoft and non-Microsoft extensions.

    For each extension, run the Sync-NAVApp cmdlet:

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "<extension name>" -Version <extension version>
    ```

## Task 6: Upgrade data

In this task, you run a data upgrade for extensions.

# [Single tenant](#tab/singletenant)

Run the data upgrade/installation on extensions in order of dependency: System Application, Business Foundation, Base Application, Application.

1. Run the data upgrade for the System Application.

    To run the data upgrade, use the [Start-NAVAppDataUpgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Name "System Application" -Version $NewBCVersion
    ```

    This step automatically installs the new system application on the tenant.
1. Install the Business Foundation extension. The Base Application has a dependency on this app, so it must be installed before you can upgrade the Base Application. 

   To install the  Business Foundation extension, use the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) cmdlet:

    ```powershell
    Install-NAVApp -ServerInstance $BcServerInstance -Name "Business Foundation" -Version $NewBCVersion
    ```

1. Run the data upgrade for the Base Application, followed by Application extension.

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Name "Base Application" -Version $NewBCVersion
    ```

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Name "Application" -Version $NewBCVersion
    ```

    This step automatically installs the new versions of these extensions on the tenant.

1. Upgrade the new versions of Microsoft extensions and non-Microsoft extensions.

    Upgrade any Microsoft and non-Microsoft extensions that are used in the old deployment to new versions found on the installation media. The new versions are in the **Application** folder of the DVD. There's a folder for each extension. The extension package (.app file) is in the **Source** folder.

    For each extension, run [Start-NAVAppDataUpgrade cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade). First, run the data upgrade for the Application extension, then run it for other Microsoft and non-Microsoft extensions. 

    This step also automatically installs the new extension version on the tenant.

# [Multitenant-tenant](#tab/multitenant)

On each tenant, run the [Start-NavDataUpgrade](/powershell/module/microsoft.dynamics.nav.management/start-navdataupgrade) cmdlet as follows:

```powershell
Start-NAVDataUpgrade -ServerInstance $BcServerInstance -Tenant $TenantId -FunctionExecutionMode Serial -SkipAppVersionCheck
```

This command upgrades and installs the extensions on the tenant.

---

## Reinstall existing extensions (Single-tenant, platfrom update only)

In this task, you reinstall the same extensions that were installed on the tenant before. If you're planning on updating the application, then skip this step.

To install an extension, you use the [Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp).

1. If your solution uses the System Application, install this first.

    ```powershell 
    Install-NAVApp -ServerInstance $BcServerInstance -Name "System Application" -Version $ExtVersion
    ```

    Replace `$ExtVersion` with the exact version of the published System Application.

1. Install the Base Application.

    ```powershell
    Install-NAVApp -ServerInstance $BcServerInstance -Name "Base Application" -Version $ExtVersion
    ```

    Replace `$ExtVersion` with the exact version of the published Base Application.

1. Install the Application extension as needed.

    ```powershell
    Install-NAVApp -ServerInstance $BcServerInstance -Name "Application" -Version $ExtVersion
    ```

    Replace `$ExtVersion` with the exact version of the published Application extension.

1. Install other extensions, including Microsoft and third-party extensions.

    ```powershell
    Install-NAVApp -ServerInstance $BcServerInstance -Name $ExtName -Version $ExtVersion
    ```

At this point, your solution has been updated to the latest platform.

> [!IMPORTANT]
> If your solution uses any Microsoft control add-ins, you must upgrade the add-ins to the latest version. Go to [Upgrade control add-ins](#controladdins) under **Post Upgrade** section.

<!--## <a name="Application"></a> APPLICATION UPDATE

Follow the next tasks to update the application code to the new features and hotfixes. The tasks include publishing new versions of the System Application, Base Application, and add-on extensions.

You publish the System Application extension only if it was used in old solution. Add-on extensions include Microsoft and third- party extensions that were used in the old solution.


> [!NOTE]
> If a license update is required for a regulatory feature, customers can download an updated license from CustomerSource (see [How to Download a Microsoft Dynamics 365 Business Central License from CustomerSource](/dynamics/s-e/)), and partners can download their customers' updated license from VOICE (see [How to Download a Microsoft Dynamics 365 Business Central Customer License from VOICE](https://mbs.microsoft.com/partnersource/northamerica/deployment/documentation/how-to-articles/howtodownloadcustomernavlicense)).-->

<!--
## Upgrade System Application

Follow these steps if your existing solution uses the Microsoft System Application. Otherwise, you can skip this procedure.

1. Publish the **System Application** extension (Microsoft_System Application.app).

    You find the (Microsoft_System Application.app in the **Applications\System Application\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path "<path to Microsoft_System Application.app>"
    ```

2. Synchronize the tenant(s) with the **System Application** extension (Microsoft_System Application):

    Use the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "System Application" -Version $NewBcVersion
    ```

    Replace `$NewBcVersion` with the exact version of the published System Application.

    > [!TIP]
    > To get a list of all published extensions, along with their names and versions, use the [Get-NAVAppInfo cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/get-navappinfo).

3. Run the data upgrade on the System Application.

    To run the data upgrade, use the [Start-NavAppDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Tenant $TenantId -Name "System Application" -Version $NewBcVersion
    ```

    Upgrading data updates the data in the tables of the tenant database to the schema changes made to tables of the System Application.

## Upgrade Business Foundation Application

Follow these steps if your existing solution uses the Microsoft Business Foundation Application. Otherwise, you can skip this procedure. The **Business Foundation** extension contains an expansive set of open source modules that make it easier to build, maintain, and easily upgrade on-premises and online apps.

1. Publish the  **Business Foundation** extension (Microsoft_Business Foundation.app).

    You find the Microsoft_Business Foundation.app in the **Applications\BusinessFoundation\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path $BusFoundAppPath
    ```

1. Synchronize the tenant with the Business Foundation extension (Microsoft_Business Foundation):

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "Business Foundation" -Version $NewBCVersion
    ```

   Replace `$NewBcVersion` with the exact version of the published Business Foundation extension.

1. Run the data upgrade on the Business Foundation.

    To run the data upgrade, use the [Start-NavAppDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Tenant $TenantId -Name "Business Foundation" -Version $NewBcVersion
    ```

    Upgrading data updates the data in the tables of the tenant database to the schema changes made to tables of the Business Foundation.

## Upgrade Base Application

### Microsoft Base Application

Follow these steps if your existing solution uses the Microsoft Base Application.

1. Publish the Business Central Base Application extension (Microsoft_Base Application.app).

    The **Base Application** extension contains the application business objects. You find the Microsoft_Base Application.app in the **Applications\BaseApp\Source** folder of installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path "<path to Microsoft_Base Application.app>"
    ```

2. Synchronize the tenant with the Business Central Base Application extension (Microsoft_BaseApp):

    ```powershell
    Sync-NAVApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name "Base Application" -Version $NewBcVersion
    ```

    Replace `$NewBcVersion` with the exact version of the published Base Application.

    With this step, the base app takes ownership of the database tables. When completed, in SQL Server, the table names will be suffixed with the base app extension ID. This process can take several minutes.
3. Run the data upgrade on the Base Application.

    To run the data upgrade, use the [Start-NavAppDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Tenant $TenantId -Name "Base Application" -Version $NewBcVersion
    ```

    Upgrading data updates the data in the tables of the tenant database to the schema changes made to tables of the Base Application.

### Upgrade custom Base Application

With a custom Base Application, you may want the new application features and hotfixes in the Microsoft Base Application. If so, you'll have to merge the modifications made in the Microsoft Base Application into your custom Base Application. Then, create a new version of your custom Base Application.

The source code for the new Microsoft Base Application version is in the **Base Application.Source.zip** file. This file is on the installation media (DVD), in the **Applications\BaseApp\Source** folder. You can compare this source code with the source code of the previous Microsoft Base Application and your custom application source. Then merge the code into a new custom application version.

After you've created the new version of your custom application, you publish it to the application server instance. Then, you synchronize and run the data upgrade on the tenants.

##  <a name="AddExtensions"></a>Upgrade Microsoft extensions

If your old solution used Microsoft extensions, then you upgrade these extensions to the new versions that are available on the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] installation media (DVD). The new versions are in the **Applications** folder, which contains a subfolder for each extension. The extension package (.app file) that you need for publishing the extension is in the **Source** folder, for example, **Applications\SalesAndInventoryForecast\Source\SalesAndInventoryForecast.app**.

The general steps for this task are listed below. For detailed steps, see [Publishing, Upgrading, and Installing Extensions During Upgrade](upgrade-publish-extensions.md).

### Publish and install Microsoft_Application extension

The Microsoft_Application extension was introduced in 15.3. In short, it's used to contain the dependency declarations on the system and base application extensions. For more information about this extension, see [The Microsoft_Application.app File](../developer/devenv-application-app-file.md).

1. Publish the Microsoft_Application.app package.

    The installation media path to the extension package (.app file) is **Applications\Application\Source\Microsoft_Application.app"**  

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path "<folder path>\Microsoft_Application.app"
    ```

2. Synchronize the tenant database with the schema changes of the Microsoft_Application extension.

    ```powershell
    Sync-NavApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name Application -Version $NewBcVersion
    ```

3. Upgrade the Microsoft_Application extension on your tenants.

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Tenant $TenantId -Name Application 
    ```

### Publish and install Microsoft extensions

Complete these steps for each Microsoft extension that you want to upgrade. 

1. Publish the new extension versions from the installation media (DVD).

    ```powershell
    Publish-NAVApp -ServerInstance $BcServerInstance -Path $ExtPath
    ```

2. Synchronize the tenant database with the schema changes of the extensions.

    ```powershell
    Sync-NavApp -ServerInstance $BcServerInstance -Tenant $TenantId -Name $ExtName -Version $NewBcVersion
    ```

3. Upgrade the data associated with the Microsoft extensions. This step will automatically install the new version on the tenant

    ```powershell
    Start-NAVAppDataUpgrade -ServerInstance $BcServerInstance -Tenant $TenantId -Name $ExtName -Version $NewBcVersion
    ```

## Upgrade Third-Party extensions

If the old solution used third-party extensions, and you still want to use them, they must be compiled to work on the new platform. For more information, see [Recompile published extensions](#repair). You then reinstall the extensions on tenants using the Install-NAVApp cmdlet.

As an alternative, if you have the source for these extensions, you can build and compile a new version of the extension in the AL development environment. Then, you upgrade to the new version as described in the previous task.-->

## Task 7: Post upgrade

### <a name="controladdins"></a>Upgrade control add-ins

[!INCLUDE[upgrade-control-addins](../developer/includes/upgrade-control-addins.md)]

### Update application version

[!INCLUDE[upgrade-change-application-version](../developer/includes/upgrade-change-application-version.md)]

### Import the customer license

Import the customer license by using the [Import-NAVServerLicense cmdlet](/powershell/module/microsoft.dynamics.nav.management/import-navserverlicense), as you did with the partner license. You'll have to restart the server instance afterwards.

```powershell
Import-NAVServerLicense -ServerInstance $BcServerInstance -LicenseFile $CustomerLicense
```

```powershell
Restart-NAVServerInstance -ServerInstance $BcServerInstance
```

[!INCLUDE[upgrade-web-server-instances](../developer/includes/upgrade-web-server-instances.md)]

## Related information

[Dynamics 365 Business Central On-Premises 2024 Release Wave 1 Updates](../deployment/update-versions-24.md)  
[Dynamics 365 Business Central On-Premises 2023 Release Wave 2 Updates](../deployment/update-versions-23.md)  
[Upgrading to Dynamics 365 Business Central 2019 Release Wave 2](upgrade-overview-v15.md)   
[Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md)  
[Version numbers in Business Central](../administration/version-numbers.md)  
[Publish and Install an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md)  
[Getting Started in AL](../developer/devenv-get-started.md)  
[Version numbers in Business Central](../administration/version-numbers.md)  
