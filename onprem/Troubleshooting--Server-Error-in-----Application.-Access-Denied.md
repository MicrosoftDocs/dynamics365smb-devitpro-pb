---
title: "Troubleshooting: Server Error in &#39;-&#39; Application. Access Denied"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: beabce4e-95ad-4767-a8bd-781d8b83ebe5
caps.latest.revision: 11
---
# Troubleshooting: Server Error in &#39;-&#39; Application. Access Denied
When you try to access the [!INCLUDE[nav_web](includes/nav_web_md.md)], you get an error that is similar to the following:  
  
 **Server Error in '/' Application.**  
  
 **Access is denied**.  
  
 **Description: An error occurred while accessing the resources required to serve this request. The server may not be configured for access to the requested URL.**  
  
 **Error message 401.2.: Unauthorized: Logon failed due to server configuration.**  
  
## Resolution  
 This error can occur when the authentication method that is configured in the web.config file for the [!INCLUDE[nav_web](includes/nav_web_md.md)] is not enabled in Internet Information Services \(IIS\). The [!INCLUDE[nav_web](includes/nav_web_md.md)] can be configured to use either Windows authentication or forms authentication. By default, the [!INCLUDE[nav_web](includes/nav_web_md.md)] uses Windows authentication.  
  
-   When you use Windows authentication, the Windows authentication feature must be turned on in IIS and enabled on the website for the [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
-   When you use forms authentication, both forms authentication and anonymous authentication must be enabled on the website for [!INCLUDE[nav_web](includes/nav_web_md.md)].  
  
> [!NOTE]  
>  For more information about authentication with the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [How to: Configure Authentication of Microsoft Dynamics NAV Web Client Users](How-to--Configure-Authentication-of-Microsoft-Dynamics-NAV-Web-Client-Users.md).  
  
#### To turn on the Windows Authentication feature in IIS  
  
-   Use Internet Information Services \(IIS\) Manager to turn on Windows authentication on IIS. For more information, see [How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md)  
  
#### To enable an authentication method on the [!INCLUDE[nav_web](includes/nav_web_md.md)] website  
  
1.  On the computer that is running [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], to open Internet Information Services \(IIS\) Manager and do one of the following:  
  
    1.  In Windows 7, on the **Start** menu, in the **Search Programs and Files** box, type **inetmgr**, and then press Enter.  
  
    2.  In Windows Server 2008 R2, on the **Start** menu, choose **All Programs**, choose **Administrative Tools**, and then choose **Internet Information Service \(IIS\) Manager**.  
  
2.  In the **Connections** pane, under **Sites**, choose **[!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client**.  
  
3.  Under **IIS**, double-click **Authentication**.  
  
4.  To enable an authentication method, in the **Authentication** pane, choose the authentication, and then choose **Enable** in the **Actions** pane.  
  
5.  Restart the web server.  
  
#### To restart IIS  
  
-   In the **Connections** pane of Internet Information Services \(IIS\) Manager, choose the root node for your computer, and then in the **Actions** pane, choose **Restart**.  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)