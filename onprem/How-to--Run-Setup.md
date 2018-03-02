---
title: "How to: Run Setup"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: e4bd0a48-9e21-44e3-8a5d-858f02af5206
caps.latest.revision: 24
---
# How to: Run Setup
You use [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup to install software or to capture a set of custom setup settings to save in a setup configuration file. In this procedure, you run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup without any customization or configuration. Opportunities for customization and configuration are described throughout the procedure.  

> [!NOTE]  
>  You must be an administrator on the computer where you run Setup.  

## Running Setup to Install an Installation Option  

> [!NOTE]  
>  Before installing [!INCLUDE[navnowlong](includes/navnowlong_md.md)] on a computer, you must uninstall any other version of [!INCLUDE[navnow](includes/navnow_md.md)].  

#### To run [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup  

1.  Verify that the target computer meets the hardware and software requirements for the selected installation option. For more information, see [System Requirements for Microsoft Dynamics NAV](System-Requirements-for-Microsoft-Dynamics-NAV.md).  

2.  Insert the [!INCLUDE[navnow](includes/navnow_md.md)] installation media or locate the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup.exe file, and then double-click the Setup.exe file.  

3.  Choose **Next**.  

4.  To accept the license terms, choose **I accept**.  

5.  Choose either **Install Demo** or **Choose an installation option**.  

     If you choose **Install Demo**, Setup immediately begins to copy software and runs without requiring additional input. For more information, see [Demo Option](Demo-Option.md). If you choose **Choose an installation option**, you open the **Choose an installation option** page.  

6.  On the **Choose an installation option** page, choose the larger text that defines the name of an installation option: **Client Option**, **Server Option**, or **Developer Option**.  

     You can also choose **Customize** that appears below any of the three installation options to modify the list of components before you install. For more information, see [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md).  

7.  On the **Customize the Installation** page, choose **Next** to open the **Specify parameters** page. Any parameter that has an asterisk \(\*\) in front of the text box is a required parameter. Setup cannot complete unless you provide values for these parameters. In some cases, you may not know the correct value when you run Setup. You can add a temporary value. You can then modify the setting after you have finished running Setup by editing the appropriate configuration file. For more information, see [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md).  

     For information about how to configure components in Setup, see [How to: Preconfigure Components](How-to--Preconfigure-Components.md).  

8.  After you configure components, choose **Install** to start to install the software.  

9. When Setup is finished, choose **Close**.  

### Canceling Setup  
 Setup does not provide a **Cancel** button on all pages, but you can cancel an installation from any page by choosing the **Close** button in the upper-right corner. All [!INCLUDE[navnow](includes/navnow_md.md)] components are removed from the computer. The only software that Setup installs but cannot remove are:  

-   Database files, such as the Demo database.  

-   Prerequisites for [!INCLUDE[navnow](includes/navnow_md.md)] components that Setup can install, such as the .NET Framework.  

## See Also  
 [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md)   
 [How to: Preconfigure Components](How-to--Preconfigure-Components.md)   
 [How to: Create or Load a Setup Configuration File](How-to--Create-or-Load-a-Setup-Configuration-File.md)
