---
title: "Translating Base App Help using AL Extensions"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.author: solsen
author: SusanneWindfeldPedersen
---

# Translating Base App Help using AL Extensions
With an AL extension you can override the default help link for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] and re-direct users pressing the Help button to another website. This also enables translating help for base app objects.

> [!NOTE]  
> This feature is not available for per-tenant extensions, and any usage will be caught by the [PerTenantExtensionCop Analyzer](devenv-codeanalyzer-pertenantextensioncop-rules.md).

## Help properties
In the `app.json` file, two properties control the help URL and the supported locale of the help. For help on manifest files, see [JSON Files](devenv-json-files.md).

The `helpBaseUrl` property represents the URL that will be used to overwrite the default Microsoft help link, which is `(/{0}/dynamics365/business-central)`. This URL must contain a placeholder `{0}` for the user's locale culture. 
The `supportedLocales` property is used to specify the list of locales that are supported by the URL specified in the `helpBaseUrl` property and used in the translation app. If the user's current locale is among the `supportedLocales` of the extension, the user will be re-directed to the help base URL that you specified. The settings in the `app.json` file look like this:

```json
"helpBaseUrl": "https://www.mydocumentationwebsite.com/{0}/business-central/",
"supportedLocales": ["da-DK"]
```

## See Also
[Working with Translation files](devenv-work-with-translation-files.md)  
[Adding Help Links from Pages, Reports, and XMLports](devenv-adding-help-links-from-pages-tables-xmlports.md)  
