---
title: Add Translated Strings for Conflicting Text Encoding Formats
description: Configure solution for users with different regional settings and formats by allowing access to the same Server but see UI strings in their local language.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.assetid: cf0de1f9-a072-4c94-9110-e31e3cfc6a04
caps.latest.revision: 4
---
# How to Add Translated Strings for Conflicting Text Encoding Formats in Dynamics NAV
You can configure your [!INCLUDE[navnow](includes/navnow_md.md)] solution so that users with different regional settings and text formats can access the same [!INCLUDE[nav_server](includes/nav_server_md.md)] and see user interface strings in their local language. This functionality supplements the use of language modules and helps resolve issues with conflicting text encoding.  
  
 The following procedure assumes that your solution contains strings in English and Dutch, and that you want to add support for Chinese. English and Dutch follow the same text encoding format, so you have been able to import the translation into Dutch to your [!INCLUDE[navnow](includes/navnow_md.md)] solution. But you cannot import strings in Chinese into the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] because the text file cannot handle Chinese as well as Dutch and English. The same situation will occur if you want to add Chinese and Japanese to your solution.  
  
### To add translated strings for a conflicting text encoding format  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], export the strings for the objects that you want to translate. For more information, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md).  
  
     The resulting text file contains user interface strings in English and Dutch.  
  
2.  Translate the strings in the resulting text file into Chinese by using your preferred translation process.  
  
3.  When translations are complete, save the translated strings into a text file in the UTF-8 text encoding format. For example, open the text file in Notepad, choose **File**, and then choose **Save As**. In the dialog that appears, in the **Encoding** field, choose UTF-8, and then choose **Save**.  
  
     Optionally, choose to replace the existing file, or save the file with a different file name. However, the extension of the file must be **.txt**.  
  
     Depending on your translation process, this file contains strings in Chinese, English, and Dutch. You save it in Unicode format so that [!INCLUDE[nav_server](includes/nav_server_md.md)] can access the content of the file.  
  
    > [!IMPORTANT]  
    >  We recommend that you remove the English and Dutch strings from the Unicode file before you copy it to the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. [!INCLUDE[nav_server](includes/nav_server_md.md)] queries the **Translations** folder for updated strings, and for performance reasons the folder should only contain strings that you cannot import into the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] because of conflicting codepages.  
  
4.  Copy the UTF-8 file to the equivalent of [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Translations on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer.  
  
     When you have more than one service instance, there is a **Translations** folder for each service instance, such as [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Instances\\*MyInstance*\\Translations.  
  
5.  Restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
 [!INCLUDE[nav_server](includes/nav_server_md.md)] adds the translated strings in the file to the metadata store for the [!INCLUDE[navnow](includes/navnow_md.md)] deployment. Users of this [!INCLUDE[nav_server](includes/nav_server_md.md)] session can now change the user interface language from English to Dutch, and then to Chinese.  
  
 The metadata store is updated whenever you add new strings to the **Translations** folder and then restart the [!INCLUDE[nav_server](includes/nav_server_md.md)] service instance. Cached strings are not deleted from the metadata store when you restart the service instance.  
  
## See Also  
 [Adding Languages to Microsoft Dynamics NAV](Adding-Languages-to-Microsoft-Dynamics-NAV.md)   
 [Multilanguage Development](Multilanguage-Development.md)   
 [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md)