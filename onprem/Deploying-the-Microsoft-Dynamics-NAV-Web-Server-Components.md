---
title: Deploy the Web Server Components
description: Understand the network architecture, users, security, deployment phases for installing and configuring the Dynamics NAV Web Server Components.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Deploying the Microsoft Dynamics NAV Web and Mobile Clients

**Applies to:** [!INCLUDE[nav2018_md](includes/nav2018_md.md)]. [See [!INCLUDE[nav2017](includes/nav2017.md)] version](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components-2017.md).

Giving users the capability to access to data by using the [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)], [!INCLUDE[nav_phone](includes/nav_phone_md.md)], and Outlook add-in requires a Internet Information Services (IIS) web site as part of your deployment. The website, which we refer to as [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance, hosts the files that provide content and services to client users over the Internet. This article highlights several factors to consider to help you set up [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances that suit your deployment requirements.

If you just want to get started installing the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md).

## ASP .NET Core on IIS

[!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances run on ASP.NET Core on IIS, which in part dictates the directory structure of the instances. For more information about ASP .NET Core, see [Introduction to ASP.NET Core](https://docs.microsoft.com/aspnet/core/).

## Network Topology
The following illustration shows the component infrastructure that supports [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances on your network.  

![NAV Web Client network architecture.](media/NAV_WebClient_Network_Architecture.png "NAV\_WebClient\_Network\_Architecture")  

Each [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance must connect to a [!INCLUDE[nav_server](includes/nav_server_md.md)], which in turn connects to the database that contains the application and business data. Multiple [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances can connect to the same [!INCLUDE[nav_server](includes/nav_server_md.md)]. You can deploy these components on one computer or on separate computers. For example, you can install the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance on one computer and the [!INCLUDE[nav_server](includes/nav_server_md.md)] and SQL Server database on another computer. The topology that you choose depends on the network resources and the infrastructure of the [!INCLUDE[navnow](includes/navnow_md.md)] components. The installation and configuration process is different for each scenario.

For information about the common deployment scenarios, see [Deployment Scenarios for the Microsoft Dynamics NAV Web Server Components](Deployment-Scenarios-for-the-Microsoft-Dynamics-NAV-Web-Server-Components.md).  

##  Creating a [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance  

There are two ways to create a [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance. You can use the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup or the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] PowerShell cmdlets.

### Using [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup
[!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup is the quickest way to get a web server instance up and running, and is typically how you install the first [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance in your deployment.

-   Setup installs the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], which does the following:

    -   Installs and configure IIS with the required prerequisites, including Microsoft .NET Core - Windows Server Hosting <!--[Microsoft .NET Core - Windows Server Hosting package](https://aka.ms/dotnetcore.2.0.0-windowshosting)-->
    -   Installs a web server instance on IIS.
    -   Installs components and files in a **WebPublish** folder that enables you to add additional web server instances without having to use the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation media (DVD).

-   You can only use Setup to install a single [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance.

-   Setup does not let you choose the site deployment type for the web server instance. By default, it creates a SubSite instance. For more information, see [Site Deployment Types](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md#WebClientonIIS).    
For information about how to install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md).

### Using [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] PowerShell cmdlets
There are several PowerShell cmdlets that enable you to create, configure, and remove [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances from a command line interface. To create a web server instance, you use the [New-NAVWebServerInstance](https://docs.microsoft.com/powershell/module/microsoft.dynamics.nav.management/new-navwebserverinstance) cmdlet, which has the following advantages over Setup:

-   You can create multiple web server instances.

-   You have more flexibility regarding the [site deployment type](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md#WebClientonIIS) of the [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instances on IIS. For example, you can create a root-level website instance  or a subsite application instance under a container website.

> [!IMPORTANT]
>Using the New-NAVWebServerInstance cmdlet requires that Microsoft .NET Core Windows Server Hosting is installed and IIS is installed and configured with the prerequisites. So unless you have previously installed the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] by using Setup, you will have to install and configure the prerequisites manually. For more information about the prerequisites, see
[How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md).

For information about how to create a [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] instance by using the New-NAVWebServerInstance cmdlet, see [Creating and Managing [!INCLUDE[nav_web_server_instance_md](includes/nav_web_server_instance_md.md)] Instances Using PowerShell](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md).

## Deployment Phases  
 Typically, you will deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)] in phases, which can influence the network topology and security settings that you deploy. For example, in the development phase, you develop, test, and fine-tune the application. In this phase, you might consider deploying the [!INCLUDE[nav_web](includes/nav_web_md.md)] in a single-computer scenario. When you move to the production phase, you deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)] in the full network infrastructure.  

## Security  

### User Authentication  
 [!INCLUDE[navnow](includes/navnow_md.md)] supports four methods for authenticating users who try to access the [!INCLUDE[nav_web](includes/nav_web_md.md)]: Windows, UserName, NavUserPassword, and AccessControlService. Windows authentication is configured by default. For more information, see [Users and Credential Types](Users-and-Credential-Types.md) and [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md).  

### Service Account for [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] Database Access  
 When you install [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] database components, you must identify an Active Directory account to provide credentials for the servers. By default, [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup runs [!INCLUDE[nav_server](includes/nav_server_md.md)] and the [!INCLUDE[navnow](includes/navnow_md.md)] database under the Network Service account, a predefined local account that is used by the service control manager.  

> [!TIP]  
>  We recommend that you create and use a domain user account for running [!INCLUDE[nav_server](includes/nav_server_md.md)] and accessing the [!INCLUDE[navnow](includes/navnow_md.md)] database. The Network Service account is considered less secure because it is a shared account that can be used by other unrelated network services.  

 For more information, see [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).  

### Securing the Connection to Microsoft Dynamics NAV Web Client With SSL  
 You can help secure [!INCLUDE[navnow](includes/navnow_md.md)] data that is transmitted over the Internet by enabling Secure Sockets Layer \(SSL\) on the connection to the [!INCLUDE[nav_web](includes/nav_web_md.md)]. You can configure SSL when you install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] or after the installation.  

 For more information, see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md) and [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md).  

## See Also  
 [Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)  
 [How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md)  
 [Configuring-the-Dynamics-NAV-Web-Server-and-Client.md](Configuring-the-Microsoft-Dynamics-NAV-Web-Server-and-Client.md)  
