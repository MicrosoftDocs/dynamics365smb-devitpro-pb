---
title: "Deploying Microsoft Dynamics NAV Using the Example Scripts"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 62d675b8-42ab-4070-90ac-85cb3ae9428d
caps.latest.revision: 10
---
# Deploying Microsoft Dynamics NAV Using the Example Scripts
[!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] include two Windows PowerShell scripts, Example-1VM.ps1 and Example-2VM.ps1, which you can run to automatically deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Microsoft Azure virtual machines. The scripts deploy [!INCLUDE[navnow](includes/navnow_md.md)] in two different network configurations as described in following sections. The scripts create the required Azure virtual machines, based on a specified image, and then install and configure the [!INCLUDE[navnow](includes/navnow_md.md)] components, including the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], [!INCLUDE[nav_server](includes/nav_server_md.md)], and [!INCLUDE[navnow](includes/navnow_md.md)] database components for SQL Server, including the application database. After the scripts are run, you will have a fully functional end-to-end [!INCLUDE[navnow](includes/navnow_md.md)] environment that enables users to access [!INCLUDE[navnow](includes/navnow_md.md)] data from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
> [!NOTE]  
>  The Example-1VM.ps1 and Example-2VM.ps1 scripts are located in the \\WindowsPowerShellScripts\\Cloud\\HowTo folder on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\).  
  
 For more information, see the following topics:  
  
-   [Deploying Microsoft Dynamics NAV on One Virtual Machine Using Example-1VM Script](Deploying-Microsoft-Dynamics-NAV-on-One-Virtual-Machine-Using-Example-1VM-Script.md)  
  
-   [Deploying Microsoft Dynamics NAV on Two Virtual Machines Using Example-2VM Script](Deploying-Microsoft-Dynamics-NAV-on-Two-Virtual-Machines-Using-Example-2VM-Script.md)  
  
## See Also  
 [Planning and Preparing](Planning-and-Preparing.md)   
 [Network Topologies for Microsoft Dynamics NAV on Azure](Network-Topologies-for-Microsoft-Dynamics-NAV-on-Azure.md)