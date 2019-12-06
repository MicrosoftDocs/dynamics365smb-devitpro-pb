---
title: "Sample Windows PowerShell Scripts for Microsoft Dynamics NAV"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5a30a9e2-c124-4e41-8449-0602a07e7629
caps.latest.revision: 8
---
# Sample Windows PowerShell Scripts for Microsoft Dynamics NAV
The [!INCLUDE[navnow](includes/navnow_md.md)] product media includes a folder that has examples of how you can use the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets to upgrade, deploy, and maintain your [!INCLUDE[navnow](includes/navnow_md.md)] solution.  
  
## [!INCLUDE[navnow](includes/navnow_md.md)] Sample Scripts  
 The sample [!INCLUDE[wps_2](includes/wps_2_md.md)] scripts are available in the **WindowsPowerShellScripts** folder on the [!INCLUDE[navnow](includes/navnow_md.md)] product media.  
  
 You can copy the folder to your computer and use the scripts as a starting point for managing your own solution. Depending on your solution, you can then add the sample [!INCLUDE[wps_2](includes/wps_2_md.md)] module into the [!INCLUDE[nav_shell](includes/nav_shell_md.md)] or [!INCLUDE[nav_dev_shell](includes/nav_dev_shell_md.md)] and then run the scripts.  
  
 The current version of [!INCLUDE[navnow](includes/navnow_md.md)] includes the following sample modules.  
  
|Parent folder|Module name|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-------------------|-----------------|---------------------------------------|  
|ApplicationMergeUtilities||Contains sample scripts that illustrate different ways of using [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to merge and modify application objects. The sample scripts use the Microsoft.Dynamics.Nav.Model.Tools.psd1 module, which you must import first.|  
|Cloud|HowTo|Contains sample scripts and files for deploying a fully functional end-to-end [!INCLUDE[navnow](includes/navnow_md.md)] solution on Microsoft Azure virtual machines. For more information, see For more information, see [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)|  
||NAVAdministration|Illustrates how [!INCLUDE[wps_2](includes/wps_2_md.md)] can be used to automate the provisioning and management of [!INCLUDE[navnow](includes/navnow_md.md)] installations on a virtual machine \(VM\).|  
||NAVRemoteAdministration|Illustrates how [!INCLUDE[wps_2](includes/wps_2_md.md)] can be used to automate the provisioning and management of [!INCLUDE[navnow](includes/navnow_md.md)] installations on Azure VMs.|  
||NAVRemoteAdministrationSamples|Provides examples of a fully automated deployment of [!INCLUDE[navnow](includes/navnow_md.md)] on Azure.|  
|Multitenancy|NAVMultitenancySamples|Illustrates how you can automate the steps that are required to migrate to a multitenant deployment architecture.<br /><br /> For more information, see [Migrating to Multitenancy](Migrating-to-Multitenancy.md).|  
|Upgrade|NAVUpgradeModule|Illustrates how you can automate the upgrade of a [!INCLUDE[nav7long](includes/nav7long_md.md)] database to [!INCLUDE[navnowlong](includes/navnowlong_md.md)].<br /><br /> For more information, see [Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md).|  
  
### Running the Sample Scripts  
 The sample scripts are designed to be run from the context of the Windows PowerShell module that is part of each collection of sample scripts. For example, to run the scripts for upgrading to [!INCLUDE[navnow](includes/navnow_md.md)], import the NAVUpgradeSamples.psm1 module into the [!INCLUDE[nav_shell](includes/nav_shell_md.md)]. Similarly, to run the sample scripts for merging application objects, open the HowTo-Start-Import-NAV-Module.ps1 script in the [!INCLUDE[wps_2](includes/wps_2_md.md)] IDE, navigate the command prompt to the folder where you placed the samples, and then run the script.  
  
 For more information, see [Getting Started with Windows PowerShell](https://go.microsoft.com/fwlink/?LinkID=252252) in the TechNet Library.  
  
## See Also  
 [Administration](Administration.md)   
 [Deployment](Deployment.md)   
 [Comparing and Merging Application Object Source Files](Comparing-and-Merging-Application-Object-Source-Files.md)   
 [Upgrading to Microsoft Dynamics NAV 2017](Upgrading-to-Microsoft-Dynamics-NAV-2017.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)