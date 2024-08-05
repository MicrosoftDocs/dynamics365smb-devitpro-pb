---
title: "Server Option"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 1caf49ca-db53-457a-a3ad-431612d22f8a
caps.latest.revision: 36
---
# Server Option
The Server option is available on the **Choose an installation option** page in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup.  
  
> [!IMPORTANT]  
>  You can only install the Server option on a computer that is running a 64-bit Windows operating system.  
  
## Installed Components  
 When you choose the Server option, [!INCLUDE[navnow](includes/navnow_md.md)] Setup installs the following components:  
  
-   [!INCLUDE[nav_server](includes/nav_server_md.md)]. For more information, see [Microsoft Dynamics NAV Server](Microsoft-Dynamics-NAV-Server.md).  
  
-   The [!INCLUDE[nav_admin](includes/nav_admin_md.md)]. For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  
  
-   Microsoft Office Outlook integration.  
  
-   SharePoint Online integration. <!-- For more information, see [Integrating with Microsoft Office](Integrating-with-Microsoft-Office.md).-->  
  
 [!INCLUDE[nav_server](includes/nav_server_md.md)] represents the middle tier in the [!INCLUDE[navnow](includes/navnow_md.md)] three-tier [Product and Architecture Overview](Product-and-Architecture-Overview.md). The [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)] is tier one, and [SQL Server Database Components](SQL-Server-Database-Components.md), together with SQL Server or SQL Server Express, is tier three.  
  
 You can configure the Server option to add or remove components by choosing **Customize** under the Server option on the **Choose an installation** option pane. You can configure the Server option to add or remove components on the **Customize the installation** page.  
  
 You may want to consider adding the following components to a [!INCLUDE[nav_server](includes/nav_server_md.md)] installation:  
  
-   [SQL Server Database Components](SQL-Server-Database-Components.md), to which you can add the Demo database.  
  
-   [Automated Data Capture System](Automated-Data-Capture-System.md).  
  
-   Web Server Components. For more information, see [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md).  
  
-   The [!INCLUDE[navnow](includes/navnow_md.md)] Help Server. This adds a separate website that displays the Help for [!INCLUDE[navnow](includes/navnow_md.md)]. For more information, see [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md).  
  
## Configuring [!INCLUDE[nav_server](includes/nav_server_md.md)] in Setup  
 When you choose the Server option, the **Specify parameters** pane is displayed in Setup. You must specify certain parameters in order to install [!INCLUDE[nav_server](includes/nav_server_md.md)] so that clients can connect to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. Each parameter is described in the Setup window. The following list provides a high-level description of the required parameters.  
  
|Category/Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|-------------------------|---------------------------------------|  
|Installation location for 32-bit and 64-bit components|Specifies the destination folder where [!INCLUDE[nav_server](includes/nav_server_md.md)] will be installed.<br /><br /> You cannot install [!INCLUDE[nav_server](includes/nav_server_md.md)] on computers that are running 32-bit editions of Windows. However, the Server option includes 32-bit components.|  
|The name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] service instance name, the service account, and the listening TCP ports for clients and services|The instance name must not include spaces. For more information, see [How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md).<br /><br /> You must specify an account that the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance uses as credentials.<br /><br /> The ports for the various services have default values, but you can specify other ports. The valid range is between 1 and 65535.|  
|Add a rule to the Windows Firewall|Specifies whether [!INCLUDE[navnow](includes/navnow_md.md)] Setup adds a rule to Windows Firewall to allow [!INCLUDE[nav_server](includes/nav_server_md.md)] instances on the target computer to communicate with clients on other computers, through the specified **Client Services Port**.<br /><br /> The default value is **Yes** for the Client or Server installation options, where the assumption is that [!INCLUDE[nav_server](includes/nav_server_md.md)] is installed on a different computer from the [!INCLUDE[rtc](includes/rtc_md.md)]. The default value is **No** for the Demo and Developer options, where the assumption is that the [!INCLUDE[nav_server](includes/nav_server_md.md)] is installed on the same computer as the [!INCLUDE[rtc](includes/rtc_md.md)].<br /><br /> If the target computer uses a firewall other than Windows Firewall, or if networking is not configured on the target computer, then this option must be set to **No** or Setup will not be able to complete successfully.|  
|SQL Server database components|Specifies the computer that is running SQL Server, an instance of SQL Server, and the database.<br /><br /> If you do not specify an instance of SQL Server, [!INCLUDE[nav_server](includes/nav_server_md.md)] connects to the default instance of SQL Server. **Important:**  If you are installing the [!INCLUDE[demolong](includes/demolong_md.md)], [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup may automatically install SQL Server 2016 Express even if there is already a valid version of SQL Server on the target computer, unless you create an instance named NAVDEMO in SQL Server before you run [!INCLUDE[navnow](includes/navnow_md.md)] Setup. For more information, see [Installation Considerations for Microsoft SQL Server](Installation-Considerations-for-Microsoft-SQL-Server.md).|  
|Public URLs for web services and client services|Optionally, specifies the root of the URLs that are used to access web services and client services. For example, you can change the value if you want to change the externally facing endpoint.<br /><br /> For more information, see [How to: Copy the URL to Open a Page or Report](How-to--Copy-the-URL-to-Open-a-Page-or-Report.md).|  
|Help Server and Help Server port|Specifies the name and port of the server that hosts the [!INCLUDE[navnow](includes/navnow_md.md)] Help Server.<br /><br /> This can be a public website or a local computer.<br /><br /> For more information, see [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md).|  
  
 Choose **Apply** when you have finished entering values to return to the **Specify parameters** page in Setup.  
  
 After you finish running Setup, you can modify [!INCLUDE[nav_server](includes/nav_server_md.md)] using the [!INCLUDE[nav_admin](includes/nav_admin_md.md)], the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets, or by modifying the server configuration files. For more information, see [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md).  
  
## See Also  
 [How to: Create a Microsoft Dynamics NAV Server Instance](How-to--Create-a-Microsoft-Dynamics-NAV-Server-Instance.md)   
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [SQL Server Database Components](SQL-Server-Database-Components.md)   
 [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md)   
 [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)   
 <!-- [Integrating with Microsoft Office](Integrating-with-Microsoft-Office.md) -->  
 [Automated Data Capture System](Automated-Data-Capture-System.md)