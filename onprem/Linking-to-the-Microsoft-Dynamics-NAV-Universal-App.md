---
title: "Linking to the Microsoft Dynamics NAV Universal App"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: d5d0499a-2770-4c7f-bbc8-ad2795656686
caps.latest.revision: 17
---
# Linking to the Microsoft Dynamics NAV Universal App
The protocol handler for the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] lets you construct a URL for starting the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] on a device. You can then distribute this URL by e-mail or from a Web page to the users.  
  
 The *ms-dynamicsnav* scheme is registered automatically when the app is installed. From this point onward, invoking a URL based on this URI scheme will start the app with the provided parameters.  
  
## Constructing the URL  
 To enable starting the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] from a link, construct a URL with the *ms-dynamicsnav* scheme pointing to your [!INCLUDE[navnow](includes/navnow_md.md)] Web server.  
  
 The structure of a [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] link is very similar to links for the [!INCLUDE[nav_web](includes/nav_web_md.md)] and resembles this:  
  
 `ms-dynamicsnav://<Server>:<Port>/<Instance>/[?tenant=<Tenant>&company=<Company>]/?profile=/?page=`  
  
|Parameter|Description|  
|---------------|-----------------|  
|Server|Optional. The public address for your [!INCLUDE[nav_web](includes/nav_web_md.md)] server.|  
|Port|Optional. The port number for your [!INCLUDE[nav_web](includes/nav_web_md.md)] server. If not provided, the standard SSL port \(443\) is used.|  
|Instance|Optional. The [!INCLUDE[nav_web](includes/nav_web_md.md)] instance that you want to connect to.|  
|Tenant|Optional. The tenant that you want to connect to. If not provided, the default tenant is used.|  
|Company|Optional. The company that you want to connect to. If not provided, the default company is used.|  
|Profile|Optional. The profile that you want to connect with. If not provided, the default profile is used.|  
|Page|Optional. The ID of the page that you want to open directly.|
|Redirect|Optional. When users run the [!INCLUDE[nav_web_md](includes/nav_web_md.md)] in a browser, they will be presented with an option to download the [!INCLUDE[nav_uni_app](includes/nav_uni_app_md.md)] instead in order to improve the user experience. However, if this is not a wanted scenario, this experience can be manually overridden by adding the parameter ```?redirect=0``` to the URL.|  
  
> [!NOTE]  
>  It is not possible to specify which client type to open up the URL in; the last used client will open up when clicking the URL.  
  
> [!WARNING]  
>  The URL `ms-dynamicsnav:///?page=21` will open the server that you last connected to on the specified page.  
  
### URL Examples  
 The following examples demonstrate how to use the parameters from the table earlier in this section:  
  
-   *ms-dynamicsnav://myserver/myinstance/*  
  
-   *ms-dynamicsnav://myserver:440/myinstance/*  
  
-   *ms-dynamicsnav://myserver/myinstance/?company=MyOtherCompany*  
  
-   *ms-dynamicsnav://myserver/myinstance/?tenant=myTenant2&company=MyCompany2*  
  
> [!IMPORTANT]  
>  The *ms-dynamicsnav* scheme only translates to a secure server connection. Therefore the [!INCLUDE[nav_tablet](includes/nav_tablet_md.md)] and [!INCLUDE[nav_phone](includes/nav_phone_md.md)] must be exposed through an https connection. For more information, see [How to: Configure SSL to Secure the Connection to Microsoft Dynamics NAV Web Client](How-to--Configure-SSL-to-Secure-the-Connection-to-Microsoft-Dynamics-NAV-Web-Client.md).  
  
### Adding Username to the URL  
 The *ms-dynamicsnav* scheme also supports sending the user name in the URL for prefilling the user name. The password must be entered by the user. To send the user name, you must URL encode the value and prefix the server address by using *\<encoded username>@*. Examples are as follows:  
  
-   *ms-dynamicsnav://demouser%40mycompany.com@myserver/myinstance/*  
  
-   *ms-dynamicsnav://user1:@myserver/myinstance/*  
  
> [!IMPORTANT]  
>  We recommend that you do not share a user name in the URL. This technique should only be used in demonstration scenarios and other instances where the accidental sharing of a URL will not compromise the system.  
  
## See Also  
 [Developing for the Microsoft Dynamics NAV Universal App](Developing-for-the-Microsoft-Dynamics-NAV-Universal-App.md)   
 [How to: Open the Microsoft Dynamics NAV Tablet or Phone Client from a Browser](How-to--Open-the-Microsoft-Dynamics-NAV-Tablet-or-Phone-Client-from-a-Browser.md)