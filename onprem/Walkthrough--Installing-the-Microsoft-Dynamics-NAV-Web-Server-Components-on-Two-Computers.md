---
title: "Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on Two Computers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on Two Computers
In this walkthrough, you will install the tiers of the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] in a production environment, where the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] is on one computer and [!INCLUDE[nav_server](includes/nav_server_md.md)] and Microsoft SQL Server with [!INCLUDE[navnow](includes/navnow_md.md)] database components are on another computer.  

 ![NAV Web client install on two computers.](media/NAV_WebClient_Walkthrough_TwoComputers.png "NAV\_WebClient\_Walkthrough\_TwoComputers")  

 The following table describes the components in this scenario.  

|Computer|Installed operating system and software|  
|--------------|---------------------------------------------|  
|**NAVSRV-SQL**|A supported operating system with the 64-bit edition of a supported version of SQL Server installed.<br /><br /> You will install [!INCLUDE[navnow](includes/navnow_md.md)] database components and [!INCLUDE[nav_server](includes/nav_server_md.md)] on this computer. **Note:**  If a supported SQL Server product is not already installed on the target computer, then [!INCLUDE[navnow](includes/navnow_md.md)] Setup automatically installs a 64-bit edition of SQL Server Express edition.|  
|**NAVWEB**|A supported operating system.<br /><br /> Supported version of Internet Information Services (IIS). **Note:**  [!INCLUDE[navnow](includes/navnow_md.md)] Setup can automatically enable IIS and the IIS features that are required for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. <br /><br /> You will install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on this computer.|  
|**DEVICE**|A device with an Internet connection and a web browser.|  

> [!NOTE]  
>  For a complete list of supported hardware and software, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

 The key characteristic of this walkthrough is that the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and [!INCLUDE[nav_server](includes/nav_server_md.md)] are installed on separate computers. Because of the multiple computers involved when a device tries to access the [!INCLUDE[nav_web](includes/nav_web_md.md)] over the Internet to manage [!INCLUDE[navnow](includes/navnow_md.md)] data, additional configuration is required to set up this environment compared to an environment where all components are on a single computer.  

## About This Walkthrough  
 After completing this walkthrough, you will have a functioning four-tier installation on two computers. The installation uses the [!INCLUDE[demolong](includes/demolong_md.md)], which contains the [!INCLUDE[demoname](includes/demoname_md.md)] company. Windows authentication is used for authenticating users who try to access the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

 This walkthrough illustrates the following tasks:  

-   Using a domain user account as the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)] and the [!INCLUDE[navnow](includes/navnow_md.md)] database.  

