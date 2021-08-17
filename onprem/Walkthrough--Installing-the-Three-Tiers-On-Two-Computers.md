---
title: "Walkthrough: Installing the Three Tiers On Two Computers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 501c0ec0-d7d6-4752-918a-9e5e87428422
caps.latest.revision: 52
manager: edupont
---
# Walkthrough: Installing the Three Tiers On Two Computers
In this walkthrough, you install a new instance of [!INCLUDE[navnowlong](includes/navnowlong_md.md)] in a production environment with SQL Server and [!INCLUDE[nav_server](includes/nav_server_md.md)] together on one computer and the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on a second computer.  

|Computer|Installed operating system and software|Tier|  
|--------------|---------------------------------------------|----------|  
|**NAVSERV**|A supported version of Microsoft Windows Server with a supported version of the 64-bit edition of Microsoft SQL Server  already installed.<br /><br /> You will install the [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] database components on this computer.|Database and Server|  
|**NAVCLIENT**|Windows 10.<br /><br /> You will install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on this computer.|Client|  

> [!NOTE]  
>  For information on system requirements for (and supported versions of) [!INCLUDE[navnowlong](includes/navnowlong_md.md)] components, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

 The key characteristic of this configuration is that the server and database tiers—[!INCLUDE[nav_server](includes/nav_server_md.md)] and SQL Server—are on the same computer. In an actual production environment you would have multiple [!INCLUDE[nav_windows](includes/nav_windows_md.md)]s; you might also have multiple server computers. But installation and configuration issues would be the same as long as the configuration topology was the same: database and [!INCLUDE[nav_server](includes/nav_server_md.md)] installed together on a computer, [!INCLUDE[nav_windows](includes/nav_windows_md.md)]s installed on separate computers.  

 If you plan on installing each of the three tiers on a separate computer, see [Walkthrough: Installing the Three Tiers on Three Computers](Walkthrough--Installing-the-Three-Tiers-on-Three-Computers.md).  

## About This Walkthrough  
 After completing this walkthrough, you will have a functioning three-tier installation on two computers. This installation uses the [!INCLUDE[demolong](includes/demolong_md.md)].  

 In this walkthrough, the [!INCLUDE[nav_server](includes/nav_server_md.md)] service runs using the credentials a dedicated domain user account. \(“Dedicated” means that this account is reserved exclusively for [!INCLUDE[nav_server](includes/nav_server_md.md)] and for the [!INCLUDE[navnow](includes/navnow_md.md)] instance in SQL Server.\) The default in [!INCLUDE[navnow](includes/navnow_md.md)] Setup is for [!INCLUDE[nav_server](includes/nav_server_md.md)] to run using the built-in Network Service account. But this account is considered less secure because it is a shared account: users who have rights to this account have rights to all services that run using this account’s credentials.  

 This walkthrough illustrates the following tasks:  

-   Installing the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] database components with [!INCLUDE[nav_server](includes/nav_server_md.md)].  

-   Configuring [!INCLUDE[nav_server](includes/nav_server_md.md)] to run using the credentials of a dedicated domain user account.  

-   Installing the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

