---
title: Microsoft Dynamics NAV Web Client
description: The web client gives users access to the Dynamics NAV data over a network, such as the internet by using a web browser.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d10fca47-106f-4f6d-be2e-37cbdae201ee
caps.latest.revision: 10
---
# Working with Microsoft Dynamics NAV Web Client
The [!INCLUDE[nav_web](includes/nav_web_md.md)] gives users access to [!INCLUDE[navnow](includes/navnow_md.md)] data over a network, such as the Internet, by using a web browser. Users can view and modify data from a user-friendly interface that resembles the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], where the starting point is the Role Center. The Role Center can be customized to users individual needs based on their role, company, and daily tasks.  

 Unlike the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], you do not have to install any [!INCLUDE[navnow](includes/navnow_md.md)] components on devices that users will use to access [!INCLUDE[navnow](includes/navnow_md.md)] data. The [!INCLUDE[nav_web](includes/nav_web_md.md)] does not replace the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] but complements it by enabling scenarios that are not possible with the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For a visual overview of the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [Touring the RoleTailored Client for Developers](Touring-the-RoleTailored-Client-for-Developers.md).  

## Deploying the Microsoft Dynamics NAV Web Client  
 To deploy [!INCLUDE[nav_web](includes/nav_web_md.md)], you install and configure the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] on a computer that is running Internet Information Services \(IIS\) and has a connection to a [!INCLUDE[nav_server](includes/nav_server_md.md)] and database. [!INCLUDE[navnow](includes/navnow_md.md)] users can access the [!INCLUDE[nav_web](includes/nav_web_md.md)] from any supported device that has a supported internet browser and a TCP/IP network connection. For a list of supported devices and browsers, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

 For more information about how to deploy the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md).  

## Developing for the Microsoft Dynamics NAV Web Client  
 As a developer of [!INCLUDE[nav_web](includes/nav_web_md.md)] applications, you will have the same experience as developing [!INCLUDE[nav_windows](includes/nav_windows_md.md)] applications. You use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to create objects, such as pages and reports, and implement the same business logic as you would for the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The same page or report that is displayed in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] can also be displayed in the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

 For more information about how to develop for the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [Developing for the Microsoft Dynamics NAV Web Client](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md).  

## Administering Users of Microsoft Dynamics NAV Web Client  
 Like the [!INCLUDE[nav_web](includes/nav_web_md.md)], you control access to the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[navnow](includes/navnow_md.md)] data by creating user accounts, permission sets, and profiles. You do not have to set up separate user accounts for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The permissions that are granted to a specific user account apply to all [!INCLUDE[rtc](includes/rtc_md.md)]s.  

 For more information about how to manage users of the [!INCLUDE[nav_web](includes/nav_web_md.md)], see [Managing Users](Managing-Users.md).  

## See Also  
 [Feature Limitations of the Microsoft Dynamics NAV Web Client](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md)   
 [Microsoft Dynamics NAV Web Client Network Architecture](Microsoft-Dynamics-NAV-Web-Client-Network-Architecture.md)   
 [How to: Install the Web Server Components](How-to--Install-the-Web-Server-Components.md)   
 [Accessibility Features of Microsoft Dynamics NAV Windows Client](Accessibility-Features-of-Microsoft-Dynamics-NAV-Windows-Client.md)
