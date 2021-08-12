---
title: Configure the Help experience
description: Learn how to give your customers access to the right Help content for Business Central online and on-premises.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.date: 04/01/2021
ms.author: edupont
---

# Configuring the Help Experience for [!INCLUDE[prod_long](../developer/includes/prod_long.md)]

The default version of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] comes with conceptual overviews and other articles that publish to the [/dynamics365/business-central/](/dynamics365/business-central/) site. This location is accessible from the Help menu and through the Learn More links in all tooltips. Each extension that you add will include its own tooltips and links to Help.

But what if you want to deploy [!INCLUDE[prod_short](../developer/includes/prod_short.md)] locally? Or if you have a vertical solution so that you want to refer your customers to your own website for Help? Or if you have a legacy Help collection based on the Dynamics NAV Help Server? These and other scenarios are also supported in [!INCLUDE[prod_short](../developer/includes/prod_short.md)].  

## Apps for online tenants

When you build an app for [!INCLUDE [prod_short](../developer/includes/prod_short.md)] using the AL developer experience, you are expected to apply tooltips and context-sensitive links to Help content on a website in accordance with the user assistance model. For more information, see the [Deploy content to your website](#deploy-content-to-your-website) section and the [Configure Context-Sensitive Help](../help/context-sensitive-help.md) article.  
  
> [!TIP]
> The website does not have to be publicly accessible, but it must be accessible to all users of the solution that it supports.

You can add Microsoft's content to your website, or you can deploy just your own content. The choice is yours and depends on the requirements of your users, the size of your app, and the amount of customization you want to make. The custom Help toolkit includes tools that can help you prepare and deploy content. For more information, see [Custom Help Toolkit](../help/custom-help-toolkit.md).  

## On-premises deployments

For deploying [!INCLUDE[prod_short](../developer/includes/prod_short.md)] on-premises, you can choose between using any online website or the legacy Dynamics NAV Help Server, and you can configure different Help experience for each [!INCLUDE[webserver](../developer/includes/webserver.md)] instance. For example, use the [Custom Help Toolkit](../help/custom-help-toolkit.md) to help you deploy content to an Azure Web App. For supported versions, the legacy Dynamics NAV Help Server component is a simple website that requires your Help to be in a specific format (HTML files). Other types of websites can host any content that you want to make available. Your choice depends on the needs of your solution and your users. If you add configuration for an online library, you must remove any settings for Help Server.  

> [!IMPORTANT]
> The legacy Dynamics NAV Help Server component is deprecated in 2021 release wave 1 (version 18). We recommend that you invest in a different type of website. For more information, see the [deprecation notice](../upgrade/deprecated-features-w1.md#the-help-server-component) and the [Custom Help Toolkit](../help/custom-help-toolkit.md) section.

> [!TIP]
> The content on the [/dynamics365/business-central/](/dynamics365/business-central/) site and in the various GitHub repos reflects the latest version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], unless otherwise specified.
>
> We recommend that you get your version of Microsoft's content close to the time the subsequent major version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] becomes available. For example, if you are deploying version 16.4, you could have taken a snapshot of the content in GitHub before version 17.0 became available.

[!INCLUDE [ua-github-releases](../includes/ua-github-releases.md)]

### Online library

To display content from a website that hosts your user assistance content, specify the URL in the settings for the [!INCLUDE[webserver](../developer/includes/webserver.md)]. The `navsettings.json` file must contain the following setting in the `ApplicationIdSettings` element:

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

### Legacy Help Server

> **APPLIES TO**: 2020 release wave 2 and earlier versions

If you want to use Help Server, then you must specify the server and port in the installation options. The Help Server website can also serve as a starting point for adding a library to your existing website, for example.  

> [!IMPORTANT]
> In version 18 and later versions, if you use the legacy Dynamics NAV Help Server component as a standalone website, then you must use the settings for the online library that is described in the previous section.
>
> The following content in this section applies to using Help Server as it was originally intended to be used. However, this type of usage is no longer supported, starting with 2021 release wave 1.

The navsettings.json file must contain the following settings in the `NAVWebSettings` element:

```json
{
  "NAVWebSettings": {
    //HelpServer: Name of the Dynamics NAV Help Server to connect to,
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

In the example, `https://myserver.com` represents the URL to the Help Server instance, and the value of the `HelpServerPort`setting determines that port 49000 on that webserver is where the content is. For more information, see [Configuring Microsoft Dynamics NAV Help Server](/dynamics-nav/configuring-microsoft-dynamics-nav-help-server) in the developer and administration content for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)].  

> [!IMPORTANT]
> If you use Help Server, the UI-to-Help mapping functionality that is described in [Configure Context-Sensitive Help](../help/context-sensitive-help.md) does not work. Neither does the original Help lookup mechanism that was based on filenames that reflected the object IDs, such as N_123.htm for the page object with the ID 123. For more information, see [Blog post: Reusing classic object-based Help on your Dynamics 365 Business Central Help Server](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/13/reusing-classic-object-based-help-dynamics-365-business-central-help-server?target=_blank).

> [!TIP]
> If you are upgrading from [!INCLUDE [navsicily_md](../developer/includes/navsicily_md.md)] or later, you can reuse your existing Help Server content by simply replacing the product name and make any other changes that apply to your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] environment. Alternatively,deploy your existing content to an online library.

