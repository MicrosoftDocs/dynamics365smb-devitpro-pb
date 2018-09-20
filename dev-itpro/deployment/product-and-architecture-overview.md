---
title: Product Architecture
description: In Microsoft Dynamics NAV, the architecture comprises of three core components, and various additional tools and components.
ms.custom: na
ms.date: 10/17/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 275aad2c-ea2c-4291-8381-82b0b92dc1a0
caps.latest.revision: 29
manager: edupont
---
# [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Component and Sytem Topology

The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment comprises three core components for serving the application to users, plus various tools and components for managing, developing, extending, and testing the application.

Use [!INCLUDE[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] to install all components.  

## Multi-Tier System Topology
 
To understand the components is useful to first look at the base topology of a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deloyment, as illustrated in the following diagram:

![Architecture overview](../media/architecture-overview.png "Architecture overview")  


## Components

### Main components

Every deployment must include the core components: Web server, Server, and SQL Database. 

|Component|Description|   |
|---------|-----------|---|
|SQL Database|An SQL Server or Azure SQL Database database that contains application object definitions and business data. In a multitenant deployment, the application and business data can be separated into different databases: the application database and the tenant, which is the a database that contains the business data. In this case, there can be one or more tenant for a single application database.||
|Server|[!INCLUDE[server](../developer/includes/server.md)] is a .NET-based Windows Service application that uses Windows Communication Framework to handle communication between clients and databases. It controls authentication, event logging, scheduled tasks, reporting and more.||
|Web Server|An Internet Information Server (IIS) web site, provisioned with the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], that enables access from the [!INCLUDE[webclient](../developer/includes/webclient.md)] and mobile apps.||

### Development and administration components

|Component|Description|   |
|---------|-----------|---|
|AL development environment|An AL language extension for Visual Studio Code for developing applications and extensions.||
|[!INCLUDE[admintool](../developer/includes/admintool.md)]|A Microsoft Management Console (MMC) for creating and configuring [!INCLUDE[server](../developer/includes/server.md)] instances.||
|[!INCLUDE[adminshell](../developer/includes/adminshell.md)]|Windows Powershell modules for managing the deployment, including tasks such adding and configuring [!INCLUDE[server](../developer/includes/server.md)] and Web server instances, databases, and users, and administering extension packages.||
|Demo Database|A database that contains application objects and sample business data for demonstration purposes.||

### Additional components

|Component|Description|   |
|---------|-----------|---|
|Help Server|An IIS website that hosts help as HTML files that can be used as an alternative to online help.||
|[!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)]|The C/SIDE client that was available in [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] for developing applications using C/AL. In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], this is only required for performing upgrades.||
|[!INCLUDE[devshell](../developer/includes/devshell.md)]|Windows Powershell modules for merging and modifying application object files and creating extension packages. Installed with the [!INCLUDE[nav_dev_long_md](../developer/includes/nav_dev_long_md.md)].||
|[!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)]|Windows Desktop application for accessing [!INCLUDE[prodshort](../developer/includes/prodshort.md)].||
|Microsoft Outlook Integration|A [!INCLUDE[server](../developer/includes/server.md)] component for integrating with Microsoft Outlook.||
|Page Testability|A [!INCLUDE[server](../developer/includes/server.md)] component for testing pages.||
|Microsoft Outlook Add-in| A component to synchronize data, such as to-dos, contacts, and tasks, between [!INCLUDE[prodshort](../developer/includes/prodshort.md)] and Outlook. The Outlook Add-In uses [!INCLUDE[prodshort](../developer/includes/prodshort.md)] web services.||
|Automated Data Capture System|A system that tracks the movement of items in a warehouse.||
|ClickOnce Installer Tools|Tools for implementing ClickOnce installation for the [!INCLUDE[nav_windows_md](../developer/includes/nav_windows_md.md)].||
|Microsoft Excel Add-in|A component that enables users to export data from [!INCLUDE[prodshort](../developer/includes/prodshort.md)] to Excel.||
|NAS Service|A server component that executes business logic without a user interface or user interaction. NAS services in [!INCLUDE[server](../developer/includes/server.md)] support applications such as Microsoft Office Outlook Integration and the NAV Job Queue|Instead of using NAS services, we recommend that you use the Task Scheduler (see [Task Scheduler](../developer/devenv-task-scheduler.md). If you decide to use NAS, and want to read more about its configuration, see [Configuring NAS Services](/dynamics-nav/configuring-nas-services) in the Dev and IT Pro Help for [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)]|



## See Also  
 [Deployment](Deployment.md)   
 [Working with Microsoft Dynamics NAV Setup](Working-with-Microsoft-Dynamics-NAV-Setup.md)   
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)
