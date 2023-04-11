---
title: Add Translated Strings Using Multilanguage Editor
description: Add string translations for UI elements in a standard country/region-specific version, and install a language module to support viewing in different languages.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 17ece886-9d04-4841-9836-c3f8ecd99f29
caps.latest.revision: 17
---
# How to Add Translated Strings By Using the Multilanguage Editor in Dynamics NAV
To add string translations for UI elements in a standard country/region-specific version of [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you install a language module so that end users can view the UI elements in a different language. If you have customized objects in the application, then you must also add translations for those objects. You can translate strings in the following ways:  
  
-   By using the Translate tool in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] to import and export multilanguage files that contain translated strings for multiple objects  
  
-   By using the Multilanguage Editor and editing the CaptionML property of individual objects  
  
 This topic describes how to use the Multilanguage Editor to edit the CaptionML property of objects. For more information about how to use the Translate tool, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md).  
  
### To add a translation in Multilanguage Editor  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select the object for which you want to add a translation, and then choose **Design**.  
  
3.  In the designer, select the control for which you want to add a translation, choose **View**, and then choose **Properties**.  
  
4.  In the **CaptionML** property, choose the **AssistEdit** button.  
  
5.  In the Multilanguage Editor, enter the language and the translated text. For more information, see [How to: Enter Text in the Multilanguage Editor](How-to--Enter-Text-in-the-Multilanguage-Editor.md).  
  
 To let the user select a specific language in the application, the following must be true:  
  
-   You must have deployed the relevant language modules. For more information, see [How to: Install Language Modules](How-to--Install-Language-Modules.md).  
  
-   The language-specific subfolder must contain the correct fin.stx file.  
  
-   The text strings in the database must be marked with the correct language ID.  
  
-   The license file must contain the correct granule.  
  
## See Also  
 [Multilanguage Development](Multilanguage-Development.md)   
 [How to: Delete Translated Strings](How-to--Delete-Translated-Strings.md)
