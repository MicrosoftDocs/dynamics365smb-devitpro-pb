---
title: Embed the Web Client Pages
description: Deploy the Web client as an independent website in an internal company portal containing data from Business Central including document handling, newsfeed etc.
ms.custom: na
ms.date: 04/01/2021
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
author: jswymer
---
# Embedding Business Central Web Client in Other Websites

The [!INCLUDE[webclient](includes/webclient.md)] can be deployed as an independent website. In some cases, it is useful to embed parts of the [!INCLUDE[webclient](includes/webclient.md)] in other websites, for example, in order to build an internal company portal that not only contains data from [!INCLUDE[prod_short](includes/prod_short.md)], but also contains news feeds, document handling, and so on  

You can do this by adding an iframe element on the embedding website, such as: `<iframe src="https://MyWebServer/DynamicsNAV110/default.aspx?..." />`. The [!INCLUDE[!INCLUDE[webclient](includes/webclient.md)] will display the ribbon, the navigation pane, and other UI parts inside the frame. You can update the [!INCLUDE[webclient](includes/webclient.md)] to hide the ribbon, the navigation pane, or any UI parts, and only display the core part of the list inside the frame.  

> [!NOTE]  
>  Only list pages are supported as framed pages.

> [!IMPORTANT]  
>  Certain data in the URL, such as company name, could be considered sensitive information. Use discretion if you distribute URLs that contain the company name, or if it is possible, exclude this information from the address.

> [!IMPORTANT]  
> Upcoming releases of some browsers, such as Google Chrome 80 and Microsoft Edge, will include changes to how cookies are handled. To ensure that the embedded web client works with these browser versions, make sure that the Business Central platform has been upgraded to a recommended update version as described in [Preparing Dynamics NAV or Dynamics 365 Business Central for Upcoming Changes to Browser Cookie Policy](../administration/prepare-for-cookie-samesite-policy.md).

## Example

The following URL displays page 22 Customers for the CRONUS International Ltd. Company. The page is displayed in a [!INCLUDE[webclient](includes/webclient.md)] that is running on a computer that has the name MyWebServer. The page is displayed without the ribbon, the navigation pane, and any UI parts.  

```  
https://MyWebServer/business_central_server_instance/?company=CRONUS%20International%20Ltd.&page=22&showribbon=0&shownavigation=0&showuiparts=0  
```  

For more information about the page address syntax, see [Web Client URL](devenv-web-client-urls.md).  

### iframe Parameters

The following table describes the parameters of the URL for displaying a list page in an iframe.  

|Parameter|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|---------------|---------------------------------------|  
|`http&#124;https`|Specifies the Internet protocol to use. Valid options are `http` and `https`.<br /><br /> The `https` protocol helps secure the Microsoft Dynamics NAV data that is transmitted over the Internet. To use `https`, Secure Sockets Layer \(SSL\) must be enabled on the connection to the [!INCLUDE[webclient](includes/webclient.md)]. For more information, see [Configuring SSL to Secure the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] Web Client Connection](../deployment/configure-ssl-web-client-connection.md).|  
|`webserver`|Specifies the name of the computer that is running the [!INCLUDE[webclient](includes/webclient.md)].|  
|`webserverinstance`|Specifies the name of the web server instance for the [!INCLUDE[webclient](includes/webclient.md)].<br /><br /> On IIS, this is the alias of the virtual directory of the web server instance. When you install the [!INCLUDE[webclient](includes/webclient.md)] using Microsoft Dynamics NAV Setup, the web server instance is given the same name as the [!INCLUDE[server](includes/server.md)] instance that it connects to. If you use the **New-NAVWebServerInstance** cmdlet to add [!INCLUDE[webclient](includes/webclient.md)] instances, then you specify the web server instance name. For more information, see [Setting Up Multiple [!INCLUDE[webserver](../developer/includes/webserver.md)] Instances](../deployment/configure-multiple-web-server-instances.md).|  
|`default&#124;blank`|Specifies the name of the active server page file to use to display the page. You can use either of the following types, regardless of the page type: `default, blank`.|  
|`company`|The name of the company in [!INCLUDE[navnow](includes/navnow_md.md)] for which you want to display the page. If you do not select a company, then [!INCLUDE[webclient](includes/webclient.md)] uses the company that is defined in the configuration file (navsettings.json). If no company is defined in the configuration file (navsettings.json), then the last company opened by the user is displayed.|  
|`mode`|Specifies the mode in which to display the page.<br /><br /> -   `View`<br />     The page can only be viewed. The user cannot change data on the page.<br />-   `Edit`<br />     The user can change data on the page.<br />-   `Create`<br />     Opens a blank page that enables the user to create a new item.|  
|`showribbon`|Specifies whether to show the ribbon when the specified page opens. The default value, if the parameter is not specified, is `1`, which displays the ribbon. Use the value `0` if you do not want to show the ribbon. **Important:**  The `showribbon` parameter cannot be used to hide the app bar, use the `isembedded` parameter instead.|  
|`shownavigation`|Specifies whether to show the navigation page when the specified page opens. The default value, if the parameter is not specified, is `1`, which displays the navigation pane. Use the value `0` if you do not want to show the navigation pane.|  
|`showuiparts`|Specifies whether to show UI parts when the specified page opens. The default value, if the parameter is not specified, is `1`, which displays the UI parts. Use the value `0` if you do not want to show UI parts.|  
|`isembedded`|Specifies the navigational behavior of the [!INCLUDE[webclient](includes/webclient.md)]. If the [!INCLUDE[webclient](includes/webclient.md)] is run as part of an external web site, the `isembedded` parameter can be used to specify that the [!INCLUDE[webclient](includes/webclient.md)] opens in full screen mode when activated.<br /><br /> Use the **Back** button on the web browser to return from a list. If a card was activated, the original web site is rendered when the card is dismissed.<br /><br /> The default value, if the parameter is not specified, is `0`, which displays the [!INCLUDE[webclient](includes/webclient.md)] in a non-embedded manner. Use the value `1` if you want to show the [!INCLUDE[webclient](includes/webclient.md)] embedded and in full screen mode, when activated. **Important:**  Specifying the value `1` for `isembedded` will also hide the app bar.|  
|`pagesize`|Specifies the number of lines to display in a grid control, which is useful when embedding the [!INCLUDE[webclient](includes/webclient.md)].<br /><br /> The default value, if the parameter is not specified, is `20`.|  

