---
title: "Scaling the Microsoft Dynamics NAV Network Topology"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 42036b7e-e8c6-4d8e-a81c-f755506ed5b5
caps.latest.revision: 16
---
# Scaling the Microsoft Dynamics NAV Network Topology
When you deploy for the first time, you will have a [!INCLUDE[navnow](includes/navnow_md.md)] environment that is configured for a single [!INCLUDE[navnow](includes/navnow_md.md)] company. The environment typically consists of a [!INCLUDE[navnow](includes/navnow_md.md)] web server instance, [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and [!INCLUDE[navnow](includes/navnow_md.md)] database. Depending on the network topology that you chose for deployment, the components will be deployed on one, two, or three computers or virtual machines.  
  
 After the initial deployment, you can begin to scale the topology by adding companies, [!INCLUDE[navnow](includes/navnow_md.md)] web server instances, [!INCLUDE[nav_server](includes/nav_server_md.md)] instances, and [!INCLUDE[navnow](includes/navnow_md.md)] databases.  
  
## Scaling Configurations  
 There are four basic configurations for scaling up the [!INCLUDE[navnow](includes/navnow_md.md)] environment: single-server instance, multiple companies - single database, multiple server instances - multiple databases, and multiple-tenant.  
  
### Single Server Instance  
 With the single server instance configuration, each company has its own computer or virtual machine that hosts the [!INCLUDE[navnow](includes/navnow_md.md)] web server instance, [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and [!INCLUDE[navnow](includes/navnow_md.md)] database. Companies or instances do not share resources.  
  
 ![Scaling NAV on Azure Single instance.](media/NAV_Azure_Scaling_SingleInstance.png "NAV\_Azure\_Scaling\_SingleInstance")  
  
### Multiple Companies - Single Database  
 With this configuration, companies share the same [!INCLUDE[navnow](includes/navnow_md.md)] web server instance and [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and [!INCLUDE[navnow](includes/navnow_md.md)] database on the same computer or virtual machine.  
  
 ![Azure Scaling Multi&#45;Company.](media/NAV_Azure_Scaling_MultiCompany.png "NAV\_Azure\_Scaling\_MultiCompany")  
  
### Multiple Server Instances - Multiple Databases  
 With this configuration, companies have their own [!INCLUDE[navnow](includes/navnow_md.md)] web server instance, [!INCLUDE[nav_server](includes/nav_server_md.md)] instance, and [!INCLUDE[navnow](includes/navnow_md.md)] database. Unlike the single-instance configuration, the [!INCLUDE[navnow](includes/navnow_md.md)] components for the companies are installed on the same computer or virtual machine.  
  
 ![NAV on Azure Multi&#45;Instance Scaling.](media/NAV_Azure_Scaling_MultiInstance.png "NAV\_Azure\_Scaling\_MultiInstance")  
  
### Multiple Tenants  
 With this configuration, companies share a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and application database, but have their own business database. The application database contains tables and information that describe the [!INCLUDE[navnow](includes/navnow_md.md)] application and is not specific to companies. The business database, which is referred to as a tenant, stores business data that is specific to the company.  
  
 ![Scaling NAV using multitenancy.](media/NAV_Scaling_Multitenancy.png "NAV\_Scaling\_Multitenancy")  
  
> [!NOTE]  
>  A tenant database can contain data for one or more companies.  
  
 To support this scenario, you must configure the [!INCLUDE[navnow](includes/navnow_md.md)] environment for multitenancy. For more information, see [Migrating to Multitenancy](Migrating-to-Multitenancy.md).  
  
## How to Scale the Network Topology  
 To scale the network topology, depending on the task, you use can use [!INCLUDE[nav_shell](includes/nav_shell_md.md)], [!INCLUDE[nav_admin](includes/nav_admin_md.md)], [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)]. The following table lists the tasks and the methods that you can use to perform the tasks.  
  
|Task|Administration Shell|Administration Tool|Development Environment|Windows/Web client|For more information, see|  
|----------|--------------------------|-------------------------|-----------------------------|-------------------------|-------------------------------|  
|Add [!INCLUDE[nav_server](includes/nav_server_md.md)] instance|X|X|||[How to: Add a Microsoft Dynamics NAV Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Server-Instance.md) \(Administration Shell\)<br /><br /> [How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md) \(Administration Tool\)|  
|Add [!INCLUDE[navnow](includes/navnow_md.md)] web server instance|X||||[How to: Add a Microsoft Dynamics NAV Web Server Instance](How-to--Add-a-Microsoft-Dynamics-NAV-Web-Server-Instance.md)|  
|Mount a tenant on a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance|X|X|||[How to: Mount a Tenant](How-to--Mount-a-Tenant.md) \(Administration Shell\)<br /><br /> [How to: Mount or Dismount a Tenant on a Microsoft Dynamics Server Instance](How-to--Mount-or-Dismount-a-Tenant-on-a-Microsoft-Dynamics-Server-Instance.md) \(Administration Tool\)|  
|Add [!INCLUDE[navnow](includes/navnow_md.md)] database|X||X||[How to: Add a Microsoft Dynamics NAV Database](How-to--Add-a-Microsoft-Dynamics-NAV-Database.md) \(Administration Shell\)<br /><br /> [How to: Create Databases](How-to--Create-Databases.md) \(Development Environment\)|  
|Add [!INCLUDE[navnow](includes/navnow_md.md)] company|X|||X|[How to: Add a Microsoft Dynamics NAV Company](How-to--Add-a-Microsoft-Dynamics-NAV-Company.md) \(Administration Shell\)<br /><br /> [How to: Create Companies](How-to--Create-Companies.md) \(Windows or Web client\)|  
  
> [!NOTE]  
>  For [!INCLUDE[navnow](includes/navnow_md.md)] deployment on Microsoft Azure, we recommend that you establish a remote desktop connection to the virtual machines.  
  
## See Also  
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)   
 [Network Topologies for Microsoft Dynamics NAV on Azure](Network-Topologies-for-Microsoft-Dynamics-NAV-on-Azure.md)   
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)