### Prerequisites  
 To complete this walkthrough, you will need two computers provisioned as described in the introduction.  

 Although [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup will automatically install SQL Server Express Edition when you install [SQL Server Database Components](SQL-Server-Database-Components.md) on a computer without any other version of SQL Server, the Express version is not recommended for production environments. For that reason, this walkthrough assumes that you have installed a non-Express version of SQL Server, and then created a SQL Server instance named NAVDEMO, before you begin. For information on how to install SQL Server, see [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md).  

## Story  
 A consultant wants to install [!INCLUDE[navnowlong](includes/navnowlong_md.md)] in a production environment.  

1.  She installs [!INCLUDE[nav_server](includes/nav_server_md.md)], [!INCLUDE[navnow](includes/navnow_md.md)] database components, and the Demo database on a server running Windows Server \(**NAVSERV**\) where she has already installed Microsoft SQL Server. As part of the installation she provides configuration information to allow the server to communicate with the database.  

2.  She creates a domain user account in Active Directory and uses [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to configure a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to run using the account’s domain credentials.  

3.  She installs the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on a computer running Windows 10 \(**NAVCLIENT**\) and configures it to communicate with [!INCLUDE[nav_server](includes/nav_server_md.md)].  

## Installing the [!INCLUDE[navnow](includes/navnow_md.md)] Database Components and [!INCLUDE[nav_server](includes/nav_server_md.md)]  
 When you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup, you see a menu of Installation Options. You configure one of those options, the Server Option, to install the SQL Server Database components, the CRONUS International, Ltd., Demo database, and [!INCLUDE[nav_server](includes/nav_server_md.md)], all at the same time.  

#### To install the [!INCLUDE[navnow](includes/navnow_md.md)] Database Components and [!INCLUDE[nav_server](includes/nav_server_md.md)]  

1.  Insert the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] DVD into the DVD drive of **NAVSERV**, the server computer where SQL Server is already installed. Or if you are installing over your network, navigate to the directory containing the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup program and run Setup.exe, the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard.  

2.  On the introductory pane, choose **Next**.  

3.  To accept the license terms, choose **I accept**.  

4.  On the **Microsoft Dynamics NAV Setup** pane, choose **Choose an installation option**.  

5.  On the **Choose an installation option** pane, choose the word **Customize** that is underneath the **Server** option  

     ![Configure Server option.](media/ServerConfigure.JPG "ServerConfigure")  

6.  On the **Customize the installation** pane, click within the **SQL Server Database Components** box and select **Run all from my computer**.  

     ![Add Database Components to the Install.](media/DBCompRunAll.JPG "DBCompRunAll")  

     This specifies that you want to install this component and all sub-components. In this case, there is a single sub-component: the Demo database.  

7.  Choose **Next** to proceed to the **Specify parameters** pane.  

     There are many parameters that you can configure here, but default parameters are provided for all but one of the required parameters—**SQL Server**. Setup needs to know which computer you have installed SQL Server on.  

    > [!NOTE]  
    >  An asterisk \(\*\) before a parameter field indicates that it is a required parameter for Setup.  

8.  Type **localhost** in the **SQL Server** field. Then choose **Apply**.  

     Setup warns you that some parameters are missing.  

9. Choose **OK** to dismiss the dialog box.  

     Setup now begins copying software.  

10. After the installation is complete, choose **Close** to exit Setup.  

## Configuring [!INCLUDE[nav_server](includes/nav_server_md.md)] to Run Using the Credentials of a Dedicated Domain User Account  
 The steps for creating a domain user account using the Active Directory Users and Computers utility \(dsa.msc\) are available as part of the online Windows Server documentation. See [Create a New User Account](https://go.microsoft.com/fwlink/?LinkId=213723). Only network administrators can perform this task.  

 After you create the account, you must give it the necessary permissions and privileges to interact securely with [!INCLUDE[navnow](includes/navnow_md.md)] clients and SQL Server databases. To do this, complete the procedures in [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).  

 After your account is created and provisioned, use the following procedure to configure a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to use a domain user account. This procedure assumes the default [!INCLUDE[nav_server](includes/nav_server_md.md)] instance since this instance is always present. It would work as well for any other instance you create. See [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).  

#### To configure a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to use a domain user account  

1.  Start [!INCLUDE[nav_admin](includes/nav_admin_md.md)]: Choose **Start**, and in the **Search programs and files** box, enter **Microsoft Dynamics NAV Administration**, and then choose the related link.  

     The [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is one of the default components for the [!INCLUDE[navnow](includes/navnow_md.md)] Server Option. If you have followed the installation steps above, [!INCLUDE[nav_admin](includes/nav_admin_md.md)] should be installed on the server computer.  

2.  In [!INCLUDE[nav_admin](includes/nav_admin_md.md)], choose the triangle to the left of the local computer to display any instances on the server computer:  

     ![Console root with two server instances.](media/ConsoleRootExp.png "ConsoleRootExp")  

3.  Right-click the default instance \(in the left pane\) and select **Log on Account**.  

4.  Choose the **Edit** button at the bottom of the pane.  

5.  In the **Service Account** field, select **User Account**.  

6.  In the remaining fields, type the account’s User name, **Domain**, and the **Password**, respectively. Retype the password in the **Confirm Password** field.  

7.  Choose **Save**.  

8.  You must now restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to activate the new log in account. In the left pane of the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], select the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer.  

     Except when administering a remote computer, this is named **Dynamics NAV \(Local\)**.  

9. In the center pane, right-click the instance and choose **Restart**.  

## Installing the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  
 The final task is to install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to NAVCLIENT, a Windows 7 computer.  

#### To install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  

1.  On **NAVCLIENT**, the [!INCLUDE[navnow](includes/navnow_md.md)] client computer running Windows 10, navigate to the Setup media directory containing the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup program and run Setup.exe, the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard.  

2.  Under **Install**, choose **Microsoft Dynamics NAV**.  

3.  On the introductory pane, choose **Next**.  

4.  On the **Microsoft Software License Terms** pane, review the software license, and then choose **I accept**.  

5.  On the **Microsoft Dynamics NAV Setup** pane, choose **Choose an installation option**.  

6.  On the **Choose an installation option** pane, choose **Client**.  

7.  On the **Specify Parameters** pane, type the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer, which is **NAVSERV**, in the **Server Name** box.  

    > [!NOTE]  
    >  You can leave all other parameters set to their default values.  

8.  Choose **Apply**.  

9. On the **Specify parameters** pane, choose **Install** to begin installing software.  

10. After the installation is complete, choose **Close** to exit Setup.  

## Next Steps  
 Software installation is now complete. When you start the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] it should connect to the [!INCLUDE[nav_server](includes/nav_server_md.md)] and inform you that you are connected to CRONUS International, Ltd. This the fictional company associated with the demo database.  

 The next steps are to upload your license \(see [How to: Upload the License File](How-to--Upload-the-License-File.md)\), create users \(see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)\), and integrate them into the [!INCLUDE[navnow](includes/navnow_md.md)] security system \(see [Managing Users](Managing-Users.md)\).  

## See Also  
 [Product and Architecture Overview](Product-and-Architecture-Overview.md)   
 [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md)
 [Configuring Microsoft SQL Server](Configuring-Microsoft-SQL-Server.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Configuring the Windows Client](Configuring-the-Windows-Client.md)   
 [Walkthrough: Setting Up Outlook Synchronization](Walkthrough--Setting-Up-Outlook-Synchronization.md)   
 [How to: Upload the License File](How-to--Upload-the-License-File.md)   
 [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md)   
 [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md)   
 [Security and Protection](Security-and-Protection.md)
