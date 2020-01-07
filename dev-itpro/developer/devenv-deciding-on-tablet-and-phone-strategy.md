---
title: "Deciding on Your Tablet and Phone Strategy"
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: blrobl
---
# Deciding on Your Tablet and Phone Strategy
To offer users a great mobile experience, you must decide on a strategy for how to accomplish this based on an analysis of your users’ needs. This topic explains the different options for developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)], but the documentation you will find in this section is primarily focused on the first of these scenarios.  
  
## Universal App Development Strategy  
 This section briefly describes some of the options that exist for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].  
  
|Development strategy|Advantages|What also to consider|Examples|For more information, see|  
|--------------------------|----------------|---------------------------|--------------|-------------------------------|  
|Use the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to modify and extend the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]. This scenario resembles developing for [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and [!INCLUDE[nav_web](includes/nav_web_md.md)].|-   Extending and modifying [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is useful for a minimal learning curve and a reduction of development costs; scenarios automatically work on multiple operating systems without having to worry about the maintenance.<br />-   Reusing existing investments in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] page objects, business logic, and javascript-based client add-ins. Ideal for user scenarios which can be achieved by using simple application pages.|[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] only supports a specific number of page types, and this can be a limitation in some type of development projects.|-   For salespeople tracking customers, looking up item details, and capturing orders.<br />-   For technicians on the road using and re-ordering spare parts.<br />-   For simple approval scenarios.|[Introducing the Dynamics 365 Business Central Universal App](devenv-introducing-business-central-universal-app.md)<br /><br /> [Getting Started Developing for the Dynamics 365 Business Central Universal App](devenv-getting-started-developing-business-central-universal-app.md)|  
|Based on OData web services or SOAP web services technologies, write an app that interacts with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Visual Studio includes project templates for this kind of apps.|This strategy applies when you want to build a highly-custom app with your own UI design that takes advantage of all the rich features which native apps provide.|Cost to learn development tools and languages outside AL, preparing new development environments. Cost of licensing any one of these tools, and having to maintain code for different operating systems.|A simple touch interface for users to scan their access card for time registration.|[OData Web Services Data Modification](../webservices/use-odata-to-modify-data.md)<br /><br /> [OData Web Services](../webservices/odata-web-services.md)<br /><br /> [SOAP Web Services](../webservices/soap-web-services.md)<br /><br /> [Web Services](../webservices/web-services.md)<br /><br />|  
|Specifically for developers, use a browser for continuous development and test of the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] solution that you are working on.|Switching to running in a browser is an easy and efficient way to test what new and modified pages look like.|Running the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser is only recommended for development scenarios.|Testing a Role Center throughout the development process from a browser.|[Opening the Dynamics 365 Business Central Tablet or Phone Client from a Browser](devenv-opening-business-central-tablet-or-phone-client-from-browser.md) |  
  
## See Also  
 [Developing for the Dynamics 365 Business Central Universal App](devenv-developing-for-the-business central-universal-app.md)   
 [Getting Started Developing for the Dynamics 365 Business Central Universal App](devenv-getting-started-developing-business-central-universal-app.md)