---
title: "Extending Microsoft Dynamics NAV Using Extension Packages"
author: SusanneWindfeldPedersen
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 8fdc480a-bc28-4b78-8656-f27480779ff8
ms.author: solsen
---
# Extending Microsoft Dynamics NAV Using Extension Packages
[!INCLUDE[nav_ext1_not_supported](includes/nav_ext1_not_supported.md)]

You can extend and customize a [!INCLUDE[navnow](includes/navnow_md.md)] deployment without modifying the original application objects. With extension packages, you install, upgrade, and uninstall functionality in on-premises deployments or for select tenants in a multitenant deployment. Customers can easily add or remove horizontal or customized functionality to their solution that upgrade much easier than past solutions.  
Your extension can add new objects and extend objects that you know to be present in the application, such as objects in the application that Microsoft makes available. The main difference from classical development is that source code modifications are not allowed. Instead, you use C/AL events to extend and customize objects.  

 Extensions are delivered as .navx package files. A .navx package contains the various artifacts that deliver the new functionality to the [!INCLUDE[navnow](includes/navnow_md.md)] deployment as well as a manifest that specifies the name, publisher, version, and other attributes of the extension. You manage .navx packages with a series of [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets that are available in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. There are also cmdlets available to ISVs and developers in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] that help create packages.  

> [!NOTE]  
>  Extensions work equally well in single-tenant and multitenant deployments. But the ability to make each tenant different is core to this type of extensions.  

## How Extensions Work  
Extensions are in the simplest terms the runtime application of objects and object deltas for a specific combination of an extension package and a tenant. When an extension is published to a [!INCLUDE[navnow](includes/navnow_md.md)] deployment, it compiles the objects in it against the current application database. Then, when the extension installs for a tenant, it stores the association and builds the relevant database schema. At runtime, [!INCLUDE[navnow](includes/navnow_md.md)] simply loads the associated objects for that extension and tenant.  

You can publish multiple extensions to a [!INCLUDE[navnow](includes/navnow_md.md)] deployment and, in multitenant deployments, install any combination of published extensions for each tenant. For example, consider a scenario with a multitenant deployment with extensions A, B, C, and D published to it. Each tenant can have their own unique combination of extensions. So tenants 2, 3, and 4 can have the same extensions \(extensions B and C\) while tenants 1 and 5 only have one extension each, extension A and D, respectively. This provides for a great degree of customer functionality choice while at the same time maximizes the server hardware and administration workload.  

 In most cases, two extension packages can coexist and work independently of each other; however there is the possibility that two apps will try to modify the same object properties. In those cases, if the conflict cannot be resolved, the installation of the conflicting extension fails.  


## Lifecycle of an Extension
By design, extension packages are intended to be more easily upgraded, so an extension is based on the concept of deltas that were introduced in the code upgrade process with the [!INCLUDE[nav_dev_shell_md](includes/nav_dev_shell_md.md)]. With this tool, you can create delta files for metadata modifications, which then can be used to merge into a target environment. When you publish an extension, this merging concept is taken to the next level where a similar delta is merged and compiled against the existing application. The difference is that the merged object is loaded at runtime as opposed to being embedded in the core source object. Doing this also permits this merge to be effectively be reversed by simply uninstalling the extension package, which removes that delta object from the deployment.  

### Development  
Extensions as a concept are designed for horizontal add-ons that are additive by nature. While not limited to that premise, following that guideline will increase the ability of your extension to coexist with other extensions. It will also ensure seamless upgrade across core application versions as well as versions of the extension.  

