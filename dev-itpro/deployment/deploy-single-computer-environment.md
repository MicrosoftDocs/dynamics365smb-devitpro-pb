---
title: "Deploying the Microsoft Dynamics NAV Web Server Components in a Single Computer Environment"
ms.custom: na
ms.date: 09/21/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Deploying [!INCLUDE[prodshort](../developer/includes/prodshort.md)] in a Single-Computer Topology
In this scenario, you install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], [!INCLUDE[server](../developer/includes/server.md)], and the SQL Server database components on the same computer.  

 ![NAV Web Client installation on one computer](media/Nav_Web_Client_Install_Single_Computer.png "Nav\_Web\_Client\_Install\_Single\_Computer")  

> [!TIP]  
>  For a step-by-step example that describes how to deploy this scenario, see [Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on a Single Computer](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-a-Single-Computer.md).  

## Pre-Installation Tasks  
The following table includes tasks to perform before you install.  

|Task|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|For more information, see|  
|----------|---------------------------------------|-------------------------------|  
|Make sure that system requirements are met.|Verify that the computer has the required hardware and software installed.|[System Requirements](system-requirement-business-central.md)|  
|Install Internet Information Services.|When you install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] creates a website for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] on IIS. If IIS is already installed, then make sure that the required features are enabled.<br /><br/>**Note:**  Instead of installing and configuring IIS manually, you can use [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] to install IIS and enable the required features.|[Configure Internet Information Services](configure-iis.md)|  
|Determine the TCP ports for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] and SOAP/OData web services and allow communication on the port through Windows Firewall.|[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] creates a website on IIS. During Setup, you will have to choose the port to use for the site. The default port that is used in [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] is port 8080. If you are not sure of which port to use, then use the default port.<br /><br /> If you will enable SOAP and OData web services, you will also need to specify a port for each. The default ports are 7048 and 7049.<br /><br />If you choose, [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] will automatically create an inbound rule in Windows Firewall that allows communication on the ports. Otherwise, you will have to do this manually.|[How to: Create an Inbound Rule in Windows Firewall for the Port of Microsoft Dynamics NAV Web Client](How-to--Create-an-Inbound-Rule-in-Windows-Firewall-for-the-Port-of-Microsoft-Dynamics-NAV-Web-Client.md)| 
|Set up the service account for [!INCLUDE[server](../developer/includes/server.md)] and the SQL Server database.|Optional. When you install [!INCLUDE[server](../developer/includes/server.md)], you can specify a user account that will be used to log on to the [!INCLUDE[server](../developer/includes/server.md)] instance and [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. The default service account is Network Service. If you want to use Network Service, then no action is required for this task.|[Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).|  
|Obtain and install an SSL certificate.|Optional. If you want to configure SSL on the connection to [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], then complete the following procedures:<br /><br /> -   Obtain an SSL certificate.<br />-   Import the certificate into the local computer store of the computer on which you will install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].<br />-   Obtain the certificate's thumbprint.<br /><br />**Note:**  You can also configure SSL after you have installed the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. For more information, see [Post-installation Tasks](deploy-single-computer-environment.md#PostInstall).|[How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)|  

## Installation Tasks
The following table includes tasks for installing the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] components.  

|Task|Description|For more information, see|  
|----------|-----------------|-------------------------------|  
|Install [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], [!INCLUDE[server](../developer/includes/server.md)], and SQL Server database components.|Run the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] setup.exe file, choose the **Advanced installation options** > **Choose an installation option** > **Custom**, and then choose the **Server**,  **SQL Server Database Components**, **Server**, and **Web Server Components** options.|[How to: Run Setup](How-to--Run-Setup.md)<br /><br /> [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)|  

##  <a name="PostInstall"></a> Post-installation Tasks  
The following table includes tasks that configure the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] after installation. These tasks are optional depending on your organizational and network requirements.  

|Task|Description|For more information, see|  
|----------|-----------------|-------------------------------|  
|Change the user authentication method.|The [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] supports the same authentication methods as the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], which include Windows, UserName, NavUserPassword, and AccessControlService. By default, Windows authentication is used.|[How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md)|  
|Secure the connection to the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] with SSL.|You can help secure [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data that is transmitted over the Internet by enabling Secure Sockets Layer \(SSL\) on the connection to the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].|[How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)|  
|Change the configuration of the [!INCLUDE[nav_web_server_instance](../developer/includes/nav_web_server_instance_md.md)].|There are several parameters in the [!INCLUDE[web_server_settings_file_md](../developer/includes/web_server_settings_file_md.md)] for the [!INCLUDE[nav_web_server_instance](../developer/includes/nav_web_server_instance_md.md)] that you can modify to change the behavior of the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. Some of the more common parameters include the [!INCLUDE[server](../developer/includes/server.md)] instance, company, language, time zone, regional settings, session time out, and online Help URL.|[Configuring Dynamics NAV Web Client by Modifying the Navsettings.json File](Configuring-Microsoft-Dynamics-NAV-Web-Client-by-Modifying-the-Web.config-File.md)|  
|Set up multiple [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] applications.|You can set up multiple web server instances for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] on the existing website. The web server instances will use the same address \(URL\) except with an alias that specifies the specific application.|[Creating and Managing [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] Instances Using PowerShell](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md)|  
|Configure web browsers on devices.|The [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] supports several different web browsers. To access the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], the web browser must be enabled on a device with cookies and JavaScript.|[Configuring the Web Browser for the Microsoft Dynamics NAV Web Client](Configuring-the-Web-Browser-for-the-Microsoft-Dynamics-NAV-Web-Client.md)|  

## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components in a Two Computer Environment](deploy-two-computer-environment.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components in a Three Computer Environment](deploy-three-computer-environment.md)
