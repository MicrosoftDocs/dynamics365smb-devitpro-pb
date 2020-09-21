---
title: Upgrade Legacy Help
description: Reuse your Help from Dynamics NAV for your Business Central solution.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 08/31/2020
ms.author: edupont
---

# Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format

The standard version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] follows a [user assistance model](../user-assistance.md) with tooltips to explain all fields and actions and conceptual descriptions of functionality that is published to a public website. If you are building an app, you are expected to comply with this model. However, there are many ways in which you can migrate and reuse any existing Help that you might have.  

## Reusing existing web content

When you move to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you can reuse your existing product Help solution in most situations, especially if the content is already published to what we refer to here as an *online library*, which is an internal or external website. In that case, all you have to do is to add that website to the configuration of [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online or on-premises. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).  

More specifically, if you have content that you created for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to reuse that for your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution.  

For example, you have a [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server website with HTML files that describe your solution according to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] documentation model and format. In that scenario, you can reuse the Help Server website and rebrand that and the content accordingly. You then connect your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] solution with that Help Server website.  

However, [!INCLUDE [prodshort](../developer/includes/prodshort.md)] does not support the field-based approach to context-sensitive Help that [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] 2017 and earlier use. Instead, you must use the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] page-based approach to context-sensitive Help. You do not have to convert your existing Help, but you do need to make the content available. For more information, see [Adding page-level UI-to-Help mapping to the system table](../help/context-sensitive-help.md#adding-page-level-ui-to-help-mapping-to-the-system-table).  

> [!NOTE]
> For apps for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] online, you must apply tooltips to controls and actions in both page objects and page extensions, and you must supply context-sensitive links. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).

## Converting existing content

If your existing content is in a different format, such as PDF files, Word documents, or printed manuals, you must decide if you want to keep the content as-is, or if you want to convert it to a format that can be accessed from inside [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. There are third-party tools available that can help you migrate to other formats, depending on the current format and the target format.  

If you are migrating your solution from Dynamics GP, you might have content in PDF files. In that case, you can choose to convert the content to MarkDown as described in the [Moving to MarkDown](#moving-to-markdown) section, and then publish to a new online library on your current website, for example.  

### Migrating from Dynamics NAV

If you are migrating your solution from [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] or later versions of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you most likely have been using the [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help Server, and your Help content is in HTML format. That means that you can reuse your existing content as-is, or you can use publicly available third-party solutions to convert some or all of your HTML files to MarkDown, if you want to follow similar processes to the ones the Microsoft team follows. For more information, see the [Moving to MarkDown](#moving-to-markdown) section.  

If you are migrating from an earlier version of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)], then you can choose to first migrate to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] format, and then migrate again to MarkDown or similar formats. For more information, see [Upgrading Your Existing Help Content](/previous-versions/dynamicsnav-2013r2/dn466754(v=nav.71)) in the legacy docs for [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)].  

### Converting legacy Dynamics NAV field Help to tooltips

The tooltips play an important role as part of the [!INCLUDE[prodshort](../developer/includes/prodshort.md)] [user assistance model](../user-assistance.md), and we encourage you to apply tooltips to your controls and actions as well.  

For the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], Microsoft extracted the first paragraph from the HTML files of the [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] Help for table fields, and then imported the text into the page objects of the base application as tooltips. Use the Custom Help Toolkit to help you reuse your existing content in the same way. For more information, see [Custom Help Toolkit: The NavFieldsTooltips tool](../help/custom-help-toolkit-NavFieldsTooltips.md).  

For Microsoft, it was a three-step process. The **NavFieldsTooltips** tool can help you with step 1 in the following list.  

1. The starting point for us was two .TXT files, one file with all application objects, and one file with the first paragraph from HTML files with the field Help plus the ID of the table field. A tool then mapped the content from the HTML files to the page and control IDs in the application objects based on regular expressions to help with the mapping (step 2).

    For example, in [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] 2016, the field topic for the [Dimension 1 Code](/previous-versions/dynamicsnav-2016/hh170682(v=nav.90)) field on the **Analysis View** table had this first paragraph:

    ```html
    <p>Specifies one of the four dimensions that you can include in an analysis view. By entering a dimension here, you will be able to filter entries in the Analysis by Dimensions window, which will allow you to investigate and monitor relationships between entries and the dimension information attached to them. To select a dimension code, choose the field.</p>
    ```

    The field has the ID 3 on table 363, giving it a unique ID of T_363_13, which was used as the file name for the field help. A tool would extract this information into a text file in the following format:

    `T363-C13-P8631-A1033-L999:Specifies one of the four dimensions that you can include in an analysis view. By entering a dimension here, you will be able to filter entries in the Analysis by Dimensions window, which will allow you to investigate and monitor relationships between entries and the dimension information attached to them. To select a dimension code, choose the field.`

    The ID of the tooltip, `T363-C13-P8631-A1033-L999`, is based on the **Translate Export** format for [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] and specifies the table, the field, the property, the language, and the field length. For more information, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](/previous-versions/dynamicsnav-2016/dd301161(v=nav.90)) in the docs for [!INCLUDE [navcorfu_md](../developer/includes/navcorfu_md.md)].  

