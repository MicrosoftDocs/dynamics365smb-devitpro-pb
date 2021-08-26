---
title: "Installing and Configuring Windows Client Control Add-ins on Pages"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c384ba35-7fed-4dd3-b1e1-4a8346436f3c
caps.latest.revision: 16
manager: edupont
---
# Installing and Configuring Windows Client Control Add-ins on Pages
In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], control add-ins add custom controls or visual elements, on Windows client page fields for displaying and editing data. When a control add-in is developed, it is compiled into a .NET Framework–based assembly, which is .dll file. To use a control add-in on [!INCLUDE[nav_windows](includes/nav_windows_md.md)] pages, you must install and configure the control add-in assembly in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] environment, which is divided between two tiers: [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[navnowlong](includes/navnowlong_md.md)] SQL Server database.  
  
 ![RoleTailored client control add&#45;in installation.](media/NAVRTCControlAddinInstall.png "NAVRTCControlAddinInstall")  
  
 The following table outlines the tasks that you must perform on each tier.  
  
|Tier|Tasks|For more information, see|  
|----------|-----------|-------------------------------|  
|[!INCLUDE[nav_windows](includes/nav_windows_md.md)] computer|Install the control add-in assemblies.|[How to: Install a Windows Client Control Add-in Assembly](How-to--Install-a-Windows-Client-Control-Add-in-Assembly.md)|  
|SQL database|Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to:<br /><br /> 1.  Register the control add-ins that are found in the assemblies in the **Client Add-in** table.<br />2.  Set up control add-ins on pages.|[How to: Register a Windows Client Control Add-in](How-to--Register-a-Windows-Client-Control-Add-in.md)<br /><br /> [How to: Set Up a Windows Client Control Add-in on a Page](How-to--Set-Up-a-Windows-Client-Control-Add-in-on-a-Page.md)|  
  
## See Also  
 [Developing Windows Client Control Add-ins](Developing-Windows-Client-Control-Add-ins.md)   
 [Windows Client Control Add-in Overview](Windows-Client-Control-Add-in-Overview.md)   
 [Walkthrough: Creating and Using a Windows Client Control Add-in](Walkthrough--Creating-and-Using-a-Windows-Client-Control-Add-in.md)
