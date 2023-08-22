---
title: Configure Localization App Location of Translated Base App Help
description: 
ms.custom: na
ms.date: 10/24/2022
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
robots: NOINDEX
ms.topic: conceptual
ms.author: solsen
author: SusanneWindfeldPedersen
---

# Configure Localization App Location of Translated Base App Help

AL extensions that are approved localization apps can override the default help link for [!INCLUDE [prod_short](includes/prod_short.md)] and re-direct users that looks for content for Microsoft's base app in a non-Microsoft delivered translations.  

> [!NOTE]  
> This feature is not available for per-tenant extensions, and any usage will be caught by the [PerTenantExtensionCop Analyzer](./analyzers/pertenantextensioncop.md).

## Configure app.json properties

In the `app.json` file, two properties control the Help URL and the supported locale of the Help. Learn more at [Localization apps](../help/context-sensitive-help.md#localization-apps) and [JSON Files](devenv-json-files.md).

## See Also

[Add Help Links from Pages, Reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
[Configure Context-Sensitive Help](../help/context-sensitive-help.md)  
[Working with Translation files](devenv-work-with-translation-files.md)  
