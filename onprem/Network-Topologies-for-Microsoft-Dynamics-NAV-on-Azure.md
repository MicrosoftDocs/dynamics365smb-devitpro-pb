---
title: "Network Topologies for Microsoft Dynamics NAV on Azure"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 44d22a2e-25e1-4a85-aefc-0a81113c02e0
caps.latest.revision: 10
---
# Network Topologies for Microsoft Dynamics NAV on Azure
The [!INCLUDE[nav_prov_long](includes/nav_prov_long_md.md)] support the automated deployment of [!INCLUDE[navnow](includes/navnow_md.md)] on Microsoft Azure virtual machines. This topic describes the deployment topologies that are supported. Before you start to deploy [!INCLUDE[navnow](includes/navnow_md.md)], you should determine the deployment topology that you want for your environment.  
  
## Deploying [!INCLUDE[navnow](includes/navnow_md.md)] on One Virtual Machine  
 When you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on a single virtual machine, the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], [!INCLUDE[nav_server](includes/nav_server_md.md)], SQL Server, and [!INCLUDE[navnow](includes/navnow_md.md)] database components are installed on the same virtual machine.  
  
 ![NAV topology on one Azure virtual machine.](media/NAV_Azure_1VM_Topology_Overview.png "NAV\_Azure\_1VM\_Topology\_Overview")  
  
 This virtual machine represents a single cloud service on Azure. Users can access [!INCLUDE[navnow](includes/navnow_md.md)] data by using the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] from a ClickOnce deployment, the [!INCLUDE[nav_web](includes/nav_web_md.md)], and OData and SOAP web services.  
  
 You can specify the size of the virtual machine, such as Small, Medium, Large, or ExtraLarge. You can also scale the deployment to serve more than one customer by adding multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] web server instances on the virtual machine.  
  
 To deploy this scenario, you can use the Example-1VM.ps1 script that is available with the provisioning tools. For more information, see [Deploying Microsoft Dynamics NAV on One Virtual Machine Using Example-1VM Script](Deploying-Microsoft-Dynamics-NAV-on-One-Virtual-Machine-Using-Example-1VM-Script.md).  
  
## Deploying [!INCLUDE[navnow](includes/navnow_md.md)] on Two Virtual Machines  
 When you deploy [!INCLUDE[navnow](includes/navnow_md.md)] on a two virtual machines, the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] are installed on one virtual machine, and the SQL Server and [!INCLUDE[navnow](includes/navnow_md.md)] database components are installed on another virtual machine.  
  
 ![NAV topology on two Azure virtual machines.](media/NAV_Azure_2VM_Topology_Overview.png "NAV\_Azure\_2VM\_Topology\_Overview")  
  
 Each virtual machine represents a cloud service on Azure. The virtual machines are joined inside the same virtual network.  
  
 Similar to the one virtual machine topology, users can access [!INCLUDE[navnow](includes/navnow_md.md)] data by using the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] from a ClickOnce site, the [!INCLUDE[nav_web](includes/nav_web_md.md)], and OData and SOAP web services.  
  
 You can specify the size of the virtual machine, such as Small, Medium, Large, or ExtraLarge. To scale the deployment, you can add multiple [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on the existing virtual machine that is running [!INCLUDE[nav_server](includes/nav_server_md.md)] or you can add new virtual machines for the [!INCLUDE[nav_server](includes/nav_server_md.md)]. You configure the virtual machines to connect to the SQL Server virtual machine.  
  
 To deploy this scenario, you can use the Example-2VM.ps1 script that is available with the provisioning tools. For more information, see [Deploying Microsoft Dynamics NAV on Two Virtual Machines Using Example-2VM Script](Deploying-Microsoft-Dynamics-NAV-on-Two-Virtual-Machines-Using-Example-2VM-Script.md).  
  
## See Also  
 [Deploying and Managing Microsoft Dynamics NAV on Microsoft Azure](Deploying-and-Managing-Microsoft-Dynamics-NAV-on-Microsoft-Azure.md)   
 [Planning and Preparing](Planning-and-Preparing.md)   
 [Scaling the Microsoft Dynamics NAV Network Topology](Scaling-the-Microsoft-Dynamics-NAV-Network-Topology.md)