---
title: Azure Virtual Machine OS Image Creation
description: This topic describes how to create custom images in Microsoft Azure Gallery that you can use to create virtual machines for deploying Dynamics NAV.
author: jswymer
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 807d5b34-e487-45f7-953e-5e7079e0e3ba
mms.author: jswymer
---
# Creating a Microsoft Azure Virtual Machine Operating System Image for Microsoft Dynamics NAV
This topic describes how to create custom images in Microsoft Azure Gallery that you can use to create virtual machines for deploying [!INCLUDE[navnow](includes/navnow_md.md)]. Following this procedure ensures that [!INCLUDE[navnow](includes/navnow_md.md)] remains fully automated when using the scripts that are provided with the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)].  

 To create a custom image and add it to the Azure Gallery, you must complete the following tasks.  

-   [Create a New Azure Virtual Machine for Generating the Operating System Image](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md#CreateAzureVM)  

-   [Install Microsoft .NET Framework 3.5](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md#InstallNET35)  

-   [Install Microsoft SQL Server by Using SysPrep (NAV Database Image Only)](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md#InstallSQL)  

     You only perform this task if the image will include SQL Server for hosting the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

-   [Capture the Image and Add it to the Azure Image Gallery](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md#CaptureImage)  

##  <a name="CreateAzureVM"></a> Create a New Azure Virtual Machine for Generating the Operating System Image  
 The first task in preparing an operating system image is to create a new Azure virtual machine that is running Windows Server 2012. To do this, you use the Azure management portal to create the virtual machine based on an image from the Azure Image Gallery.  

#### To create a new Azure virtual machine  

1.  Sign in to Azure at [https://azure.microsoft.com](https://go.microsoft.com/fwlink/?LinkID=285197).  

2.  Complete the instructions for creating a new virtual machine at [https://azure.microsoft.com/documentation/articles/virtual-machines-windows-tutorial](https://azure.microsoft.com/documentation/articles/virtual-machines-windows-tutorial).  

3.  When the virtual machine has been created, establish a Remote Desktop connection to the virtual machine, and then run Windows Update and apply all recommended updates.  

     To connect from the Azure management portal, under **Virtual Machines**, select the virtual machine, and then choose **Connect**. For more information, see [How to Log on to a Virtual Machine Running Windows Server](https://go.microsoft.com/fwlink/?LinkID=298930).  

##  <a name="InstallNET35"></a> Install Microsoft .NET Framework 3.5  
 If Microsoft .NET Framework is not installed on the image, the [!INCLUDE[navnow](includes/navnow_md.md)] Setup will install it automatically during deployment. However, by installing Microsoft .NET Framework 3.5 manually, you can decrease the installation time and eliminate potential installation problems.  

#### To install Microsoft .NET Framework 3.5 on Windows Server 2012  

1.  Establish a Remote Desktop Connection to the Azure virtual machine.  

     From the Azure management portal, under **Virtual Machines**, choose the virtual machine from the list, and then choose **Connect**. For more information, see [How to Log on to a Virtual Machine Running Windows Server](https://go.microsoft.com/fwlink/?LinkID=298930).  

2.  Run Windows PowerShell as an Administrator.  

3.  At the command prompt, type the following command and press Enter.  

    ```  
    Add-WindowsFeature NET-Framework-Core  
    ```  

##  <a name="InstallSQL"></a> Install Microsoft SQL Server by Using SysPrep \(NAV Database Image Only\)  
 If you are creating an image that will be used to host the [!INCLUDE[navnow](includes/navnow_md.md)] database, then the next task is to install Microsoft SQL Server on the virtual machine. If the image will be used to create virtual machines that will only host the [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)], not the [!INCLUDE[navnow](includes/navnow_md.md)] database, then you can skip this task.  

 You cannot complete the installation of SQL Server on the virtual machine before you capture it as an image in Azure. This is because when you use the captured image to create a new virtual machine, the virtual machine is configured to use a new administrator account that has a different security identifier \(SID\) than the administrator account on the image. Therefore, you will use SysPrep to run the first part of the SQL Server installation before you capture the operating system image, and then run the second part of the installation after the new virtual machine is created from the image and started for the first time.  

> [!NOTE]  
>  The following procedure illustrates how to use SysPrep to install a trial version of SQL Server.  
>   
>  For more information about SQL Server 2012 installation using SysPrep and configuration file generation, see [Install SQL Server 2012 Using SysPrep](https://go.microsoft.com/fwlink/?LinkID=298932).  

#### To install SQL Server  

1.  Establish Remote Desktop Connection to the new virtual machine.  

    > [!NOTE]  
    >  From the Azure management portal, under **Virtual Machines**, choose the virtual machine from the list, and then choose **Connect**.  

2.  Download SQL Server 2012 from [https://www.microsoft.com/sqlserver/en/us/get-sql-server/try-it.aspx](https://www.microsoft.com/sqlserver/en/us/get-sql-server/try-it.aspx).  

    > [!NOTE]  
    >  By default, Windows Server 2012 is enabled with the Internet Explorer Enhanced Security Configuration feature. This might prevent you from downloading SQL Server 2012. If you encounter problems, disable the feature temporarily, and then enable it again after the download is finished. To enable or disable the feature, open **Server Manager**, and then set the **Internet Explorer Enhanced Security Configuration** option.  

     SQL server is downloaded as an ISO image.  

3.  Mount the SQL Server ISO image as virtual drive on the virtual machine.  

     To mount the ISO file, open **File Explorer**, right-click the file, and then choose **Mount**. A new drive, such as DVD Drive \(F:\), appears in the File Explorer.  

4.  Copy SQL Server 2012 installation files from the mounted drive to the system drive \(for example C:\) of the virtual machine.  

5.  Create a SQL SysPrep configuration file for running the SQL Server setup.exe file.  

     You can use the example file that is described in [SQL Server Sysprep Installation Configuration File Example](SQL-Server-Sysprep-Installation-Configuration-File-Example.md) or follow the instructions at [Install SQL Server 2012 Using a Configuration File](https://msdn.microsoft.com/library/dd239405.aspx) to create your own file.  

     Name the file *ConfigurationFile.ini* and save it in the same location as the setup.exe file.  

6.  Open a command prompt on the virtual machine, and then change to the folder that contains the setup.exe file.  

7.  To run the SQL Server installer, type the following command and press Enter.  

    ```  
    Setup.exe /ConfigurationFile=ConfigurationFile.ini /IAcceptSQLServerLicenseTerms=true  
    ```  

     The *ConfigurationFile* parameter specifies the SQL Server 2012 installation configuration file that executes the first part of the SysPrep-based SQL Server installation. The *IAcceptSQLServerLicenseTerms* parameter suppresses and acknowledges the SQL Server license agreement.  

8.  To schedule the second part of the SQL Server Installation, follow these steps to create a SetupComplete2.cmd file.  

    1.  Open a text editor, such as Notepad.  

    2.  Include the following command:  

        ```  
        "C:\Program Files\Microsoft SQL Server\110\Setup Bootstrap\SQLServer2012\setup.exe" /QS /ACTION=CompleteImage /INSTANCEID=MSSQLSERVER /INSTANCENAME=MSSQLSERVER /IACCEPTSQLSERVERLICENSETERMS=1 /SQLSYSADMINACCOUNTS=%COMPUTERNAME%\VMAdmin /BROWSERSVCSTARTUPTYPE=AUTOMATIC /INDICATEPROGRESS /TCPENABLED=1  

        ```  

         `VMAdmin` species the user name of the administrator account that is created on the virtual machine. If you want to specify a different user name, substitute `VMAdmin` with the name that you want to use. You cannot use `Administrator` as the user name.  

        > [!IMPORTANT]  
        >  When you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Azure by using the example scripts \(Example-1VM-ps1 and Example-2VM.ps1\), you must specify this user name for the administrator account on the virtual machine that will host the [!INCLUDE[navnow](includes/navnow_md.md)] database. You specify the user name in the Setting-PartnerSettings.ps1 file or Set-PartnerCustom.ps1 file that is used by the example script. If you are using the Example-1VM-ps1 script, then you specify the user name in the $NAV\_VMAdminUserName parameter. If you are using the Example-2VM-ps1 script, then you specify the user name in the $NAV\_SqlServerMachineAdminUserName parameter. For more information about how to run the example scripts, see [How to: Deploy Microsoft Dynamics NAV on Microsoft Azure by Using the Example Scripts](How-to--Deploy-Microsoft-Dynamics-NAV-on-Microsoft-Azure-by-Using-the-Example-Scripts.md)  

    3.  Save the file as *SetupComplete2.cmd* in the *C:\\Windows\\OEM\\* folder.  

         For an example of the SetupComplete2.cmd, see [SetupComplete2.cmd File Example](SetupComplete2.cmd-File-Example.md).  

##  <a name="CaptureImage"></a> Capture the Image and Add it to the Azure Image Gallery  
 The last task for creating a custom operating system image is to capture the image and add it to the Azure Image Gallery. This operation is performed by using SysPrep.  

#### To capture the image and add it to the Azure Image Gallery  

-   For instructions about how to capture the image and add it to the Azure Image Gallery, see [How to Capture an Image of a Virtual Machine Running Windows Server](https://go.microsoft.com/fwlink/?LinkID=299670).  

## .NET Framework Security  
 We recommend that the image adheres to the guidance that is provided on [Microsoft Solution Accelerators](https://go.microsoft.com/fwlink/?LinkID=294849).
