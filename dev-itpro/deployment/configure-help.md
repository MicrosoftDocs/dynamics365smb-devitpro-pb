---
title: Help setup
description: You can override the default location for Help to point at your own website.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 08/08/2018
ms.author: edupont
---

# Configuring the Location of Help for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

The default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] comes with conceptual overviews and other articles that publish to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. This location is then accessible from the Help menu and through the Learn More links in all tooltips.  

Each extension that you add will include its own tooltips and links to Help. But what if you want to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] locally? Or if you have a vertical solution so that you want to refer your customers to your own website for Help? Or if you have a legacy Help collection based on the Dynamics NAV Help Server?  

These and other scenarios are also supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. But the options and possibilities are different, depending on your deployment scenario.  

## On-premises deployments
For on-premises deployment, you must choose between using the legacy Dynamics NAV Help Server or an online website. Help Server is a simple website that requires your Help to be in a specific format (HTML files), and the online website can host any content that you want to make available. Your choice depends on the concrete needs of your solution and your users.  

### Online website
If you want to use a website that is not based on Help Server, then you must specify the URL in the settings for the Web client and the Windows client, if your company uses this legacy client.  

For the Web client, which is accessed by users from a browser or from the mobile apps, the 
 navsettings.json file must contain the following settings:

```
                           "//HelpServer": [
                                                   "Name of the Microsoft Dynamics NAV Help Server to connect to."
    					                   ],
                           "HelpServer": "",
                           "//HelpServerPort":  "The listening TCP port for the Microsoft Dynamics NAV Help Server. Valid range: 1-65535",
                           "HelpServerPort": "49000",
                           "//BaseHelpUrl":  "The location of Help for this application."
                           "BaseHelpUrl": "https://docs.microsoft.com/{0}/dynamics365/business-central/",
                           "//BaseHelpSearchUrl":  "The URL to use if Help is included in the Search functionality in Business Central."
                           "BaseHelpSearchUrl": "https://docs.microsoft.com/{0}/search/index?search={1}&scope=BusinessCentral",
                           "//DefaultRelativeHelpPath":  "The Help article to look up if no other article can be found."
                           "DefaultRelativeHelpPath": "index",
```


For users who use the legacy Windows client connected to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the ClientUserSettings.config file must contain the following settings:

```
    <add key="HelpServer" value="" />
    <add key="BaseHelpUrl" value="https://docs.microsoft.com/{0}/dynamics365/business-central/" />
    <add key="DefaultRelativeHelpPath" value="index" />
```

> [!NOTE]
> Replace the value of the BaseHelpUrl key with the URL for your own website, such as ```https://mycompany.com/{0}/documentation/```. The parameter, {0}, represents the locale of the browser that the user is using, such as en-us or da-dk, and is generated at runtime.

### Help Server
If you want to use Help Server, then you must specify the server and port in the installation options. The Help Server website *

For the Web client, which is accessed by users from a browser or from the mobile apps, the 
 navsettings.json file must contain the following settings:

```
                           "//HelpServer": [
                                                   "Name of the Microsoft Dynamics NAV Help Server to connect to."
    					                   ],
                           "HelpServer": "https://myserver.com",
                           "//HelpServerPort":  "The listening TCP port for the Microsoft Dynamics NAV Help Server. Valid range: 1-65535",
                           "HelpServerPort": "49000",
```

For users who use the legacy Windows client connected to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], the ClientUserSettings.config file must contain the following settings:

```
    <add key="HelpServer" value="https://myserver.com" />
    <add key="HelpServerPort" value="49000" />
```
In both examples, https://myserver.com represents the URL to the Help Server instance. For more information, see [Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server).

## See Also
[Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server)  
