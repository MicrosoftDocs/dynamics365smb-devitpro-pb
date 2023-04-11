---
title: Create or Load Setup Configuration File
description: Customize the list of components to install or configure settings for individual components and save the information to a setup configuration file.
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e153944c-015b-49ea-9a82-a4b462c5a103
caps.latest.revision: 15
---
# Creating or Loading a Setup Configuration File
You can customize the list of components to install or configure settings for individual components. For more information, see [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md) and [How to: Preconfigure Components](How-to--Preconfigure-Components.md).  
  
 After you finished customization and configuration, you can save this information to a Setup configuration file. You can use this file with Setup, either when you or another user runs Setup or when you run a silent installation. For more information about silent installation, see [Running Setup on the Command Line](Running-Setup-on-the-Command-Line.md).  
  
 In these procedures, you save and load a configuration file.  
  
## Saving Setup Configuration Files  
 You can create a new setup configuration file or save a modified setup configuration file on the **Specify parameters** page in [!INCLUDE[navnow](includes/navnow_md.md)] Setup. This page is available when you run Setup unless you select **Install Demo**, which skips all other Setup pages.  
  
#### To save a setup configuration file  
  
1.  In the **Specify parameters** page, choose **Save**.  
  
2.  Type a file name for the configuration file. An .xml extension is added automatically.  
  
3.  Choose **Save**.  
  
     You now return to the **Specify parameters** page, where you can continue with installing software. You can also close Setup if you only have to create a Setup configuration file.  
  
## Loading a Setup Configuration File  
 The option to load a Setup configuration file is on the **Choose an installation option** page in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] Setup. This option is also available with a command-line install. For more information, see [Running Setup on the Command Line](Running-Setup-on-the-Command-Line.md).  
  
> [!IMPORTANT]  
>  A Setup configuration file contains information about which components to install and which settings to apply to each component. Therefore, you should not customize the list of components or configure components in Setup before you load a Setup configuration file because loading the configuration overwrites all prior customization and configuration.  
  
#### To load a Setup configuration file in Setup  
  
1.  In the **Choose an installation option** page, choose **Load Configuration**.  
  
     This option is located under **Custom Components**.  
  
2.  In the **Open** dialog box, select or browse to the Setup configuration file that you want to open, and then double-click the file.  
  
     Setup now shows the **Customize the installation** page that has been modified according to the component selection in the loaded Setup configuration file.  
  
3.  Modify the list of components to install or choose **Next** to proceed to the **Specify parameters** page, where settings from the Setup configuration file are shown.  
  
4.  Configure these settings or choose **Apply** to accept these values and continue.  
  
## See Also  
 [Editing a Setup Configuration File](Editing-a-Setup-Configuration-File.md)
