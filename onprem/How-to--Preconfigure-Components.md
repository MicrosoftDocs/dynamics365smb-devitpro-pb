---
title: "How to: Preconfigure Components"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 511d8c03-364b-4595-a11e-4cfa6710d92c
caps.latest.revision: 21
---
# How to: Preconfigure Components
You can preconfigure components before you install [!INCLUDE[navnow](includes/navnow_md.md)] so that you do not have to configure them after. You can also configure Setup components and then save them to Setup configuration files before you deploy them to users. For more information, see [How to: Create or Load a Setup Configuration File](How-to--Create-or-Load-a-Setup-Configuration-File.md).  
  
### To associate configuration settings with a component before installing  
  
1.  In Setup, on the **Specify parameters** pane, supply all settings for the listed components.  
  
     Two settings that you see on the **Specify parameters** pane are not related to a particular component:  
  
    -   The **Destination Folder \(x86\)** setting specifies where Setup installs 32-bit [!INCLUDE[navnow](includes/navnow_md.md)] components such as the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
    -   The **Destination Folder** setting specifies where Setup installs 64-bit [!INCLUDE[navnow](includes/navnow_md.md)] components such as [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
2.  For information about parameters for a configurable component, see one of the following:  
  
    -   [Configuring Microsoft Dynamics NAV Server](Configuring-Microsoft-Dynamics-NAV-Server.md)  
  
    -   [Configuring the Windows Client](Configuring-the-Windows-Client.md)  
  
    -   [Configuring Database Components](Configuring-Database-Components.md)  
  
    -   [Configuring Microsoft Dynamics NAV Help Server](Configuring-Microsoft-Dynamics-NAV-Help-Server.md)  
  
3.  When you have finished configuring a component, choose **Apply** to validate your settings. If there are issues with the settings that you have selected, then information about these issues is displayed on the **Problems were identified for this configuration** pane.  
  
## See Also  
 [How to: Create or Load a Setup Configuration File](How-to--Create-or-Load-a-Setup-Configuration-File.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [Custom Option](Custom-Option.md)
