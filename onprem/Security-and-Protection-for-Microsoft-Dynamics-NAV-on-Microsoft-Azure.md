---
title: "Security and Protection for Microsoft Dynamics NAV on Microsoft Azure"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 13049d00-80d4-4835-897b-396ac5aedede
caps.latest.revision: 7
---
# Security and Protection for Microsoft Dynamics NAV on Microsoft Azure
This topic contains the following information and recommendations about the security and protection of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on Microsoft Azure.  
  
-   [User Accounts Created by the Microsoft Dynamics NAV Provisioning Tools](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#UserAccts)  
  
-   [Clients and Services](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#Communication)  
  
-   [Remote Desktop (RDP)](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#RemoteDeskTop)  
  
-   [Windows PowerShell Remoting](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#PSRemote)  
  
-   [Custom Images for Azure Virtual Machines](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#CustomImage)  
  
-   [Antivirus Software](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#Virus)  
  
##  <a name="UserAccts"></a> User Accounts Created by the Microsoft Dynamics NAV Provisioning Tools  
 When you deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the example scripts of the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] automatically create the following user accounts on the virtual machines:  
  
-   Azure virtual machine administrator account.  
  
-   Service account for [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
-   [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user account.  
  
### User Name and Passwords for the User Accounts  
 When you deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] by using the example scripts, you specify the user name and passwords in the Set-PartnerSettings.ps1 file. The Set-PartnerSettings.ps1 file includes a user name parameter and password parameter for every user account. If you do not provide a value for a password parameter, then the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] will automatically generate and assign a password to the account.  
  
 Like any computer, an Azure virtual machine is a potential object for a security attack. When you set the password, make sure that the password meets the Windows Server password complexity requirements. For more information, see [Passwords must meet complexity requirements](https://go.microsoft.com/fwlink/?LinkID=296611).  
  
### Azure Virtual Machine Administrator Accounts  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] create new virtual machines on which [!INCLUDE[prodshort](../developer/includes/prodshort.md)] components are installed. On each virtual machine, the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] create a local Windows user account in the Administrator group. In the Set-PartnerSettings.ps1 file of the example scripts, you specify the user name and password for the virtual machine accounts by setting the following parameters:  
  
-   $NAV\_VMAdminUserName  
  
-   $NAV\_VMAdminPassword  
  
-   $NAV\_SqlServerMachineAdminUserName  
  
-   $NAV\_SqlServerMachineAdminPassword  
  
> [!IMPORTANT]  
>  Any account that is a member of the Windows Administrator group of a virtual machine has rights to execute administrative operations on [!INCLUDE[nav_server](includes/nav_server_md.md)] instances through the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Administration Tool.  
  
### Microsoft Dynamic NAV Server Service Account  
 [!INCLUDE[nav_server](includes/nav_server_md.md)] is a Windows service that is configured to run under a specific Windows user account. The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] automatically create and configure a service account for the [!INCLUDE[nav_server](includes/nav_server_md.md)]. In the Set-PartnerSettings.ps1 file of the example scripts, you specify the [!INCLUDE[nav_server](includes/nav_server_md.md)] service account by setting the $NAV\_WindowsServiceAccount parameter and $NAV\_WindowsServiceAccountPassword parameter.  
  
 If there is more than one [!INCLUDE[nav_server](includes/nav_server_md.md)] instance on the virtual machine, then you should create a separate service account for every instance.  
  
 You should control the resources, such as files and directories, on the virtual machines that the service accounts can access by configuring Access Control Lists \(ACLs\) for the resources. For more information, see [Access Control Lists](https://go.microsoft.com/fwlink/?LinkId=177398).  
  
> [!NOTE]  
>  The service account does not have to be a member of the Administrator group.  
  
 For more information about the service account, see [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).  
  
###  <a name="NAVUser"></a> Default Microsoft Dynamics NAV User  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] create a default [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user who is assigned the SUPER permission set. The user is given access to all companies in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. In the Set-PartnerSettings.ps1 file of the example scripts, you specify the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user by setting the $NAV\_NAVAdminUserName parameter and the $NAV\_NAVAdminPassword parameter.  
  
> [!NOTE]  
>  For the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user account, if you specify a user name that is already being used by a user account in the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database, then a new user is not created. Only the password of the existing user account is changed. The existing user account will not be assigned the SUPER permission set unless it is already assigned.  
>   
>  The first time that you try to sign in to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] by using the default [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user account, you will be asked to change the password.  
  
##  <a name="Communication"></a> Clients and Services  
 The [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] configures several communication endpoints on Azure virtual machines that support clients, services, and remote administration of [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  
  
### Microsoft Dynamics NAV Web Client  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] install a website on IIS on the virtual machine. The website acts as a container for one or more web server instances for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. To help secure the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data transmission, the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] scripts configure Secure Sockets Layer \(SSL\) on the connection to [!INCLUDE[nav_web](includes/nav_web_md.md)] according to the following:  
  
-   Create a binding that uses HTTPS communication protocol on port 443.  
  
-   Apply an SSL certificate to the binding. You specify the SSL certificate in the Set-PartnerSettings file of the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)].  
  
-   Open port 443 through Windows Firewall of the virtual machine and add the port to the Azure service endpoints.  
  
 For more information about SSL for the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md).  
  
### Microsoft Dynamics NAV Windows Client  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] configure a ClickOnce website from which users can install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. To secure the ClickOnce installation, the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] implement a security certificate on the website. When you deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)], you can specify the certificate in the Set-PartnerSetting file that is used by the example scripts. There are no specific security considerations for using the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] that is deployed by the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)]. The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] automatically configure the connection to [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is used by the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The communication port that is used by a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is opened through Windows Firewall and added as an endpoint in Azure.  
  
###  <a name="RemoteDeskTop"></a> Remote Desktop \(RDP\)  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] enable Remote Desktop connections to virtual machines on Azure. We recommend that you limit scope of the IP addresses that have permission to establish a Remote Desktop connection to the virtual machine. To do this, modify the inbound rule that enables Remote Desktop connections \(RDP traffic\) in Windows Firewall of the virtual machine.  
  
 For more information, see [Remote Desktop Services and Windows Firewall](https://go.microsoft.com/fwlink/?LinkID=299451).  
  
###  <a name="PSRemote"></a> Windows PowerShell Remoting  
 To deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] by using the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)], Window PowerShell Remoting must be enabled on the Azure virtual machines. If you use an Azure Gallery image when you deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)], then Windows PowerShell Remoting is enabled by default. If you are using a custom image, then make sure that Windows PowerShell Remoting is enabled on the image. For more information, see [How to: Create a Microsoft Azure Virtual Machine Operating System Image for Microsoft Dynamics NAV](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md).  
  
 When [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] scripts are executed at provisioning, a Windows PowerShell remote session is established from the provisioning computer to the Azure virtual machine. To help secure the communication, the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] implement a Windows Remote Management \(WinRM\) session that uses an HTTPS listener with a SSL certificate.  
  
 After you deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you can establish a Windows PowerShell remote session to the Azure virtual machines and run additional Windows PowerShell cmdlets and scripts to configure the deployment. We recommend that you set up HTTPS on the Windows PowerShell remote session.  
  
