---
title: "Deploying the Microsoft Dynamics NAV Web Server Components in a Demonstration Environment"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Deploying the Microsoft Dynamics NAV Web Server Components in a Demonstration Environment
In this scenario, you install the major components of the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] on a single computer. The scenario enables you to install [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_phone](includes/nav_phone_md.md)], and [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] in an environment where you can test its features and behavior, compare it to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], and start developing your own applications. The installation requires minimal hardware resources, preparation, and configuration.  

> [!NOTE]  
>  [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is not required to run the [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_phonet](includes/nav_phone_md.md)], and [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)]]. In this scenario, [!INCLUDE[nav_windows](includes/nav_windows_md.md)] is installed for demonstration only.  

## Installed Components and Configuration  

### Components  
 This scenario installs the following components:  

-   [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]  

-   Internet Information Services

    If IIS is already installed, then the setup will enable any required features that are not currently enabled.

-   [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  

-   [Microsoft Dynamics NAV Server](Microsoft-Dynamics-NAV-Server.md)  

-   [SQL Server Database Components](SQL-Server-Database-Components.md)  

-   [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md)  

-   [Development Environment (C/SIDE)](Development-Environment--C-SIDE-.md)  

-   [!INCLUDE[demolong](includes/demolong_md.md)], including a demo license.  

     For information about what you can do with this license, see [Properties of the Demo License](Properties-of-the-Demo-License.md).  

### Configuration  
 This scenario uses the default setting of the [!INCLUDE[navnow](includes/navnow_md.md)] Setup program, which includes the following:  

-   Windows authentication is configured for authenticating users who try to open the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

-   [!INCLUDE[nav_server](includes/nav_server_md.md)] configuration:  

    -   Service instance: [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]  

    -   Client service port: 7046  

    -   SOAP web services port: 7047  

    -   OData web services port: 7048  

-   [!INCLUDE[navnow](includes/navnow_md.md)] database components configuration:  

    -   Service instance: NAVDEMO  

    -   Database: Demo Database NAV \(11-0\)  

-   NETWORK SERVICE account is used as the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] database.  

## Installing the Microsoft Dynamics NAV Web Server Components  
 To install the [!INCLUDE[nav_web](includes/nav_web_md.md)] in this scenario, you will run [!INCLUDE[navnow](includes/navnow_md.md)] Setup two times. The first time, you will choose the **Install Demo** option, which installs the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], and the [!INCLUDE[demolong](includes/demolong_md.md)]. The second time that you run Setup, you will choose the **Web Server Components** option, which installs a website for [!INCLUDE[nav_web](includes/nav_web_md.md)] on the Internet Information Services.  

### Prepare for the [!INCLUDE[nav_web](includes/nav_web_md.md)] installation  

1.  Get access to the [!INCLUDE[navnow](includes/navnow_md.md)] installation media. For example, this could be a DVD or network drive that contains the [!INCLUDE[navnow](includes/navnow_md.md)] installation files.  

2.  Make sure that the computer meets the hardware and software requirements.  

     For more information, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  


4.  Determine which HTTP port to use for the [!INCLUDE[nav_web](includes/nav_web_md.md)] connections. 

    -   [!INCLUDE[navnow](includes/navnow_md.md)] Setup will create a website on IIS for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. During Setup, you will have to choose the port to use for the site. The default port that is used in [!INCLUDE[navnow](includes/navnow_md.md)] Setup is port 8080. If you are not sure of which port to use, then use the default port. 

    -    With most of the supported Windows operating systems, an inbound rule will automatically be added in Windows Firewall to allow communication on the port. However, if your computer is running Windows 7, 8.0, or 8.1, then you have to manually create an inbound rule. For information about see [How to: Create an Inbound Rule in Windows Firewall for the Port of Microsoft Dynamics NAV Web Client](How-to--Create-an-Inbound-Rule-in-Windows-Firewall-for-the-Port-of-Microsoft-Dynamics-NAV-Web-Client.md).  


### Run [!INCLUDE[navnow](includes/navnow_md.md)] Setup  

1.  From the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation media, run the setup.exe file to start [!INCLUDE[navnow](includes/navnow_md.md)] Setup Wizard.  

2.  On the **Welcome to [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup** page, choose the **Next** button, and then choose **I accept** to accept the license terms.  

3.  On the **Microsoft Dynamics NAV Setup** page, choose **Install Demo**.  

     The installation starts. This can take several minutes.  

4.  When the installation is complete, choose the **Close** button.  

5.  Run the setup.exe again to start the [!INCLUDE[navnow](includes/navnow_md.md)] Setup Wizard.  

6.  On the **Maintenance** page, choose **Add or remove components**.  

7.  On the **Customize the Installation** page, choose the box next to **Web Server Components**, choose **Run from My Computer**, and then choose **Next**.  

8.  On the **Specify Parameters** page, under **Web Server Components**, set the **Port** parameter to the TCP/IP port to use for the [!INCLUDE[nav_web](includes/nav_web_md.md)] connection or use the default port 8080.  

9. Set the **Install IIS prerequisites** parameter to **Install**.  

     This enables the IIS features that are required for the [!INCLUDE[nav_web](includes/nav_web_md.md)] on the computer. For more information about this parameter, see [Using Microsoft Dynamics NAV Setup to Install IIS Features](Using-Microsoft-Dynamics-NAV-Setup-to-Install-IIS-Features.md).  
10. Choose the **Apply** button to start the installation.  
  

11. When the installation is complete, choose the **Close** button.  

 The following elements of the [!INCLUDE[nav_web](includes/nav_web_md.md)] have been added to your computer:  

-   A [!INCLUDE[nav_web](includes/nav_web_md.md)] button on the **Start** menu.  

-   A web server instance for the [!INCLUDE[nav_web](includes/nav_web_md.md)] is installed on IIS. The web server instance consists of a web site that has the name **[!INCLUDE[navnowlong_md](includes/navnowlong_md.md)] Web Client**. The web site contains an application that has the name (and alias) **[!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)]**.  

    > [!NOTE]  
    >  The **[!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)]** alias matches the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that was also created.  

### Open the [!INCLUDE[nav_web](includes/nav_web_md.md)]  

-   To open the [!INCLUDE[nav_web](includes/nav_web_md.md)] from the computer where you installed [!INCLUDE[navnowlong](includes/navnowlong_md.md)], on the **Start** menu, choose **All Programs**, and then choose **[!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client**.  

-   To open the [!INCLUDE[nav_web](includes/nav_web_md.md)] from other devices on the network, open an Internet browser, and type the following URL in the address box:  

    https://ComputerName:PortNumber/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]  
    Or for [!INCLUDE[nav2017](includes/nav2017.md)]:
    
    https://ComputerName:PortNumber/dynamicsnav100/webclient

    -   Substitute **ComputerName** with the name of the computer where you installed [!INCLUDE[navnow](includes/navnow_md.md)]. If you are working on the computer where you installed [!INCLUDE[navnow](includes/navnow_md.md)], then you can use **localhost**.  

    -   Substitute **PortNumber** with the port that you configured for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] during Setup.  

        For example, if the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] is installed on port 8080, then you can use the following URL: `https://NavWeb:8080/DynamicsNAV110`. 

        For a list of supported devices and browsers, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

> [!NOTE]  
>  If you get an error and the [!INCLUDE[nav_web](includes/nav_web_md.md)] does not open, then see [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md) to try to resolve the problem.  

## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)
