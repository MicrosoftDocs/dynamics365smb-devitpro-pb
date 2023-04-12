---
title: Multilanguage Application Development
description: Dynamics NAV is multilanguage enabled, which means that you can display the user interface UI in different languages.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6e0ff568-9cad-4b0f-bd97-b8ac5690a470
caps.latest.revision: 26
---
# Multilanguage Development in Dynamics NAV
[!INCLUDE[navnow](includes/navnow_md.md)] is multilanguage enabled, which means that you can display the user interface \(UI\) in different languages.  
  
 A multilanguage version of [!INCLUDE[navnow](includes/navnow_md.md)] is not the same as a localized version.  
  
-   A *localized* version is a version that is adapted to a local market. All text that is displayed to the user is translated into the local language, and all functional areas are adapted to the requirements of the local market. For example, the Canadian version of [!INCLUDE[navnow](includes/navnow_md.md)] has additional local functionality that applies to the Canadian market.  
  
-   A *multilanguage* version is a localized version that you can run in different languages, but all local functionality remains the same. For example, you can run the Canadian version of [!INCLUDE[navnow](includes/navnow_md.md)] in both English and French, but it is still the Canadian localized version. It does not contain the same local functionality as the French localized version.  
  
 To be able to run a localized version in multiple languages, you must install language modules.  
  
## Installing Language Modules  
 You can install language modules so that you can view text in the user interface in different languages. Once you have installed a language module, you can select that language on the **Select Language** page in the UI to change the language of all text that is displayed in the UI in captions for text boxes, on command buttons, in menus, and so on.  
  
> [!NOTE]  
>  When you change the language of [!INCLUDE[navnow](includes/navnow_md.md)], you are not changing the language of the data that is stored in [!INCLUDE[navnow](includes/navnow_md.md)]. Changing the text that is stored as application data is not part of the language modules. Examples of such text are the names of items in the inventory or the comments for a customer.  
  
 For more information, see [Language Modules](Language-Modules.md).  
  
## Developing Multilanguage Applications  
 After you install a language module, you must design your application to take advantage of the multilanguage functionality. For more information, see [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md).  
  
## Viewing the Application in Different Languages  
 The language that is displayed to end users in the application depends on several factors, including the language on the localized version of the application, whether a user has specified a global language, whether a developer has specified a global language in C/AL code, or whether a developer has specified a language for a particular object in C/AL code. For more information, see [Viewing the Application in Different Languages](Viewing-the-Application-in-Different-Languages.md).  
  
## See Also  
 [Development](Development.md)   
 [Adding Languages to Microsoft Dynamics NAV](Adding-Languages-to-Microsoft-Dynamics-NAV.md)   
 [Language Modules](Language-Modules.md)   
 [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md)   
 [Viewing the Application in Different Languages](Viewing-the-Application-in-Different-Languages.md)
