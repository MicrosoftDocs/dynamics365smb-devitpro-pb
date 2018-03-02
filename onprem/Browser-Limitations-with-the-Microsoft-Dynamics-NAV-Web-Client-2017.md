---
title: "Browser Limitations with the Microsoft Dynamics NAV Web Client"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2017"
ms.assetid: c87f0ac3-97d8-4afc-bcf6-a331cf45dd21
caps.latest.revision: 18
---
# Browser Limitations with the Microsoft Dynamics NAV Web Client

**Applies to:** [!INCLUDE[nav2017](includes/nav2017.md)]. [See [!INCLUDE[nav2018_md](includes/nav2018_md.md)] version](Browser-Limitations-with-the-Microsoft-Dynamics-NAV-Web-Client.md).

The [!INCLUDE[nav_web](includes/nav_web_md.md)] supports several browsers. There are some [!INCLUDE[navnow](includes/navnow_md.md)] features that are not supported by all browsers.  

 For a list of the supported browsers and versions, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

## Feature Limitations  
 The following table describes the feature limitations and known issues with the supported browsers.  

> [!IMPORTANT]  
>  The [!INCLUDE[nav_web](includes/nav_web_md.md)] is designed for keyboard and mouse usage. If you want to use a touch-enabled device, we recommend running the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)].  

|Feature|Description|Browser|Remarks|  
|-------------|-----------------|-------------|-------------|  
|Previewing a report|The **Preview** button does not appear on the request pages of reports.|Google Chrome<br /><br />Microsoft Edge<br /><br />Mozilla Firefox<br /><br /> Safari||  
|Printing a report from the report preview|If you try to print a report from the report preview, then you will get a script error message.|Internet Explorer 10 \(in the Windows 8-style UI mode\)|This is because Windows 8-style UI does not support plugins. To print a report, open the report as a PDF, and then print the report from the PDF viewer.|  
|Tooltips in the ribbon|Tooltips do not appear when you pause on an action with the pointer.|Safari||  
|Tooltips for error messages and icons on pages|Tooltips do not appear when you pause on an error message or an icon on a page with the pointer.|Internet Explorer 10 \(on tablets that run Windows 8\)<br /><br /> Safari|To see the tooltip, you must tap the message or icon.|  
|Dragging the cursor in a field|If you drag the cursor in a field, then the field becomes blocked and you cannot enter any data.|Safari|To make it possible to enter data, refresh the browser or start a new browser session.|  
|Scrolling a list by using one finger|You cannot scroll a list by using a one finger scrolling gesture.|Safari|To scroll a list, use a two finger scrolling gesture.|  
|Windows authentication|Validating user credentials by using Windows authentication is not supported.|Safari|For more information about authentication and credentials, see [Users and Credential Types](Users-and-Credential-Types.md).|  
|Documentation Feedback link in the Microsoft Dynamics NAV Online Help.|Using the Documentation Feedback link does not work.|Mozilla Firefox|Use a different browser to provide feedback.|  


## See Also  
 [Feature Limitations of the Microsoft Dynamics NAV Web Client](Feature-Limitations-of-the-Microsoft-Dynamics-NAV-Web-Client.md)   
 [Microsoft Dynamics NAV Web Client](Microsoft-Dynamics-NAV-Web-Client.md)   
 [Deploying the Microsoft Dynamics NAV Web Server Components](Deploying-the-Microsoft-Dynamics-NAV-Web-Server-Components.md)   
 [Developing for the Microsoft Dynamics NAV Web Client](Developing-for-the-Microsoft-Dynamics-NAV-Web-Client.md)   
 [How to: Open the Microsoft Dynamics NAV Web Client](How-to--Open-the-Microsoft-Dynamics-NAV-Web-Client.md)
