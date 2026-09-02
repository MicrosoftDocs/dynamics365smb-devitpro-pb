---
title: Deciding on Your Tablet and Phone Strategy
description: Compare the options for delivering a Business Central mobile experience, including extending the tablet and phone clients, Power Apps, and connected apps.
ms.date: 08/24/2026
ms.reviewer: solsen
ms.topic: concept-article
author: SusanneWindfeldPedersen
ms.author: solsen
---

# Deciding on your tablet and phone strategy

To offer users a great mobile experience, decide on a strategy based on an analysis of your users' needs. This article explains the different options for developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]. The documentation in this section focuses primarily on the first of these scenarios.  
  
## Mobile app development strategy  
This section briefly describes some of the options that exist for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].    

|Development strategy|What else to consider|Examples|Learn more|  
|--------------------------|----------------|---------------------------|--------------|  
|**Business Central platform**<br />Use the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to modify and extend the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)].This scenario resembles developing for [!INCLUDE[nav_web](includes/nav_web_md.md)]. The main advantages of this strategy are: <br /><br />- Extending and modifying [!INCLUDE[prod_short](includes/prod_short.md)] tablet and phone clients is useful for a minimal learning curve and a reduction of development costs; scenarios automatically work on multiple operating systems without having to worry about the maintenance.<br /><br />- You can reuse existing investments in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] page objects, business logic, and JavaScript-based client add-ins. Ideal for user scenarios which can be achieved by using simple application pages.<img width=250/>|[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] only supports a specific number of page types, and this limitation can affect some types of development projects.<img width=25/>|- For salespeople tracking customers, looking up item details, and capturing orders.<br /><br />- For technicians on the road using and re-ordering spare parts.<br /><br />- For simple approval scenarios.<img width=150/>|[Introducing the Dynamics 365 Business Central Mobile App](devenv-introducing-business-central-mobile-app.md)<br /><br /> [Getting Started Developing for the Dynamics 365 Business Central Mobile App](devenv-getting-started-developing-business-central-mobile-app.md)<img width=125/>|  
|**Power App**<br />Use the Power Apps platform connected to [!INCLUDE[prod_short](includes/prod_short.md)] either by using the [!INCLUDE[prod_short](includes/prod_short.md)] connector in Power Apps or a custom connector to access and modify your data.|The standard [!INCLUDE[prod_short](includes/prod_short.md)] connector for Power Apps only supports built-in APIs, so you might need to use the custom connector feature to access your custom APIs.|For field salesforce that needs a user experience that's more customized or tightly connected to third-party software or hardware.|[Connecting to Your Business Central Data to Build a Business App Using Power Apps](/dynamics365/business-central/across-how-use-financials-data-source-powerapps)<br /><br />[Create a canvas app from a template in Power Apps](/powerapps/maker/canvas-apps/get-started-test-drive)|
|**Connected mobile app**<br />Based on OData web services or SOAP web services technologies, write an app that interacts with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Visual Studio includes project templates for this kind of app.<br /><br /> This strategy applies when you want to build a highly customized app with your own UI design that takes advantage of all the rich features which native apps provide.|Cost to learn development tools and languages outside AL, preparing new development environments. <br /><br />Cost of licensing any of these tools, and having to maintain code for different operating systems.|A simple touch interface for users to scan their access card for time registration.|[OData web services data modification](../webservices/use-odata-to-modify-data.md)<br /><br /> [OData web services](../webservices/OData-Web-Services.md)<br /><br /> [SOAP web services](../webservices/SOAP-Web-Services.md)<br /><br /> [Web services](../webservices/web-services.md)<br /><br />|  

## Remarks
If you develop by using the AL language, use a browser for continuous development and testing of the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] solution that you're working on. Switching to running in a browser is an easy and efficient way to test what new and modified pages look like. We only recommend running the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser for development scenarios. Learn more in [Opening the Business Central tablet or phone client from a browser](devenv-opening-business-central-tablet-or-phone-client-from-browser.md).

## Related information

[Get started developing for the Business Central mobile app](devenv-getting-started-developing-business-central-mobile-app.md)  
[Introducing the Business Central mobile app](devenv-introducing-business-central-mobile-app.md)  
