---
title: Multiple Language Functionality
description: In a Multilanguage-enabled application, you view the text in any language that has been added to the application in Microsoft Dynamics NAV. 
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: c8d9df64-66c1-464f-9803-f1b9f4aca228
caps.latest.revision: 9
---
# Viewing the Application in Different Languages
In a multilanguage-enabled application, you can view the text in any language that has been added to the application. For more information about adding languages, see [Language Modules](Language-Modules.md).  
  
## Changing the Language from the User Interface  
 You can change the language in which text is displayed in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] and in the [!INCLUDE[rtc](includes/rtc_md.md)].  
  
 When you change the language of the application from the user interface \(UI\) in either the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] or the [!INCLUDE[rtc](includes/rtc_md.md)], you are changing the *global language*.  
  
 For more information, see [How to: Change the Language in the User Interface](How-to--Change-the-Language-in-the-User-Interface.md).  
  
## Changing the Language from C/AL Code  
 You can change the global language from C/AL code, which is the same as changing the language from the UI. To change the global language from C/AL code, use the GLOBALLANGUAGE function.  
  
 For more information, see [Language Functions](Language-Functions.md).  
  
## Languages and Primary Languages  
 If a particular string for the current language cannot be found, then [!INCLUDE[navnow](includes/navnow_md.md)] searches for the text in another related language. Languages in Windows are tagged with a primary language ID. For example, the language with ID 1033, which is English \(United States\), is the primary language for a group of languages that includes ID 2057, which is English \(United Kingdom\), and ID 3081, which is English \(Australia\). Similar relationships exist for languages such as French, Spanish, and German.  
  
 [!INCLUDE[navnow](includes/navnow_md.md)] uses the primary language if the text for the current language cannot be found. For example, if you are running the German \(Switzerland\) localized version and you open a page that contains strings that do not exist with the language ID for German \(Switzerland\), then [!INCLUDE[navnow](includes/navnow_md.md)] looks for a string with the language ID for German \(Germany\) because German \(Germany\) is the primary language for German \(Switzerland\).  
  
 The algorithm searches for the text to use in the following order:  
  
1.  The language of the object, which can be specified by a developer in C/AL code.  
  
2.  The primary language of the object language.  
  
3.  The global language that is either selected by the user or specified by a developer in code.  
  
4.  The primary language of the global language.  
  
5.  The language of the localized version of the application.  
  
6.  The primary language of the localized version of the application.  
  
 Text is always displayed, but you can have situations in which different pages or even different controls on a page are displayed in different languages.  
  
 To view all language IDs and the associated information, such as primary ID, name, and abbreviated name, you can design a page that is based on the **Windows Language** virtual table. For more information, see [Windows Language Virtual Table](Windows-Language-Virtual-Table.md).  
  
## Help in the RoleTailored Client  
 In the [!INCLUDE[rtc](includes/rtc_md.md)], Help displays in the same language as you have selected in [!INCLUDE[navnow](includes/navnow_md.md)]. If the Help Server does not include that language, Help displays in English.  
  
## See Also  
 [Multilanguage Development](Multilanguage-Development.md)   
 [Microsoft Dynamics NAV Help Server](Microsoft-Dynamics-NAV-Help-Server.md)
