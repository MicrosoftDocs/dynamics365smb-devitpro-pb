---
title: "Administration of Microsoft Dynamics NAV on Microsoft Azure"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 240ad968-f67b-4fbb-b704-d111d9eeb5dc
caps.latest.revision: 9
---
# Administration of Microsoft Dynamics NAV on Microsoft Azure
This topic discusses the following administration concepts and tasks for [!INCLUDE[navnow](includes/navnow_md.md)] deployments on Microsoft Azure.  
  
-   [User Authentication](Administration-of-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#UserAuth)  
  
-   [SQL Server on Azure Virtual Machines](Administration-of-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#SQLServer)  
  
-   [Fault Tolerance](Administration-of-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#FaultTolerance)  
  
-   [Changing the Azure Virtual Machine Size](Administration-of-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#VMSize)  
  
-   [Managing Microsoft Dynamics NAV Hotfixes](Administration-of-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md#Hotfix)  
  
##  <a name="UserAuth"></a> User Authentication  
 [!INCLUDE[navnow](includes/navnow_md.md)] supports four different credential types for authenticating users:  
  
-   NavUserPassword  
  
-   Windows  
  
-   UserName  
  
-   AccesControlService  
  
 These credential types are also supported for [!INCLUDE[navnow](includes/navnow_md.md)] deployments on Azure. By default, the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] configure NavUserPassword credential type for [!INCLUDE[navnow](includes/navnow_md.md)] deployments on Azure. However, you can configure the deployment for any of the available credential types.  
  
 You can change the credential type programmatically by modifying the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] scripts or manually by establishing a Remote Desktop connection to the virtual machine that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)], and then modifying the configuration of these components. You must also configure the credential type in [!INCLUDE[navnow](includes/navnow_md.md)] user accounts.  
  
 For more information, see [Users and Credential Types](Users-and-Credential-Types.md).  
  
> [!NOTE]  
>  The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] automatically configure a default [!INCLUDE[navnow](includes/navnow_md.md)] user who is assigned the SUPER permission set. For more information, see [Security and Protection for Microsoft Dynamics NAV on Microsoft Azure](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md).  
  
### NavUserPassword Credential Type  
 With the NavUserPassword credential type, authentication is managed by [!INCLUDE[nav_server](includes/nav_server_md.md)] but is not based on Windows users or Azure Active Directory \(Azure AD\). The user is prompted for user name and password credentials when they start the client. The credentials are then validated by an external mechanism. Security certificates are required to protect the passing of credentials. This mode is intended for hosted environments, for example, where [!INCLUDE[navnow](includes/navnow_md.md)] is implemented in Azure.  
  
### Windows or UserName Credential Type  
 The Windows and UserName credential types authenticate users against a Windows account in Active Directory. To use the Windows or UserName credential type, you must have an Active Directory domain controller in the same virtual network as the virtual machines that are running [!INCLUDE[navnow](includes/navnow_md.md)] components. The virtual machines must be joined to the domain and [!INCLUDE[navnow](includes/navnow_md.md)] users must have a Windows account in Active Directory. For more information, see [Windows Server Active Directory on Azure VMs](https://go.microsoft.com/fwlink/?LinkID=296596).  
  
 With the Windows credential type, users are authenticated using their Windows credentials. Users are not prompted for credentials when they start the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
 You should use the UserName credential type instead of the Windows credential type if users will access [!INCLUDE[navnow](includes/navnow_md.md)] from devices that are not part of the domain. The UserName credential type uses Form authentication for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. When users access the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)], they are prompted to enter their Windows credentials.  
  
### AccessControlService Credential Type  
 Azure Access Control service \(ACS\) is a cloud service that provides user authentication and authorization for web applications and services. To configure ACS to authenticate users, you must set up the ACS provider, and then configure the [!INCLUDE[navnow](includes/navnow_md.md)] components and users for the ACS credential type.  
  
 For more information, see [Authenticating Users with Microsoft Azure Access Control Service](Authenticating-Users-with-Microsoft-Azure-Access-Control-Service.md).  
  