###  <a name="EmbedWebClient"></a> Embedding the Web Client in a Website on Another Web Server

By default, the [!INCLUDE[webclient](includes/webclient.md)] will not allow a website to display the web client inside an iframe unless the website is hosted on the same web server. This is enforced by having the default value of `X-FRAME-OPTIONS` set to `SAMEORIGIN` and `Content-Security-Policy` to `frame-ancestors 'self'` in the web.config file.  

```  
<httpProtocol>  
      <customHeaders>  
        <!-- SAMEORIGIN: allows framing of the Microsoft Dynamics NAV Web client in another website only if the other website is on the same host. Remove this to enable cross-site framing of the Microsoft Dynamics NAV Web client, but be aware of the increased risk of clickjacking, which could deceive a legitimate user into taking unintended actions on behalf of the attacker. -->  
        <add name="X-FRAME-OPTIONS" value="SAMEORIGIN" />  
      </customHeaders>  
    </httpProtocol>  
```  

In order to show a list page in an HTML site on a different host, the configuration file (navsettings.json) of the [!INCLUDE[webserver](includes/webserver.md)] instance that hosts the [!INCLUDE[webclient](includes/webclient.md)] has to be configured to include a hostname as a value of the `AllowedFrameAncestors` setting.  

```  
"NAVWebSettings":  {  
    "AllowedFrameAncestors":  "https://myhostname.com",
    ...  
    }
}

```  

> [!WARNING]  
>  The `value` of `AllowedFrameAncestors` accepts wildcards. If you want to specify more hostnames, the values must be separated by commas.  

 In the following some sample values for `AllowedFrameAncestors` are shown:  

```  
 "AllowedFrameAncestors":  "https://mysite.sharepoint.com,https://yoursite.sharepoint.com",  
```  

```  
"AllowedFrameAncestors":  "https://*.myportal.com",  
```  

> [!WARNING]  
>  Be aware that if you remove the `<add name="X-FRAME-OPTIONS" value="SAMEORIGIN" />` line from the web.config file, it can pose a potential security risk.  

## See Also  
