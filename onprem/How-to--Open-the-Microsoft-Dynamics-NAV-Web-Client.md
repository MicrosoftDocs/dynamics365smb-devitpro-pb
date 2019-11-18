---
title: "How to: Open the Microsoft Dynamics NAV Web Client"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
author: jswymer
---
# How to: Open the Microsoft Dynamics NAV Web Client
You open the [!INCLUDE[nav_web](includes/nav_web_md.md)] by using a web browser from a device that has a network connection. To open the [!INCLUDE[nav_web](includes/nav_web_md.md)], you must know the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and the HTTP port that it is running on.  

 For a list of supported browsers, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md). For more specific parameters, see [Opening a Page in the Microsoft Dynamics NAV Web Client by Using a URL](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md)  

### To open [!INCLUDE[nav_web](includes/nav_web_md.md)]  

1.  Open the web browser.  

    > [!TIP]  
    >  On the computer where the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] are installed, you can open the [!INCLUDE[nav_web](includes/nav_web_md.md)] directly from **Start** in Windows. In the **Search** box, type **[!INCLUDE[navnowlong](includes/navnowlong_md.md)] Web Client**, and then choose the related link.  

2.  In the address box of the browser, type one of the following URLs.  

    |To open|URL|Example|  
    |-------------|---------|-------------|  
    |The Role Center for the default company|https://ComputerName:Port/WebServerInstance<br /><br /> Or \(for multitenant deployments\)<br /><br /> https://ComputerName:Port/WebServerInstance/?tenant=TenantID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]|  
    |The Role Center for a specific company|https://ComputerName:Port/WebServerInstance/?company=CompanyName<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/?tenant=TenantID&company=CompanyName|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/?company=CRONUS%20International%20Ltd.|  
    |A specific page|https://ComputerName:Port/WebServerInstance/?page=ID<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/?tenant=TenantID&page=ID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/?page=22|  
    |A specific report|https://ComputerName:Port/WebServerInstance/?report=ID<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/?tenant=TenantID&report=ID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/?report=5|  
    |A specific profile|https://ComputerName:Port/WebServerInstance/?profile=ID<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/?profile=ID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/?profile=Small-Business| 

    For [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions:

    |To open|URL|Example|  
    |-------------|---------|-------------|  
    |The Role Center for the default company|https://ComputerName:Port/WebServerInstance/WebClient<br /><br /> Or \(for multitenant deployments\)<br /><br /> https://ComputerName:Port/WebServerInstance/WebClient/default.aspx?tenant=TenantID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient|  
    |The Role Center for a specific company|https://ComputerName:Port/WebServerInstance/WebClient/default.aspx?company=CompanyName<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/WebClient/default.aspx?tenant=TenantID&company=CompanyName|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient/default.aspx?company=CRONUS%20International%20Ltd.|  
    |A specific page|https://ComputerName:Port/WebServerInstance/WebClient/default.aspx?page=ID<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/WebClient/default.aspx?tenant=TenantID&page=ID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient/default.aspx?page=22|  
    |A specific report|https://ComputerName:Port/WebServerInstance/WebClient/default.aspx?report=ID<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/WebClient/default.aspx?tenant=TenantID&report=ID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient/default.aspx?report=5|  
    |A specific profile|https://ComputerName:Port/WebServerInstance/WebClient/?profile=ID<br /><br /> Or<br /><br /> https://ComputerName:Port/WebServerInstance/WebClient/?profile=ID|https://MyNAVWeb:8080/[!INCLUDE[nav_server_instance](includes/nav_server_instance_md.md)]/WebClient/?profile=Small-Business|  

     Substitute the following parameters:  

    -   **http** with **https** if SSL is configured for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and the [!INCLUDE[navnow](includes/navnow_md.md)] Web Server is not configured to redirect HTTP requests to HTTPS.  

    -   **ComputerName** with the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

    -   **Port** with the port number that you configured for the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] during installation.  

    -   **WebServerInstance** with the virtual directory alias under which the [!INCLUDE[nav_web](includes/nav_web_md.md)] application exists on the web server. For more information, see [Microsoft Dynamics NAV Web Server Components Installation on IIS](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components-2017.md#WebClientonIIS).  

    -   **TenantID** with the name of the tenant that you want to connect to. This parameter is only required when [!INCLUDE[navnow](includes/navnow_md.md)] is deployed in a multitenant architecture. The tenant that you specify must be mounted on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the [!INCLUDE[nav_web](includes/nav_web_md.md)] connects to. For more information, see [Multitenant Deployment Architecture](Multitenant-Deployment-Architecture.md).  

    -   **CompanyName** with the name of the company in [!INCLUDE[navnow](includes/navnow_md.md)]. This parameter is optional and is only needed if you want to open a different company than the one specified in **My Settings**.  

    -   **ID** with the ID that is assigned to the page or report object in [!INCLUDE[navnow](includes/navnow_md.md)].  

    > [!TIP]  
    >  After you open the [!INCLUDE[nav_web](includes/nav_web_md.md)], you can choose the **Search for Page or Report** icon to find pages and reports. The **Search for Page or Report** button in the ribbon.  

 For more information about the URLs to open pages and reports, see [Opening a Page in the Microsoft Dynamics NAV Web Client by Using a URL](Opening-a-Page-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md) and [Opening a Report in the Microsoft Dynamics NAV Web Client by Using a URL](Opening-a-Report-in-the-Microsoft-Dynamics-NAV-Web-Client-by-Using-a-URL.md).  

## See Also  
 [How to: Open the Microsoft Dynamics NAV Tablet or Phone Client from a Browser](How-to--Open-the-Microsoft-Dynamics-NAV-Tablet-or-Phone-Client-from-a-Browser.md)   
 [Developing for the Microsoft Dynamics NAV Web Client](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md)
