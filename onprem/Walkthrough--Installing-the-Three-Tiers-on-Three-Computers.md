---
title: "Walkthrough: Installing the Three Tiers on Three Computers"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: b2858619-94c9-482b-9547-2a4250317062
caps.latest.revision: 69
manager: edupont
---
# Walkthrough: Installing the Three Tiers on Three Computers
In this walkthrough, you will install [!INCLUDE[navnowlong](includes/navnowlong_md.md)] in a production environment, with each of the three [!INCLUDE[navnow](includes/navnow_md.md)] tiers \(client, server, database\) on a separate computer:  

|Computer|Installed operating system and software|Tier|  
|--------------|---------------------------------------------|----------|  
|**NAVSQL**|A supported version of Microsoft Windows Server with a supported version of the 64-bit edition of SQL Server installed.<br /><br /> You will install [!INCLUDE[navnow](includes/navnow_md.md)] database components on this computer.|Database|  
|**NAVSERV**|A supported version of Microsoft Windows Server.<br /><br /> You will install [!INCLUDE[nav_server](includes/nav_server_md.md)] on this computer.|Server \(middle\)|  
|**NAVCLIENT**|Windows 10.<br /><br /> You will install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on this computer.|Client|  

> [!NOTE]  
>  For information on system requirements for (and supported versions of) [!INCLUDE[navnowlong](includes/navnowlong_md.md)] components, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

 The key characteristic of this walkthrough is that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], [!INCLUDE[nav_server](includes/nav_server_md.md)], and SQL Server are installed on separate computers. In a production environment, you may have multiple computers running SQL Server, multiple computers running [!INCLUDE[nav_server](includes/nav_server_md.md)], and multiple computers running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. When any client user is accessing [!INCLUDE[nav_server](includes/nav_server_md.md)] on a remote computer and SQL Server on a different remote computer, the procedures and issues presented in this walkthrough apply.  

 For information about how to configure deployments where [!INCLUDE[nav_server](includes/nav_server_md.md)] and SQL Server are installed on a single computer, see [Walkthrough: Installing the Three Tiers On Two Computers](Walkthrough--Installing-the-Three-Tiers-On-Two-Computers.md).  

## Domain User Account vs. Network Service  
 In this walkthrough, the SQL Server service and [!INCLUDE[nav_server](includes/nav_server_md.md)] share a domain user account. No other application or service uses this account.  

 You could run SQL Server or [!INCLUDE[nav_server](includes/nav_server_md.md)] using the credentials of the Network Service account. But this is considered less secure because the Network Service account is a shared account that can be used by other unrelated network services. Any users who have rights to this account have rights to all services that are running on this account. Running SQL Server and [!INCLUDE[nav_server](includes/nav_server_md.md)] under a dedicated domain user account is more secure but requires more work by a domain administrator, as described in this walkthrough.  

## About This Walkthrough  
 After completing this walkthrough, you will have a functioning three-tier installation on three computers. The installation uses the [!INCLUDE[demolong](includes/demolong_md.md)], which contains the [!INCLUDE[demoname](includes/demoname_md.md)] company.  

 This walkthrough illustrates the following tasks:  

-   Installing the [!INCLUDE[navnow](includes/navnow_md.md)] database components.  

-   Installing [!INCLUDE[nav_server](includes/nav_server_md.md)].  

-   Configuring [!INCLUDE[nav_server](includes/nav_server_md.md)] to run using the credentials of a dedicated domain user account.  

-   Installing the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

### Prerequisites  
 To complete this walkthrough, you need three computers that are configured as described in the introduction.  

 If SQL Server is not present on the computer where you install the [SQL Server Database Components](SQL-Server-Database-Components.md), then Setup automatically installs a 64-bit edition of SQL Server Express Edition, which you can use for prototyping, developing, and testing. We recommend that you use a non-Express version of SQL Server in production environments. For that reason, this walkthrough assumes that you have installed a non-Express version of SQL Server, and then created a SQL Server instance named NAVDEMO, before you begin. For more information, see [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md).  

## Story  
 A consultant wants to install [!INCLUDE[navnowlong](includes/navnowlong_md.md)] in a production environment.  

-   She installs [!INCLUDE[navnow](includes/navnow_md.md)] database components on a server running Windows Server \(**NAVSQL**\) where she has already installed Microsoft SQL Server.  

-   She installs [!INCLUDE[nav_server](includes/nav_server_md.md)] on a server running Windows Server \(**NAVSERV**\).  

-   She creates a domain user account in Active Directory and uses [!INCLUDE[nav_admin](includes/nav_admin_md.md)] to configure a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to run using that account’s credentials.  

