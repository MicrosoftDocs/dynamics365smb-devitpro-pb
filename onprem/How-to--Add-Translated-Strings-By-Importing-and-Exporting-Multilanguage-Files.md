---
title: Importing and Exporting Multilanguage Files
description: Add string translations for UI elements in a country/region-specific version, and install a language module to support viewing in different languages.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 116f40e8-26fe-46d4-9da9-ae5830fbe509
caps.latest.revision: 19
manager: edupont
---
# How to Add Translated Strings By Importing and Exporting Multilanguage Files in Dynamics NAV
To add string translations for UI elements in a standard country/region-specific version of [!INCLUDE[navnowlong](includes/navnowlong_md.md)], you install a language module so that end users can view the UI elements in a different language. If you have customized objects in the application, then you must also add translations for those objects. You can translate strings in the following ways:  
  
-   By importing and exporting text files that contain translated strings for multiple objects in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)].  
  
-   By using the Multilanguage Editor and editing the CaptionML property of individual objects.  
  
-   By running [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to update CaptionML properties.  
  
 This topic describes how to import and export multilanguage files. For more information about how to use the Multilanguage Editor, see [How to: Add Translated Strings By Using the Multilanguage Editor](How-to--Add-Translated-Strings-By-Using-the-Multilanguage-Editor.md). For more information about how to run [!INCLUDE[wps_2](includes/wps_2_md.md)] cmdlets to export and import languages, see [Working with Application Objects as Text Files](Working-with-Application-Objects-as-Text-Files.md).  
  
## Exporting Multilanguage Files  
 To translate strings for multiple objects, you must first export all text strings.  
  
#### To export a multilanguage file  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in Object Designer, select the objects that you want to export strings for.  
  
2.  On the **Tools** menu, point to **Translate**, and then choose **Export**.  
  
3.  In the **Translate Export** window, select the location where you want to export the file.  
  
4.  In the **File name** field, enter an appropriate name for the file.  
  
5.  In the **Save as Type** field, select the format type, and then choose the **Save** button.  
  
## Translating Multilanguage Files  
 You can add translated strings directly to the exported file, or you can use a translation tool. If you add translated strings directly to the exported file, then use the following procedure.  
  
#### To translate strings in a multilanguage file  
  
1.  Open the multilanguage file for editing. For example, open the file with a text editor or in Microsoft Office Excel.  
  
2.  For each string that you want to translate, create a new line in the file.  
  
3.  Copy and paste the source ID of the item to be translated into the new line.  
  
4.  Modify the four-character language code to the language to which you are translating.  
  
5.  Add the translated string to the new line.  
  
     The following illustration uses \#\#\#\# to represent the language code of the language to which you translate the string.  
  
     ![Translated Strings file in Excel.](media/NAV_PLAT_TranslatingStrings.png "NAV\_PLAT\_TranslatingStrings")  
  
## Importing Multilanguage Files  
 After you add translated strings to the multilanguage file, you must import the file into the application.  
  
#### To import a multilanguage file  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], in Object Designer, select the objects that you want to import strings for.  
  
     If you do not know which objects are included in the multilanguage file, select all objects.  
  
2.  On the **Tools** menu, point to **Translate**, and then choose **Import**.  
  
3.  In the **TranslateImport** window, navigate to the file that you want to import.  
  
4.  Select the file, and then choose **Open**.  
  
## See Also  
 [Multilanguage Development](Multilanguage-Development.md)   
 [Working with Application Objects as Text Files](Working-with-Application-Objects-as-Text-Files.md)