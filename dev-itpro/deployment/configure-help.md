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
ms.date: 08/09/2018
ms.author: edupont
---

# Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

The default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] comes with conceptual overviews and other articles that publish to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. This location is then accessible from the Help menu and through the Learn More links in all tooltips. Each extension that you add will include its own tooltips and links to Help. But what if you want to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] locally? Or if you have a vertical solution so that you want to refer your customers to your own website for Help? Or if you have a legacy Help collection based on the Dynamics NAV Help Server?  

These and other scenarios are also supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. But the options and possibilities are different, depending on your deployment scenario.  

## User assistance for [!INCLUDE[prodshort](../developer/includes/prodshort.md)]

The user assistance model is based on the following principles:

- Get started

    Default values and setup wizards makes it easy to start using [!INCLUDE[prodshort](../developer/includes/prodshort.md)] with your own data, and in-product videos give new users a quick introduction to how the product works.
- Get unblocked

    Embedded user assistance implemented as tooltips answers most immediate questions about what fields and actions do.
- Learn more

    The Help menu and the tooltips provide context-sensitive links to Help articles with more information.

### Context-sensitive Help

The context-sensitive links to Help are based on a UI-to-Help mapping that is stored in table 2000000198 **Page Documentation**. In this table, all page objects in the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] are listed, and have a target Help article associated with each of them. This means that multiple page objects can be associated with the same Help article, such as when a specific workflow involves multiple pages.  

The table associates page IDs with target articles, but the URL to where to find the target article is specified at the application level that defaults to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/) site. In an extension, you can overrule this URL so that all calls for Help go to your site instead, for example. Alternatively, you can specify help links at the object level. For more information, see [Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md).  

### Tooltips

The base application has set the TooltipML property for all controls on (almost) all page objects. Most system actions also include tooltips so that users get a consistent experience. Your extensions are expected to also include tooltips for the same reason.  



## On-premises deployments

For deploying [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, you must choose between using the legacy Dynamics NAV Help Server or an online website. Help Server is a simple website that requires your Help to be in a specific format (HTML files), and the online website can host any content that you want to make available. Your choice depends on the concrete needs of your solution and your users.  

### Online website

If you want to use a website that is not based on Help Server, then you must specify the URL in the settings for the Web client and the Windows client, if your company uses this legacy client. The website does not have to be publicly accessible, but it must be accessible to all users of the solution that it support.  

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
> Replace the value of the BaseHelpUrl key with the URL for your own website, such as ```https://mycompany.com/{0}/documentation/```. The parameter, {0}, represents the locale of the browser that the user is using, such as en-us or da-dk, and is set automatically at runtime.

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

> [!IMPORTANT]
> If you use Help Server, the functionality for providing context-sensitive links to Help article does not work. Instead, you must rely on the legacy Help lookup mechanism that hinges on .HTM files with filenames that reflect the object IDs, such as N.123.htm. For more information, see [Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server).  

## See Also

[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server)  
[Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server)  
[Upgrade Dynamics NAV Help](../upgrade/migrate-help.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](system-requirement-business-central.md)  
