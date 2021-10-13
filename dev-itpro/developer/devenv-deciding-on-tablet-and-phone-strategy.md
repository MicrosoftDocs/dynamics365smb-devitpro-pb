---
title: "Deciding on Your Tablet and Phone Strategy"
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: solsen
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
author: blrobl
---
# Deciding on Your Tablet and Phone Strategy
To offer users a great mobile experience, you must decide on a strategy for how to accomplish this based on an analysis of your users' needs. This topic explains the different options for developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)], but the documentation you will find in this section is primarily focused on the first of these scenarios.  
  
## Mobile app development strategy  
This section briefly describes some of the options that exist for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)].    

|Development strategy|What also to consider|Examples|For more information, see|  
|--------------------------|----------------|---------------------------|--------------|-------------------------------|  
|**Business Central platform**<br />Use the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)] to modify and extend the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)].This scenario resembles developing for [!INCLUDE[nav_web](includes/nav_web_md.md)]. The main advantages of this strategy are: <br /><br />- Extending and modifying [!INCLUDE[prod_short](includes/prod_short.md)] tablet and phone clients is useful for a minimal learning curve and a reduction of development costs; scenarios automatically work on multiple operating systems without having to worry about the maintenance.<br /><br />- You can reuse existing investments in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] page objects, business logic, and javascript-based client add-ins. Ideal for user scenarios which can be achieved by using simple application pages.<img width=250/>|[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] only supports a specific number of page types, and this can be a limitation in some type of development projects.<img width=25/>|- For salespeople tracking customers, looking up item details, and capturing orders.<br /><br />- For technicians on the road using and re-ordering spare parts.<br /><br />- For simple approval scenarios.<img width=150/>|[Introducing the Dynamics 365 Business Central Mobile App](devenv-introducing-business-central-mobile-app.md)<br /><br /> [Getting Started Developing for the Dynamics 365 Business Central Mobile App](devenv-getting-started-developing-business-central-mobile-app.md)<img width=125/>|  
|**Power App**<br />Use the Power Apps platform connected to [!INCLUDE[prod_short](includes/prod_short.md)] either using the [!INCLUDE[prod_short](includes/prod_short.md)] connector in Power Apps or custom connector and access your modify data.|The standard [!INCLUDE[prod_short](includes/prod_short.md)] connector for Power Apps only supports built in APIs, so you may need to use custom connector feature to access your custom APIs.|For field salesforce in need of user experience that is more customized or tightly connected to 3rd party software or hardware.|[Connecting to Your Business Central Data to Build a Business App Using Power Apps](/dynamics365/business-central/across-how-use-financials-data-source-powerapps)<br /><br />[Create a canvas app from a template in Power Apps](/powerapps/maker/canvas-apps/get-started-test-drive)|
|**Connected mobile app**<br />Based on OData web services or SOAP web services technologies, write an app that interacts with [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. Visual Studio includes project templates for this kind of app.<br /><br /> This strategy applies when you want to build a highly customized app with your own UI design that takes advantage of all the rich features which native apps provide.|Cost to learn development tools and languages outside AL, preparing new development environments. <br /><br />Cost of licensing any of these tools, and having to maintain code for different operating systems.|A simple touch interface for users to scan their access card for time registration.|[OData Web Services Data Modification](../webservices/use-odata-to-modify-data.md)<br /><br /> [OData Web Services](../webservices/odata-web-services.md)<br /><br /> [SOAP Web Services](../webservices/soap-web-services.md)<br /><br /> [Web Services](../webservices/web-services.md)<br /><br />|  

## Remarks
If you are developing using the AL language, use a browser for continuous development and test of the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] solution that you are working on. Switching to running in a browser is an easy and efficient way to test what new and modified pages look like. Running the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] in a browser is only recommended for development scenarios. For more information, see [Opening the Dynamics 365 Business Central Tablet or Phone Client from a Browser](devenv-opening-business-central-tablet-or-phone-client-from-browser.md).

## See Also  
 [Getting Started Developing for the Dynamics 365 Business Central Mobile App](devenv-getting-started-developing-business-central-mobile-app.md)  
 [Introducing the Business Central Mobile App](devenv-introducing-business-central-mobile-app.md)