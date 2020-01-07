---
title: "Opening the Business Central Tablet or Phone Client from a Browser"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: blrobl
---
# How to: Open the Business Central Tablet or Phone Client from a Browser
You can open the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] or the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] by using a browser from a device that has a network connection. Opening the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] or the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser can, for example, make it easier to test your solution during the design phase. You must know the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and the HTTP port that it is running on to be able to open the client in a browser.  

> [!IMPORTANT]  
>  In early versions of Internet Explorer 11, prior to and 11.0.9600.16476, an issue with hardware acceleration can occur when the browser zoom is not set to 100%. This can cause some elements of the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] or [!INCLUDE[nav_phone](includes/nav_phone_md.md)] UI being rendered incorrectly. For example, the action pane appears displaced horizontally.  

> [!IMPORTANT]  
>  The procedure in this article illustrates how you can open the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] in a browser. The syntax and options for opening [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser are the same; just replace *tablet.aspx* with *phone.aspx* in the examples later in this section.  

### To open [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] in a browser  

1.  Open the web browser.  

2.  In the address box of the browser, type one of the following URLs.  

    |To open|URL|Example|  
    |-------------|---------|-------------|  
    |The Role Center for the default company|*https://ComputerName:Port/WebServerInstance/tablet.aspx*<br /><br /> Or \(for multitenant deployments\)<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet.aspx?tenant=TenantID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet.aspx|  
    |The Role Center for a specific company|*https://ComputerName:Port/WebServerInstance/tablet.aspx?company=CompanyName*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet.aspx?tenant=TenantID&company=CompanyName*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet.aspx?company=CRONUS%20International%20Ltd.| 
    |A specific page|*https://ComputerName:Port/WebServerInstance/tablet.aspx?page=ID*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet.aspx?tenant=TenantID&page=ID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet.aspx?page=22|  
    |A specific report|*https://ComputerName:Port/WebServerInstance/tablet.aspx?report=ID*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet.aspx?tenant=TenantID&report=ID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet.aspx?report=8|  
    |A specific profile|*https://ComputerName:Port/WebServerInstance/tablet.aspx?profile=ProfileID*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet.aspx?tenant=TenantID&profile=ProfileID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet.aspx?profile=Small-Business|  

     Substitute the following parameters:  

    -   **http** with **https** if SSL is configured for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] or the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] and the Microsoft Dynamics NAV Web Server is not configured to redirect HTTP requests to HTTPS.  

    -   **ComputerName** with the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

    -   **Port** with the port number that you configured for the [!INCLUDE[webservercomponents](includes/webservercomponents.md)] during installation.  

    -   **WebServerInstance** with the virtual directory alias under which the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] or the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] exists on the web server. For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).  

    -   **TenantID** with the name of the tenant that you want to connect to. This parameter is only required when [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] is deployed in a multitenant architecture. The tenant that you specify must be mounted on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that the [!INCLUDE[nav_web](includes/nav_web_md.md)] connects to. For more information, see [Multitenant Deployment Architecture](/../deployment/multitenant-deployment-architecture).  

    -   **CompanyName** with the name of the company in [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)]. This parameter is optional and is only needed if you want to open a different company than the one specified in **My Settings**.  

    -   **ID** with the ID that is assigned to the page or report in [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)].  

    -   **ProfileID** with the ID that is assigned to the profile in [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)].  

## See Also  
 [Developing for the Business Central Universal App](devenv-Developing-for-the-business-central-Universal-App.md)   
 [Introducing the Business Central Universal App](devenv-Introducing-business-central-Universal-App.md)
