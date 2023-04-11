---
title: "Saving Setup Parameters in the Zup File"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 9c7cf52b-8128-45af-a7d9-0482457cb4df
caps.latest.revision: 7
---
# Saving Setup Parameters in the Zup File
Setup parameters for running the [!INCLUDE[nav_dev_long](includes/nav_dev_long_md.md)] are stored in a .zup file. By default, the file is named fin.zup and is located at C:\\users\\\<user name>\\AppData\\Roaming\\. To change the name and location of the .zup file, run the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] at a command prompt and specify the path and ID in the *id* parameter. For more information, see [Using the Development Environment from the Command Prompt](Using-the-Development-Environment-from-the-Command-Prompt.md).  
  
 You can create multiple .zup files by using the *id* parameter. For example, you may want different users to run the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] with different setup parameters by using the *id* parameter and specifying different .zup files.  
  
 The information that is stored in the .zup file includes:  
  
-   Database name.  
  
-   Database server name.  
  
-   The parameters that are available in the [Options](uiref/-$-S_2355-Options-$-.md) window.  
  
-   User-specified personalization of [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] windows, such as window size, window position, column order, column visibility, and column width.  
  
 When a user closes the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], any setup changes the user has made are saved to the .zup file.  
  
 To return to the original setup parameters, you can run the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] at a command prompt without specifying the *id* parameter so that the fin.zup file is used instead of a customized \<*id*>.zup file. If you have made changes to the fin.zup file but want to return to the original fin.zup settings, then delete the fin.zup file and run the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] at a command prompt without specifying the *id* parameter. A new fin.zup file is created that has the original setup parameters.
