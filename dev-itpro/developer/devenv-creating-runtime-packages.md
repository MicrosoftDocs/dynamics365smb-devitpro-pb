---
title: "Creating Runtime Packages for Business Central On-Premises"
description: "How to create runtime packages used for distribution of extensions."
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 11/10/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: solsen
---

# Creating Runtime Packages for Business Central On-Premises

If you want to distribute extensions, you can generate runtime packages that don't contain AL code, but only the final artifacts used by the server at runtime. Runtime packages thereby allow you to protect the intellectual property represented by your AL source code. 

When the runtime package is generated on the server, the developer license is checked for permissions to the used extension IDs. The extension in a runtime package can then be installed on servers that don't have a developer license. The server only needs permissions to run the objects, but not to modify or insert them. 

## Start using runtime packages

The first step in using runtime packages is to have an extension developed and published to an on-premise instance.
Next, use the following PowerShell command to connect to the server, find the extension, and download the runtime package.

`Get-NavAppRuntimePackage`

For more information about this cmdlet, see [Get-NAVAppRuntimePackage cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/Get-NAVAppRuntimePackage?view=businesscentral-ps).

The following example gets the NAV App runtime package with the provided name and version.

`Get-NAVAppRuntimePackage -ServerInstance DynamicsNAV -AppName 'Proseware SmartApp' -Version 2.3.4.500 -Path 'Prosware SmartApp_2.3.4.500_runtime.app'`

For publishing and installing the package, use the [Publish-NavApp](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp) and the [Install-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp) PowerShell cmdlets. 

## Upgrade considerations

Like any extension, extensions distributed in runtime packages will occasionally have to be upgraded so that they can run on with the latest Business Central version. There are two ways to upgrade a runtime package. Each way provides a different level of upgrade.

### Create a new extension version and runtime package

The recommended way to upgrade a runtime package is to build a new version of the extension against the latest platform and application. Then, publish the extension to an on-premise instance, and create a new runtime package version for distribution. Once you have the package, you can then publish it on tenants, and run a data upgrade like with any other extension.

### Recompile the existing package

Another way to upgrade the package is to use the [Repair-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/repair-navapp) to recompile the published package against the new platform and Business Central server instance. Once complied, you can reinstall the package on the tenant. Be aware that using the Repair-NAVApp cmdlet doesn't guarantee the extension will work properly. It's not recommended when upgrading to a new version. 

The Repair-NAVApp cmdlet requires that the runtime package includes the source code. You can include the source code in two different ways:

- In the extension's app.json file, set `"allowDownloadingSource"` or `showMyCode` to `true`. 
- When you run the Get-NavAppRuntimePackage cmdlet, use either the `-IncludeSourceInPackageFile $true` or `-ShowMyCode $true` parameter.

## Limitations

The limitation of runtime packages is that they only work for on-premise installations, so you can't submit them to AppSource. For more information about the extension requirements for AppSource, see [Technical Validation Checklist](devenv-checklist-submission.md). Moreover, debugging into an extension to view the source code isn't allowed by default; the `allowDebugging` flag is by default set to `false`. For more information, see [Resource Exposure Policy Setting](devenv-security-settings-and-ip-protection.md).

> [!NOTE]  
> Runtime packages are guaranteed to work only if published to a platform with the same version as the one where they were produced.

> [!NOTE]  
> If you set the `allowDebugging` flag to `true` when running the `Get-NavAppRuntimePackage` cmdlet, you can enable debugging and you thereby also allow viewing the source code.

## See Also

[Publish-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/publish-navapp)  
[Install-NAVApp cmdlet](/powershell/module/microsoft.dynamics.nav.apps.management/install-navapp)