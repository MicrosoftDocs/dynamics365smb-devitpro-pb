---
title: "Troubleshooting: Icon Font Not Loaded"
ms.custom: na
ms.date: 04/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics365-business-central"
author: blrobl
---
# Troubleshooting: Icon Font Not Loaded
The Icon font is missing on the [!INCLUDE[nav_web](includes/nav_web_md.md)], [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)], or [!INCLUDE[nav_phone](includes/nav_phone_md.md)] preventing you from seeing, for example, the plus sign in front of the **New** action.  
  
## Resolution  
 The reason is that the **Font download** option is disabled in your browser and the resolution is to add the [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] web site to your trusted sites.  
  
1.  Launch Internet Explorer and then open the [!INCLUDE[d365_bus_cent_short](includes/d365_bus_cent_short_md.md)] web site.  
  
2.  Go to **Internet options**, and choose the **Security** tab.  
  
3.  Choose **Trusted sites**, and then choose the **Sites** button.  
  
4.  Next to the **Add this website to the zone** field, choose the **Add** button, and then choose the **Close** button.  
  
5.  In the **Internet Options** window, choose the **OK** button.  
  
## See Also  
 [Troubleshooting the Business Central Mobile App](devenv-Troubleshooting-the-Mobile-App.md)  