-   [Installing the Microsoft Dynamics NAV Database Components and Microsoft Dynamics NAV Server](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Two-Computers.md#InstallDatabase)  

-   [Installing the Microsoft Dynamics NAV Web Server Components](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Three-Computers.md#InstallWeb)  

-   [Configuring Constrained Delegation from the Microsoft Dynamics NAV Web Client to Microsoft Dynamics NAV Server](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Three-Computers.md#Delegation)  

-   [Allowing Inbound Communication on the Microsoft Dynamics NAV Web Client Port Through the Windows Firewall](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Three-Computers.md#Firewall)  

-   [Opening the Microsoft Dynamics NAV Web client](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Three-Computers.md#Opening)  

### Prerequisites  
 To complete this walkthrough, you will need:  

-   [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation media. For example, this can be a DVD or a network drive that contains the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation files.  

-   Two computers that are configured as described in the introduction.  

     On the **NAVWEB** computer, you must enable IIS with the required features for the [!INCLUDE[nav_web](includes/nav_web_md.md)]. For instructions about how to install Internet Information Services, see [How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md).  

    > [!NOTE]  
    >  Instead of installing and configuring IIS manually, you can use [!INCLUDE[navnow](includes/navnow_md.md)] Setup to install IIS and enable the required features, as described in this walkthrough.  

-   A domain user account for accessing [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] database on the Microsoft SQL Server. The user account must have the following permissions:  

    -   Permission to log on as a service on the computer where you will install [!INCLUDE[nav_server](includes/nav_server_md.md)] and the computer that is running SQL Server.  

    -   Permission to register Service Principal Names \(SPNs\) on itself.  

         If the user account does not have this permission, then you must register SPNs for the account manually.  

     For information about how to create a domain user account, see [Create a New User Account](https://go.microsoft.com/fwlink/?LinkId=213723) in the TechNet Library. For information about how to enable permission to log on as a service and register SPNs, see [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md)  

    > [!NOTE]  
    >  By default, [!INCLUDE[navnow](includes/navnow_md.md)] Setup uses NETWORK SERVICE as the service account. You can use NETWORK SERVICE instead of a domain user account, but this is considered less secure. If you want to use NETWORK SERVICE, then you do not need this prerequisite.  

## Story  
 Viktor is a Microsoft Certified Partner working for [!INCLUDE[demoname](includes/demoname_md.md)] He has been tasked with deploying [!INCLUDE[nav_web](includes/nav_web_md.md)] for a customer. Viktor is a Microsoft Certified Partner working for CRONUS International Ltd. He has been tasked with deploying [!INCLUDE[nav_web](includes/nav_web_md.md)] for customer. To meet the customer's requirements, Viktor has decided to deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)] as follows:  

-   Install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on one computer, and install [!INCLUDE[nav_server](includes/nav_server_md.md)] and SQL server with [!INCLUDE[navnow](includes/navnow_md.md)] database components on another computer.  

-   Install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on HTTP port 8080.  

-   Use a domain user account instead of the Network Service account as the service account for [!INCLUDE[nav_server](includes/nav_server_md.md)].  

-   Use Windows Authentication to authenticate users.  

##  <a name="InstallDatabase"></a> Installing the Microsoft Dynamics NAV Database Components and Microsoft Dynamics NAV Server  
 In this procedure, you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup to install the SQL Server Database components for [!INCLUDE[navnow](includes/navnow_md.md)], including the [!INCLUDE[demolong](includes/demolong_md.md)], and [!INCLUDE[nav_server](includes/nav_server_md.md)]. During setup, you will assign the domain user account as the service account for the database.  

> [!NOTE]  
>  If you already have an existing [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] database that you want to use for the [!INCLUDE[nav_web](includes/nav_web_md.md)], you can skip this procedure.  

#### To install the [!INCLUDE[navnow](includes/navnow_md.md)] database components and [!INCLUDE[nav_server](includes/nav_server_md.md)]  

1.  On the **NAVSRV-SQL** computer, access the [!INCLUDE[navnow](includes/navnow_md.md)] installation media.  

2.  Run the setup.exe file to start the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard.  

3.  On the **Welcome to [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup** page, choose the **Next** button.  

4.  To accept the license terms, choose **I accept**.  

5.  On the **Microsoft Dynamics NAV Setup** page, choose **Choose an installation option**.  

6.  On the **Choose an installation option** page, under the **Server** option, choose **Customize**.  

7.  On the **Customize the installation** page, select **SQL Server Database Components**, and then select **Run all from my computer**.  

     This specifies that you want to install this component and all subcomponents. In this case, there is a single subcomponent, which is the [!INCLUDE[demolong](includes/demolong_md.md)].  

    > [!NOTE]  
    >  The **Server** option, which installs [!INCLUDE[nav_server](includes/nav_server_md.md)], is automatically chosen.  

8.  Choose the **Next** button to proceed to the **Specify parameters** page.  

     The **Specify parameters** page contains many parameters that you can configure, but default parameters are provided for all except **Server Account** and **SQL Server**.  

9. Set the **Server account** to the domain user account that you created for the [!INCLUDE[navnow](includes/navnow_md.md)] database and [!INCLUDE[nav_server](includes/nav_server_md.md)].  

10. In the **SQL Server** box, type **localhost** to specify the computer that you are working on.  

11. If you have an existing database for [!INCLUDE[navnow](includes/navnow_md.md)] on the computer, and you want to replace it with the [!INCLUDE[demolong](includes/demolong_md.md)], then set the **Replace Existing Database** box to **Yes**.  

12. Choose the **Apply** button.  

     Setup installs the components.  

13. After the installation is complete, choose the **Close** button.  

##  <a name="InstallWeb"></a> Installing the Microsoft Dynamics NAV Web Server Components  
 In this procedure, you use [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup to install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on the **NAVWEB** computer.  

#### To install [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] by using Setup  

1.  On the **NAVWEB** computer, access the [!INCLUDE[navnow](includes/navnow_md.md)] installation media.  

2.  Run the setup.exe file to start the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard.  

3.  Choose the **Next** button.  

4.  To accept the license terms, choose **I accept**.  

5.  On the **Microsoft Dynamics NAV Setup** page, choose **Choose an installation option**.  

6.  On the **Choose an Installation Option** page, choose **Custom**.  

7.  On the **Customize the Installation** page, select **NAV Web Server Components**, and then choose **Run from My Computer**.  

8.  Choose the **Next** button to go to the **Specify Parameters** page.  

9. On the **Specify parameters** page, in the **Server Name** box, type the name of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], in this case, NAVSRV.  

10. In the **Web Server Components** section, set the **Port** field to **8080**.  

11. Set the **Install IIS prerequisites** parameter to **Install**.  

     This enables the IIS features that are required for the [!INCLUDE[nav_web](includes/nav_web_md.md)] on the computer. For more information about this parameter, see [Using Microsoft Dynamics NAV Setup to Install IIS Features](Using-Microsoft-Dynamics-NAV-Setup-to-Install-IIS-Features.md).  

12. Choose the **Apply** button to complete the installation.  

13. When Setup is finished, choose the **Close** button.  

 A website that has the name [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client has been installed on IIS. The website uses port 8080. A website that has the name [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client has been installed on IIS. The website includes a web server instance for [!INCLUDE[nav_web](includes/nav_web_md.md)] that has the name [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]. The default physical path of the web server instance is C:\\inetpub\\wwwroot\\[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]\\.  

##  <a name="Delegation"></a> Configuring Constrained Delegation from the Microsoft Dynamics NAV Web Client to Microsoft Dynamics NAV Server  
 When the client device, [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], and [!INCLUDE[nav_server](includes/nav_server_md.md)] are on separate computers, the client device interacts with [!INCLUDE[nav_server](includes/nav_server_md.md)] through the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. The computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] is performing actions on the client device's behalf. This process is known as *impersonation*. Impersonation cannot be used across multiple computers, so you must set up delegation from the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] to [!INCLUDE[nav_server](includes/nav_server_md.md)].  

 To configure delegation, you must perform two tasks. First, you delegate access from the computer that is running [!INCLUDE[nav_web](includes/nav_web_md.md)] to the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)]. Second, you configure the kernel mode authentication for the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

### Delegating Access from the Web Server to [!INCLUDE[nav_server](includes/nav_server_md.md)]  
 Configuring delegation means explicitly configuring the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] \(NAVWEB\) to delegate its access to the [!INCLUDE[nav_server](includes/nav_server_md.md)] \(NAVSRV-SQL\) on behalf of the device \(DEVICE\) that is trying to connect to [!INCLUDE[navnow](includes/navnow_md.md)]. To make the access more secure, you specify delegation to a specific service on a specific server. This is known as *constrained delegation*.  

> [!NOTE]  
>  You must run the following procedure on a domain controller computer or a computer that is installed with Active Directory Domain Services tools.  

##### To delegate access to [!INCLUDE[nav_server](includes/nav_server_md.md)]  

1.  On the domain controller computer for your network, or a computer that is installed with Active Directory Domain Services tools, choose **Start**, and then choose **Run**.  

2.  In the **Open** field, type **dsa.msc**.  

     This opens the  **Active Directory Users and Computers** utility.  

3.  Expand the node for the domain where you have installed the [!INCLUDE[navnow](includes/navnow_md.md)] environment. For this example, the domain in the walkthrough is **Corp**.  

4.  Select the **Computers** node, right-click the **NAVWEB** computer, and then choose **Properties**.  

5.  On the **Delegation** tab, choose **Trust this user for delegation to specified services only**, and then choose **Use Kerberos only**.  

6.  You must add the following service entries for the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], which in this walkthrough is **NAVSRV-SQL**.  

    |Service type|User or computer|Port|  
    |------------------|----------------------|----------|  
    |DynamicsNAV|NAVSRV-SQL|7046|  
    |DynamicsNAV|NAVSRV-SQL.corp|7046|  
    |HOST|NAVSRV-SQL||  
    |HOST|NAVSRV-SQL.corp||  

7.  To add the services, select **Expanded**, and then choose **Add**.  

8.  In the **Add Services** window, choose **Users or Computers**.  

9. In the **Enter the object names to select** box, type the name of the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)], in this case NAVSRV-SQL, and then choose the **OK** button.  

10. In the list of available services, press and hold the Ctrl key, select **DynamicsNAV** for port 7046 and **HOST**, and then choose the **OK** button.  

11. Choose the **OK** button to close the dialog box.  

### Configuring Kernel Mode Authentication  
 By default, Windows authentication in IIS is set to use kernel mode authentication. Kernel-mode authentication improves authentication performance. However, when you use delegation with Kerberos, you must either disable kernel mode or configure it to use the credentials of the application pool of [!INCLUDE[nav_web](includes/nav_web_md.md)]. Otherwise, authentication will fail and [!INCLUDE[nav_web](includes/nav_web_md.md)] will not be able to connect to [!INCLUDE[nav_server](includes/nav_server_md.md)]. This is because kernel mode authentication runs under the computer account of the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], while the [!INCLUDE[nav_web](includes/nav_web_md.md)] runs under the user account of the user trying to access [!INCLUDE[navnow](includes/navnow_md.md)].  

 As a best practice, you should configure kernel mode authentication to use the application pool credentials as described in this walkthrough.  

##### To configure kernel mode authentication to use the application pool credentials  

1.  On the NAVWEB computer, using a text editor such as Notepad, open the applicationHost.config file for IIS. By default, the file is located in the *c:\\Windows\\System32\\inetsrv* folder.  

2.  Locate the `<location path="Microsoft Dynamics NAV 2013 Web Client">` element.  

3.  Change the `<windowsAuthentication enabled="true">` element to the following.  

    ```  
    <windowsAuthentication enabled="true" useAppPoolCredentials="true" />  
    ```  

4.  Save the file.  

5.  Restart IIS. To restart IIS in a command prompt, do the following:  

    1.  On the **Start** menu, choose **Run**.  

    2.  In the **Open** box, type **cmd**, and then choose the **OK** button.  

    3.  At the command prompt, type **iisreset**, and then press Enter.  

    > [!TIP]  
    >  You can also restart IIS using Internet Information Services Manager, if you have it installed.  

##  <a name="Firewall"></a> Allowing Inbound Communication on the Microsoft Dynamics NAV Web Client Port Through the Windows Firewall  
 By default, the [!INCLUDE[nav_web](includes/nav_web_md.md)] is configured for communication on port 8080 of the computer. This port is typically blocked by Windows Firewall. To allow communication to the [!INCLUDE[nav_web](includes/nav_web_md.md)] from client devices, you must create an inbound rule on the port 8080 in the Windows Firewall setup.  

> [!NOTE]  
>  You do not have to perform this task if the computer is running Windows Server 2012 or Windows Server 2016 because communication on the port is automatically allowed by Windows Firewall.  

#### To create an inbound rule on the port that is used by [!INCLUDE[nav_web](includes/nav_web_md.md)]  

1.  On the **NAVWEB** computer, on the **Start** menu, choose **Control Panel**, choose **System and Security**, and then choose **Windows Firewall**.  

2.  In the navigation pane, choose **Advanced settings**.  

3.  In the **Windows Firewall with Advanced Settings** window, in the navigation pane, choose **Inbound Rules**, and then in the Actions pane, choose **New Rule**.  

4.  On the **Rule Type** page, choose **Port**, and then choose the **Next** button.  

5.  On the **Protocol and Ports** page, choose **Specific local ports**, and then type a port number in the box. For example, type 8080 for the default port of the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

6.  Choose the **Next** button.  

7.  On the **Action** page, choose **Allow the connection**, and then choose the **Next** button.  

8.  On the **Profile** page, choose the profiles, and then choose the **Next** button.  

9. On the **Name** page, type a name for the rule, and then choose the **Finish** button.  

##  <a name="Opening"></a> Opening the [!INCLUDE[nav_web](includes/nav_web_md.md)]  
 You can open the [!INCLUDE[nav_web](includes/nav_web_md.md)] from a device with a supported web browser.  

#### To open the [!INCLUDE[nav_web](includes/nav_web_md.md)]  

1.  Open the web browser.  

2.  In the address box, type the following URL:  

    `https://ComputerName:PortNumber/nav_server_instance`  

    Or for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions:

    `https://ComputerName:PortNumber/nav_server_instance/WebClient/Default.aspx`  

    -   Substitute **ComputerName** with the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

    -   Substitute **PortNumber** with the port that you configured for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] during Setup.  

    -   Substitute **[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]** with the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that you configured during Setup. [!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)] is the default value.  

     For this walkthrough, you would use the following URL:  

    ```  
    https://navweb:8080/nav_server_instance  
    ```  

    ```  
    https://navweb:8080/nav_server_instance/WebClient/Default.aspx  
    ```  

