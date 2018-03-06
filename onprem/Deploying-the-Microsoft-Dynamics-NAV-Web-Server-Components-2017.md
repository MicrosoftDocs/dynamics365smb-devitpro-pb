---
title: "Deploying the Microsoft Dynamics NAV Web Server Components"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
ms.assetid: 9c5a0bb0-66a9-437b-b228-17b43001d579
caps.latest.revision: 24
---
# Deploying the Microsoft Dynamics NAV Web Server Components

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md).

This section contains information about the deployment of the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. It is important to understand the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] environment and consider the factors that will affect the installation and configuration, such as network architecture and infrastructure, users, security, and the deployment phase.  
  
 When you deploy the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you get both the [!INCLUDE[nav_web](includes/nav_web_md.md)] and the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)].  
  
## Network Architecture and Topology  
 The following illustration shows the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] environment.  
  
 ![NAV Web Client network architecture](media/NAV_WebClient_Network_Architecture.png "NAV\_WebClient\_Network\_Architecture")  
  
 You can deploy the components on one computer or on separate computers. For example, you can install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on one computer and the [!INCLUDE[nav_server](includes/nav_server_md.md)] and SQL Server database on another computer. The topology that you choose depends on the network resources and the infrastructure of the [!INCLUDE[navnow](includes/navnow_md.md)] components. The installation and configuration process is different for each scenario.  
  
 For information about the common deployment scenarios, see [Deployment Scenarios for the Microsoft Dynamics NAV Web Server Components](Deployment-Scenarios-for-the-Microsoft-Dynamics-NAV-Web-Server-Components.md).  
  
##  <a name="WebClientonIIS"></a> Microsoft Dynamics NAV Web Server Components Installation on IIS  
 To deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)], you install [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on a computer that is running Internet Information Services \(IIS\). For more information about how to install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and IIS, see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md) and [How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md).  
  
 When you install [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], a web server instance is added on IIS for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The web server instance consists of a virtual directory and application. The following illustration shows the structure in Internet Information Services Manager. For more information about these elements in IIS, see [IIS Manager UI](http://go.microsoft.com/fwlink/?LinkID=614897).  
  
 ![The NAV Web client structure on IIS](media/NAVWebClientIIS.png "NAVWebClientIIS")  
  
 The following table includes the default settings for each element of the website structure.  
  
 **Website**  
  
|Setting|Value|  
|-------------|-----------|  
|Name|[!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client|  
|Binding|Type: http or https \(if you configure SSL on the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]\)<br /><br /> Port: Port number you assigned the [!INCLUDE[nav_web](includes/nav_web_md.md)] \(default 8080\)|  
|Application pool|DefaultAppPool|  
|Application pool identity|ApplicationPoolIdentity|  
|Physical path|%systemroot%\\inetpub\\wwwroot\\NavWebApplicationContainer|  
|Authentication|Windows Authentication|  
  
 **Virtual directory**  
  
|Setting|Value|  
|-------------|-----------|  
|Physical path|%systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]|  
|Virtual path/Alias|/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]<br /><br /> By default, this name matches the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] connects to.|  
  
 **Web application**  
  
|Setting|Value|  
|-------------|-----------|  
|Application pool|[!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client Application Pool|  
|Application pool identity|ApplicationPoolIdentity|  
|Physical path|%systemroot%\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\\WebClient **Note:**  This folder is a symbolic link that targets the %systemroot%\\Program Files\\Microsoft Dynamics NAV\\90\\Web Client folder.|  
|Virtual path/Alias|/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient|  
|Protocol|http|  
|Authentication|Windows Authentication, Forms authentication, Anonymous Authentication, and ASP.NET Impersonation.|  
  
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
 [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)