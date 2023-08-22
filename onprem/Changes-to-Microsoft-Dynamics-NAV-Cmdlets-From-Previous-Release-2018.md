---
title: Cmdlets Changes From Previous Release
description: This article provides an overview of the new, changed, and removed cmdlets in the Administration Shell and Development Shell since previous release. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
ms.prod: "dynamics-nav-2017"
---
# Changes to Microsoft Dynamics NAV Cmdlets From Previous Release

The following sections provide an overview of the new, changed, and removed cmdlets in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] and [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] since the previous release.  

## Changes to [!INCLUDE[nav_shell](includes/nav_shell_md.md)] Cmdlets  

### New and changed cmdlets for administering the Dynamics NAV deployment

The following cmdlets are new in the Microsoft.Dynamics.NAV.Management module. 

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|
|||


The following cmdlets have been changed in the Microsoft.Dynamics.NAV.Management module.

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|[New-NAVServerUser](/powershell/module/microsoft.dynamics.nav.management/New-NAVServerUser)|-Company and -Language parameters added.|
|[Set-NAVServerUser](/powershell/module/microsoft.dynamics.nav.management/Set-NAVServerUser)|-Company and -Language parameters added.|

<!-- A number of other new cmdlets are available in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] but are not yet listed here. For a full list, see [Administration Cmdlets for Microsoft Dynamics NAV Extensions](https://go.microsoft.com/fwlink/?LinkID=626874).  -->

### New and changed cmdlets for administering Dynamics NAV Extensions
The following cmdlet are new in the Microsoft.Dynamics.NAV.Apps.Management module. 

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|||

<!--|[Get-NAVTableSynchSetupForDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/Get-NAVTableSynchSetupForDataUpgrade)|Gets information about the tables that will be modified, added, or removed during a tenant data upgrade on the specified  [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|-->

The following cmdlets have been changed in the Microsoft.Dynamics.NAV.Apps.Management module.

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|||

## Changes to [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] Cmdlets  

### Changed cmdlets for merging and modifying application object files 
The following cmdlets have been changed in the Microsoft.Dynamics.NAV.Model.Tools module.
|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|||

<!-- >  A number of other new cmdlets are available in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] but are not yet listed here. For a full list, see [Development Cmdlets for Microsoft Dynamics NAV Extensions](https://go.microsoft.com/fwlink/?LinkId=626875). -->

<!--
### Changed cmdlets for creating extension packages  
The following cmdlets have been changed in the Microsoft.Dynamics.NAV.Apps.Tools module.
|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|[Export-NAVAppTenantWebService](/powershell/module/microsoft.dynamics.nav.apps.tools/Export-NAVAppTenantWebService)|-ServiceName parameter has been added.|
-->

## See Also  
[Administration Cmdlets for Microsoft Dynamics NAV](/powershell/module/microsoft.dynamics.nav.management/Microsoft.Dynamics.NAV.Management.md)  
[Development Cmdlets for Microsoft Dynamics NAV](/powershell/module/microsoft.dynamics.nav.model.tools/Microsoft.Dynamics.NAV.Model.Tools.md)  
[Administration Cmdlets for Microsoft Dynamics NAV Extensions](/powershell/module/microsoft.dynamics.nav.apps.management/Microsoft.Dynamics.NAV.Apps.Management.md)  
[Development Cmdlets for Microsoft Dynamics NAV Extensions](/powershell/module/microsoft.dynamics.nav.apps.tools/Microsoft.Dynamics.NAV.Apps.Tools.md)  
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)
