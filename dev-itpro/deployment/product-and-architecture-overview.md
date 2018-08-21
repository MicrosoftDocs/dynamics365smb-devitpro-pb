---
title: Product Architecture
description: In Microsoft Dynamics NAV, the architecture comprises of three core components, and various additional tools and components.
ms.custom: na
ms.date: 10/17/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 275aad2c-ea2c-4291-8381-82b0b92dc1a0
caps.latest.revision: 29
manager: edupont
---
# [!INCLUDE[prodshort](../developer/includes/prodshort.md)] Component and Sytem Topology

The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] deployment comprises three core components for serving the application to users, plus various tools and components for managing, developing, extending, and testing the application.

Use [!INCLUDE[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] Setup to install all components.  

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

<!--
1.  The [!INCLUDE[rtc](../developer/includes/rtc_md.md)] is the *client tier*, which includes a [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)] and a [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].  

     In addition to the [!INCLUDE[rtc](../developer/includes/rtc_md.md)], [!INCLUDE[prodshort](../developer/includes/prodshort.md)] also supports additional client types, including web service clients and a NAS services client for programmatic access. For details on the various client types, see [Client Types](Client-Types.md).  

2.  [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] is the *middle or server tier*, managing all business logic and communication.  

3.  SQL Server, augmented by [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database components, is the *data tier*.  

     If you deploy [!INCLUDE[navnow](../developer/includes/navnow_md.md)] in a multitenant deployment architecture, the data tier consists of an application database and one or more tenant databases.  
-->
<!-- 
> [!IMPORTANT]  
>  When you install [!INCLUDE[prodshort](../developer/includes/prodshort.md)], all components must be from the same version and build of [!INCLUDE[navnow](../developer/includes/navnow_md.md)] for the software to run correctly.

You can have multiple instances of any of the core components in a production environment. The following diagram shows a simple installation with two [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)]s and a [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] connecting to a single [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] computer, which in turn connects to a computer with SQL Server and the [!INCLUDE[navnow](../developer/includes/navnow_md.md)] database components.  

 ![The RoleTailored architecture.](media/NAV_RoleTailoredArchitecture.png "NAV\_RoleTailoredArchitecture")  

 Some common configurations are:  

-   All three components on the same computer. This is the configuration for a demo install, and is also typical for a development environment, so that a developer can work on [!INCLUDE[navnow](../developer/includes/navnow_md.md)] applications without worrying about network connections and inter-component security. See [Walkthrough: Installing the Demo Version](Walkthrough--Installing-the-Demo-Version.md).  

-   [!INCLUDE[rtc](../developer/includes/rtc_md.md)] and [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] on the same computer, data tier on a separate computer. This scenario is described in [Walkthrough: Installing the Three Tiers On Two Computers](Walkthrough--Installing-the-Three-Tiers-On-Two-Computers.md).  

-   Each of the three tiers on a separate computer. This scenario is described in [Walkthrough: Installing the Three Tiers on Three Computers](Walkthrough--Installing-the-Three-Tiers-on-Three-Computers.md).  

## Additional Components  
 In addition to the three core components, there are additional components that enhance or supplement the core components.  

|Component|Purpose|  
|---------------|-------------|  
|[Microsoft Dynamics NAV Help Server](Microsoft-Dynamics-NAV-Help-Server.md)|A website with the Help content for [!INCLUDE[navnow](../developer/includes/navnow_md.md)] in the languages that your version of [!INCLUDE[navnow](../developer/includes/navnow_md.md)] includes. You can deploy a single Help Server for all users, or customer-specific Help Servers, depending on your requirements.|  
|Web Server Components. See [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md).|The components that are needed to enable [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]s to connect with a browser.|  
|[Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)|A tool for configuring and managing [!INCLUDE[nav_server](../developer/includes/nav_server_md.md)] and [!INCLUDE[navnow](../developer/includes/navnow_md.md)] sites.|  
|[Development Environment (C/SIDE)](Development-Environment--C-SIDE-.md)|The Development Environment for creating and modifying [!INCLUDE[navnow](../developer/includes/navnow_md.md)] applications in C/AL.|  
|[Microsoft Office Outlook Add-In](Microsoft-Office-Outlook-Add-In.md)|A component for synchronizing data, such as to-dos, contacts, and tasks, between [!INCLUDE[navnow](../developer/includes/navnow_md.md)] and Outlook.|  
|[Automated Data Capture System](Automated-Data-Capture-System.md)|A [!INCLUDE[navnow](../developer/includes/navnow_md.md)] tool for accurately capturing data for inbound, outbound, and internal documents, primarily in connection with warehouse activities. With ADCS, company employees use handheld devices and radio frequency technology to continuously validate warehouse inventories.|  
|ClickOnce Installer Tools. See [Deploying Microsoft Dynamics NAV Using ClickOnce](Deploying-Microsoft-Dynamics-NAV-Using-ClickOnce.md).|A set of tools designed to create ClickOnce deployments for applications for the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)].| 

--> 

## See Also  
 [Deployment](Deployment.md)   
 [Working with Microsoft Dynamics NAV Setup](Working-with-Microsoft-Dynamics-NAV-Setup.md)   
 [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md)