### Troubleshooting  
 If you are cannot connect the [!INCLUDE[nav_web](includes/nav_web_md.md)] or you are experiencing problems, see [Troubleshooting the Microsoft Dynamics NAV Web Client Installation](Troubleshooting-the-Microsoft-Dynamics-NAV-Web-Client-Installation.md).  

## Next Steps  
 The following is a list of typical tasks to perform after you install [!INCLUDE[nav_web](includes/nav_web_md.md)].  

-   Secure the connection to [!INCLUDE[nav_web](includes/nav_web_md.md)] using SSL. For more information, see [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md).  

-   Upload your license. For more information, see [How to: Upload the License File](How-to--Upload-the-License-File.md).  

-   Create users and integrate them into the [!INCLUDE[navnow](includes/navnow_md.md)] security system. For more information, see [Managing Users](Managing-Users.md).  

## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components in a Two Computer Environment](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components-in-a-Two-Computer-Environment.md)   
 [Microsoft Dynamics NAV Web Client Network Architecture](Microsoft-Dynamics-NAV-Web-Client-Network-Architecture.md)   
 [Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on Three Computers](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-Three-Computers.md)   
 [Walkthrough: Installing the Microsoft Dynamics NAV Web Server Components on a Single Computer](Walkthrough--Installing-the-Microsoft-Dynamics-NAV-Web-Server-Components-on-a-Single-Computer.md)   
 [Configuring Microsoft SQL Server](Configuring-Microsoft-SQL-Server.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)
