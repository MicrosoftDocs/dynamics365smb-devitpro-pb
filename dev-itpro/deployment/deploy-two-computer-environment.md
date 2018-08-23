---
title: "Deploying the Microsoft Dynamics NAV Web Server Components in a Two Computer Environment"
ms.custom: na
ms.date: 09/21/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Deploying [!INCLUDE[prodsshort](../developer/includes/prodshort.md)] in a Two-Computer Topology
In this scenario, you install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] on a computer separate than [!INCLUDE[server](../developer/includes/server.md)] and the SQL Server database components.  

 ![NAV Web client installation on two computers](media/NAV_Web_Client_Install_Two_Computers.png "NAV\_Web\_Client\_Install\_Two\_Computers")  

<!--
> [!TIP]  
>  For a step-by-step example that describes how to deploy this scenario, see [Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on Two Computers](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Two-Computers.md).
--> 

## Pre-Installation Tasks  
The following table includes tasks to perform before you install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].  

|Task|[!INCLUDE[bp_tabledescription](../developer/includes/bp_tabledescription_md.md)]|For more information, see|  
|----------|---------------------------------------|-------------------------------|  
|Make sure that system requirements are met.|Verify that the computer has the required hardware and software installed.|[System Requirements](system-requirement-business-central.md)|  
|Install Internet Information Services.|When you install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] creates a website for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] on IIS. If IIS is already installed, then make sure that the required features are enabled.<br /><br/>**Note:**  Instead of installing and configuring IIS manually, you can use [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] to install IIS and enable the required features.|[Configure Internet Information Services](configure-iis.md)|  
|Determine the TCP ports for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] and SOAP/OData web services and allow communication on the port through Windows Firewall.|[!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] creates a website on IIS. During Setup, you will have to choose the port to use for the site. The default port that is used in [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] is port 8080. If you are not sure of which port to use, then use the default port.<br /><br /> If you will enable SOAP and OData web services, you will also need to specify a port for each. The default ports are 7048 and 7049.<br /><br />If you choose, [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] will automatically create an inbound rule in Windows Firewall that allows communication on the ports. Otherwise, you will have to do this manually.|[How to: Create an Inbound Rule in Windows Firewall for the Port of Microsoft Dynamics NAV Web Client](How-to--Create-an-Inbound-Rule-in-Windows-Firewall-for-the-Port-of-Microsoft-Dynamics-NAV-Web-Client.md)|  
|Set up the service account for [!INCLUDE[server](../developer/includes/server.md)] and the SQL Server database.|Optional. When you install [!INCLUDE[server](../developer/includes/server.md)], you can specify a user account that will be used to log on to the [!INCLUDE[server](../developer/includes/server.md)] instance and [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. The default service account is Network Service. If you want to use Network Service, then no action is required for this task.|[Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).|  
|Obtain and install an SSL certificate.|Optional. If you want to configure SSL on the connection to [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], then complete the following procedures:<br /><br /> -   Obtain an SSL certificate.<br />-   Import the certificate into the local computer store of the computer on which you will install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].<br />-   Obtain the certificate's thumbprint.<br /><br />**Note:**  You can also configure SSL after you have installed the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)]. For more information, see [Post-installation Tasks](deploy-two-computer-environment.md#PostInstall).|[How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)|  

## Installation Tasks  
 The following table includes tasks for installing the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].  

|Task|Description|For more information, see|  
|----------|-----------------|-------------------------------|  
|On one computer. install [!INCLUDE[server](../developer/includes/server.md)] and SQL Server Database Components on one computer|Run the [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] setup.exe file, choose **Advanced installation options** > **Choose an installation option** > **Custom**, and then choose the **Server** and **SQL Server Database Components** options.|[How to: Run Setup](How-to--Run-Setup.md)|  
|On the other computer, install the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)].|Run [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)], choose **Advanced installation options** > **Choose an installation option** > **Custom**, and then the **Web Server Components** option.|[How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)|  
|Configure delegation from the web server to [!INCLUDE[server](../developer/includes/server.md)].|Because [!INCLUDE[server](../developer/includes/server.md)] is running on a different computer than the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)], you must configure the computer that is running [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] to delegate its access to [!INCLUDE[server](../developer/includes/server.md)] on behalf of the device trying to access from the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].|[How to: Configure Delegation for Microsoft Dynamics NAV Web Client](How-to--Configure-Delegation-for-Microsoft-Dynamics-NAV-Web-Client.md)|  

##  <a name="PostInstall"></a> Post-installation Tasks  
 The following table includes tasks to configure the [!INCLUDE[webservercomponents](../developer/includes/webservercomponents.md)] after installation. These tasks are optional depending on your organizational and network requirements.  

|Task|Description|For more information, see|  
|----------|-----------------|-------------------------------|  
|Change the user authentication method.|The [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] supports the same authentication methods as the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], which include Windows, UserName, NavUserPassword, and AccessControlService. By default, the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] uses Windows authentication.|[How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md)|  
|Secure the connection to the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] with SSL.|You can help secure [!INCLUDE[prodshort](../developer/includes/prodshort.md)] data that is transmitted over the Internet by enabling Secure Sockets Layer \(SSL\) on the connection to the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)].|[How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)|  
|Change the user authentication method.|The [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] supports the same authentication methods as the [!INCLUDE[nav_windows](../developer/includes/nav_windows_md.md)], which include Windows, UserName, NavUserPassword, and AccessControlService. By default, the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] uses Windows authentication.|[How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md)|  
|Set up multiple [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] applications on a website.|You can set up multiple web server instances for the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] on the existing website. The web server instances will use the same address \(URL\) except with an alias that specifies the specific application.|[Creating and Managing [!INCLUDE[nav_web_server_instance_md](../developer/includes/nav_web_server_instance_md.md)] Instances Using PowerShell](How-to--Set-Up-Multiple-Web-Server-Instances-for-the-Microsoft-Dynamics-NAV-Web-Client.md)|  
|Configure web browsers on devices.|The [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)] supports several different web browsers. To access the [!INCLUDE[nav_web](../developer/includes/nav_web_md.md)], the web browser must be enabled on a device with cookies and JavaScript.|[Configuring the Web Browser for the Microsoft Dynamics NAV Web Client](Configuring-the-Web-Browser-for-the-Microsoft-Dynamics-NAV-Web-Client.md)|  

## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components in a Single Computer Environment](deploy-single-computer-environment.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components in a Three Computer Environment](deploy-three-computer-environment.md)
