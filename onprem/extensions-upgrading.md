---
author: SusanneWindfeldPedersen
title: "Upgrading Extensions"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.author: solsen
---

# Upgrading Extensions
[!INCLUDE[nav_ext1_not_supported](includes/nav_ext1_not_supported.md)]

This topic provides information about how you can upgrade an existing extension after making changes.  

## Overview
Changes to a [!INCLUDE[navnow](includes/navnow_md.md)] deployment by an extension are treated differently than if you had manually added them to your code base. UI modifications are, in their simplest form, just the differences or deltas from the base application code. These are applied at runtime. On the other hand, because an extension package cannot modify existing code or add new code to existing objects, changes in business logic must be encapsulated through the use of events or in new codeunits. For more information, see [Introducing Events](Introducing-Events.md).  

You should not necessarily consider the upgrade of extensions as part of the upgrade process of the [!INCLUDE[navnow](includes/navnow_md.md)] deployment as a whole; unless a product upgrade has an adverse effect on an extension. In this case, you will need to address the condition by adding upgrade code to your extension. You can upgrade your extension independently of the [!INCLUDE[navnow](includes/navnow_md.md)] deployment.  

> [!TIP]  
>  We recommend that you add the upgrade code to your very first version of the extension to handle the uninstallation and reinstallation for cases when an upgrade failed, or the users inadvertently uninstalled.  


## How to Upgrade an Extension
To upgrade an extension, you simply uninstall the old package and then install a new version of the package. The newer version takes care of the rest. You can do this by using the [Uninstall-NAVApp](https://go.microsoft.com/fwlink/?LinkID=618057) and [Install-NAVApp](https://go.microsoft.com/fwlink/?LinkID=618056) cmdlets.  

When an extension package is uninstalled, all data for the extension is archived into a set of special tables, so while the extension is now removed from the system, the data is still preserved. This becomes important when you install an update because at that time, it invokes code designed to upgrade or restore any data from the old version.  

When uninstalling the extension, you can choose to not archive the data from the extension. This is accomplished by use of the *DoNotSaveData* switch parameter for the [Uninstall-NAVApp](https://msdn.microsoft.com/library/mt584146.aspx) cmdlet. Similarly, when an extension package is installed, you can choose to not load any previous version archived data by use of the *DoNotLoadData* switch parameter on the [Install-NAVApp](https://msdn.microsoft.com/library/mt584144.aspx) cmdlet. Installing and uninstalling an extension from the **Extension Management** page in the client will always save and load the data. When using these switches to either not archive data or not load archived data, the archived data will not be restored for any tables no matter what functions where written for the individual tables. Any starting data for a table will be imported into the table however.  

The following example illustrates how you can uninstall an extension and not archive its data.  

```  
Uninstall-NAVApp -ServerInstance YourDynamicsNAVServer -Path MyNAVExtension.navx -DoNotSaveData
```  

## Developing an Extension for Upgrading
When you develop an extension, you must write logic that actively upgrades or restores the archived data when the extension is installed. This code must be placed in specific functions in a codeunit in the package. As a developer of an extension, you must make sure that all scenarios for upgrades are included in your upgrade code, including the possibility that the exact same version of the extension is re-installed.  

Your extension is upgraded if you implement global functions with the following names:  

-   `OnNavAppUpgradePerDatabase()`

    Called only once in the installation process.  

-   `OnNavAppUpgradePerCompany()`  

    Called once for each company in the tenant currently being installed to.  

> [!IMPORTANT]  
>  The codeunit cannot be an **Upgrade** codeunit type. You can use more than one codeunit to contain the upgrade functions. However, it is recommended that you use a single codeunit because this gives you more control over the execution order of the upgrade code. Within a single codeunit, the `OnNavAppUpgradePerDatabase` function is run before the `OnNavAppUpgradePerCompany` function.  

There are several system functions that enable you access and manage archived data from the last version of the extension that was uninstalled. For more information about these functions, see [NAV App](NAV-App.md).  

For each new or modified table in your extension, you must use one of the following options in the appropriate upgrade global function for handling any archived data. A single extension may combine the approaches as long as all modified or added tables are handled.  

-   Restore table data  

-   Delete table data  

-   Upgrade table data  

-   Load default or starting table data  

You must include `OnNavAppUpgradePerDatabase` or `OnNavAppUpgradePerCompany` functions to your upgrade code. If these functions are not present at the time of creating the extension package and there are schema changes, the packaging will fail with an error. The installation of an extension package will also validate that all table changes are handled, and the following error occurs if they are not handled:

*The package contains changes to the database schema that are not handled in upgrade code.*

> [!NOTE]  
>  An extension package that was created by using [!INCLUDE[navcorfu](includes/navcorfu_md.md)] prior to Cumulative Update 1 may have been successfully created without the handling of archive data. This package can be published successfully for [!INCLUDE[navcorfu](includes/navcorfu_md.md)], but it may fail on a re-install if there is archive data. You will need to use the –DoNotLoadData parameter or create a new version of the extension package with upgrade code in order to successfully re-install this extension.  

For detailed instructions about how to write upgrade code, see [How to: Write Extension Upgrade Code](extensions-upgrade-howto.md).

## See Also  
[Getting Started](developer/devenv-get-started.md)  