---
title: "Getting Started Developing for the Microsoft Dynamics NAV Universal App"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: ea808715-db54-478b-8a33-72b961e833dd
caps.latest.revision: 30
manager: edupont
---
# Getting Started Developing for the Microsoft Dynamics NAV Universal App
The [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]s are built on the same framework as the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[nav_web](includes/nav_web_md.md)]. The [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] offer a framework for building an app based on [!INCLUDE[navnow](includes/navnow_md.md)] pages. Developing for [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is not much different from developing pages for [!INCLUDE[nav_windows](includes/nav_windows_md.md)] or [!INCLUDE[nav_web](includes/nav_web_md.md)] using the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
 Using the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] you can develop content for the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] that allow users in small and medium sized businesses to access [!INCLUDE[navnow](includes/navnow_md.md)] data from a tablet or a phone. Developing for tablets and phones provides flexibility for end-users who can perform their daily tasks from anywhere, outside the office, on the train, passing time and so on with just a tablet or phone available.  
  
## Microsoft Dynamics NAV Tablet and Phone Client Prerequisites  
 To be able to run [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)], the [!INCLUDE[nav_web_server](includes/nav_web_server_md.md)] must be installed. For more information, see [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md).  
  
## Steps for Developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]  
 The first step to take when you are developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is to consider the design and implementation of the solution:  
  
-   What is the business scenario that you want to support?  
  
-   Do you want to extend your existing data model?  
  
-   Should the solution work well on both a desktop computer, on the tablet and also on a phone?  
  
-   What design should the Role Center that will be the central dashboard for the solution have?  
  
 Understanding the business scenario is important to build the best solution. Design your solution for users who are most typically occasional users who need an overview of their daily work status and perform relatively simple or light data entry. Many of these preparations resemble those for developing for [!INCLUDE[nav_web](includes/nav_web_md.md)], but in an even smaller scale. For more information, see [Developing for the Microsoft Dynamics NAV Web Client](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md).  
  
 Once the data model, users, permissions, and profiles are in place, you can start developing the Role Center. You have two options: You can either reuse an existing Role Center or create a new one. This will depend on the business scenario. The [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] are designed to be smart about laying out the same Role Center depending on the display target. Later in this section, you can read a walkthrough that illustrates how to create a new Role Center specifically for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)]. For more information, see [Walkthrough: Developing a Sales Rep Role Center for the Microsoft Dynamics NAV Tablet Client](Walkthrough--Developing-a-Sales-Rep-Role-Center-for-the-Microsoft-Dynamics-NAV-Tablet-Client.md). When developing for the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] you want to continue similarly, but think even more about design and usability on a very small screen. On the phone the app will always by default start a page in view mode meaning that the user actively must switch to edit mode. This is based on the most common use, and avoids the accidental change of data.  
  
 There are some best practices and limitations to consider in particular caused by the smaller screen size and touch experience. For more information, see [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md). On devices that have a camera and GPS capability and also run the Dynamics NAV Universal App you have a couple of additional options. For more information, see [How to: Implement the Camera in C-AL](How-to--Implement-the-Camera-in-C-AL.md) and [How to: Implement Location in C-AL](How-to--Implement-Location-in-C-AL.md).  
  
 The next steps are to consider how to deploy your solution and how to distribute it to your customers. After you have completed your solution, you can send an e-mail to the users to let them know that they can download [!INCLUDE[navnow](includes/navnow_md.md)] from the relevant store. In the e-mail, you can include the organization URL and sign-in information. For more information, see [Linking to the Microsoft Dynamics NAV Universal App](Linking-to-the-Microsoft-Dynamics-NAV-Universal-App.md).  
  
## See Also  
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Deciding on Your Tablet and Phone Strategy](Deciding-on-Your-Tablet-and-Phone-Strategy.md)   
 [Differences and Limitations When Developing Pages for the Microsoft Dynamics NAV Universal App](Differences-and-Limitations-When-Developing-Pages-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Walkthrough: Developing a Sales Rep Role Center for the Microsoft Dynamics NAV Tablet Client](Walkthrough--Developing-a-Sales-Rep-Role-Center-for-the-Microsoft-Dynamics-NAV-Tablet-Client.md)