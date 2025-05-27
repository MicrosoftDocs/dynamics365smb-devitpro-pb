---
title: "Migrating a Deployment to a New Microsoft Dynamics NAV Server Instance"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: 6c08fcf3-1b8a-42ae-a033-2b708c803d3b
caps.latest.revision: 2
---
# Migrating a Deployment to a New Microsoft Dynamics NAV Server Instance
When you have deployed [!INCLUDE[navnow](includes/navnow_md.md)], you may want to move existing client connections to a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. In that case, you can move the clients that are connecting to the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to a new instance.  
  
## Moving Client Connections to a New [!INCLUDE[nav_server](includes/nav_server_md.md)] Instance  
 You can move existing client connections to a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance without changing the client configuration. For example, you can set up a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is a copy of the existing configuration. By reusing the configuration on the server side, the client connections do not have to be updated because the client configuration settings are the same. The following list describes the main steps in moving client connections to a new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance:  
  
1.  Install the new [!INCLUDE[nav_server](includes/nav_server_md.md)] instance. For more information, see [Server Option](Server-Option.md).  
  
2.  Replace the CustomSettings.config file for the new server instance with the CustomSettings.config file from the original server instance.  
  
3.  Stop the original server instance.  
  
4.  Start the new server instance.  
  
 Your users access the [!INCLUDE[nav_server](includes/nav_server_md.md)] based on the name of the server computer, the name of the service instance, and the port. Provided that those values are the same for the original [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and the new instance, the client connection settings are the same, and users will not know that you replaced the server instance. Also, if you do not expose physical server names to users, the client configurations do not change either. If the server name is different, you must update the ClientUserSettings.config file for each [!INCLUDE[nav_windows](includes/nav_windows_md.md)] user, and you must provide [!INCLUDE[nav_web](includes/nav_web_md.md)] users with a new URL.  
  
## See Also  
 [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)   
 [Working with Microsoft Dynamics NAV Setup](Working-with-Microsoft-Dynamics-NAV-Setup.md)   
 [Server Option](Server-Option.md)   
 [Deployment](Deployment.md)