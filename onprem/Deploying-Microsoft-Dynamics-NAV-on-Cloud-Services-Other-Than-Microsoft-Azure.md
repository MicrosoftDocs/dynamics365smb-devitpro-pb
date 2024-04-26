---
title: "Deploying Microsoft Dynamics NAV on Cloud Services Other Than Microsoft Azure"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 6470796c-510e-462e-9de5-6a7dfcb019a6
caps.latest.revision: 8
---
# Deploying Microsoft Dynamics NAV on Cloud Services Other Than Microsoft Azure
The [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] have been designed to provide an end-to-end scenario for deploying [!INCLUDE[navnow](includes/navnow_md.md)] on the Microsoft Azure. However, because the provisioning tools are implemented in Windows PowerShell scripts, you can adapt them to other cloud services or on-premise installations.  

 This topic provides an overview of the work that is required to modify the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] for deploying [!INCLUDE[navnow](includes/navnow_md.md)] on cloud services and virtual machines that are not on Azure.  

## Preparing the Virtual Machines  
 The virtual machines on the cloud service must meet the following requirements:  

-   Minimum system requirements for [!INCLUDE[navnow](includes/navnow_md.md)]. For more information, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

-   The Remote Desktop Protocol \(RDP\) and remote administration using PowerShell 3.0 must be enabled.  

## Modifying the Provisioning Tool Scripts  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] are located in the **WindowsPowerShellScripts\\Cloud** folder on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\). The Cloud folder includes several subfolders where the different Windows PowerShell scripts are organized according to their function. Most of the scripts do not have any dependencies on Azure so that they can be reused in other environments without modification. You perform most of the modifications on the scripts in the **Cloud\\NAVRemoteAdministrationSamples** folder and **Cloud\\NAVRemoteAdministration\\Azure** folder of the provisioning tools.  

 The **Cloud\\NAVRemoteAdministrationSamples** folder contains the following files that you must modify:  

-   Install-NAVBox.ps1  

-   HowTo-CreateAzureVM.ps1  

-   HowTo-InstallNAVOnVM.ps1  

-   HowTo-AddNAVInstance.ps1  

-   HowTo-OpenFirewallPort.ps1  

-   HowTo-SetAzureVMSize.ps1  

-   HowTo-UploadFilesToVM.ps1  

 The "HowTo” scripts import and call additional scripts from the **Cloud\\NAVRemoteAdministration** folder and its subfolders. Most of the scripts in this folder are generic and should not be modified. However, some of the scripts have dependencies Azure for doing tasks like creating the network, the virtual machines, and the physical storage where the virtual machines are installed. The Azure-specific scripts are all located in the **Cloud\\NAVRemoteAdministration\\Azure** folder and include the following:  

-   New-NAVAzureBaseVM.ps1  

-   New-NAVAzureDataDisk.ps1  

-   Copy-VhdFileToAzureStorage.ps1  

-   Mount-VhdFileToAzureVM.ps1  

-   Dismount-VhdFileFromAzureVM.ps1  

-   Wait-VMReadyState.ps1  

-   Remove-NAVAzureVM.ps1  

-   New-AzureVhdDisk.ps1  

-   New-AzureVirtualNetwork.ps1  

-   Test-AzureAffinityGroup.ps1  

-   Test-AzureVirtualNetwork.ps1  

 Replace these scripts with scripts that perform similar tasks on your environment.  

> [!NOTE]  
>  The scripts in the **Cloud\\NAVRemoteAdministration\\Azure** folder are very specific to Azure. The API for your cloud service provider may require a different structure of the scripts. However, the high-level concepts will be similar.  

## See Also  
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV on Two Virtual Machines Using Example-2VM Script](Deploying-Microsoft-Dynamics-NAV-on-Two-Virtual-Machines-Using-Example-2VM-Script.md)   
 [Deploying Microsoft Dynamics NAV on One Virtual Machine Using Example-1VM Script](Deploying-Microsoft-Dynamics-NAV-on-One-Virtual-Machine-Using-Example-1VM-Script.md)   
 [How to: Deploy Microsoft Dynamics NAV on Microsoft Azure by Using the Example Scripts](How-to--Deploy-Microsoft-Dynamics-NAV-on-Microsoft-Azure-by-Using-the-Example-Scripts.md)
