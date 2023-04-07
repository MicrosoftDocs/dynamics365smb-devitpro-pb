---
title: "Microsoft Dynamics Online Connect"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 143a477f-63a9-4a95-b6b0-b4b4dfec5a61
caps.latest.revision: 9
---
# Microsoft Dynamics Online Connect
If your installation includes both the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and the [!INCLUDE[demolong](includes/demolong_md.md)], then you have the option of offering Microsoft Dynamics Online Connect to client users. Microsoft Dynamics Online Connect is a Web service that displays Microsoft Dynamics product and business information from online sources such as CustomerSource and the Microsoft Dynamics online community and provides links into those online sources. The actual list of links is customized for each Role Center.  
  
 Microsoft Dynamics Online Connect is displayed by default on some Role Centers, can be configured to be displayed on most other Role Centers, and is unavailable on a few Role Centers. See [How to: Include Microsoft Dynamics Online Connect on Role Centers](How-to--Include-Microsoft-Dynamics-Online-Connect-on-Role-Centers.md) for information on which Role Centers offer Microsoft Dynamics Online Connect, and for information on how to configure Role Centers to either include or exclude Microsoft Dynamics Online Connect.  
  
## Security Consideration for Microsoft Dynamics Online Connect  
 Microsoft Dynamics Online Connect sends the following information about the [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] software over the Internet to Microsoft:  
  
-   Product name  
  
-   Product version  
  
-   Some license information, but not the license number  
  
-   Country/region version  
  
-   Language  
  
-   Profile, which is based on the Role Center ID  
  
 No other information is sent.  
  
### Internet Access  
 If you decide to make Microsoft Dynamics Online Connect available to users, then they will require Internet access to use the service. If you have not previously offered Internet access to users, then you should consider the security implications before implementing Microsoft Dynamics Online Connect.  
  
## See Also  
 [Security and Protection](Security-and-Protection.md)