As a developer, you maintain your extension as a codebase that is separate from the original, and then export the modified objects as standard object .TXT files. Next, you run the application merge utilities to create delta files and then build the package with [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets that are available in the [!INCLUDE[nav_dev_shell_md](includes/nav_dev_shell_md.md)]. To update an extension, you simply repeat that process, incrementing the extension version number.  

[!INCLUDE[navnowlong](includes/navnowlong_md.md)] adds more capabilities for which object types you can include in your extension. For more information, see [Extension Packages Capabilities Support Matrix](Extension-Packages-Capability-Support-Matrix.md).

Code modifications are not allowed in extension packages. This is intended to remove the code-merge task during upgrade, and to increase the probability that different extensions can coexist. Changes to a Microsoft Dynamics NAV deployment by an extension are treated differently than if you had manually added them to your code base. User interface modifications are in their simplest form just the differences or deltas from the base application code. These are applied at runtime. Changes in business logic are encapsulated through the use of events and stored in new codeunits. You cannot modify any existing code or add code to existing objects in an extension package; you must use events. For more information, see [Introducing Events](introducing-events.md).  

#### Licensing Considerations  
   Licensing is the same for functionality that is made available in an extension package as in a .fob file. You must have the relevant license to create and export objects as TXT files. Similarly, your consumers must also have the appropriate licensing to use your extension.  

  > [!WARNING]  
  >  We strongly advise against using object IDs in the customization range \(50,000-99,000\) for objects that are intended to be distributed to multiple end customers.  

#### Debugging and Code Coverage
It is possible to use the debugger or code coverage functionality in the [!INCLUDE[navnow](includes/navnow_md.md)] client to debug your installed extension. The object lookup on the code coverage and debugger pages will display the extension objects installed for the session’s tenant. Extension objects have the same reporting and analysis capabilities as all other objects. Breakpoints can be set for extension code objects based on the line number. You are not able to open up the development environment and browse the extension’s source to set the breakpoint. You could use code coverage to discover the line numbers to set the breakpoint on if not already known.  

#### Packaging  
An integral part of development is the final building of the package. This includes providing the extension with metadata, such as name, publisher, and version, in a manifest, and packaging that with the application elements of the extension, such as DELTA files and permission set export files. The end result of that process is a package of type .NAVX .  

### Deployment  
 You administrate extensions by using the [!INCLUDE[nav_shell_md](includes/nav_shell_md.md)] to publish extensions to a [!INCLUDE[navnow](includes/navnow_md.md)] deployment, which makes it available for tenants to selectively install and use. You can also uninstall extensions for a tenant, or remove an extension from the [!INCLUDE[navnow](includes/navnow_md.md)] deployment. Upgrade scenarios, either for a specific extension or the application for this [!INCLUDE[navnow](includes/navnow_md.md)] deployment, can be accomplished with less friction as extensions, and their functionality are self-contained and do not contain alterations to C/AL code, removing the need to perform a manual merge.  

 You can publish multiple versions of the same extension to a [!INCLUDE[navnow](includes/navnow_md.md)] deployment. However, you can only have one version of the extension installed for each tenant. In a multitenant deployment, one tenant can run a different version of an extension than other tenants.  

### Upgrade  
Changes to a [!INCLUDE[navnow](includes/navnow_md.md)] deployment by an extension are treated differently than if you had manually added them to your code base. UI modifications are in their simplest for just the differences or deltas from the base application code. These are applied at runtime. Changes in business logic are encapsulated through the use of eventing or in new codeunits. As mentioned earlier, you cannot modify any existing code in an extension package; you must use events. For more information, see [Introducing Events](Introducing-Events.md).  

To upgrade an extension, you simply uninstall the old package and then install a new version of the package. The newer version takes care of the rest. When an extension package is uninstalled, all data for the extension is archived into a set of special tables, so while the extension is now removed from the system, the data is still preserved. This becomes important when you install an update as at that time it invokes code designed to upgrade any data from the old version. For more information, see [Upgrading Extensions](extensions-upgrading.md).

### Move Tenants from One Server to Another  
In multitenant deployments, moving a tenant from one server to another requires some evaluation with regards to your extension packages. The data for any extension is stored within the schema for each company in the tenant database so that will move without any extra steps. The tenant database also stores information about which extensions are installed for that tenant. Moving a tenant requires an examination of the destination server to validate that all extensions for the tenant are published on the destination server.  

As part of your preparations to move a tenant, review all installed extension packages for the tenant to make sure the same extensions are available on the destination server. You can use the [Get-NAVAppInfo](https://go.microsoft.com/fwlink/?LinkID=618058) cmdlet to accomplish this. If the apps are available then you can simply unmount the tenant and move it, as part of the mount tenant process all installed extensions for the tenant being moved will be re-installed. Please note that the applications that the two servers use must of course also be identical for this process to succeed.  

If your destination server does not have the required extensions, you can alternately uninstall the extension packages before you dismount to allow the mounting of the tenant on the destination server. The data for those extensions will be kept in the archived tables until you publish and reinstall that extension, or you choose to no longer use the extension, at which time you will need to discard the data by removing the archived tables in the tenant database.  

## System Tables and Virtual Tables  
 Extension packages are installed to and operate on a per-tenant basis. To accomplish this, the objects that are used at runtime are dynamically constructed with any extension deltas that are present for the base object. The end result is a virtual merge of the base plus the delta for a given extension. Multiple deltas from multiple extension packages can also be applied in this process. In [!INCLUDE[navnowlong](includes/navnowlong_md.md)], new system tables are added to support extensions. We recommend that you only access the system tables using the cmdlets in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] and [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)]. They are listed here for your information only:  

