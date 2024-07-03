---
title: Publishing and Installing an Extension
description: "Description of the process of publishing and installing an extension"
author: jswymer
ms.date: 06/10/2024
ms.topic: conceptual
ms.author: jswymer
ms.reviewer: jswymer
---

# Publishing and installing an extension

To make your extension available to tenant users requires three basic tasks: publish the extension package to the [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] server instance, synchronize the extension with the tenant database, and install the extension on the tenant.

> [!NOTE]  
> This article describes how to publish and install the first version of an extension. If you want to publish an install newer version of an extension, see [Upgrading Extensions](devenv-upgrading-extensions.md).  

## Publish and synchronize an extension

Publishing an extension to a [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] server instance adds the extension to the application database that is mounted on the server instance, making it available for installation on tenants of the server instance. Publishing updates internal tables, compiles the components of the extension behind-the-scenes, and builds the necessary metadata objects that are used at runtime.

Synchronizing an extension updates the database schema of the tenant database with the database schema that is defined by the extension objects. If a table or table extension is included in the extension, the respective full or companion table is created in the tenant database.  

1. Start the [!INCLUDE[adminshell](includes/adminshell.md)]. 

1. To publish the extension, run the [Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp).

    The cmdlet takes as parameters the [!INCLUDE[d365fin_server_md](includes/d365fin_server_md.md)] instance that you want to install to and the .app package file that contains the extension. The following example publishes the extension **MyExtension.app** to the **YourDynamicsNAVServer** instance.  

    ```powershell
    Publish-NAVApp -ServerInstance YourDynamicsNAVServer -Path ".\MyExtension.app"
    ```  

    > [!NOTE]  
    > If you are publishing a version 16.0 Microsoft extension, you'll have to include the `-SkipVerification` parameter. Otherwise, you will get the error "Publish-NAVApp : You cannot publish an extension that has not been code signed.". This issue is fixed in later versions.

1. To synchronize the schema of a tenant database to the extension, run the [Sync-NavApp cmdlet](/powershell/module/Microsoft.Dynamics.Nav.Apps.Management/Sync-NAVApp).

    The following example synchronizes the extension **MyExtension** with version number 1.0.0.0: 

    ```powershell
    Sync-NavApp -ServerInstance YourDynamicsNAVServer -Name ExtensionName -Version 1.0.0.0 -Tenant TenantID
    ```

    Replace `TenantID` with the tenant ID of the database. If you don't have a multitenant server instance, use `default` or omit this parameter.

The extension can now be installed on tenants.

## Install an extension

After you publish and synchronize an extension, you can install it on tenants. The extension is then available to users in the client. Installing an extension can be done from the [!INCLUDE[d365fin_md](includes/d365fin_md.md)] client or [!INCLUDE[adminshell](includes/adminshell.md)].

> [!NOTE]  
> Installing an extension will run any installation code that is built-in to the extension. Installation code could, for example, perform operations like populating empty records with data, service callbacks and telemetry, version checks, and messages to users. For more information, see [Writing Extension Install Code](devenv-extension-install-code.md).

### Install an extension by using [!INCLUDE[adminshell](includes/adminshell.md)] 

1. Start the [!INCLUDE[adminshell](includes/adminshell.md)]. 
1. To install the extension on one or more tenants, use the `Install-NAVApp` cmdlet.

    The following example installs the extension **My Extension** for Tenant1 and Tenant3. In single-tenant deployments, you either specify `default` as the tenant ID, or you omit the `–Tenant` parameter.  

    ```powershell
    Install-NAVApp -ServerInstance YourDynamicsNAVServer -Name "My Extension" –Tenant Tenant1, Tenant3  
    ```

### Install an extension by using the client  

1. In [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], use search to open the **Extension Management** page.

   In the **Extension Management** window, you can view the extensions that are published to your server. For each extension, you can see the current installation status. 
1. Select an extension to see additional information and to install the extension.  
1. Review and accept the license agreement.  
1. Select the **Install** button to install the extension.

## See also

[Unpublishing and Uninstalling Extensions](devenv-unpublish-and-uninstall-extension-v2.md)  
[Developing Extensions](devenv-dev-overview.md)  
[Analyzing Extension Lifecycle Telemetry](../administration/telemetry-extension-lifecycle-trace.md)