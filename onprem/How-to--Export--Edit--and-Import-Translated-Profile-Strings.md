---
title: "How to: Export, Edit, and Import Translated Profile Strings"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5010e1d9-6894-4356-811b-ad6c7e4b96d9
caps.latest.revision: 4
---
# How to: Export, Edit, and Import Translated Profile Strings
To enable customized translation of profiles, the **Profile List** window has actions for exporting and importing resources \(.resx\) files. This topic explains the process of exporting .resx files for translation, and then importing the translated .resx files for one or more profiles. Any imported translation can also be removed from the **Profile List** window.  

> [!NOTE]  
>  When installing a language module, we recommend that you import the profile resource files for all of the profiles. For more information, see [How to: Install Language Modules](How-to--Install-Language-Modules.md).  

### To export a profile resource file  

1.  In the **Search** box, enter **Profiles**, and then choose the related link.  

2.  Select the profile, or profiles that you want to export a resource file for, and then choose the **Export Translated Profile Resources** action.  

3.  In the **Browse for Folder** dialog, select which folder to export the resource file to and then choose the **OK** button.  

4.  A dialog will appear when the export is completed.  

     The [!INCLUDE[nav_web](includes/nav_web_md.md)] only supports exporting and importing .zip files, and if you are exporting profile resource files from the [!INCLUDE[nav_web](includes/nav_web_md.md)], you will be prompted for where to save the .zip file after step 4.  

### To edit a profile resource file  

1.  Navigate to where you exported the profile resource file and open the file with your preferred editor.  

2.  Find the text strings that you want to translate marked in `<value></value>` tags, for example, `<value>Send To</value>`. The `<comment></comment>` tag contains information about which object the string is used for.  

    > [!IMPORTANT]  
    >  Do not translate the strings in the `<data name="Profile ID" xml:space="preserve">` and `<data name="Profile Description" xml:space="preserve">` tags. These contain the **Profile ID** and **Profile Description** and modifying these will cause an error.  

3.  Once you are done, save the file.  

### To import a profile resource file  

1.  In the **Search** box, enter **Profiles**, and then choose the related link.  

2.  Select the profile, or profiles that you want to import a resource file for, and then choose either the **Import Translated Profile Resources From Folder** action, or the **Import Translated Profile Resources From Zip File** action, depending on the format of your resource files.  

     When you import from a folder, select the folder that contains the individual language folders.  

     When you import from a .zip file, the .zip file must contain the same structure as is generated when exporting to a .zip file. You can try this by exporting the profile resource file from the [!INCLUDE[nav_web](includes/nav_web_md.md)].  

    > [!NOTE]  
    >  In the [!INCLUDE[nav_web](includes/nav_web_md.md)], you only have the **Import Translated Profile Resources From Zip** option.  

3.  In the **Browse For Folder** dialog, select the folder to import the translated resource file from, and then choose the **OK** button.  

    > [!IMPORTANT]  
    >  Any existing translations will be overwritten.  

4.  A dialog will appear when the import is completed.  

### To remove a profile resource file  

1.  On the Profiles page, select the profile, or profiles that you want to remove translated profile resource for.  

2.  Select the **Remove Translated Profile Resources** action, and in the dialog box, select the language to remove the profile translations for.  

3.  Choose the **OK** button.  

## See Also  
 [How to: Install Language Modules](How-to--Install-Language-Modules.md)   
 [How to: Uninstall Language Modules](How-to--Uninstall-Language-Modules.md)
