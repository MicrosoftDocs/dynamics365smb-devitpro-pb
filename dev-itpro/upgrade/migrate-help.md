---
title: Upgrade Legacy Help
description: Reuse your Help from Dynamics NAV for your Business Central solution.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/02/2020
ms.author: edupont
---

# Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format

[!INCLUDE[prodshort](../developer/includes/prodshort.md)] implements a [user assistance model](../user-assistance.md) where tooltips explain all fields and actions, and articles with conceptual descriptions of functionality are published to a website. If you are building an app, you are expected to comply with this model. However, there are many ways in which you can migrate and reuse your existing Help within this model.  

## Reusing existing web content

When you move to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you can reuse your existing product Help solution in most situations, especially if the content is already published to an *online library*, which is an internal or external website. In that case, all you have to do is to add that website to the configuration of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online or on-premises. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).  

More specifically, if you have content that you created for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to reuse that content for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution.  

For example, you have a [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server website with HTML files that describe your solution according to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] documentation model and format. You can reuse the Help Server website and rebrand the website and the content. You then connect your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution with the Help Server website. For more information, see [Configuring the Help Experience for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../deployment/configure-help.md).  

[!INCLUDE [prodshort](../developer/includes/prodshort.md)] does not support the field-based approach to context-sensitive Help that [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] 2017 and earlier versions use. Instead, you must use the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] page-based approach to context-sensitive Help. You do not have to convert your existing Help, but you do need to make the content available. For more information, see [Adding page-level UI-to-Help mapping to the system table](../help/context-sensitive-help.md#adding-page-level-ui-to-help-mapping-to-the-system-table).  

> [!NOTE]
> For apps for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, you must apply tooltips to controls and actions in both page objects and page extensions, and you must supply context-sensitive links. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).

## Converting existing content

If your existing content is in a different format, such as PDF files, Word documents, or printed manuals, you must decide if you want to keep the content as-is, or if you want to convert it to a format that can be accessed from inside [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. There are third-party tools available that can help you migrate your content, depending on the current format and the target format.  

For example, if you are migrating your solution from Dynamics GP, you might have content in PDF files. You can choose to convert the content to MarkDown as described in the [Moving to MarkDown](#moving-to-markdown) section, and then publish to a new online library on your current website.  

### Migrating from Dynamics NAV

If you are migrating your solution from [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] or later versions of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you most likely have been using the [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server, and your Help content is in HTML format. That means that you can reuse your existing content as-is, you can use the [Custom Help Toolkit](../help/custom-help-toolkit.md) to get new HTML files to supplement your existing content, or you can use publicly available third-party solutions to convert some or all of your HTML files to MarkDown if you want to follow similar processes to the ones the Microsoft team follows. For more information, see the [Moving to MarkDown](#moving-to-markdown) section.  

If you are migrating from an earlier version of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to first migrate to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] format, and then migrate again to MarkDown. For more information, see [Upgrading Your Existing Help Content](/previous-versions/dynamicsnav-2013r2/dn466754(v=nav.71)) in the legacy docs for [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)].  

### Converting legacy Dynamics NAV field Help to tooltips

Tooltips play an important role as part of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] [user assistance model](../user-assistance.md), and we encourage you to apply tooltips to your controls and actions as well.  

If you would like to reuse text from your Dynamics NAV Help for table fields, the [FieldTopicTextExtractor](../help/custom-help-toolkit-FieldTopicTextExtractor.md) tool can extract the first paragraph from your Dynamics NAV Help topics for table fields. The resulting spreadsheet will help you copy and paste the text from your Dynamics NAV Help topics into the ToolTip property of your controls.  

Mapping the table fields to page controls is not always straightforward because the same table is often used by two or more pages. As a result, the page ID can be many numbers away from the table ID. It requires knowledge of the actual solution to determine which tooltips are relevant for which pages. The **FieldTopicTextExtractor** tool generates an Excel file that you can use for this purpose, since you can sort and filter, and then copy content in Excel.  

In the base application, tooltips are in the page objects, so, at Microsoft, we edit code to edit tooltips. You do not have to do the same. You can choose to work with tooltips in the translation files or straight in the .AL files. Different solutions require different processes, so pick the process that is more efficient for you. We chose to associate the "What is this field?"-content with the user interface, meaning the controls on page objects. In the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] Help model, we chose a different approach, focusing on the database structure. Both approaches have their advantages and disadvantages, but the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] user assistance model currently focuses on the user interface with tooltips on page objects. For more information, see [User Assistance Model](../user-assistance.md). 	

For more information, see [Working with Application Objects as Text Files](/previous-versions/dynamicsnav-2016/dn789521%28v%3dnav.90%29) in the docs for [!INCLUDE [navcorfu_md](../developer/includes/navcorfu_md.md)], [How to Add Translated Strings By Importing and Exporting Multilanguage Files](/dynamics-nav/how-to--add-translated-strings-by-importing-and-exporting-multilanguage-files) in the docs for [!INCLUDE [nav2018_md](../developer/includes/nav2018_md.md)], and [Working with Translation Files](../developer/devenv-work-with-translation-files.md) for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].

## Moving to MarkDown

Converting your existing content to MarkDown can be done using third-party tools, including but not limited to [PanDoc](https://pandoc.org) or the [Writage](https://writage.com) plugin for Word.  

Once you have converted your content to MarkDown, we recommend storing your content in a repository, such as a Git repo in Azure DevOps, a private or public repo in GitHub, or a project in [MkDocs](https://www.mkdocs.org/). You can use open-source tools such as [DocFx](https://dotnet.github.io/docfx/) to generate content for your website. In general, working in MarkDown means that you have access to a world of open-source tools and do not have a hard dependency on Microsoft providing you with tools. The Custom Help Toolkit can help you prepare content for publishing. For more information, see [Custom Help Toolkit](../help/custom-help-toolkit.md).  

If you do not yet have a website that you publish content to, then there are several ways in which you can create such a site. The [MkDocs](https://www.mkdocs.org/) project generates a website for you, but you can also work with a web designer to build a site to host your content. We recommend deploying to [an Azure web app](/azure/app-service/overview).

## See Also

[Configuring the Help Experience](../deployment/configure-help.md)  
[Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md)  
[User Assistance Model](../user-assistance.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](../deployment/system-requirement-business-central.md)  
