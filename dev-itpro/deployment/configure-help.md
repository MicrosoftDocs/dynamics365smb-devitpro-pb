---
title: Configure the Help experience
description: Learn how to give your customers access to the right Help content.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/15/2019
ms.author: edupont
---

# Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

The default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] comes with conceptual overviews and other articles that publish to the [/dynamics365/business-central/](/dynamics365/business-central/) site. This location is then accessible from the Help menu and through the Learn More links in all tooltips. Each extension that you add will include its own tooltips and links to Help. But what if you want to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] locally? Or if you have a vertical solution so that you want to refer your customers to your own website for Help? Or if you have a legacy Help collection based on the Dynamics NAV Help Server?  

These and other scenarios are also supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. But the options and possibilities are different, depending on your deployment scenario.  

## Apps for online tenants

When you build an app for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] using the AL developer experience, you are expected to comply with the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user assistance model. This includes tooltips and context-sensitive links to Help.  

For more information, see [User Assistance Model](../user-assistance.md) and [Configure Context-Sensitive Help](../help/context-sensitive-help.md).  

## On-premises deployments

For deploying [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, you must choose between using the legacy Dynamics NAV Help Server or an online website. Help Server is a simple website that requires your Help to be in a specific format (HTML files), and the online website can host any content that you want to make available. Your choice depends on the concrete needs of your solution and your users.  

> [!IMPORTANT]
> You can configure each client to use either an online library or Help Server. If you add configuration for an online library, you must remove the settings for Help Server.  

### Online library

If you want to use a website that is *not* based on Help Server, then you must specify the URL in the settings for the Web client. The website does not have to be publicly accessible, but it must be accessible to all users of the solution that it support.  

For the Web client, which is accessed by users from a browser or from the mobile apps, the navsettings.json file must contain the following setting:

```json
    "//BaseHelpUrl":  "The location of Help for this application.",
    "BaseHelpUrl": "https://mysite.com/{0}/documentation/",
```

> [!NOTE]
> Replace the value of the BaseHelpUrl key with the URL for your own website. The parameter, {0}, represents the locale of the browser that the user is using, such as en-us or da-dk, and is set automatically at runtime.

### Help Server

If you want to use Help Server, then you must specify the server and port in the installation options. The Help Server website can also serve as a starting point for adding a library to your existing website, for example.  

For the Web client, which is accessed by users from a browser or from the mobile apps, the navsettings.json file must contain the following settings:

```json
    "//HelpServer": "Name of the Dynamics NAV Help Server to connect to.",
    "HelpServer": "https://myserver.com",
    "//HelpServerPort":  "The listening TCP port for the Dynamics NAV Help Server. Valid range: 1-65535",
    "HelpServerPort": "49000",
```

In the example, *https://myserver.com* represents the URL to the Help Server instance. For more information, see [Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server) in the developer and ITpro content for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)].  

> [!IMPORTANT]
> If you use Help Server, the UI-to-Help mapping functionality that is described in [Configure Context-Sensitive Help](../help/context-sensitive-help.md) does not work. Neither does the original Help lookup mechanism that was based on filenames that reflected the object IDs, such as N_123.htm for the page object with the ID 123. For more information, see [Blog post: Reusing classic object-based Help on your Dynamics 365 Business Central Help Server](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/13/reusing-classic-object-based-help-dynamics-365-business-central-help-server?target=_blank).

> [!TIP]
> If you are upgrading from [!INCLUDE [navnowlong_md](../developer/includes/navnowlong_md.md)], you can reuse your existing Help Server content by simply replacing the product name and make any other changes that apply to your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] environment.  

You can also still download the files that were made available for [!INCLUDE [nav2017](../developer/includes/nav2017.md)]. The download consists of 45 CAB files with the content from the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] 2016 DVD rebranded to [!INCLUDE [nav2017](../developer/includes/nav2017.md)]. There are CAB files with the W1 application Help translated into each of the supported languages plus the local functionality for the country/region where that language is spoken. There are also CAB files with local functionality in English. The files were published as a single download so each administrator could choose exactly the files that they needed at the time. For more information, see [Microsoft Dynamics NAV 2017 Classic Help Download](https://www.microsoft.com/download/details.aspx?id=54315).  

## Fork the Microsoft repos, and customize or extend the content

If you want to customize or extend the Microsoft Help, you can fork our public repo for either the source repo in English (US) at [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs), or one of the related repos with translations into the supported languages. For guidance about how to generate HTML files for your website, see [Building HTML files](../help/contributor-guide.md#building-html-files). For more information, see [Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md).  

## See Also

[User Assistance Model](../user-assistance.md)  
[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server)  
[Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server)  
[Migrate Legacy Help to the Business Central Format](../upgrade/migrate-help.md)  
[Building Your First Sample Extension With Extension Objects, Install Code, and Upgrade Code](../developer/devenv-extension-example.md)  
[Building an Advanced Sample Extension](../developer/devenv-extension-advanced-example.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](system-requirement-business-central.md)  
[Resources for Help and Support](../help-and-support.md)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central/)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  
[Blog post: Reusing classic object-based Help on your Dynamics 365 Business Central Help Server](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/13/reusing-classic-object-based-help-dynamics-365-business-central-help-server/)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)  