## [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]  
 When you use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to develop [!INCLUDE[prodshort](../developer/includes/prodshort.md)] applications on Azure virtual machines, we recommended that you establish a Remote Desktop connection to the virtual machine, and then run the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] on the virtual machine. If you open ports in Windows Firewall on the SQL Server computer to enable access the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database from a remote computer, then you introduce a potential security risk.  
  
##  <a name="CustomImage"></a> Custom Images for Azure Virtual Machines  
 The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] example scripts create virtual machines based on a VHD image that you specify in the Set-PartnerSettings.ps1 file when you run the scripts. Instead of using an image from the Azure Marketplace, you can create a custom image. If you are using a custom image, then you should make sure that the image aligns with Microsoft solution accelerators. For more information, see [Microsoft Solution Accelerators](https://go.microsoft.com/fwlink/?LinkID=294849).  
  
 For more information about how to create an image, see [How to: Create a Microsoft Azure Virtual Machine Operating System Image for Microsoft Dynamics NAV](How-to--Create-a-Microsoft-Azure-Virtual-Machine-Operating-System-Image-for-Microsoft-Dynamics-NAV.md).  
  
##  <a name="Virus"></a> Antivirus Software  
 Virtual machines that are created by the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] are standard Windows machines and should be protected by using common protection mechanisms. Azure provides virtual machines as an Infrastructure as a Service \(IaaS\), which means that you are responsible for the day-to-day protection of the virtual machine. We recommended that you use antivirus software and keep the software updated.  
  
## See Also  
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [How to: Deploy Microsoft Dynamics NAV on Microsoft Azure by Using the Example Scripts](How-to--Deploy-Microsoft-Dynamics-NAV-on-Microsoft-Azure-by-Using-the-Example-Scripts.md)