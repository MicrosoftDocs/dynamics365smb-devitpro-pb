---
title: Configure the Help experience
description: Learn how to give your customers access to the right Help content.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/27/2020
ms.author: edupont
---

# Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]

The default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] comes with conceptual overviews and other articles that publish to the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/dynamics365/business-central/) site. This location is accessible from the Help menu and through the Learn More links in all tooltips. Each extension that you add will include its own tooltips and links to Help.

But what if you want to deploy [!INCLUDE[prodshort](../developer/includes/prodshort.md)] locally? Or if you have a vertical solution so that you want to refer your customers to your own website for Help? Or if you have a legacy Help collection based on the Dynamics NAV Help Server? These and other scenarios are also supported in [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

## Apps for online tenants

When you build an app for [!INCLUDE [prodshort](../developer/includes/prodshort.md)] using the AL developer experience, you are expected to comply with the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] user assistance model. The user assistance model requires the use of tooltips and context-sensitive links to Help content that is hosted on a website. For more information, see the [Deploy content to your website](#deploy-content-to-your-website) section and the [Configure Context-Sensitive Help](../help/context-sensitive-help.md) article.  
  
> [!TIP]
> The website does not have to be publicly accessible, but it must be accessible to all users of the solution that it supports.

You can add Microsoft's content to your website, or you can deploy just your own content. The choice is yours and depends on the requirements of your users, the size of your app, and the amount of customization you want to make. The custom Help toolkit includes tools that can help you prepare and deploy content. For more information, see [Custom Help Toolkit](../help/custom-help-toolkit.md).  

## On-premises deployments

For deploying [!INCLUDE[prodshort](../developer/includes/prodshort.md)] on-premises, you can choose between using the legacy Dynamics NAV Help Server and an online website, and you can configure different Help experience for each [!INCLUDE[webserver](../developer/includes/webserver.md)] instance. Help Server is a simple website that requires your Help to be in a specific format (HTML files), while the online website can host any content that you want to make available. Your choice depends on the needs of your solution and your users. If you add configuration for an online library, you must remove any settings for Help Server.  

> [!IMPORTANT]
> The legacy Dynamics NAV Help Server component will be deprecated. We recommend that you invest in a different type of website. For more information, see the [2020 release wave 2 release plan](/dynamics365-release-plan/2020wave2/smb/dynamics365-business-central/deprecation-legacy-dynamics-nav-help-server-component-) and [Custom Help Toolkit](../help/custom-help-toolkit.md).

> [!TIP]
> The content on the [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/dynamics365/business-central/) site and in the various GitHub repos reflects the latest version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)], unless otherwise specified.
>
> We recommend that you get your version of Microsoft's content close to the time the subsequent major version of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] becomes available. For example, if you are deploying version 16.4, you should have taken a snapshot of the content in GitHub before version 17.0 became available.

### Online library

To display content from an website that hosts your user assistance content, specify the URL in the settings for the [!INCLUDE[webserver](../developer/includes/webserver.md)]. The navsettings.json file must contain the following setting in the `ApplicationIdSettings` element:

```json
{
  "NAVWebSettings": {
    // [...more keys]
  },
  "ApplicationIdSettings": {
    //BaseHelpUrl:  The location of Help for this application.,
    "BaseHelpUrl": "https://mysite.com/{0}/documentation/",
     // [...more keys]
  }
}
```

> [!NOTE]
> Replace the value of the BaseHelpUrl key with the URL for your own website. The parameter, {0}, represents the locale of the browser that the user is using, such as en-us or da-dk, and is set automatically at runtime.

For more information, see [Configuring [!INCLUDE[webserver](../developer/includes/webserver.md)] Instances](../administration/configure-web-server.md).  

> [!TIP]
> The website does not have to be publicly accessible, but it must be accessible to all users of the solution that it supports.  

### Help Server

If you want to use Help Server, then you must specify the server and port in the installation options. The Help Server website can also serve as a starting point for adding a library to your existing website, for example.  

The navsettings.json file must contain the following settings in the `NAVWebSettings` element:

```json
{
  "NAVWebSettings": {
    //HelpServer: Name of the Dynamics NAV Help Server to connect to.,
    "HelpServer": "https://myserver.com",
    //HelpServerPort:  The listening TCP port for the Dynamics NAV Help Server. Valid range: 1-65535,
    "HelpServerPort": "49000",
    // [...more keys]
  },
  "ApplicationIdSettings": {
    // [...more keys]
  }
}
```

In the example, `https://myserver.com` represents the URL to the Help Server instance. For more information, see [Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server) in the developer and adminstration content for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)].  

> [!IMPORTANT]
> If you use Help Server, the UI-to-Help mapping functionality that is described in [Configure Context-Sensitive Help](../help/context-sensitive-help.md) does not work. Neither does the original Help lookup mechanism that was based on filenames that reflected the object IDs, such as N_123.htm for the page object with the ID 123. For more information, see [Blog post: Reusing classic object-based Help on your Dynamics 365 Business Central Help Server](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/13/reusing-classic-object-based-help-dynamics-365-business-central-help-server?target=_blank).

> [!TIP]
> If you are upgrading from [!INCLUDE [navnowlong_md](../developer/includes/navnowlong_md.md)], you can reuse your existing Help Server content by simply replacing the product name and make any other changes that apply to your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] environment.  

You can also still download the files that were made available for [!INCLUDE [nav2017](../developer/includes/nav2017.md)]. The download consists of 45 CAB files with the content from the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] 2016 DVD rebranded to [!INCLUDE [nav2017](../developer/includes/nav2017.md)]. There are CAB files with the W1 application Help translated into each of the supported languages plus the local functionality for the country/region where that language is spoken. There are also CAB files with local functionality in English. The files were published as a single download so each administrator could choose exactly the files that they needed at the time. For more information, see [Microsoft Dynamics NAV 2017 Classic Help Download](https://www.microsoft.com/download/details.aspx?id=54315).  

> [!IMPORTANT]
> Specifically for the preview of [!INCLUDE [prodshort](../developer/includes/prodshort.md)] in India, the installation of Help Server fails due to missing files on the installation media. The solution is to install Help Server without the HTML files for local functionality and instead pick up the content from GitHub. For more information, see [Get updates from Microsoft](../help/contributor-guide.md#get-updates-from-microsoft).

## Deploy content to your website

[!INCLUDE [prodshort](../developer/includes/prodshort.md)] has no firm requirements for the website that hosts your online library for your [!INCLUDE [prodshort](../developer/includes/prodshort.md)] online or on-premises. You can deploy your content using any tool and process, such as [Azure Static Web Apps](/azure/static-web-apps/), [Azure App Service](/azure/app-service/quickstart-html), a website that can render MarkDown files using a [customization of the DocFx Flavored MarkDown engine](https://dotnet.github.io/docfx/tutorial/howto_customize_docfx_flavored_markdown.html), or third-party services such as [MkDocs](https://www.mkdocs.org/).  

You can see an example of how to deploy content to an Azure web app in the article [Deploy custom help to Azure](/dynamics365/fin-ops-core/dev-itpro/help/walkthrough-help-azure), which supports the custom Help toolkit for Dynamics 365 Finance, Dynamics 365 Supply Chain Management, and Dynamics 365 Commerce. That article also describes how you can build a search service for your website. This is currently not relevant for [!INCLUDE [prodshort](../developer/includes/prodshort.md)], but you might find the guidance helpful anyway.  

Use the [HtmlFromRepoGenerator tool](../help/custom-help-toolkit-HtmlFromRepoGenerator.md) tool in the custom Help toolkit to clone a repo and generate the corresponding HTML files automatically. If, instead, you want to create your own tooling and processes around [DocFx](https://dotnet.github.io/docfx/), which is an open-source tool for converting markdown files, you can see examples in the [Build HTML files](../help/contributor-guide.md#build-html-files) section of the contributor guide.  

## Fork the Microsoft repos, and customize or extend the content

If you want to customize or extend the Microsoft Help, you can fork our public repo for either the source repo in English (US) at [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs), or one of the repos that contain translations. For more information, see [Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md) and [Custom Help Toolkit](../help/custom-help-toolkit.md).  

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
