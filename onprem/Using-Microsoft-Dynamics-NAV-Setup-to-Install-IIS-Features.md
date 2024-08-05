---
title: "Using Microsoft Dynamics NAV Setup to Install IIS Features"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: f7cc0e09-db48-4014-8222-0c0105870692
caps.latest.revision: 5
---
# Using Microsoft Dynamics NAV Setup to Install IIS Features
When you install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you can use the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard to enable Internet Information Services \(IIS\) and the IIS features that are required to run the [!INCLUDE[nav_web](includes/nav_web_md.md)]. If IIS is already enabled on the computer and you do not want Setup to change the configuration, then you can use Setup to detect which required features are not enabled. Afterward, you can manually enable the features, and then install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  
  
## IIS Installation Options  
 To install or detect the IIS features on the computer where you are installing the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], you set the **Install IIS prerequisites** parameter on **Specify Parameters** page of the Setup wizard. The parameter has the following options.  
  
|Value|Description|  
|-----------|-----------------|  
|**Install**|Setup enables IIS and the required features for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and installs the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)]. If IIS is already enabled on the computer, then Setup enables any required features that are not currently enabled.|  
|**Detect**|Setup detects whether IIS and the required features for the [!INCLUDE[nav_web](includes/nav_web_md.md)] are enabled on the computer, and then does the following:<br /><br /> -   If the required IIS features are enabled, then Setup installs the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].<br />-   If any IIS features are not enabled, then Setup does not install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and an error report is generated that lists the required features. You must enable the required features, and then run Setup again to install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].|  
|**Skip**|Setup installs the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] without detecting whether IIS or the required features are enabled. Setup does not change the IIS setup.|  
  
 For more information about how to run the [!INCLUDE[navnow](includes/navnow_md.md)] setup wizard to install the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)], see [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md).  
  
## IIS Features That are Enabled by Setup  
 [!INCLUDE[navnow](includes/navnow_md.md)] Setup enables IIS and the following features:  
  
-   HTTP Activation \(Windows Communication Foundation\)  
  
-   .NET Extensibility 4.5, .NET Extensibility 4.6, or .NET Extensibility 4.7 (depending on Windows version) 

-   Application Initialization
  
-   ASP.NET 4.5, ASP.NET 4.6, or ASP.NET 4.7 (depending on Windows version)
  
-   ISAPI Extensions  
  
-   ISAPI Filters  
  
-   Request Filtering  
  
-   Windows Authentication  
  
-   Static Content  
  
-   Default Document  
  
-   Directory Browsing  
  
-   HTTP Errors  
  
-   HTTP Logging  
  
-   Request Monitoring  
  
-   Dynamic Content Compression

-   Static Content Compression  
  
-   IIS Management Console  
  
## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [How to: Install and Configure Internet Information Services for Microsoft Dynamics NAV Web Client](How-to--Install-and-Configure-Internet-Information-Services-for-Microsoft-Dynamics-NAV-Web-Client.md)