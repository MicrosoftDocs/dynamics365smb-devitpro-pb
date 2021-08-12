---
title: "How to: Delete Translated Strings"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 72a94bea-81df-41c9-b4e6-a7b0276aa65b
caps.latest.revision: 16
manager: edupont
---
# How to: Delete Translated Strings
After you add translated strings into a database, there are two ways to delete them. You can use the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)], as described in this article, or the [Remove-NAVApplicationObjectLanguage](/powershell/module/microsoft.dynamics.nav.model.tools/Remove-NAVApplicationObjectLanguage) cmdlet that is available in the [!INCLUDE[nav_dev_shell_md](includes/nav_dev_shell_md.md)].   
  
### To delete a language layer  
  
1.  In the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], on the **Tools** menu, choose **Object Designer**.  
  
2.  In Object Designer, select the object for which you want to delete the translated strings.  
  
3.  On the **Tools** menu, point to **Language Module**, and then choose **Export**.  
  
4.  In the **Language Module Export** window, in the **File Name** field, enter the path and file name of the file that will contain the deleted strings.  
  
5.  In the **Language** field, choose the **AssistEdit** button.  
  
6.  In the **Windows Language List** window, select the language that you want to delete, and then choose **OK**.  
  
7.  In the **Language Module Export** window, select the **Delete language** field, and then choose the **OK** button.  
  
## See Also  
 [Multilanguage Development](Multilanguage-Development.md)   
 [How to: Add Translated Strings By Importing and Exporting Multilanguage Files](How-to--Add-Translated-Strings-By-Importing-and-Exporting-Multilanguage-Files.md)   
 [How to: Add Translated Strings By Using the Multilanguage Editor](How-to--Add-Translated-Strings-By-Using-the-Multilanguage-Editor.md)   
 [How to: Uninstall Language Modules](How-to--Uninstall-Language-Modules.md)