[!INCLUDE [nav2017classichelp](../developer/includes/nav2017classichelp.md)]

> [!IMPORTANT]
> Specifically for the preview of [!INCLUDE [prod_short](../developer/includes/prod_short.md)] in India, the installation of Help Server fails due to missing files on the installation media. The solution is to install Help Server without the HTML files for local functionality and instead pick up the content from GitHub. For more information, see [Get updates from Microsoft](../help/contributor-guide.md#get-updates-from-microsoft).

## Deploy content to your website

[!INCLUDE [prod_short](../developer/includes/prod_short.md)] has no firm requirements for the website that hosts your online library for your [!INCLUDE [prod_short](../developer/includes/prod_short.md)] online or on-premises. You can deploy your content using any tool and process including the following:

* [Azure Static Web Apps](/azure/static-web-apps/)  
* [Azure App Service](/azure/app-service/quickstart-html)  
* Third-party services such as [MkDocs](https://www.mkdocs.org/)  
* Any website that can render MarkDown files using a [customization of the DocFx Flavored MarkDown engine](https://dotnet.github.io/docfx/tutorial/howto_customize_docfx_flavored_markdown.html)  

You can see an example of how to deploy content to an Azure web app in the article [Deploy custom help to Azure](/dynamics365/fin-ops-core/dev-itpro/help/walkthrough-help-azure), which supports the custom Help toolkit for Dynamics 365 finance and operations apps. That article also describes how you can build a search service for your website. This step is currently not relevant for [!INCLUDE [prod_short](../developer/includes/prod_short.md)], but you might find the guidance helpful anyway.  

### Optional: Get Microsoft's content

If you deploy a solution that is based on Microsoft's default application, then you might want to include a customized version of Microsoft's business functionality content on your website. Microsoft's source files are available as downloadable packages for each major release in the [https://github.com/MicrosoftDocs/dynamics365smb-docs/](https://github.com/MicrosoftDocs/dynamics365smb-docs/releases) GitHub repo in English (US) only. For other languages, pull files based on a commit before the next major version.  

> [!TIP]
> The content on the [/dynamics365/business-central/](/dynamics365/business-central/) site and in the various GitHub repos reflects the latest version of [!INCLUDE [prod_short](../developer/includes/prod_short.md)], unless otherwise specified.
>
> [!INCLUDE [ua-github-releases](../includes/ua-github-releases.md)]

Let's take an example: You are deploying version 17.4 on-premises for a customer in Belgium in June 2021. Back in March 2021, you knew that version 18.0 was coming up, so you ran the [custom help toolkit's HtmlFromRepoGenerator tool](../help/custom-help-toolkit-HtmlFromRepoGenerator.md) to get the latest version of Microsoft's source files from the relevant repos. In this example, you would configure the tool to process the following repos:

* [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs)  
* [https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.fr-be](https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.fr-be)  
* [https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.nl-be](https://github.com/MicrosoftDocs/dynamics365smb-docs-pr.nl-be)  

> [!TIP]
> The [HtmlFromRepoGenerator](../help/custom-help-toolkit-HtmlFromRepoGenerator.md) tool generates HTML files for you that you can choose to customize before you deploy them to the relevant website. Starting with 2021 release wave 1, the tool can get content based on the release-specific packages in GitHub. For more information, see [Custom Help Toolkit](../help/custom-help-toolkit.md) and [Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md).

Alternatively,use any tool or script that you prefer. If you want to create your own tooling and processes around [DocFx](https://dotnet.github.io/docfx/), you can see examples in the [Build HTML files](../help/contributor-guide.md#build-html-files) section of the contributor guide.  

## Fork the Microsoft repos, and customize or extend the content

If you want to customize or extend the Microsoft Help, you can fork our public repo for either the source repo in English (US) at [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs), or one of the repos that contain translations. For more information, see [Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md) and [Custom Help Toolkit](../help/custom-help-toolkit.md).  

## See Also

[User Assistance Model](../user-assistance.md)  
[Adding Help Links from Pages, Reports, and XMLports](../developer/devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Migrate Legacy Help to the Business Central Format](../upgrade/migrate-help.md)  
[Building Your First Sample Extension With Extension Objects, Install Code, and Upgrade Code](../developer/devenv-extension-example.md)  
[Building an Advanced Sample Extension](../developer/devenv-extension-advanced-example.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[Resources for Help and Support](../help-and-support.md)  
[Blog post: Extending and customizing the Help](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/extending-and-customizing-the-help-in-dynamics-365-business-central/)  
[Blog post: Collaborate on content for Business Central](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/14/collaborate-on-content-for-dynamics-365-business-central/)  
[Blog post: Reusing classic object-based Help on your Dynamics 365 Business Central Help Server](https://cloudblogs.microsoft.com/dynamics365/it/2019/08/13/reusing-classic-object-based-help-dynamics-365-business-central-help-server/)  
[Working with Dynamics NAV Help Server](/dynamics-nav/microsoft-dynamics-nav-help-server)  
[Docs Contributor Guide](/contribute/)  
[Docs Authoring Pack for Visual Studio Code](/contribute/how-to-write-docs-auth-pack)