-   She installs the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] on a Windows 10 computer \(**NAVCLIENT**\) and configures it to communicate with [!INCLUDE[nav_server](includes/nav_server_md.md)].  

## Installing the Microsoft Dynamics NAV Database Components  
 When you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup, you see a menu of installation options. You configure the **Server Option** to install the SQL Server Database components and the [!INCLUDE[demolong](includes/demolong_md.md)]. When Setup is finished, you start the SQL Browser Service on the SQL Server.  

#### To install the Microsoft Dynamics NAV database components and the demo database  

1.  Insert the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] installation media in the drive of **NAVSQL**, which is the computer where SQL Server is already installed.  

2.  On the introductory pane, choose **Next**.  

3.  To accept the license terms, choose **I accept**.  

4.  On the **Microsoft Dynamics NAV Setup** page, choose **Choose an installation option**.  

5.  On the **Choose an installation option** page, choose **Customize** underneath the **Server** option.  

     ![Configure Server option.](media/ServerConfigure.JPG "ServerConfigure")  

6.  On the **Customize the installation** page, choose the **SQL Server Database Components** box, and then select **Run all from My computer**.  

     ![Add Database Components to the Install.](media/DBCompRunAll.JPG "DBCompRunAll")  

     This specifies that you want to install this component and all subcomponents. In this case, there is a single subcomponent, which is the [!INCLUDE[demolong](includes/demolong_md.md)].  

7.  Choose the **Server** box, and then choose **Not Available**. Choose the **Administration Tool** box, and then choose **Not Available**.  

     This excludes server components that you will install later on a different computer.  

     Your list of components should now look like this:  

     ![Install database tier without other components.](media/DBTierOnly.JPG "DBTierOnly")  

8.  Choose **Next**.  

9. On the **Specify parameters** page, do not modify any parameters, and then choose **Apply**.  

     Setup installs the database components.  

10. After the installation is complete, choose **Close**.  

###  <a name="SQLBrowser"></a> Starting the SQL Server Browser Service on the SQL Server  
 When you installed the [!INCLUDE[navnow](includes/navnow_md.md)] database components, the [!INCLUDE[demolong](includes/demolong_md.md)] was installed on a database instance named **NAVDEMO**. Because you are using a named database instance and [!INCLUDE[nav_server](includes/nav_server_md.md)] is on a separate computer, you must enable and start the SQL Server Browser Service on the SQL Server computer to ensure the [!INCLUDE[nav_server](includes/nav_server_md.md)] can connect to the database instance.  

##### To start SQL Server Browser Service  

1.  On the computer running SQL Server, run the SQL Server Configuration Manager.  

     On the **Start** menu, in the **Search Programs and Files** box, type **SQL**, and then choose **SQL Server Configuration Manager**.  

2.  In SQL Server Configuration Manager, in the navigation pane on the left, choose **SQL Server Services**.  

3.  Right-click **SQL Server Browser**, and then choose **Properties**.  

4.  On the **Service** tab in the **SQL Server Browser** dialog box, set the **Start mode** to **Automatic**.  

5.  Choose **OK** to return to the SQL Server Configuration Manager main page.  

6.  Right-click **SQL Server Browser** again, and then choose **Start**.  

## Installing Microsoft Dynamics NAV Server  
 The next step is to install [!INCLUDE[nav_server](includes/nav_server_md.md)] on **NAVSERV**. This is a different computer from the one where you installed the [!INCLUDE[navnow](includes/navnow_md.md)] database components.  

#### To install Microsoft Dynamics NAV Server  

1.  Insert the [!INCLUDE[navnow](includes/navnow_md.md)] installation media into the drive of **NAVSERV**.  

2.  On the introductory page, choose **Next**.  

3.  To accept the license terms, choose **I accept**.  

4.  On the **Microsoft Dynamics NAV Setup** page, choose **Choose an installation option**.  

5.  On the **Choose an installation option** page, choose **Server**.  

     In this case, you do not need to customize the parameter list. By choosing **Server** instead of **Customize**, you bypass the **Customize the installation** page.  

6.  On the **Specify parameters** page, type **NAVSQL**, which is the name of the computer running SQL Server.  

     Default values are sufficient for all other parameters.  

7.  Choose **Apply** to save your setting information. Setup installs the components.  

8.  After the installation is complete, choose **Close**.  

