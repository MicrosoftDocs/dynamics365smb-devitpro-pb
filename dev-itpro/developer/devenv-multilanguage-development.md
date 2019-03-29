---
title: "Multilanguage Development"
ms.custom: na
ms.date: 04/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
ms.assetid: 6e0ff568-9cad-4b0f-bd97-b8ac5690a470
caps.latest.revision: 26
ms.author: solsen
author: SusanneWindfeldPedersen
redirect_url: devenv-work-with-translation-files
---

 

# Multilanguage Development
[!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] are multilanguage enabled, which means that you can display the user interface (UI) in different languages.  

A multilanguage version of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] is not the same as a localized version.  
  
-   A *localized* version is a version that is adapted to a local market. All text that is displayed to the user is translated into the local language, and all functional areas are adapted to the requirements of the local market. For example, the Canadian version of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] has additional local functionality that applies to the Canadian market.  
  
-   A *multilanguage* version is a localized version that you can run in different languages, but all local functionality remains the same. For example, you can run the Canadian version of [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)] in both English and French, but it is still the Canadian localized version. It does not contain the same local functionality as the French localized version.  
  
## Viewing the application in different languages  
 The language that is displayed to end users in the application depends on several factors, including the language on the localized version of the application, whether a user has specified a global language, whether a developer has specified a global language in AL code, or whether a developer has specified a language for a particular object in AL code. 
  
## Adding languages for extensions
When developing extensions for [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)], you must make sure that the user interface of the extension is translated to the language used in [!INCLUDE[d365fin_long_md](includes/d365fin_long_md.md)]. The properties in AL that contain strings surfacing in the UI, can be extracted to an .xliff file and sent for translation. For more information, see [Working with Translation Files](devenv-work-with-translation-files.md).

## See Also
[Working with Translation Files](devenv-work-with-translation-files.md)  