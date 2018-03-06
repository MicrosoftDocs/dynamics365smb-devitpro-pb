---
title: "Deciding on Your Tablet and Phone Strategy"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 87c32712-d160-4ebc-90c1-726f09dfdcc5
caps.latest.revision: 21
manager: edupont
---
# Deciding on Your Tablet and Phone Strategy
To offer users a great mobile experience, you must decide on a strategy for how to accomplish this based on an analysis of your users’ needs. This topic explains the different options for developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)], but the documentation you will find in this section is primarily focused on the first of these scenarios.  
  
## Universal App Development Strategy  
 This section briefly describes some of the options that exist for [!INCLUDE[navnow](includes/navnow_md.md)].  
  
|Development strategy|Advantages|What also to consider|Examples|For more information, see|  
|--------------------------|----------------|---------------------------|--------------|-------------------------------|  
|Use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] to modify and extend the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]. This scenario resembles developing for [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)].|-   Extending and modifying [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is useful for a minimal learning curve and a reduction of development costs; scenarios automatically work on multiple operating systems without having to worry about the maintenance.<br />-   Reusing existing investments in [!INCLUDE[navnow](includes/navnow_md.md)] page objects, business logic, and javascript-based client add-ins. Ideal for user scenarios which can be achieved by using simple application pages.|[!INCLUDE[navnow](includes/navnow_md.md)] only supports a specific number of page types, and this can be a limitation in some type of development projects.|-   For salespeople tracking customers, looking up item details, and capturing orders.<br />-   For technicians on the road using and re-ordering spare parts.<br />-   For simple approval scenarios.|[Introducing the Microsoft Dynamics NAV Universal App](Introducing-the-Microsoft-Dynamics-NAV-Universal-App.md)<br /><br /> [Getting Started Developing for the Microsoft Dynamics NAV Universal App](Getting-Started-Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)|  
|Based on OData web services or SOAP web services technologies, write an app that interacts with [!INCLUDE[navnow](includes/navnow_md.md)]. Visual Studio includes project templates for this kind of apps.|This strategy applies when you want to build a highly-custom app with your own UI design that takes advantage of all the rich features which native apps provide.|Cost to learn development tools and languages outside C/SIDE, preparing new development environments. Cost of licensing any one of these tools, and having to maintain code for different operating systems.|A simple touch interface for users to scan their access card for time registration.|[Using OData Web Services to Modify Data](Using-OData-Web-Services-to-Modify-Data.md)<br /><br /> [OData Web Services](OData-Web-Services.md)<br /><br /> [SOAP Web Services](SOAP-Web-Services.md)<br /><br /> [Web Services](Web-Services.md)<br /><br /> [Web Service Walkthroughs](Web-Service-Walkthroughs.md)|  
|Specifically for developers, use a browser for continuous development and test of the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] solution that you are working on.|Switching to running in a browser is an easy and efficient way to test what new and modified pages look like.|Running the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser is only recommended for development scenarios.|Testing a Role Center throughout the development process from a browser.|[How to: Open the Microsoft Dynamics NAV Tablet or Phone Client from a Browser](How-to--Open-the-Microsoft-Dynamics-NAV-Tablet-or-Phone-Client-from-a-Browser.md)|  
  
## See Also  
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [Getting Started Developing for the Microsoft Dynamics NAV Universal App](Getting-Started-Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)