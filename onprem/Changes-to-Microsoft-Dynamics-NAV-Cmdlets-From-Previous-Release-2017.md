---
title: "Changes to Microsoft Dynamics NAV Cmdlets From Previous Release"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
manager: edupont
ms.prod: "dynamics-nav-2017"
---
# Changes to Microsoft Dynamics NAV Cmdlets From Previous Release

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Changes-to-Microsoft-Dynamics-NAV-Cmdlets-From-Previous-Release.md).

The following sections provide an overview of the new, changed, and removed cmdlets in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] and [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] since the previous release.  

## Changes to [!INCLUDE[nav_shell](includes/nav_shell_md.md)] Cmdlets  

### New cmdlets for administering the Dynamics NAV deployment  

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|
|[Get-NAVServerAppConfiguration](/powershell/module/microsoft.dynamics.nav.management/Get-NAVServerAppConfiguration?view=dynamicsnav-ps-2017)|Returns the settings in an application-specific configuration file of a [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|
|[New-NAVServerAppConfiguration](/powershell/module/microsoft.dynamics.nav.management/New-NAVServerAppConfiguration?view=dynamicsnav-ps-2017)|Creates a new server application specific configuration file.|
|[Set-NAVServerAppConfiguration](/powershell/module/microsoft.dynamics.nav.management/Set-NAVServerAppConfiguration?view=dynamicsnav-ps-2017)|Specifies a setting in an application-specific configuration file for a [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|
|[Import-NAVConfigurationPackageFile](/powershell/module/microsoft.dynamics.nav.management/Import-NAVConfigurationPackageFile?view=dynamicsnav-ps-2017)|Imports a configuration package file into the application database.|
|[Remove-NAVConfigurationPackageFile](/powershell/module/microsoft.dynamics.nav.management/Remove-NAVConfigurationPackageFile?view=dynamicsnav-ps-2017)| Removes a configuration package file from the application database.|
|[Import-NAVMembershipEntitlement](/powershell/module/microsoft.dynamics.nav.management/Import-NAVMembershipEntitlement?view=dynamicsnav-ps-2017)|Imports the license entitlement data for a membership association.|
|[Update-NAVScheduledTaskList](/powershell/module/microsoft.dynamics.nav.management/Update-NAVScheduledTaskList?view=dynamicsnav-ps-2017)|Updates the application-wide list of scheduled tasks with the information from the tenant database.|

<!-- A number of other new cmdlets are available in the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] but are not yet listed here. For a full list, see [Administration Cmdlets for Microsoft Dynamics NAV Extensions](https://go.microsoft.com/fwlink/?LinkID=626874).  -->

### New cmdlets for administering Dynamics NAV Extensions

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|[Get-NAVAppTableModification](/powershell/module/microsoft.dynamics.nav.apps.management/Get-NAVAppTableModification?view=dynamicsnav-ps-2017)|Gets information about the tabled added or modified by an extension based on the specified [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|
|[Remove-NAVAppsForTenant](/powershell/module/microsoft.dynamics.nav.apps.management/Remove-NAVAppsForTenant?view=dynamicsnav-ps-2017)| Removes all NAV Apps from the specified, unmounted tenant. This cmdlet should be run against tenants that are not mounted.|

<!--|[Get-NAVTableSynchSetupForDataUpgrade](/powershell/module/microsoft.dynamics.nav.apps.management/Get-NAVTableSynchSetupForDataUpgrade?view=dynamicsnav-ps-2017)|Gets information about the tables that will be modified, added, or removed during a tenant data upgrade on the specified  [!INCLUDE[nav_server_md](includes/nav_server_md.md)] instance.|-->

### Changed cmdlets  

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|[Install-NAVApp](/powershell/module/microsoft.dynamics.nav.apps.management/Install-NAVApp?view=dynamicsnav-ps-2017)|*ExchangeAuthenticationMetadataLocation* parameter added.|
|[Mount-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/Mount-NAVTenant?view=dynamicsnav-ps-2017)|*ExchangeAuthenticationMetadataLocation* parameter added.|
|[Get-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/Mount-NAVTenant?view=dynamicsnav-ps-2017)|*ExchangeAuthenticationMetadataLocation* is returned.|
|[Start-NAVDataUpgrade](/powershell/module/microsoft.dynamics.nav.management/Start-NAVDataUpgrade?view=dynamicsnav-ps-2017)|*Language* parameter added.|
|[Sync-NAVTenant](/powershell/module/microsoft.dynamics.nav.management/Sync-NAVTenant?view=dynamicsnav-ps-2017)|*CommitPerTable* parameter added.|
|[New-NAVWebServerInstance](/powershell/module/microsoft.dynamics.nav.management/New-NAVWebServerInstance?view=dynamicsnav-ps-2017)|The parameters *ACSUri*, *Language*, *RegionFormat*, and *Company* are deprecated. <BR /><BR />The *Language*, *RegionFormat*, and *Company* settings are now stored in system tables for users. Users can change the value of these settings from the **My Settings** page in the client. Administrators can globally change these settings by using User Personalization in the clients.<BR /><BR />The *ACSUri* has been replaced by the **WSFederationLoginEndpoint** key in the [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration file, which you can set by using the [Set-NAVServerConfiguration cmdlet](/powershell/module/microsoft.dynamics.nav.management/Set-NAVServerConfiguration.md).|

## Changes to [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] Cmdlets  

### New cmdlets for includes cmdlets for creating Dynamics NAV extension packages
 The following table includes the new cmdlets in the current release.  

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|[Export-NAVAppReportLayout](/powershell/module/microsoft.dynamics.nav.apps.tools/Export-NAVAppReportLayout?view=dynamicsnav-ps-2017)|Exports the specified custom report layout from the database to a file.|
|[Export-NAVAppTableData](/powershell/module/microsoft.dynamics.nav.apps.tools/Export-NAVAppTableData.md) | Exports data from a Microsoft Dynamics NAV database table to file.|
|[Export-NAVAppTenantWebService](/powershell/module/microsoft.dynamics.nav.apps.tools/Export-NAVAppTenantWebService?view=dynamicsnav-ps-2017)| Exports the specified web service from the database to a file.|

<!-- >  A number of other new cmdlets are available in the [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] but are not yet listed here. For a full list, see [Development Cmdlets for Microsoft Dynamics NAV Extensions](https://go.microsoft.com/fwlink/?LinkId=626875). -->

### Changed cmdlets  

|Cmdlet|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|
|------------|---------------------------------------|  
|[New-NAVCrmTable](/powershell/module/microsoft.dynamics.nav.model.tools/New-NAVCrmTable?view=dynamicsnav-ps-2017)|*AuthenticationType* parameter added.|

## See Also  
[Administration Cmdlets for Microsoft Dynamics NAV](/powershell/module/microsoft.dynamics.nav.management/Microsoft.Dynamics.Nav.Management.md)  
[Development Cmdlets for Microsoft Dynamics NAV](/powershell/module/microsoft.dynamics.nav.model.tools/Microsoft.Dynamics.Nav.Model.Tools.md)  
[Administration Cmdlets for Microsoft Dynamics NAV Extensions](/powershell/module/microsoft.dynamics.nav.apps.tools/Microsoft.Dynamics.Nav.Apps.Tools.md)  
[Development Cmdlets for Microsoft Dynamics NAV Extensions](/powershell/module/microsoft.dynamics.nav.apps.tools/Microsoft.Dynamics.Nav.Apps.Tools.md)  
[Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)