-   **NAV App Object Metadata** – Stores the metadata deltas for an extension.  

-   **NAV App Tenant App** – Contains all extensions that are installed to tenants and part of the application database. This table is synchronized with **NAV App Installed App** in the tenant databases and is used to drive runtime decisions about tenant/app relationships. It is also watched for changes by each [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to support on-the-fly app switching.  

-   **NAV App Data Archive** – Points to tables created to archive data for extensions that have been uninstalled. Used to provide access to the data when the extension is reinstalled during an upgrade.  

-   **NAV App Installed App** – Contains information about extensions that are installed in this tenant. This lives in the tenant database and is written/read on mount/unmount to make sure tenants keep track of their apps even when detached from an application database.  

-   **NAV App** - Contains all extensions that are published to the system. This is part of the application database.  

-   **NAV App Dependencies** – List of dependencies for individual extensions that are published to the system.  

-   **NAV App Capabilities** – List of capabilities for each extension that is published to the system. Pulled from the manifest at publication time.  

-   **NAV App Object Prerequisites** – List of prerequisite objects for individual extensions that are published to the system.  

-   **Tenant Permission Set** - Defines the mapping between extensions and permission sets.  

-   **Tenant Permission** – Contains permissions for objects as defined by permission sets in extension packages.  

 We also include objects from extensions in the following virtual tables  

-   **AllObj, AllObjWithCaption** includes new objects from all installed extensions based on the current session/tenant.  

-   **AllObj, AllObjWithCaption** includes the App Package ID field \(empty GUID for base objects, package id GUID if object comes from an extension\)  

## Windows PowerShell Cmdlets  
 To help you build, package, publish, install, and manage extensions, [!INCLUDE[navnow](includes/navnow_md.md)] includes a number of [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets as described in the following sections.  

### Development  
 The [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] includes the following new cmdlets:  

|Area|PowerShell Cmdlets|  
|----------|------------------------|  
|Manifest|-   New-NAVAppManifest<br />-   Set-NAVAppManifest<br />-   Get-NAVAppManifest<br />-   New-NAVAppManifestFile|  
|Permissions|-   Export-NAVAppPermissionSet|  
|Packaging|-   New-NAVAppPackage|  
|Table data|-   Export-NAVAppTableData|  
|Web services|-   Export-NAVAppTenantWebService|  
|Custom report layouts|-   Export-NAVAppReportLayout|  
|Multilanguage files|-   Compare-NAVAppApplicationObjectLanguage|  

 For more information, see [Development Cmdlets for Microsoft Dynamics NAV Extensions](https://go.microsoft.com/fwlink/?LinkID=626875).  

### Administration  
 The [!INCLUDE[nav_shell](includes/nav_shell_md.md)] includes the following new cmdlets:  

|Area|PowerShell Cmdlets|  
|----------|------------------------|  
|Publishing|-   Publish-NAVApp<br />-   Unpublish-NAVApp|  
|Installing|-   Install-NAVApp<br />-   Uninstall-NAVApp|  
|Managing|-   Get-NAVAppInfo<br />-   Get-NAVAppTenant<br />-   Repair-NAVApp<br />-    Remove-NAVAppsForTenant|  

 For more information, see [Administration Cmdlets for Microsoft Dynamics NAV Extensions](https://go.microsoft.com/fwlink/?LinkID=626874).  

## See Also  
[Getting Started](developer/devenv-get-started.md)  
<!--
[How to: Develop an Extension](How-to--Develop-an-Extension.md)  
[How to: Create an Extension Package](How-to--Create-an-Extension-Package.md)  
[How to: Publish and Install an Extension](How-to--Publish-and-Install-an-Extension.md)  
[Microsoft Dynamics NAV Extension Packages](Microsoft-Dynamics-NAV-Extention-Packages.md)    
[Extension Packages Capability Support Matrix](Extension-Packages-Capability-Support-Matrix.md)  
[Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)  
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)
-->