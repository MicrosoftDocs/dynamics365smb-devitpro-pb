---
title: Get started developing for the Dynamics 365 Business Central mobile app
description: Learn how to develop for the Dynamics 365 Business Central Mobile App with this comprehensive guide. Includes design tips, best practices, and deployment steps.
ms.date: 03/01/2024
ms.reviewer: na
ms.topic: conceptual
author: SusanneWindfeldPedersen
ms.collection: get-started
---

# Get started developing for the Business Central mobile app

The [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] are built on the same framework as the [!INCLUDE[nav_web](includes/nav_web_md.md)], such that they're all based on the same [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] pages. Developing for [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] isn't much different from developing pages for [!INCLUDE[nav_web](includes/nav_web_md.md)] either, since it's also done from the [!INCLUDE[d365_dev_long_md](includes/d365_dev_long_md.md)].  

## Steps for developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)]

The first step to take when you're developing for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] is to consider the design and implementation of the solution:  
  
- What is the business scenario that you want to support?  
- Do you want to extend your existing data model?  
- Should the solution work well on both a desktop computer, on the tablet and also on a phone?  
- What design should the Role Center that is the central dashboard for the solution have?  
  
Understanding the business scenario is important to build the best solution. Design your solution for users who are most typically occasional users who need an overview of their daily work status and perform relatively simple or light data entry. Many of these preparations resemble those for developing for [!INCLUDE[nav_web](includes/nav_web_md.md)], but in an even smaller scale. <!--For more information, see [Developing for the Dynamics 365 Business Central Web Client](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md).-->  
  
Once the data model, users, permissions, and profiles are in place, you can start developing the Role Center. You can either reuse an existing Role Center or create a new one. This depends on the business scenario. The [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] are designed to be smart about laying out the same Role Center depending on the display target. 
<!--For a walkthrough that illustrates how to create a new Role Center specifically for the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)], see [Example: Developing a Sales Rep Role Center for the Dynamics 365 Business Central Tablet Client](devenv-walkthrough-developing-sales-rep-rolecenter-business-central-tablet-client.md). -->
 
When developing for the [!INCLUDE[nav_phone](includes/nav_phone_md.md)] you want to think even more about design and usability on a small screen. On the phone the app always by default starts a page in view mode, meaning that the user actively must switch to edit mode. 
  
There are some best practices and limitations to consider in particular caused by the smaller screen size and touch experience. For more information, see [Differences and limitations When developing pages for the Dynamics 365 Business Central mobile app](devenv-differences-and-limitations-developing-pages-business-central-mobile-app.md). On devices that run the [!INCLUDE[d365fin_uni_app_md](includes/d365fin_uni_app_md.md)] and have a camera and location capability you also have a couple of more options. For more information, see [Implementing the camera in AL](devenv-implement-camera-al.md) and [Implementing location in AL](devenv-implement-location-al.md).  

To complete designing your [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] solution, you should consider offering users help, to guide them through pages or workflows. For more information about adding help to your solution, see [Contribute to the help for Dynamics 365 Business Central](../help/contributor-guide.md).
  
The next steps are to consider how to deploy your solution and how to distribute it to your customers. After you complete your solution, you can send an e-mail to the users to let them know that they can download [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] from the relevant store and include the organization URL and sign-in information. For more information, see [Linking to the Dynamics 365 Business Central mobile app](devenv-link-to-mobile-app.md).  
  
## See also

[Deciding on your tablet and phone strategy](devenv-deciding-on-tablet-and-phone-strategy.md)  
[Differences and limitations when developing pages for the Dynamics 365 Business Central mobile app](devenv-differences-and-limitations-developing-pages-business-central-mobile-app.md)  
<!--[Example: Developing a Sales Rep Role Center for the Dynamics 365 Business Central Tablet Client](devenv-walkthrough-developing-sales-rep-rolecenter-business-central-tablet-client.md)-->