## Configuring [!INCLUDE[nav_server](includes/nav_server_md.md)] to Run Using the Credentials of a Dedicated Domain User Account  
 The steps for creating a domain user account using the Active Directory Users and Computers utility \(dsa.msc\) are available in the Windows Server documentation. For more information, see [Create a New User Account](https://go.microsoft.com/fwlink/?LinkId=213723) in the TechNet Library. You must be a network administrator to perform this task.  

 After you create the account, you must give it the necessary permissions and privileges to interact securely with [!INCLUDE[navnow](includes/navnow_md.md)] clients and SQL Server databases. To do this, complete the procedures in [Provisioning the Microsoft Dynamics NAV Server Account](Provisioning-the-Microsoft-Dynamics-NAV-Server-Account.md).  

 Then follow these steps to configure a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to use a domain user account. This procedure uses the default [!INCLUDE[nav_server](includes/nav_server_md.md)] instance because this instance is always present. It works for any other instance that you create. For more information, see [Managing Microsoft Dynamics NAV Server Instances](Managing-Microsoft-Dynamics-NAV-Server-Instances.md).  

#### To configure a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to use a domain user account  

1.  Start the [!INCLUDE[nav_admin](includes/nav_admin_md.md)] on NAVSERV, which is the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)]. Choose **Start**, and in the **Search programs and files** box, enter **Microsoft Dynamics NAV Administration**, and then choose the related link.  

     [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is a default component for the Server Option.  

2.  Choose **Microsoft Dynamics NAV \(Local\)**, under Console Root, in the left pane of the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], to display all [!INCLUDE[navnow](includes/navnow_md.md)] instances on the server computer in the center pane:  

     ![Console root with two server instances.](media/ConsoleRootExp.png "ConsoleRootExp")  

3.  In the left pane, choose the default instance, then right-click it, then choose **Log on Account**.  

4.  Choose the **Edit** button at the bottom of the center pane.  

5.  In the **Service Account** field, choose the drop-down arrow, and then choose **User Account**.  

6.  In the remaining fields, enter the correct values in the **User name**, **Domain**, and **Password** fields. Enter the password again in the **Confirm Password** field.  

7.  Choose **Save**.  

8.  Now restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to enable the new login account. To do this, choose the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer in the left pane.  

     Except when you are administering a remote computer, this is **Dynamics NAV \(Local\)**.  

9. In the center pane, right-click the instance, and then choose **Restart**.  

## Installing the RoleTailored Client  
 The final task is to install the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to NAVCLIENT, which is a computer running Windows 7.  

#### To install the RoleTailored client  

1.  Insert the [!INCLUDE[navnow](includes/navnow_md.md)] installation media into the drive of **NAVCLIENT**.  

2.  On the introductory page, choose **Next**.  

3.  To accept the license terms, choose **I accept**.  

4.  On the **Microsoft Dynamics NAV Setup** page, choose **Choose an installation option**.  

5.  On the **Choose an installation option** page, choose **Client**.  

6.  On the **Specify parameters** page, in the **Server Name** field, enter **NAVSERV**, which is the name of the computer running [!INCLUDE[nav_server](includes/nav_server_md.md)].  

     You should fully qualify the domain name in this field in the form *YourServer*. *YourDomain*. *YourCompany*.com.  

7.  Choose **Apply** to begin install the components.  

8.  After installation is complete, choose **Close**.  

## Establishing a Connection  
 The configuration is now complete. You should be able to start the RoleTailored client and connect to the [!INCLUDE[demolong](includes/demolong_md.md)].  

 If you cannot connect the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] to [!INCLUDE[nav_server](includes/nav_server_md.md)] after completing this procedure, then the problem may be that [!INCLUDE[nav_server](includes/nav_server_md.md)] is not able to establish a connection to SQL Server. For more information, see [Troubleshooting: SQL Server Connection Problems](Troubleshooting--SQL-Server-Connection-Problems.md).  

## Next Steps  
 You have now installed all [!INCLUDE[navnow](includes/navnow_md.md)] components. When you start the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], it connects to [!INCLUDE[nav_server](includes/nav_server_md.md)] and to [!INCLUDE[demoname](includes/demoname_md.md)], which is the demonstration company that is associated with the demonstration database.  

 The next steps are to upload your license, create users, and integrate them into the [!INCLUDE[navnow](includes/navnow_md.md)] security system. For more information, see [How to: Upload the License File](How-to--Upload-the-License-File.md), [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md), and [Managing Users](Managing-Users.md).  

## See Also  
 [Product and Architecture Overview](Product-and-Architecture-Overview.md)
 [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md)
 [Configuring Microsoft SQL Server](Configuring-Microsoft-SQL-Server.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Configuring the Windows Client](Configuring-the-Windows-Client.md)   
 [How to: Upload the License File](How-to--Upload-the-License-File.md)
