---
title: "Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure"
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 71c910f8-2b3c-4dca-961a-832a5a8b60a3
ms.author: jswymer
---
# Preparing for Deploying Microsoft Dynamics NAV on Microsoft Azure
You must perform the following prerequisites before you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Microsoft  Azure virtual machines:  

-   [Setting Up the Azure Subscription](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#AzureSubscritpion)  

-   [Preparing the Provisioning Computer](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#PrepareComputer)  

-   [Creating a Backup of the Application Database](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#CreateBackup)  

-   [Installing Control Add-ins and Server-Side Files](Preparing-for-Deploying-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#ControlAddins)  

 Before you begin, determine the network topology that you want for the [!INCLUDE[navnow](includes/navnow_md.md)] installation. For more information, see [Network Topologies for Microsoft Dynamics NAV on Azure](Network-Topologies-for-Microsoft-Dynamics-NAV-on-Azure.md).  

##  <a name="AzureSubscritpion"></a> Setting Up the Azure Subscription  
 Perform the following tasks to create an Azure subscription and prepare the subscription for deploying [!INCLUDE[navnow](includes/navnow_md.md)]. You only have to perform these tasks one time.  

|Task|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|Sign up for a Microsoft account.|You use a Microsoft account to sign in to the Azure management portal.<br /><br /> For more information, see [How to: Sign Up for a Microsoft Account](How-to--Sign-Up-for-a-Microsoft-Account.md).|  
|Sign up for an Azure subscription.|The Azure subscription gives you access to the Azure management portal.<br /><br /> For more information, see [How to: Sign Up for a Microsoft Azure Subscription](How-to--Sign-Up-for-a-Microsoft-Azure-Subscription.md).|  
|Create an Azure storage account in the data center where you want to add your virtual machines.|An Azure storage account provides access to the Azure Blob, Table, and Queue services in a geographic region. To create a storage account, you use the Azure management portal. For more information, see [How to Create a Storage Account](https://go.microsoft.com/fwlink/?LinkID=313871). **Tip:**  Make a note of the name that you use for the storage account because you will use it when you deploy [!INCLUDE[navnow](includes/navnow_md.md)].|  
|Prepare an Azure image for [!INCLUDE[navnow](includes/navnow_md.md)].|You will create Azure virtual machines for [!INCLUDE[navnow](includes/navnow_md.md)] deployment based on an Azure image.<br /><br /> You can use an image from the Azure Image Gallery, or create your own image. If you use an image from the Azure Image, then no action is needed for this prerequisite.<br /><br /> For more information, see [Preparing a Microsoft Azure Virtual Machine Image for Microsoft Dynamics NAV](Preparing-a-Microsoft-Azure-Virtual-Machine-Image-for-Microsoft-Dynamics-NAV.md).|  

##  <a name="PrepareComputer"></a> Preparing the Provisioning Computer  
 Perform the following tasks on the computer that you will use to create the Azure virtual machines and deploy [!INCLUDE[navnow](includes/navnow_md.md)]. You will use this computer to run the Azure provisioning scripts for [!INCLUDE[navnow](includes/navnow_md.md)]. You only have to perform these tasks one time.  

|Task|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|----------|---------------------------------------|  
|Install Windows PowerShell 3.0.|By default, Windows 8 and Windows Server 2012 include Windows PowerShell 3.0 and its prerequisites. If Windows PowerShell 3.0 is not installed, then you can download from [Installing Windows PowerShell](https://go.microsoft.com/fwlink/?LinkID=294705).|  
|Install the Windows PowerShell Integrated Scripting Environment \(ISE\).|This is an optional requirement. Windows PowerShell Integrated Scripting Environment \(ISE\) enables you to run commands, and write and debug scripts in a single graphical user interface. You can use Windows PowerShell ISE to run the sample scripts that are available with [!INCLUDE[navnow](includes/navnow_md.md)].<br /><br /> For more information, see [Windows PowerShell 3.0 Integrated Scripting Environment \(ISE\)](https://go.microsoft.com/fwlink/?LinkId=221086). **Note:**  This is an optional requirement. However, many of the procedures in this guide use Windows PowerShell ISE because of its ease of use.|  
|Install the Azure PowerShell module.|For more information, see [How to: Install the Microsoft Azure Cmdlets Module](How-to--Install-the-Microsoft-Azure-Cmdlets-Module.md).|  
|Download and import publish settings and subscription information.|To configure the connectivity between the provisioning computer and Azure, you download and import the PublishSettings file. For more information, see [How to: Download and Import Publish Settings and Subscription Information](How-to--Download-and-Import-Publish-Settings-and-Subscription-Information.md).|  
|Copy the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] to the computer.|The [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] are included on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media in the WindowsPowerShellScripts\\Cloud folder. Copy the Cloud folder and its contents to a location on the provisioning computer, such as C:\\Cloud.<br /><br /> For more information, see [How to: Install the Microsoft Dynamics NAV Provisioning Tools for Microsoft Azure](How-to--Install-the-Microsoft-Dynamics-NAV-Provisioning-Tools-for-Microsoft-Azure.md).|  
|Obtain a security certificate PFX file and password for client services.|This security certificate will be stored at the hosted service level on Azure. The security certificate is used to establish a trusted connection between clients and [!INCLUDE[navnow](includes/navnow_md.md)] services, such as SOAP and OData. You can use the sample certificate that is provided with [!INCLUDE[navnow](includes/navnow_md.md)], or you can obtain your own certificate. If you decide to use the sample certificate, then no action is required for this task.<br /><br /> -   The sample certificate is called MyAzure.pfx and is located in the Cloud\\HowTo folder.<br />-   For information about how to obtain your own certificate, see [Using Certificates to Secure a Remote RoleTailored Client Connection](https://go.microsoft.com/fwlink/?LinkID=285869).|  
|Obtain a security certificate PFX file and password for configuring SSL for the [!INCLUDE[nav_web](includes/nav_web_md.md)].|The example scripts of the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] configure HTTPS on the [!INCLUDE[navnow](includes/navnow_md.md)] Web Server to help secure [!INCLUDE[nav_web](includes/nav_web_md.md)] connections. If you do not have a certificate, the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] will automatically generate and implement a certificate. In this case, no action is required for this task|  
|Obtain a security certificate PFX file and password for ClickOnce installation of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].|This requirement is optional. The certificate is used to sign the ClickOnce installation of the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to indicate to end users that the publisher is verified. You can use the sample certificate that is provided with [!INCLUDE[navnow](includes/navnow_md.md)], or you can obtain your own certificate.<br /><br /> -   The sample certificate is called ClickOnceSignature.pfx and is located in the Cloud\\HowTo folder.<br />-   For more information about certificates, see [Using Certificates to Secure a Remote RoleTailored Client Connection](https://go.microsoft.com/fwlink/?LinkID=299320).|  
|Install the Microsoft Windows HTTP Services Certificate Configuration Tool.|This tool enables administrators to install and configure client certificates. For more information, see [Windows HTTP Services Certificate Configuration Tool](https://go.microsoft.com/fwlink/?LinkId=275580).|  
|Install the makecert.exe tool \(Certificate Creation Tool\) for creating an SSL certificate for the [!INCLUDE[nav_web](includes/nav_web_md.md)] deployment.|The makecert.exe generates certificates for testing. It is available with Microsoft Visual Studio and Microsoft Windows SDK. For more information, see [Certificate Creation Tool \(Makecert.exe\)](https://go.microsoft.com/fwlink/?LinkId=202833) in the MSDN Library. **Note:**  The makecert.exe tool is only required if you do not already have an SSL certificate.|  
|Download and install the Manifest Generation and Editing Tool \(mage.exe\) version 4.0 or later versions.|The Manifest Generation and Editing Tool is included with .NET Framework 4 and .NET Framework 4.5, which are part of the Windows SDK for Windows 7, Windows 8, Windows 8.1, and Windows Server 2012.<br /><br /> -   By default, Windows 8 and Windows Server 2012 include the Windows SDK, so no action is required.<br />-   For information about how to download and install Windows SDK for Windows 8.1, see the [https://go.microsoft.com/fwlink/?LinkID=397438](https://go.microsoft.com/fwlink/?LinkID=397438)<br />-   For information about how to download and install Windows SDK for Windows 7, see [Microsoft Windows SDK for Windows 7 and .NET Framework 4](https://go.microsoft.com/fwlink/?LinkId=275581). **Note:**  The installation of Windows SDK can fail on some computers and Windows versions. If this occurs, as a workaround, install the Windows SDK on another computer, and then copy the mage.exe file to the provisioning computer.|  
|[!INCLUDE[navnow](includes/navnow_md.md)] license.|You must have a valid license. A demonstration license \(Cronus.flf\) is available on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media \(DVD\).|  

##  <a name="CreateBackup"></a> Creating a Backup of the Application Database  
 If you will deploy your own application database instead of the [!INCLUDE[demolong](includes/demolong_md.md)], then you must create a backup of the database, and store it in a location that can be accessed from the provisioning computer. You must perform this task for each [!INCLUDE[navnow](includes/navnow_md.md)] application database that you want to deploy on Azure.  

 For more information, see [How to: Export Your Solution to a Database Backup File](How-to--Export-Your-Solution-to-a-Database-Backup-File.md).  

##  <a name="ControlAddins"></a> Installing Control Add-ins and Server-Side Files  
 If the [!INCLUDE[navnow](includes/navnow_md.md)] application that you are deploying on Azure includes control add-ins or additional files that will run on the [!INCLUDE[nav_server](includes/nav_server_md.md)], copy these files to a location that can be accessed from the provisioning computer, and then modify the deployment scripts to install the files.  

 For more information, see [How to: Install Control Add-Ins and Support Files for Your Solution](How-to--Install-Control-Add-Ins-and-Support-Files-for-Your-Solution.md)  

## See Also  
 [Planning and Preparing](Planning-and-Preparing.md)   
 [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)
