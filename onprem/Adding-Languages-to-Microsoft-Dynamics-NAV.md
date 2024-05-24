---
title: "Adding Languages to Microsoft Dynamics NAV"
ms.date: 10/01/2018
ms.topic: article
ms.assetid: c56b9a90-1ec8-43ea-aeef-1b37ec423740
caps.latest.revision: 3
---
# Adding Languages to Microsoft Dynamics NAV
In [!INCLUDE[navnow](includes/navnow_md.md)], you can display the user interface \(UI\) in different languages. Your version of [!INCLUDE[navnow](includes/navnow_md.md)] can include multiple languages by default, and you can add additional languages to an existing deployment.  

 You can add a language layer by importing a language module, or you can import a multilanguage file that contains newly translated strings.  

## Translated User Interface Strings  
 In [!INCLUDE[navnow](includes/navnow_md.md)], the user interface includes the following types of translatable user interface strings:  

-   Captions for application objects, such as pages, tables, reports, option fields, icons, menus, and so on, that are defined in the **CaptionML** property for an object.  

     For more information, see [Developing Multilanguage-Enabled Applications](Developing-Multilanguage-Enabled-Applications.md).  

-   Text messages that are defined in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], such as text constants and error messages that are defined in the [C-AL Globals](uiref/-$-S_10204-C-AL-Globals-$-.md) window or the **C/AL Locals** window.  

-   Text messages and strings that are defined in [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  

 If you are a developer or an administrator, you can add languages to the captions for application objects and to the text messages that are defined in the **C/AL Globals** window or the **C/AL Locals** window. To add a language to the text messages that are defined in the resource files for [!INCLUDE[nav_server](includes/nav_server_md.md)] and [!INCLUDE[nav_windows](includes/nav_windows_md.md)], special tools are required.  

### Language Modules and Translated Text Files  
 You can install language modules so that you can view text in the user interface in different languages. Once you have installed a language module, you change the language of the user interface in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] and for users of the [!INCLUDE[nav_web](includes/nav_web_md.md)]. When you change a language in the UI, you change the language of all text that is displayed in the UI in captions for text boxes, on command buttons, in menus, and so on. For more information, see [Language Modules](Language-Modules.md).  

 Alternatively, you can manage translations by using text files. In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], you can export all strings for the specified objects to a text file, translate the strings in a translation tool of your choice, and then import the new translations. Then, when you compile the updated objects, the new translations are available to users in the [!INCLUDE[nav_windows](includes/nav_windows_md.md)]. For more information, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md).  

 Language modules and multilanguage text files are the default way of supporting users of your application so that they can switch between Dutch and English, for example.  

### Translating Multilanguage Files  
 Captions and other user interface text that you define for objects in the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] can be exported to a text file. You can then add new translations to the text file and import the new translations in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. You can use a dedicated translation tool, or you can add translations manually using Notepad, Microsoft Excel, and so on.  

 The exported text files contain an entry for each translatable user interface element for the objects that you selected in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)]. However, the text file also includes entries that cannot be translated. For example, if you export the strings for table 18, the resulting text file contains hundreds of entries, of which fewer than 170 can be translated. The translatable strings include the captions of for all fields and the error messages that you have defined. The non-translatable strings include names of variables, and so on.  

 In [!INCLUDE[demolong](includes/demolong_md.md)], all objects are multilanguage enabled, and they include strings with captions in the 1033 locale, English \(US\). The locale is specified by a multilanguage property such as P8629, but the ID of the actual property is different for different types of strings. However, the locale for the multilanguage property value always starts with the character A. For example, the English \(US\) captions are identified by the `A1033` locale value for the relevant multilanguage property. You can identify which strings can be translated by opening the file in Microsoft Excel and then filter by the English locale.  

 If you export strings for objects of different types, the text file lists the strings by object type and then by object ID. For example, if you export strings for table 18, page 21, and report 111, the text file lists strings in the following order:  

1.  Table 18  

2.  Report 111  

3.  Page 21  

 The format of the exported text files can be difficult to read, because for each type of object, the text file contains different types of strings. Each type of string is identified by a property that starts with the character P followed by an ID. For example, for a table object and the fields on the table, the multilanguage property has the ID 8629. For option values for fields on tables, the multilanguage property has the ID 8632. This means that you can identify the type of string when you translate the strings. However, you should filter out all strings that are not translatable, which makes the remaining strings easier to understand.  

 The following table illustrates the translatable strings for table 18 in the [!INCLUDE[demolong](includes/demolong_md.md)].  

|String|[!INCLUDE[bp_tabledescription](includes/bp_tabledescription_md.md)]|  
|------------|---------------------------------------|  
|`T18-P8629-A1033-L999:Customer`|The caption of the table object.|  
|`T18-F1-P8629-A1033-L999:No.`|The caption of field 1.|  
|`T18-F7601-P8629-A1033-L999:Copy Sell-to Addr. to Qte From` <br /> `T18-F7601-P8632-A1033-L999:Company,Person`|The caption of field 7601 and the captions of the option values for the field.|  
|`T18-Q1001-P26171-A1033-L999:Do you wish to create a contact for %1 %2?`|A text constant that defines user interface text.|  

 For more information, see [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md).  

### Multilanguage across Conflicting Text Encoding Formats  
 In most deployments of [!INCLUDE[navnow](includes/navnow_md.md)], you use the default multilanguage capabilities of [!INCLUDE[navnow](includes/navnow_md.md)]. However, if your users use languages with conflicting text encoding formats, such as Dutch and Chinese, for example, then you must add the translated strings to [!INCLUDE[navnow](includes/navnow_md.md)] in a different way.  

 To support users with translated strings across conflicting text encoding formats, you must save the translations to a text file in UTF-8 text encoding format. This converts the file to Unicode, which [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] cannot import. Instead, you add the files to a dedicated **Translations** folder on the [!INCLUDE[nav_server](includes/nav_server_md.md)] computer. The default location of this folder is [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Translations. When you have more than one service instance, there is a **Translations** folder for each service instance, such as [!INCLUDE[navnow_install](includes/navnow_install_md.md)]\\Service\\Instances\\*MyInstance*\\Translations. [!INCLUDE[nav_server](includes/nav_server_md.md)] adds any strings in text files that you place in the relevant **Translations** folder to the metadata for [!INCLUDE[navnow](includes/navnow_md.md)]. As a result, users can switch the language of the user interface between Dutch, English, and Chinese, for example. For more information, see [How to: Add Translated Strings for Conflicting Text Encoding Formats](How-to--Add-Translated-Strings-for-Conflicting-Text-Encoding-Formats.md).  

> [!IMPORTANT]  
>  [!INCLUDE[nav_server](includes/nav_server_md.md)] imports strings from .txt files only. If you save your strings to a file with a different extension, they cannot be imported by [!INCLUDE[nav_server](includes/nav_server_md.md)].  
>   
>  Also, we recommend that you use .txt files only for those strings that cannot be added by importing multilanguage files into the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)].  

## See Also  
 [Language Modules](Language-Modules.md)   
 [How to: Install Language Modules](How-to--Install-Language-Modules.md)   
 [How to: Uninstall Language Modules](How-to--Uninstall-Language-Modules.md)   
 [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md)   
 [How to: Add Translated Strings for Conflicting Text Encoding Formats](How-to--Add-Translated-Strings-for-Conflicting-Text-Encoding-Formats.md)   
 [Multilanguage Development](Multilanguage-Development.md)
