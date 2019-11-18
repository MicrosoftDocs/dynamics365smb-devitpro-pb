---
title: "Developing for the Microsoft Dynamics NAV Web Client"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 912e5da2-8ba1-481f-aeae-9f56bc603d4e
caps.latest.revision: 16
---
# Developing for the Microsoft Dynamics NAV Web Client
[!INCLUDE[nav_web](includes/nav_web_md.md)] is a web-based application that lets users interact with [!INCLUDE[navnow](includes/navnow_md.md)] data over the network from a web browser. The [!INCLUDE[nav_web](includes/nav_web_md.md)] user interface resembles the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Use the following guidelines to develop [!INCLUDE[nav_web](includes/nav_web_md.md)] applications.  

-   [Understand the Business Scenario](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md#UnderstandProblem)  

-   [Design the Data Model](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md#DataModel)  

-   [Install the Development Tools](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md#InstallTools)  

-   [Create Microsoft Dynamics NAV Objects](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md#CreateObjects)  

-   [Create Users and Grant Permissions to Objects](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md#Users)  

-   [Create Profiles and Assign Users](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md#Profiles)  

##  <a name="UnderstandProblem"></a> Understand the Business Scenario  
 You must understand and define the business problem or scenario that you want your application to solve. It is helpful to know who will be using the application and what they will be trying to accomplish. Compared to the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the [!INCLUDE[nav_web](includes/nav_web_md.md)] is designed for occasional users who typically need an overview of their daily work status and perform relatively simple or light data entry. The [!INCLUDE[nav_web](includes/nav_web_md.md)] does not support all the features that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] does.  

##  <a name="DataModel"></a> Design the Data Model  
 After you understand the problem that you want your application to solve, you must design the structure of the database for your application. For more information about how to design the data model, see the following topics:  

-   [Designing Databases \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkId=240055)  

-   [Database Basics \(SQL Server\)](https://go.microsoft.com/fwlink/?LinkId=240053)  

##  <a name="InstallTools"></a> Install the Development Tools  

-   [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)]  

     You use the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to create objects, such as tables, pages and reports, and implement the business logic for your application.  

     For more information, see [How to: Install C/SIDE Development Environment](How-to--Install-C-SIDE-Development-Environment.md).  

-   [!INCLUDE[nav_windows](includes/nav_windows_md.md)] \(optional\)  

     There are many administration and operational tasks, such as creating profiles, setting users, and publishing web services, which cannot be done by using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. Although you can use the [!INCLUDE[nav_web](includes/nav_web_md.md)] for performing these tasks, it is sometimes easier and more efficient to use the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. Also, to configure or personalize the [!INCLUDE[nav_web](includes/nav_web_md.md)] interface, you must use the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

     For more information, see [Client Option](Client-Option.md).  

-   [!INCLUDE[nav_admin](includes/nav_admin_md.md)] \(optional\)  

     The [!INCLUDE[nav_admin](includes/nav_admin_md.md)] is a Microsoft Management Console \(MMC\) snap-in that you can use to manage the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance that is used by the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

     For more information, see [Microsoft Dynamics NAV Server Administration Tool](Microsoft-Dynamics-NAV-Server-Administration-Tool.md).  

##  <a name="CreateObjects"></a> Create Microsoft Dynamics NAV Objects  
 The development experience for the [!INCLUDE[nav_web](includes/nav_web_md.md)] application is like [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. You use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to create [!INCLUDE[navnow](includes/navnow_md.md)] objects to support the logic for the business scenario. Some of the major tasks include the following:  

-   Creating table objects in [!INCLUDE[navnow](includes/navnow_md.md)] to implement the design of your database.  

-   Creating pages for entering and retrieving data.  

-   Creating reports for viewing and presenting data.  

-   Writing C/AL code on object triggers to perform runtime operations.  

 As you develop [!INCLUDE[nav_web](includes/nav_web_md.md)] applications, you should consider the following factors.  

-   The same objects can be used in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

-   The [!INCLUDE[nav_web](includes/nav_web_md.md)] supports most of the features that the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] supports, but there are some exceptions and limitations, which you must consider in your design. For more information, see [Feature Limitations of the Microsoft Dynamics NAV Web Client](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md).  

-   Do you want your solution to be available on [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] as well? For more information, see [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md).  

 For more information about how to develop [!INCLUDE[navnow](includes/navnow_md.md)] objects for [!INCLUDE[nav_web](includes/nav_web_md.md)] applications, see [Development](Development.md).  

### Follow the Microsoft Dynamics NAV User Experience Guidelines  
 The [!INCLUDE[navnow](includes/navnow_md.md)] User Experience guidelines can help you develop high quality and consistent applications. The guidelines provide answers to specific user experience issues, such as determining which page type to use or which components to include on a page. You can use the guidelines to design new application or improve existing ones.  

 For more information, see [Microsoft Dynamics NAV User Experience Guidelines](https://go.microsoft.com/fwlink/?LinkID=317424) in the MSDN Library.  

##  <a name="Users"></a> Create Users and Grant Permissions to Objects  
 Like the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], you restrict access to [!INCLUDE[navnow](includes/navnow_md.md)] data by creating users in [!INCLUDE[navnow](includes/navnow_md.md)] and applying permission sets that grant access to [!INCLUDE[navnow](includes/navnow_md.md)] objects, such as pages and reports. You do not have to create separate user accounts for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. The same permission sets are applied to the user in both clients.  

 For more information, see [Managing Users](Managing-Users.md) and [Managing Permissions and Permission Sets](Managing-Permissions-and-Permission-Sets.md).  

##  <a name="Profiles"></a> Create Profiles and Assign Users  
 Profiles are collections of [!INCLUDE[navnow](includes/navnow_md.md)] users who share the same Role Center. You create a profile and then assign users to the profile. The profile is applied to the user in all clients.  

 For more information, see [Profiles and Role Centers](Profiles-and-Role-Centers.md).  

## See Also  
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Application Design Overview](Application-Design-Overview.md)   
 [Accessibility Features of Microsoft Dynamics NAV Windows Client](Accessibility-Features-of-Microsoft-Dynamics-NAV-Windows-Client.md)
