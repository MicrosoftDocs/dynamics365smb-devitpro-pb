---
title: "Walkthrough: Installing the Demo Version"
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1ad0b37b-6d38-4c92-9ca6-14888864fb6b
---
# Walkthrough: Installing the Demo Version
You can install the Demo version of [!INCLUDE[navnowlong](includes/navnowlong_md.md)] to evaluate or learn how to use the product. You should not use the [!INCLUDE[demolong](includes/demolong_md.md)] as the basis for an actual deployed production environment.  

> [!NOTE]  
>  [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup always installs all components for the demonstration database on a single computer.  

## Installed Components  
 The Demo Install includes:  

-   The [!INCLUDE[nav_windows](includes/nav_windows_md.md)]  

-   [Microsoft Dynamics NAV Server](Microsoft-Dynamics-NAV-Server.md)]  

-   [Development Environment (C/SIDE)](Development-Environment--C-SIDE-.md)]  

-   Microsoft Office Outlook Add-in for Microsoft Dynamics NAV  

-   [SQL Server Database Components](SQL-Server-Database-Components.md)]  

-   [!INCLUDE[demolong](includes/demolong_md.md)]  

-   Demo license  

> [!NOTE]  
>  If a supported version of SQL Server is present on the computer, and there is an existing SQL Server instance named NAVDEMO, then the [!INCLUDE[demolong](includes/demolong_md.md)] is installed in this instance. Otherwise, Setup automatically installs SQL Server Express Edition, then creates a NAVDEMO instance, then installs [!INCLUDE[demolong](includes/demolong_md.md)] in this instance.  

## Recommendations and Constraints  
 You should consider the following factors before you install and use the Demo Install:  

-   The [!INCLUDE[demolong](includes/demolong_md.md)] has not been tested to run side by side with earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)]. We recommend that you do not install the [!INCLUDE[demolong](includes/demolong_md.md)] on a computer that already has an earlier version of [!INCLUDE[navnow](includes/navnow_md.md)] installed.  

-   If you want to use the Microsoft Outlook Add-In, then install Outlook before you install the [!INCLUDE[demolong](includes/demolong_md.md)].  

-   If User Account Control is enabled on the computer where you want to install the demonstration database, then right-click **[!INCLUDE[navnowlong](includes/navnowlong_md.md)]**, and then choose **Run as administrator** to run the [!INCLUDE[nav_windows](includes/nav_windows_md.md)] with administrative credentials.  

## Running Setup  

#### To install the Demo version of [!INCLUDE[navnowlong](includes/navnowlong_md.md)]  

1.  Insert the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] DVD, or navigate to the folder containing the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup.exe program.  

2.  Run Setup.exe to start the [!INCLUDE[navnow](includes/navnow_md.md)] Setup wizard.  

3.  Choose **Next** to move to the next page.  

4.  Choose **I accept** to accept the license terms.  

5.  Choose **Install Demo**.  

6.  When the installation is complete, choose **Close**.  

7.  Choose **Start**, choose **All Programs**, and then choose [!INCLUDE[navnowlong](includes/navnowlong_md.md)] to open the [!INCLUDE[rtc](includes/rtc_md.md)].  

## Next Steps  
 You can now work with the [!INCLUDE[demolong](includes/demolong_md.md)] to try the different features with demonstration data.  

> [!NOTE]  
>  When you uninstall [!INCLUDE[navnowlong](includes/navnowlong_md.md)], the demonstration database is not removed. You have to remove it manually. For more information, see "Removing the Demo Database" in [Modifying, Uninstalling, or Repairing Microsoft Dynamics NAV](Modifying--Uninstalling--or-Repairing-Microsoft-Dynamics-NAV.md).  

## See Also  
[Properties of the Demo License](Properties-of-the-Demo-License.md)
[Deployment](Deployment.md)  
