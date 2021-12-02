---
title: Migrate Legacy Help to the Business Central Format
description: Reuse your existing Help content from Dynamics NAV or other products, and make it available to your Business Central solution.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.date: 04/01/2021
ms.author: edupont
---

# Migrate Legacy Help to the [!INCLUDE[prod_long](../developer/includes/prod_long.md)] Format

If you are building an app for [!INCLUDE[prod_short](../developer/includes/prod_short.md)], we expect you to comply with the [user assistance model](../user-assistance.md). That means that tooltips and callouts explain all fields and actions, and conceptual descriptions of functionality are published to a website. Fortunately, there are many ways in which you can migrate and reuse your existing Help within this model.  

## Reusing existing web content

You can reuse your existing product Help solution in most situations. If the content is already published to an internal or external website, all you have to do is to add that *online library* to the configuration of [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online or on-premises. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).  

More specifically, if you have content for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to reuse that content for your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution.  

For example, you have a [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server website with HTML files that describe your solution according to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] documentation model and format. You decide to reuse the Help Server website and rebrand the website and the content. Finally, you connect your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] solution with the Help Server website. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).  

[!INCLUDE [prod_short](../developer/includes/prod_short.md)] does not support the field-based approach to context-sensitive Help that [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] 2017 and earlier versions use. Instead, you must use the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] page-based approach to context-sensitive Help. You do not have to convert your existing Help, but you do need to make the content available. For more information, see the [Converting existing content](#converting-existing-content) section.  

> [!NOTE]
> For apps for [!INCLUDE[prod_short](../developer/includes/prod_short.md)] online, you must apply tooltips to controls and actions in both page objects and page extensions, and you must supply context-sensitive links. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).

## Converting existing content

Your existing content might be in a different format, such as PDF files, Word documents, or printed manuals. You must decide if you want to keep the content as-is, or if you want to convert it to a format that can be accessed from inside [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. There are third-party tools available that can help you migrate your content, depending on the current format and the target format.  

In this example, you are migrating your solution from Dynamics GP, and you have content in PDF files. You choose to convert the content to MarkDown as described in the [Moving to MarkDown](#moving-to-markdown) section. Then, you publish to a new online library on your current website. Sounds too easy? Well, it doesn't have to be more complicated, and it's a one-off project.  

### Migrating from Dynamics NAV

If you are migrating your solution from [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)], [!INCLUDE [nav2017](../developer/includes/nav2017.md)], or a version in between, then you most likely have been using the [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server, and your Help content is in HTML format. That means that you have a free choice of what to do:

* Reuse your existing content as-is but redeployed to a new website  
* Use the [Custom Help Toolkit](../help/custom-help-toolkit.md) to get new HTML files to supplement your existing content  
* Use publicly available third-party solutions to convert some or all of your HTML files to MarkDown if you want to follow similar processes to the ones the Microsoft team follows  

For more information, see the [Moving to MarkDown](#moving-to-markdown) section.  

If you are migrating from an earlier version of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to first migrate to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] format, and then migrate again to MarkDown. For more information, see [Upgrading Your Existing Help Content](/previous-versions/dynamicsnav-2013r2/dn466754(v=nav.71)) in the legacy docs for [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)].  

### Converting legacy Dynamics NAV field Help to tooltips

Tooltips play an important role as part of the [!INCLUDE[prod_short](../developer/includes/prod_short.md)] [user assistance model](../user-assistance.md), and we encourage you to apply tooltips to your controls and actions as well.  

You can reuse text from your Dynamics NAV Help for table fields: The [FieldTopicTextExtractor](../help/custom-help-toolkit-FieldTopicTextExtractor.md) tool can extract the first paragraph from your Dynamics NAV Help topics for table fields. The resulting spreadsheet will help you copy and paste the text from your Dynamics NAV Help topics into the ToolTip property of your controls.  

Mapping the table fields to page controls is not always straightforward. Because the same table is often used by two or more pages, the page ID can be many numbers away from the table ID. It requires knowledge of the actual solution to determine which tooltips are relevant for which pages. The **FieldTopicTextExtractor** tool generates an Excel file that you can use for this purpose. At Microsoft, we went through a similar process when we converted our field Help into tooltips. We find Excel useful because you can sort and filter, and then copy content to other fields, for example.  

In the base application, tooltips are in the page objects, so we edit code to edit tooltips. You do not have to do the same. You can choose to work with tooltips in the translation files or straight in code. Different solutions require different processes, so pick the process that is more efficient for you.  

We chose to associate the "What is this field?"-content with the user interface, meaning the controls on page objects. In the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] Help model, we chose a different approach, focusing on the database structure. Both approaches have their advantages and disadvantages, but the [!INCLUDE [prod_short](../developer/includes/prod_short.md)] user assistance model currently focuses on the user interface with tooltips on page objects. For more information, see [User Assistance Model](../user-assistance.md).  

For more information, see the following articles:

* [Working with Application Objects as Text Files](/previous-versions/dynamicsnav-2016/dn789521%28v%3dnav.90%29) in the docs for [!INCLUDE [navcorfu_md](../developer/includes/navcorfu_md.md)]  
* [How to Add Translated Strings By Importing and Exporting Multilanguage Files](/dynamics-nav/how-to--add-translated-strings-by-importing-and-exporting-multilanguage-files) in the docs for [!INCLUDE [nav2018_md](../developer/includes/nav2018_md.md)]  
* [Working with Translation Files](../developer/devenv-work-with-translation-files.md) for [!INCLUDE [prod_short](../developer/includes/prod_short.md)]  

## Moving to MarkDown

Converting your existing content to MarkDown can be done using third-party tools, including but not limited to [PanDoc](https://pandoc.org) or the [Writage](https://www.writage.com/) plugin for Word.  

Once you have converted your content to MarkDown, we recommend storing your content in a repository from where you can publish to your website, such as the following:

* A Git repo in Azure DevOps  
* A private or public repo in GitHub  
* A project in [MkDocs](https://www.mkdocs.org/)  

Use open-source tools such as [DocFx](https://dotnet.github.io/docfx/) to generate content for your website. By working in MarkDown, you have access to a world of open-source tools. But our [Custom Help Toolkit](../help/custom-help-toolkit.md) can help you prepare content for publishing.  

If you do not yet have a website that you publish content to, then there are several ways in which you can create such a site. For example, the [MkDocs](https://www.mkdocs.org/) project generates a website for you. You can also work with a web designer to build a site to host your content. We recommend deploying to [an Azure web app](/azure/app-service/overview). [!INCLUDE [prod_short](../developer/includes/prod_short.md)] does not require a special design of your website, unlike the now deprecated [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] Help Server. It's your choice what the website looks like, including the styling.  

## See Also

[Configuring the Help Experience](../deployment/configure-help.md)  
[Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md)  
[User Assistance Model](../user-assistance.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](../deployment/system-requirement-business-central.md)  
