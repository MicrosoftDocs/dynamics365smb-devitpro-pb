---
title: Upgrade Dynamics NAV Help
description: Reuse your Help from Dynamics NAV for your Business Central solution.
author: edupont04
ms.custom: na
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.date: 10/01/2018
ms.author: edupont
---

# Migrate Legacy Help to the [!INCLUDE[prodlong](../developer/includes/prodlong.md)] Format

When you move to [!INCLUDE[prodshort](../developer/includes/prodshort.md)], you can reuse your existing product Help solution in most situations, especially if the content is already published to an internal or external website. In that case, all you have to do is to add that website to the configuration of [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. For more information, see [Configuring the Help Experience](../deployment/configure-help.md).  

If your existing content is in a different format, such as PDF files, Word documents, or printed manuals, you must decide if you want to keep the content as-is, or if you want to convert it to a format that can be accessed from inside [!INCLUDE[prodshort](../developer/includes/prodshort.md)].  

If you are migrating your solution from [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] or later versions of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md), then you most likely have been using the [!INCLUDE[navnow_md](../developer/includes/navnow_md.md) Help Server, and your Help articles are in HTML format. That means that you can use publicly available third-party solutions to convert your HTML files to MarkDown, if you want to follow similar processes to the ones the Microsoft team follows.  

If you are migrating from an earlier version of [!INCLUDE[navnow_md](../developer/includes/navnow_md.md), then you can choose to first migrate to the [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)] format, and then migrate again to MarkDown or similar formats. For more information, see [Upgrading Your Existing Help Content](/previous-versions/dynamicsnav-2013r2/dn466754(v=nav.71)) in the legacy docs for [!INCLUDE[navsicily_md](../developer/includes/navsicily_md.md)].  

## Converting to tooltips and MarkDown
For the default version of [!INCLUDE[prodshort](../developer/includes/prodshort.md)], Microsoft extracted the first paragraph from the HTML files of the legacy Help and imported the text into the page objects of the base application as tooltips. You can build a similar tool if you want to reuse your existing content in the same way.  

The Microsoft team also converted a subset of the legacy Help for [!INCLUDE[navnow_md](../developer/includes/navnow_md.md) to build the new Help library at [https://docs.microsoft.com/dynamics365/business-central/](https://docs.microsoft.com/en-us/dynamics365/business-central/). If you want to customize or extend the Microsoft Help, you can fork our public repo here: [https://github.com/MicrosoftDocs/dynamics365smb-docs](https://github.com/MicrosoftDocs/dynamics365smb-docs).  

Converting your existing content to MarkDown can be done using third-party tools, including but not limited to [PanDoc](https://pandoc.org) or the [Writage](https://writage.com) plugin for Word.  

## See Also

[Configuring the Help Experience](../deployment/configure-help.md)  
[Development of a Localization Solution](../developer/readiness/readiness-develop-localization.md)  
[System Requirements](../deployment/system-requirement-business-central.md)  
