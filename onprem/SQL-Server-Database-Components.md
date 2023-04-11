---
title: "SQL Server Database Components"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: faa5fd81-1ff7-4ce8-883a-1476ee6df0e1
caps.latest.revision: 19
---
# SQL Server Database Components
SQL Server database components configure Microsoft SQL Server to work with [!INCLUDE[navnowlong](includes/navnowlong_md.md)].  
  
 If SQL Server is not present on the computer where you install the database components, then Setup automatically installs SQL Server Express 2016, which you can use for prototyping, developing, and testing. We recommend that you use SQL Server 2016 or SQL Server 2014 in production environments.  
  
 If you are installing the [!INCLUDE[demolong](includes/demolong_md.md)], Setup will automatically install SQL Server Express 2016 if it does not find an existing NAVDEMO instance in SQL Server. So if you intend to install the [!INCLUDE[demo](includes/demo_md.md)] database to an existing SQL Server installation, remember to create a NAVDEMO instance in SQL Server before you run [!INCLUDE[navnow](includes/navnow_md.md)] Setup.  
  
 In [!INCLUDE[navnow](includes/navnow_md.md)] Setup, SQL Server database components are a default component for the [Developer Option](Developer-Option.md). You can add the components to the [Server Option](Server-Option.md) or as part of a custom installation.  
  
 When you have installed the [!INCLUDE[navnow](includes/navnow_md.md)] SQL Server database components on a database server, you can create new [!INCLUDE[navnow](includes/navnow_md.md)] databases in the [!INCLUDE[navnow](includes/navnow_md.md)][!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)], by using the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] commands, or by using the [!INCLUDE[navnow](includes/navnow_md.md)] Windows PowerShell cmdlets.  
  
## See Also  
 [Developer Option](Developer-Option.md)   
 [Custom Option](Custom-Option.md)   
 [Configuring Database Components](Configuring-Database-Components.md)   
 [Microsoft Dynamics NAV Windows PowerShell Cmdlets](Microsoft-Dynamics-NAV-Windows-PowerShell-Cmdlets.md)   
 [Development Environment Commands](Development-Environment-Commands.md)
