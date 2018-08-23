---
title: "Install Business Central Using Setup"
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
# Installing Business Central Using Setup
You use [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] to install the different components that comprise a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] production, demonstration, or development environment. For a list of components, see [Components and Topology](product-and-architecture-overview.md).   

## About Setup
 
Setup is available on the installation media (DVD) in the setup.exe file. When run, Setup leads you through installation process, where you can install individual components or select predefined options that install a logical collection of components.

### Configuration settings

Throughout Setup, you are presented with various configuration settings. Some settings require that you set them, and other settings have a default value. In many cases, the default value is sufficient for the initial installation. After you run Setup, you can change the configuration settings by using other tools such as the [!INCLUDE[admintool](../developer/includes/admintool.md)] and [!INCLUDE[adminshell](../developer/includes/adminshell.md)].

### Prerequisite Installations by Setup

There are some components that require other software in order run, for example the database requires SQL Server and the Web client requires IIS. Setup will install several of these prerequisites, like installing SQL Server Express and enabling IIS. You can see which prerequisites Setup installs in the [System Requirements](system-requirement-business-central.md).  

## Before you run Setup

1. Plan you deployment and identify the components that you want to install.
2. Verify that the target computer where you will install components meets the hardware and software requirements for the components that you want to install. For more information, see [System Requirements](system-requirement-business-central.md).
3.  Make sure that you are an administrator on the computer where you run Setup.

## Run Setup
<!--
 or to capture a set of custom setup settings to save in a setup configuration file. In this procedure, you run [!INCLUDE[prodsetup](../developer/includes/prodsetup.md)] without any customization or configuration. Opportunities for customization and configuration are described throughout the procedure.
-->  
1. In the installation media (DVD) folder, double-click the setup.exe.
2. Follow Setup until you get to the **[!INCLUDE[prodlong](../developer/includes/prodlong.md)]** page.

    ![Business Central Setup](../media/setup.png "Business Central Setup")

    - Choose **Get a free online trial to sign-up**  if you interested in hearing about and trying the cloud experience.
    - Choose **Get the Business Central app from the Microsoft Store** to download a companion app that mimic that Web client but has the same look-and-feel as the mobile apps.
    - Choose **Advance installation options** to install a demonstration environment or one more components. Then, follow the on-screen instructions to complete the installation.

## Cancel Setup  
 Setup does not provide a **Cancel** button on all pages, but you can cancel an installation from any page by choosing the **Close** button in the upper-right corner. All [!INCLUDE[prodshort](../developer/includes/prodshort.md)] components are removed from the computer. The only software that Setup cannot remove are:  

-   Database files, such as the Demo database.  

-   Prerequisites for [!INCLUDE[prodshort](../developer/includes/prodshort.md)] components that Setup can install, such as the .NET Framework.  

## See Also  
 [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md)   
 [How to: Preconfigure Components](How-to--Preconfigure-Components.md)   
 [How to: Create or Load a Setup Configuration File](How-to--Create-or-Load-a-Setup-Configuration-File.md)
