---
title: Publishing, Upgrading, and Installing Extensions During Upgrade
description: This article describes the tasks required for publishing, upgrading, and installing extensions during upgrade to Dynamics 365 Business Central.
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.author: jswymer
ms.service: "dynamics365-business-central"
author: jswymer
---
#  <a name="AddExtensions"></a>Publishing, Upgrading, and Installing Extensions During Upgrade

This article describes how to publish, upgrade and install extension when upgrading to a new version of Business Central.

> [!IMPORTANT]
> To complete the step in this article, you use the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]. You must run this as an administrator.

## Get a list of current extensions

It is useful to get a list of the extensions that are currently published for future reference. To get list of the extensions currently published on the application, run the following command:

```
Get-NAVAppinfo -ServerInstance <ServerInstanceName>
```

## Publish new system, test, and application symbols

If you installed the **AL Development Environment**, you can find the symbol files where your installed the environment, which by default is [!INCLUDE[prodx86installpath](../developer/includes/prodx86installpath.md)]. Otherwise, you can find the files in the **ModernDev** folder on the installation media. 

1. Unpublish the system, test, and application symbols.

    1. To get a list of the currently published symbols, use the Get-NAVAppInfo cmdlet:
       
        ```
        Get-NAVAppinfo -ServerInstance <ServerInstanceName> -SymbolsOnly
        ```
    2. Unpublish the symbols using the [Unpublish-NAVAPP cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/unpublish-navapp):
       
        ```
        Unpublish-NAVApp -ServerInstance <ServerInstanceName> -Name <name> -Version <n.n.n.n>
        ```
2. Publish the new system.app and test.app symbol files.

    To publish the symbols, open the [!INCLUDE[adminshell](../developer/includes/adminshell.md)] as an administrator, and run the following command for each of the symbol files:

    ```
    Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <SymbolFilePath> -PackageType SymbolsOnly
    ```

3. <a name="GenerateSymbols"></a>Generate the application symbol references by using the finsql.exe file as follows:

    1. Make sure that **Enable loading application symbol references at server startup** (EnableSymbolLoadingAtServerStartup) is set on the [!INCLUDE[server](../developer/includes/server.md)] instance.

        For more information, see [Configuring Business Central Server](../administration/configure-server-instance.md).
    2. Open a command prompt as an administrator, change to the directory where the `finsql.exe` file has been installed as part of [!INCLUDE[nav_dev_long](../developer/includes/nav_dev_long_md.md)], and then run the following command:

        ```
        finsql.exe Command=generatesymbolreference, Database="<MyDatabaseName>", ServerName=<DatabaseServerName>\<DatabaseInstance>
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

    3. When you run the command, the console returns to an empty command prompt, and does not display or provide any indication about the status of the run. However, the finsql.exe may still be running in the background. It can take several minutes for the run to complete, and the symbols will not be generated until such time. You can see whether the finsql.exe is still running by using Task Manager and looking on the **Details** tab for **finsql.exe**. 
    
        When the process ends, a file named **navcommandresult.txt** is saved to the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)] installation folder. If the command succeeded, the file will contain text like `[0] [06/12/17 14:36:17] The command completed successfully in '177' seconds.` If the command failed, another file named **naverrorlog.txt** will be generated. This file contains details about the error(s) that occurred. 
            
    For more information about generation symbols, see [Running C/SIDE and AL Side-by-Side](../developer/devenv-running-cside-and-al-side-by-side.md).

    4. Restart the [!INCLUDE[server](../developer/includes/server.md)] instance.

## Publish and synchronize new versions of extensions

You must upgrade the Microsoft extensions that were published in the old deployment to new versions. For Denmark (DK) and German (DE), you must also complete this step to install the new local functionality extensions, such as ELSTER.

The new extension versions are found in the `\Extensions` folder of the installation media (DVD). Follow these steps for each extension by using the [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

To publish the new extension version, run the [Publish-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) cmdlet: 

```
Publish-NAVApp -ServerInstance <ServerInstanceName> -Path <ExtensionFileName> 
```
           
## Synchronize the database with the schema changes of the extensions

For each extension, run the [Sync-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/sync-navapp) cmdlet:

```
Sync-NavApp -ServerInstance <ServerInstanceName> -Name  <ExtensionFileName>  -Version N.N.N.N -Tenant <TenantID>
```

Replace `<TenantID>` with the tenant ID of the database. If you do not have a multitenant server instance, use `default` or omit this parameter.

## Upgrade the data of the extensions

This step is not required for the newly published local functionality extensions.

To run the data upgrade, run the [Start-NAVAppDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/start-navappdataupgrade) cmdlet:

```
Start-NAVAppDataUpgrade -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
``` 

Apart from upgrading the data, this command will install the new extension version.

## Install new extensions on the tenants

Install the newly published local functionality extensions by running the [Install-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) cmdlet:

```    
Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
```
For more information about publishing extensions, see [Publish and Install an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md).

## Repair, synchronize, and install any custom extensions (third-party) that are currently published and that you still want to use

This ensures that the extensions work on the new platform and application versions. For each extension, complete the following steps from the [!INCLUDE[adminshell](../developer/includes/adminshell.md)]: 

1. Compile the extension to make it work with the new platform by running the [Repair-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navappSynchronize) cmdlet:

    ```
    Repair-NAVApp -ServerInstance <ServerInstanceName> -Name <Extension Name> -Version <N.N.N.N>
    ```
2. Synchronize the schema with the database:

    ```    
    Sync-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```
3. Install the extension:

    ```    
    Install-NAVApp -ServerInstance <ServerInstanceName> -Name <Name> -Version <N.N.N.N>
    ```

## See Also
  
[Upgrading the Application Code](Upgrading-the-Application-Code.md)  
[Upgrading to Business Central](upgrading-to-business-central.md)  
[Synchronizing the Tenant Database and Application Database](../administration/synchronize-tenant-database-and-application-database.md)  
[Publish and Install an Extension](../developer/devenv-how-publish-and-install-an-extension-v2.md)  