##  <a name="SQLServer"></a> SQL Server on Azure Virtual Machines  
 When you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Azure virtual machines, you can create an SQL server for hosting the [!INCLUDE[navnow](includes/navnow_md.md)] database. Depending on whether you built a new [!INCLUDE[navnow](includes/navnow_md.md)] database on Azure or migrated an existing [!INCLUDE[navnow](includes/navnow_md.md)] database, Azure virtual machines provide robust infrastructure for SQL Server. You can control and manage the [!INCLUDE[navnow](includes/navnow_md.md)] database by using the same development and administration tools that are available with on-premise installations.  
  
 For more information, see [SQL Server in Azure Virtual Machines](https://go.microsoft.com/fwlink/?LinkID=299595).  
  
###  <a name="DBBackup"></a> Backing Up and Restoring the Microsoft Dynamics NAV Database  
 Backing up the [!INCLUDE[navnow](includes/navnow_md.md)] database on SQL Server on Azure virtual machines provides a safeguard for protecting critical data. The guidelines for backing up and restoring the [!INCLUDE[navnow](includes/navnow_md.md)] database on Azure are like on-premise installations of [!INCLUDE[navnow](includes/navnow_md.md)].  
  
 For more information, see [Backup and Restore for SQL Server in Azure Virtual Machines](https://go.microsoft.com/fwlink/?LinkID=299596).  
  
### Optimizing SQL Server Performance with [!INCLUDE[navnow](includes/navnow_md.md)]  
 There are several procedures that you can perform to optimize the performance in [!INCLUDE[navnow](includes/navnow_md.md)] when you access data from the SQL Server database. For more information, see [Optimizing SQL Server Performance with Microsoft Dynamics NAV](Optimizing-SQL-Server-Performance-with-Microsoft-Dynamics-NAV.md).  
  
##  <a name="FaultTolerance"></a> Fault Tolerance  
 Azure offers geo redundant storage \(GRS\) that replicates data to guarantee fault tolerance and avoid a single point of failure. Additionally, most high availability and disaster recovery \(HADR\) database system solutions that are available in SQL Server are supported in Azure virtual machines.  
  
 For more information, see the following topics:  
  
-   [What is a Storage Account?](https://go.microsoft.com/fwlink/?LinkID=296573)  
  
-   [Introducing Geo-replication for Azure Storage](https://go.microsoft.com/fwlink/?LinkID=296574)  
  
-   [High Availability and Disaster Recovery for SQL Server in Azure Virtual Machines](https://go.microsoft.com/fwlink/?LinkID=299597)  
  
##  <a name="VMSize"></a> Changing the Azure Virtual Machine Size  
 When you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Azure by using the [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)], you specify the size of the virtual machines that are created on Azure. The virtual machine size determines the number of CPU cores, the memory capacity, and the local file system size that is allocated to a running virtual machine. In the Example-1VM and Example-2VM scripts of the [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)], the virtual machine size is set by the $NAV\_VMSize parameter in the Set-PartnerSettings file. The [!INCLUDE[nav_prov_short](includes/nav_prov_short_md.md)] support the following sizes: Small, Medium, Large, ExtraLarge, A6, and A7. After the initial deployment, you can change the virtual machine size to suit your requirements.  
  
 For more information, see [Configure Virtual Machine Sizes](https://go.microsoft.com/fwlink/?LinkID=273688).  
  
##  <a name="Hotfix"></a> Managing Microsoft Dynamics NAV Hotfixes  
 A hotfix is typically a package of one or more files that fix problems in [!INCLUDE[navnow](includes/navnow_md.md)]. [!INCLUDE[navnow](includes/navnow_md.md)] hotfixes are released for the application and platform.  
  
### Installing a Hotfix on an Existing [!INCLUDE[navnow](includes/navnow_md.md)] Deployment on Azure  
 You install a hotfix on a [!INCLUDE[navnow](includes/navnow_md.md)] deployment on Azure just like you install a hotfix on an on-premise deployment of [!INCLUDE[navnow](includes/navnow_md.md)]. To install a hotfix, you establish a Remote Desktop Connection to the Azure virtual machine that is running the [!INCLUDE[navnow](includes/navnow_md.md)] components, and then install the hotfix files to the [!INCLUDE[navnow](includes/navnow_md.md)] installation folder on the virtual machine.  
  
 For more information about how to install [!INCLUDE[navnow](includes/navnow_md.md)] application and platform hotfixes, see [How to install a Microsoft Dynamics NAV 2013 update rollup](https://go.microsoft.com/fwlink/?LinkID=299598) \(requires a PartnerSource account\).  
  
### Installing a Hotfix on the [!INCLUDE[navnow](includes/navnow_md.md)] Installation Media  
 Before you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on Azure, you can install a hotfix on the [!INCLUDE[navnow](includes/navnow_md.md)] installation media that you will use for the deployment. This makes sure that future [!INCLUDE[navnow](includes/navnow_md.md)] deployments on Azure include the hotfix changes. To install a hotfix, copy the hotfix files to the location of the [!INCLUDE[navnow](includes/navnow_md.md)] installation media.  
  
## See Also  
 [Planning and Preparing](Planning-and-Preparing.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Deploying Microsoft Dynamics NAV Using the Example Scripts](Deploying-Microsoft-Dynamics-NAV-Using-the-Example-Scripts.md)   
 [Security and Protection for Microsoft Dynamics NAV on Microsoft Azure](Security-and-Protection-for-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)