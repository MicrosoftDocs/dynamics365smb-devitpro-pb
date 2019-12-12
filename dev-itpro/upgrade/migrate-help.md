---
title: Upgrade Legacy Help
description: Reuse your Help from Dynamics NAV for your Business Central solution.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/22/2019
ms.author: edupont
---

# Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format

The standard version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] follows a [user assistance model](../user-assistance.md) with tooltips to explain all fields and actions and conceptual descriptions of functionality that is published to a public website. If you are building an app, you are expected to comply with this model. However, there are many ways in which you can migrate and reuse any existing Help that you might have.  

## Reusing existing web content

When you move to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you can reuse your existing product Help solution in most situations, especially if the content is already published to what we refer to here as an *online library*, which is an internal or external website. In that case, all you have to do is to add that website to the configuration of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online or on-premises. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).  

More specifically, if you have content that you created for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to reuse that for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution.  

For example, you have a [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server website with HTML files that describe your solution according to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] documentation model and format. In that scenario, you can reuse the Help Server website and rebrand that and the content accordingly. You then connect your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution with that Help Server website.  

However, [!INCLUDE [prodshort](../developer/includes/prodshort.md)] does not support the field-based approach to context-sensitive Help that [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] 2017 and earlier use. Instead, you must use the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] page-based approach to context-sensitive Help. You do not have to convert your existing Help, but you do need to populate the **Page Documentation** table. For more information, see [Adding page-level UI-to-Help mapping to the system table](../help/context-sensitive-help.md#adding-page-level-ui-to-help-mapping-to-the-system-table).  

> [!NOTE]
> For apps for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, you must apply tooltips to controls and actions in both page objects and page extensions, and you must supply context-sensitive links. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).

## Converting existing content

If your existing content is in a different format, such as PDF files, Word documents, or printed manuals, you must decide if you want to keep the content as-is, or if you want to convert it to a format that can be accessed from inside [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. There are third party tools available that can help you migrate to other formats, depending on the the current format and the target format.  

If you are migrating your solution from Dynamics GP, you might have content in PDF files. In that case, you can choose to convert the content to MarkDown as described in the [Moving to MarkDown](#moving-to-markdown) section, and then publish to a new online library on your current website, for example.  

### Migrating from Dynamics NAV

If you are migrating your solution from [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] or later versions of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you most likely have been using the [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server, and your Help content is in HTML format. That means that you can reuse your existing content as-is, or you can use publicly available third-party solutions to convert some or all of your HTML files to MarkDown, if you want to follow similar processes to the ones the Microsoft team follows. For more information, see the [Moving to MarkDown](#moving-to-markdown) section.  

If you are migrating from an earlier version of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to first migrate to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] format, and then migrate again to MarkDown or similar formats. For more information, see [Upgrading Your Existing Help Content](/previous-versions/dynamicsnav-2013r2/dn466754(v=nav.71)) in the legacy docs for [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)].  

### Converting legacy Dynamics NAV field Help to tooltips

For the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], Microsoft extracted the first paragraph from the HTML files of the [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help for table fields, and then imported the text into the page objects of the base application as tooltips. You can build a similar tool if you want to reuse your existing content in the same way.  

The tooltips play an important role as part of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] [user assistance model](../user-assistance.md), and we encourage you to apply tooltips to your controls and actions as well.  

## Moving to MarkDown

The Microsoft team converted a subset of the legacy Help for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to build the new Help library at [/dynamics365/business-central/](/dynamics365/business-central/). If you want to customize or extend the Microsoft Help, you can fork our public repo for either the source repo in English (US) at [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs), or one of the related repos with translations into the supported languages. The readme.md file in the source repo provides tips and tricks for working with the Microsoft GitHub repos and MarkDown.  

Converting your existing content to MarkDown can be done using third-party tools, including but not limited to [PanDoc](https://pandoc.org) or the [Writage](https://writage.com) plugin for Word.  

When you have converted your content to MarkDown, you can use a Git repo in Azure DevOps as your source repository, create a private or public repo in GitHub, or set up a project in [MkDocs](https://www.mkdocs.org/), for example. Then you can use open source tools such as [DocFx](https://dotnet.github.io/docfx/) to generate content for your website. In general, working in MarkDown means that you have access to a world of open source tools and do not have a hard dependency on Microsoft providing you with tools.  

If you do not yet have a website that you publish content to, then there are several ways in which you can create such a site. The [MkDocs](https://www.mkdocs.org/) project generates a website for you, but you can also work with a web designer to build a site that resembles the [Docs.microsoft.com](/dynamics365/business-central/) site, if that is what your customers will prefer.  

## See Also

[Configuring the Help Experience](../deployment/configure-help.md)  
[Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md)  
[User Assistance Model](../user-assistance.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](../deployment/system-requirement-business-central.md)  