2. The second step mapped that table field ID to the corresponding control on the Analysis View page object. This step was required because tooltips are not supported on table fields, only on controls on page objects.  

    The mapping is not always straightforward because the same table is often used by two or more pages. As a result, the page ID could be many numbers away from the table ID. So we did much cleaning up and shuffling around in Excel after the conversion.

3. The last step was to get the edited tooltips into the metadata for the relevant page objects.  

    During our conversion, the application objects were still based on C/AL and C/SIDE, so we used the tools for working with C/AL objects in .TXT format. But the same can work for AL-based objects where the tooltips are stored in the [ToolTip](../developer/properties/devenv-tooltip-property.md) property.  

    For more information, see [Working with Application Objects as Text Files](/previous-versions/dynamicsnav-2016/dn789521%28v%3dnav.90%29) in the docs for [!INCLUDE [navcorfu_md](../developer/includes/navcorfu_md.md)], [How to Add Translated Strings By Importing and Exporting Multilanguage Files](/dynamics-nav/how-to--add-translated-strings-by-importing-and-exporting-multilanguage-files) in the docs for [!INCLUDE [nav2018_md](../developer/includes/nav2018_md.md)], and [Working with Translation Files](../developer/devenv-work-with-translation-files.md) for [!INCLUDE [prodshort](../developer/includes/prodshort.md)].

### After the conversion

Now that the tooltips are in the page objects, we work with them using Excel. Excel makes it easy to bulk-apply and bulk-edit strings because you can sort and filter the data. Due to the requirement of getting the text into Tooltip properties on page objects, we had to make it easy to do this work in a large Git enlistment in Azure DevOps, so the tooling is surrounded by a bunch of PowerShell scripts. We cannot share our current tooltip tool either, but it uses an open-source tool, [https://closedxml.codeplex.com/](https://closedxml.codeplex.com/), to handle the Excel integration - creating, opening, and saving an Excel workbook. The tool is then surrounded by PowerShell cmdlets scripts to populate the new Excel file with the existing page objects and their existing tooltips, and import the changed tooltips into the page objects.  

You can also choose to work with tooltips in the translation files or straight in the .AL files. Different solutions require different processes, so pick the process that is more efficient for you.  

We chose to associate the "What is this field?"-content with the user interface, meaning the controls on page objects. In the [!INCLUDE [navnow_md](../developer/includes/navnow_md.md)] help model, we chose a different approach, focusing on the database structure. Both approaches have their advantages and disadvantages, but the [!INCLUDE [prodshort](../developer/includes/prodshort.md)] user assistance model currently focuses on the user interface with tooltips on page objects. For more information, see [User Assistance Model](../user-assistance.md).  

## Moving to MarkDown

The Microsoft team converted a subset of the legacy Help for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md)] to build the new Help library at [/dynamics365/business-central/](/dynamics365/business-central/). If you want to customize or extend the Microsoft Help, you can fork our public repo for either the source repo in English (US) at [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs), or one of the related repos with translations into the supported languages. For more information, see [Extend, Customize, and Collaborate on the Help for [!INCLUDE[prodlong](../developer/includes/prodlong.md)]](../help/contributor-guide.md).  

Converting your existing content to MarkDown can be done using third-party tools, including but not limited to [PanDoc](https://pandoc.org) or the [Writage](https://writage.com) plugin for Word.  

When you have converted your content to MarkDown, you can use a Git repo in Azure DevOps as your source repository, create a private or public repo in GitHub, or set up a project in [MkDocs](https://www.mkdocs.org/), for example. Then you can use open-source tools such as [DocFx](https://dotnet.github.io/docfx/) to generate content for your website. In general, working in MarkDown means that you have access to a world of open-source tools and do not have a hard dependency on Microsoft providing you with tools. But the Custom Help Toolkit can help you prepare content for publishing. For more information, see [Custom Help Toolkit](../help/custom-help-toolkit.md).  

If you do not yet have a website that you publish content to, then there are several ways in which you can create such a site. The [MkDocs](https://www.mkdocs.org/) project generates a website for you, but you can also work with a web designer to build a site that resembles the [Docs.microsoft.com](/dynamics365/business-central/) site, if that is what your customers will prefer. We recommend deploying to [an Azure web app](/azure/app-service/overview).

## See Also

[Configuring the Help Experience](../deployment/configure-help.md)  
[Extend, Customize, and Collaborate on the Help](../help/contributor-guide.md)  
[User Assistance Model](../user-assistance.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](../deployment/system-requirement-business-central.md)  
