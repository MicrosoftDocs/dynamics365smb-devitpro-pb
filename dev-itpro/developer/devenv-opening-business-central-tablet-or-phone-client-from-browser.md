---
title: "Opening the Business Central Tablet or Phone Client from a Browser"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: blrobl
---
# Opening the Business Central Tablet or Phone Client from a Browser
You can open the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] or the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] by using a browser from a device that has a network connection. This can make it easier to test your solution during the design phase. <!--To be able to open the client in a browser you must know the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] and the HTTP port that it is running on.-->

> [!IMPORTANT]  
> The steps in this article illustrates how you can open the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] in a browser. The syntax and options for opening [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser are the same; just replace *tablet* with *phone* in the examples later in this section.  

## To open [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] in a browser  

1.  Open the web browser.  

2.  In the address box of the browser, type one of the following URLs.  

    |To open|URL|Example|  
    |-------------|---------|-------------|  
    |The Role Center for the default company<img width=25/>|*https://ComputerName:Port/WebServerInstance/tablet*<br /><br /> Or \(for multitenant deployments\)<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet?tenant=TenantID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet|  
    |The Role Center for a specific company|*https://ComputerName:Port/WebServerInstance/tablet?company=CompanyName*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet?tenant=TenantID&company=CompanyName*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet?company=CRONUS%20International%20Ltd.| 
    |A specific page|*https://ComputerName:Port/WebServerInstance/tablet?page=ID*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet?tenant=TenantID&page=ID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet?page=22|  
    |A specific report|*https://ComputerName:Port/WebServerInstance/tablet?report=ID*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet?tenant=TenantID&report=ID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet?report=8|  
    |A specific profile|*https://ComputerName:Port/WebServerInstance/tablet?profile=ProfileID*<br /><br /> Or<br /><br /> *https://ComputerName:Port/WebServerInstance/tablet?tenant=TenantID&profile=ProfileID*|https://MyBCWeb:8080/[!INCLUDE[serverinstance](includes/serverinstance.md)]/tablet?profile=Small-Business|  

     Substitute the following parameters:  

    -   **ComputerName** with the name of the computer that is running the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)].  

    -   **Port** with the port number that you configured for the [!INCLUDE[webservercomponents](includes/webservercomponents.md)] during installation.  

    -   **WebServerInstance** with the virtual directory alias under which the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] or the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] exists on the web server. For more information, see [Installing Business Central Using Setup](../deployment/install-using-setup.md).  

    -   **TenantID** with the name of the tenant that you want to connect to. This parameter is only required when [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] is deployed in a multitenant architecture. The tenant that you specify must be mounted on the [!INCLUDE[server](includes/server.md)] instance that the [!INCLUDE[nav_web](includes/nav_web_md.md)] connects to. For more information, see [Multitenant Deployment Architecture](../deployment/multitenant-deployment-architecture.md).  

    -   **CompanyName** with the name of the company in [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)]. This parameter is optional and is only needed if you want to open a different company than the one specified in **My Settings**.  

    -   **ID** with the ID that is assigned to the page or report in [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)].  

    -   **ProfileID** with the ID that is assigned to the profile in [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)].  

## See Also  
 [Introducing the Dynamics 365 Business Central Mobile App](devenv-Introducing-business-central-Mobile-App.md)   
