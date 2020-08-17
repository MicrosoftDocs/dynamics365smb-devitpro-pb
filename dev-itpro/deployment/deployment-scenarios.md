---
title: Web Server Components Deployment Scenarios
description: This article describes how to install and configure the Dynamics NAV Web Server components in different network topologies and the deployment scenarios.
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: ae4ef9f5-f1bd-4792-a232-f8cab454f3c5
caps.latest.revision: 16
---
# Deployment Topologies

A [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment consists of various components that support the production, development, and testing. These components can be installed on various computers, in different combinations. The deployment process varies depending on the topology that you implement. This article provides an overview of the supported topologies. 

<!-- 
This section describes how to install and configure the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] in different network topologies.  

-->
  
![Architecture overview](../media/architecture-overview.png "Architecture overview")   
  
## Deployment Scenarios 

The following table lists some of the most typical deployment topologies for the INCLUDE[prodshort](../developer/includes/prodshort.md)], with links to detailed instructions. However, components can be installed on one, two, or three machines in any combination. So your scenario might vary.

|Topology|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|More information|  
|--------------|---------------------------------------|---|  
|Demonstration|Installs an end-to-end environment, complete with the base application and demonstration data for a single company, on a single computer. The installation enables access to [!INCLUDE[prodshort](../developer/includes/prodshort.md)] from the Web client and App, and development.<br /><br />The deployment requires minimal hardware resources, preparation, and configuration.| [Deploying a Demonstration Environment](deploy-demonstration-environment.md)|  
|Single-computer|Installs the [!INCLUDE[webserver](../developer/includes/webservercomponents.md)], [!INCLUDE[server](../developer/includes/server.md)], and the SQL Server database components on the same computer.| [Deploying in a Single Computer Environment](deploy-single-computer-environment.md)| 
|Two-computer|Installs the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] on one computer and the [!INCLUDE[server](../developer/includes/server.md)] and the SQL Server database components on another computer.|[Deploying in a Two Computer Environment](deploy-two-computer-environment.md)|  
|Three-computer|Installs the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], [!INCLUDE[server](../developer/includes/server.md)], and the SQL Server database components on separate computers.| [Deploying in a Three Computer Environment](deploy-three-computer-environment.md)| 
  
## See Also  
[Install Business Central Using Setup](install-using-setup.md)  
[Business Central Web Server Overview](web-server-overview.md)

