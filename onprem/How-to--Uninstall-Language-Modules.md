---
title: "How to: Uninstall Language Modules"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 25734b06-5c44-47b1-ad76-b286fb0418c0
caps.latest.revision: 11
---
# How to: Uninstall Language Modules
To uninstall a language module, you must delete the language from the database and uninstall each component of the language module that you installed.  
  
 For more information about how to delete translated strings from individual objects, see [How to: Delete Translated Strings](How-to--Delete-Translated-Strings.md).  
  
 For more information about how to install language modules, see [How to: Install Language Modules](How-to--Install-Language-Modules.md).  
  
### To uninstall a language module  
  
1.  If you have imported translated profile resources, you must first go to the computer running the [!INCLUDE[nav_windows](includes/nav_windows_md.md)].  
  
2.  In the **Search** box, enter **Profiles**, and then choose the related link.  
  
3.  Select all profiles, and then choose the **Remove Translated Profile Resources** button.  
  
4.  Select the language that you want to delete and for which to remove the profile translations, and then choose the **OK** button.  
  
5.  Now in the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
6.  In Object Designer, select all objects.  
  
7.  On the **Tools** menu, choose **Language Module**, and then choose **Export**.  
  
8.  In the **Language Module Export** window, in the **File Name** field, enter the path and file name of the file that will contain the deleted language module.  
  
9. In the **Language** field, choose the **AssistEdit** button.  
  
10. In the **Windows Language List** window, select the language that you want to delete, and then choose the **OK** button.  
  
11. In the **Language Module Export** window, select the **Delete language** field, and then choose the **OK** button.  
  
12. In Control Panel, choose **Programs and Features**.  
  
13. For each component of the language module that is installed, select the component, and then choose **Uninstall/Change**.
