---
title: "Preparing a Microsoft Azure Virtual Machine Image for Microsoft Dynamics NAV"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: 89251188-b6ef-481f-87df-e5b649579632
caps.latest.revision: 11
---
# Preparing a Microsoft Azure Virtual Machine Image for Microsoft Dynamics NAV
Before you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Microsoft Azure, you must prepare images that will be used to create the virtual machines for the deployment. An image is a virtual hard drive \(VHD\) file that you use as a template to create new virtual machines on Azure.  

 The end-to-end scripts Example-1VM.ps1 and Example-2VM.ps1, which are part of the [!INCLUDE[navnow](includes/navnow_md.md)] provisioning tools, automatically create the virtual machines for [!INCLUDE[navnow](includes/navnow_md.md)] based on an image that you specify when you run the scripts.  

## Using Microsoft Azure Marketplace Images or Custom Images  
 You can use images that are available in the Azure Marketplace or you can create your own custom images. Depending on the image that you use, it must meet the requirements that are described in the next section.  

 We recommend that you use an image Azure Marketplace, because no preparation is needed. By default, the Set-PartnerSetting.ps1 file that is used by the Example-1VM.ps1 and Example-2VM.ps1 scripts is configured to use valid Azure Marketplace images.  

 For information about how to create your own image, see [How to: Create a Microsoft Azure Virtual Machine Operating System Image for Microsoft Dynamics NAV](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md).  

##  <a name="ImageRequirements"></a> Images Requirements  
 Depending on the network topology that you deploy on Azure, you will need one or two images. Example-1VM.ps1 deploys [!INCLUDE[navnow](includes/navnow_md.md)] on one virtual machine and requires a single image. Example-2VM.ps1 deploys [!INCLUDE[navnow](includes/navnow_md.md)] on two virtual machines, where one virtual machine is for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)], and the other virtual machine is for SQL Server and the [!INCLUDE[navnow](includes/navnow_md.md)] database. The Example-2VM.ps1 script requires that you specify an image for each virtual machine. Depending on the script that you use, the images must meet the requirements that are described in the following table.  

|Deployment topology|Image requirements|  
|-------------------------|------------------------|  
|One virtual machine \(Example-1VM.ps1\)|-   A supported operating system, such as Windows Server 2012.<br />-   A supported version of Microsoft SQL Server, such a Microsoft SQL Server 2012.<br />-   Windows PowerShell Remoting feature enabled and allowed through Windows Firewall. **Note:**      By default, Windows PowerShell Remoting is enabled on Azure Marketplace images.|  
|Two virtual machines \(Example-2VM.ps1\)|The image for the virtual machine on which [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] will be installed must include the following:<br /><br /> -   Windows Server 2012 operating system.<br />-   Windows PowerShell Remoting feature enabled and allowed through Windows Firewall.<br /><br /> The image for the virtual machine on which [!INCLUDE[navnow](includes/navnow_md.md)] database components will be installed must include the following:<br /><br /> -   Windows Server 2012 operating system.<br />-   A supported version of Microsoft SQL Server, such a Microsoft SQL Server 2012.<br />-   Windows PowerShell Remoting feature enabled and allowed through Windows Firewall. **Note:**  You can use the same image for both virtual machines as long as the image includes Microsoft SQL Server 2012.|  

 For a complete list of supported operating systems and Microsoft SQL Server versions, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

## See Also  
 [Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)
