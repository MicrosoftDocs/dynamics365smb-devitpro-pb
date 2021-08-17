---
title: "Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on a Single Computer"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on a Single Computer
In this walkthrough, you will install the tiers of [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] in a production environment on one computer.  

 ![NAV Web Client installation on one computer.](media/Nav_Web_Client_Install_Single_Computer.png "Nav\_Web\_Client\_Install\_Single\_Computer")  

## About This Walkthrough  
 After completing this walkthrough, you will have a functioning four-tier installation on one computer. The installation uses the [!INCLUDE[demolong](includes/demolong_md.md)], which contains the [!INCLUDE[demoname](includes/demoname_md.md)] company. Windows authentication is used for authenticating users who try to access the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

 This walkthrough illustrates the following tasks:  

-   Using a domain user account as the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)] and the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

-   [Installing the Microsoft Dynamics NAV Database Components and Microsoft Dynamics NAV Server](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Two-Computers.md#InstallDatabase)  

-   [Allowing Inbound Communication on the Microsoft Dynamics NAV Web Client Port Through the Windows Firewall](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Three-Computers.md#Firewall)  

-   [Opening the Microsoft Dynamics NAV Web client](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-a-Single-Computer.md#Opening) 

The [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] require a supported version of Internet Information Services (IIS). This walkthrough uses [!INCLUDE[navnow](includes/navnow_md.md)] Setup to automaticaally install and configure IIS for you. If you want to do this manually, see [How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md).  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation media. For example, this could be a DVD or network drive that contains the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation files.  

-   A computer that is installed with the following software:  

    -   A supported operating system. For more information, see [System Requirements for [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]](System-Requirements-for-Microsoft-Dynamics-NAV.md#WebServer).  

    -   A supported version of Microsoft SQL Server. For more information, see [System Requirements for Microsoft Dynamics NAV Database](System-Requirements-for-Microsoft-Dynamics-NAV.md#SQLReq)  

         If a supported SQL Server product is not already installed on the target computer, then [!INCLUDE[navnow](includes/navnow_md.md)] Setup automatically installs a 64-bit edition of SQL Server Express.  

         For more information, see [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md).  

-   A device with a network connection and a supported web browser.  

     For a list of supported browsers, see [System Requirements for [!INCLUDE[nav_web_md](includes/nav_web_md.md)]](System-Requirements-for-Microsoft-Dynamics-NAV.md#WebClient).  

-   Optionally, a domain user account for accessing [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] database on the Microsoft SQL Server. The user account must have the following permissions:  

    -   Permission to log on as a service on the computer where you will install [!INCLUDE[nav_server](includes/nav_server_md.md)] and the computer that is running SQL Server.  

    -   Permission to register Service Principal Names \(SPNs\) on itself.  

     For information about how to create a domain user account, see [Create a New User Account](https://go.microsoft.com/fwlink/?LinkId=213723). For information about how to enable permission to log on as a service and register SPNs, see [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).  

    > [!NOTE]  
    >  By default, [!INCLUDE[navnow](includes/navnow_md.md)] Setup uses NETWORK SERVICE as the service account. You can use NETWORK SERVICE instead of a domain user account, but this is considered less secure. If you want to use NETWORK SERVICE, then you do not need this prerequisite.  

## Story  
 Viktor is a Microsoft Certified Partner working for [!INCLUDE[demoname](includes/demoname_md.md)] He has been tasked with deploying [!INCLUDE[nav_web](includes/nav_web_md.md)] for a customer. To meet the customer's requirements, Viktor has decided to deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)] as follows:  

-   Install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], [!INCLUDE[nav_server](includes/nav_server_md.md)], and SQL server with [!INCLUDE[navnow](includes/navnow_md.md)] database components on one computer.  

-   Install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on HTTP port 8080.  

-   Use a domain user account instead of the Network Service account as the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)].  

-   Use Windows Authentication to authenticate users.  

##  <a name="InstallDatabase"></a> Installing the Microsoft Dynamics NAV Components  
 In this procedure, you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup to install the SQL Server Database components for [!INCLUDE[navnow](includes/navnow_md.md)], including the [!INCLUDE[demolong](includes/demolong_md.md)], [!INCLUDE[nav_server](includes/nav_server_md.md)], and the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. During setup, you will assign the domain user account as the service account for the database.  

> [!NOTE]  
>  You can also use this procedure to connect to an existing [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] database.  

#### To install the [!INCLUDE[navnow](includes/navnow_md.md)] components  

1.  From the [!INCLUDE[navnow](includes/navnow_md.md)] installation media, run the setup.exe file to start the [!INCLUDE[navnow](includes/navnow_md.md)] Setup Wizard.  

2.  On the **Welcome to [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup** page, choose the **Next** button.  

3.  To accept the license terms, choose **I accept**.  

4.  On the **Microsoft Dynamics NAV Setup** page, choose **Choose an installation option**.  

5.  On the **Choose an Installation Option** page, choose **Custom**.  

6.  On the **Customize the installation** page, to install the [!INCLUDE[navnow](includes/navnow_md.md)] database, select the **SQL Server Database Components** box, and then select **Run from My Computer** or **Run all from my computer**.  

     If you choose **Run all from my computer**, Setup installs the [!INCLUDE[demolong](includes/demolong_md.md)].  

7.  To install the [!INCLUDE[nav_server](includes/nav_server_md.md)], select the **Server** box, and then choose **Run from My Computer**.  

8.  To install the [!INCLUDE[nav_web](includes/nav_web_md.md)], select the **Web Server Components** box, and then choose **Run from My Computer**.  

9. Choose **Next** to open to the **Specify Parameters** page.  

10. In the **Server** section, set the **Server account** field to the domain user account that you created for access to the [!INCLUDE[nav_server](includes/nav_server_md.md)], and in the **Service Account Password** field, type the password for the user account.  

11. In the **SQL Server Database Components** section, in the **SQL Database** field, type a name for the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

     For this walkthrough, type **Demo Database NAV \(11-0\).**  

12. In the **Web Server Components** section, set the **Port** field to **8080**.  

13. Set the **Install IIS prerequisites** parameter to **Install**.  

     This enables the IIS features that are required for the [!INCLUDE[nav_web](includes/nav_web_md.md)] on the computer. For more information about this parameter, see [Using Microsoft Dynamics NAV Setup to Install IIS Features](Using-Microsoft-Dynamics-NAV-Setup-to-Install-IIS-Features.md).  
14. Choose **Apply** to complete the installation.  

15. When Setup is complete, choose the **Close** button.  

 A website that has the name [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client has been installed on IIS. The website uses port 8080. A website that has the name [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client has been installed on IIS. The website includes a web server instance for [!INCLUDE[nav_web](includes/nav_web_md.md)] that has the name [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]. The default physical path of the web server instance is C:\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\\.  

##  <a name="Firewall"></a> Allowing Inbound Communication on the Port Through the Windows Firewall (Windows 8.0 and 8.1 only)  
 Viktor installed the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on a computer running Windows 8.0. Port 8080 is typically blocked by Windows Firewall. To allow communication to the port from client devices, he must create an inbound rule on the port 8080 in the Windows Firewall setup. 

#### To create an inbound rule on the port that is used by [!INCLUDE[nav_web](includes/nav_web_md.md)]  

1.  On the **Start** menu, choose **Control Panel**, choose **System and Security**, and then choose **Windows Firewall**.  

2.  In the navigation pane, choose **Advanced settings**.  

3.  In the **Windows Firewall with Advanced Settings** window, in the navigation pane, choose **Inbound Rules**, and then in the Actions pane, choose **New Rule**.  

4.  On the **Rule Type** page, choose **Port**, and then choose **Next**.  

5.  On the **Protocol and Ports** page, choose **Specific local ports**, and then type the port number in the box. For example, type 8080 for the default port of the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

6.  Choose **Next**.  

7.  On the **Action** page, choose **Allow the connection**, and then choose **Next**.  

8.  On the **Profile** page, choose the profiles, and then choose **Next**.  

9. On the **Name** page, type a name for the rule, and then choose **Finish**.  

##  <a name="Opening"></a> Opening the [!INCLUDE[nav_web](includes/nav_web_md.md)]  
 You can open the [!INCLUDE[nav_web](includes/nav_web_md.md)] from any device with a supported web browser.  

#### To open the [!INCLUDE[nav_web](includes/nav_web_md.md)]  

1.  Open the web browser.  

2.  In the address box, type the following URL:  

     **https://ComputerName:PortNumber/[!INCLUDE[nav_server_instance_md](includes/nav_server_instance_md.md)]**  

    Or for [!INCLUDE[nav2017](includes/nav2017.md)]:
    
    **https://ComputerName:PortNumber/dynamicsnav100/webclient**

    -   Substitute **ComputerName** with the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. If you are working on the computer where you installed [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], then you can use **localhost**.  

    -   Substitute **PortNumber** with the port that you configured for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] during Setup.  

    -   Substitute [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)] with the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that you configured during Setup. [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)] is the default value.  

     For example, if the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] is installed on port 8080 and the computer has the name NavWeb, then you can use the following URL:  

     **https://NavWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]** 

     or:
    
    **https://NavWeb:8080//dynamicsnav100/webclient**

### Troubleshooting  
 If you are cannot connect the [!INCLUDE[nav_web](includes/nav_web_md.md)] or you are experiencing problems, see [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md).  

## Next Steps  
 The following is a list of typical tasks to perform after you install [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

-   Upload your license. For more information, see [How to: Upload the License File](How-to--Upload-the-License-File.md).  

-   Create users and integrate them into the [!INCLUDE[navnow](includes/navnow_md.md)] security system. For more information, see [Managing Users](Managing-Users.md).  

## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components in a Three Computer Environment](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components-in-a-Three-Computer-Environment.md)   
 [Microsoft Dynamics NAV Web Client Network Architecture](Microsoft-Dynamics-NAV-Web-Client-Network-Architecture.md)   
 [Walkthrough: Installing the Microsoft Dynamics NAV Web Client Tiers on One Computer](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-a-Single-Computer.md)   
 [Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on Two Computers](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Two-Computers.md)   
 [Configuring Microsoft SQL Server](Configuring-Microsoft-SQL-Server.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)
