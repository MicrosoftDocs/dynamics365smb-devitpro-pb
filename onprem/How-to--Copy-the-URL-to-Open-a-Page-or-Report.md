---
title: Copy URL to Open a Page or Report
description: Generate URL for opening page and report request page, create shortcut and send to people as hyperlink from Windows Client, SOAP, OData web services.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
author: jswymer
---
# Copy the URL to Open a Page or Report in Dynamics NAV
[!INCLUDE[navnow](includes/navnow_md.md)] generates URLs for opening pages and report request pages from the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], the [!INCLUDE[nav_web](includes/nav_web_md.md)], and SOAP and OData web services. You can copy these URLS from the About This Page window and save them as shortcuts for your own use, or you can send them to other people as hyperlinks, for example.  
  
 The URLs are generated based on the GETURL function that you can also use in your code. For more information, see [GETURL Function](GETURL-Function.md).  
  
> [!NOTE]  
>  You can only view the URLs in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
### To view URLS for a Page  
  
1.  In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], in the relevant page, in the Application menu, point to **Help**, and then choose **About This Page**.  
  
2.  On the **URLs** FastTab, copy the link that you want to use.  
  
     The following table shows the syntax for the URLs.  
  
    |Field|URL|  
    |-----------|---------|  
    |[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|DynamicsNAV://*server*/*instance*/*company*|  
    |[!INCLUDE[nav_web](includes/nav_web_md.md)]|https://*server*:*port*/*instance*/?company='*MyCompany*'/ or https://*server*:*port*/*instance*/WebClient?company='*MyCompany*' (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions).|  
    |OData client|https://*server*:*port*/*instance*/OData/Company\('*MyCompany*'\)/|  
    |SOAP client|https://*server*:*port*/*instance*/WS/*MyCompany*|  
  
### To view URLS for a Report  
  
1.  In the [!INCLUDE[nav_windows](includes/nav_windows_md.md)], in the relevant report request page, in the Application menu, point to **Help**, and then choose **About This Page**.  
  
2.  On the **URLs** FastTab, copy the link that you want to use.  
  
     The following table shows the syntax for the URLs.  
  
    |Field|URL|  
    |-----------|---------|  
    |[!INCLUDE[nav_windows](includes/nav_windows_md.md)]|DynamicsNAV://*server*/*instance*/*company*|  
    |[!INCLUDE[nav_web](includes/nav_web_md.md)]|https://*server*:*port*/*instance*/?company='*MyCompany*' or https://*server*:*port*/*instance*/WebClient?company='*MyCompany*'/ (for [!INCLUDE[nav2017](includes/nav2017.md)] and earlier versions)|  
  
## See Also  
 [Using About This Page and About This Report](Using-About-This-Page-and-About-This-Report.md)   
 [GETURL Function](GETURL-Function.md)   
 [Creating and Running Hyperlinks](Creating-and-Running-Hyperlinks.md)