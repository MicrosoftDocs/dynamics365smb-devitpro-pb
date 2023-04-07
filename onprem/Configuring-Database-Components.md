---
title: Configure SQL Server Database Components
description: This article explains how to configure SQL Server Database Components and how to apply custom settings to the relevant components.
author: edupont04
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 1b590d6f-c38e-40f1-8c9e-d1c8070e05a3
caps.latest.revision: 19
---
# Configuring Database Components
Use [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup to install SQL Server Database Components. This is software you install on the computer running the SQL Server database to manage interaction between [!INCLUDE[navnow](includes/navnow_md.md)] and the SQL Server database.  

 You can install database components on the same computer as [!INCLUDE[nav_server](includes/nav_server_md.md)] \(as described in [Walkthrough: Installing the Three Tiers On Two Computers](Walkthrough--Installing-the-Three-Tiers-On-Two-Computers.md)\) or on a separate computer \(as described in [Walkthrough: Installing the Three Tiers on Three Computers](Walkthrough--Installing-the-Three-Tiers-on-Three-Computers.md)\). SQL Server Database Components are a default component for the [Developer Option](Developer-Option.md) in [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Setup, but for a production environment you can select SQL Server Database Components either by customizing the [Server Option](Server-Option.md) or by performing a complete custom installation \(that is, by choosing **Custom** on the **Choose an installation option pane** in Setup\). For more information, see [How to: Choose Components to Install](How-to--Choose-Components-to-Install.md).  

 When you select SQL Server Database Components in Setup you must also decide whether to install the second-level component, which is the [!INCLUDE[navnow](includes/navnow_md.md)] Demo database.  

## Configuring Database Components in Setup  
 If you select SQL Server Database Components in Setup you have the option of configuring related settings on the **Specify parameters** pane. These settings are in a section entitled **SQL Server Database Components**.  

### Settings  
 The following parameters pertain to database components.  

|Parameter|Description|  
|---------------|-----------------|  
|**SQL Server instance**|Specifies the instance of SQL Server to which [!INCLUDE[nav_server](includes/nav_server_md.md)] attempts to connect. The default value is **NAVDEMO**, which [!INCLUDE[navnow](includes/navnow_md.md)] creates. This differs from earlier versions of [!INCLUDE[navnow](includes/navnow_md.md)], which installed the Demo database to the default SQL Server instance.|  
|**SQL Database**|Specifies the name of the database that [!INCLUDE[navnow](includes/navnow_md.md)] interacts with.<br /><br /> The default value specifies the Demo database: **Demo Database NAV \(10-0\)**.<br /><br /> This option is only present in Setup when you include the Demo database.|  
|**Replace Existing Database**|Specifies what Setup should do if the Demo database is already present in the specified SQL Server instance.<br /><br /> With the default value \(**No**\), Setup completes with an error.<br /><br /> With this parameter set to **Yes**, Setup completes with no error.<br /><br /> This option is only present in Setup when you include the Demo database.|  

## See Also  
 [Configuring Microsoft Dynamics NAV](Configuring-Microsoft-Dynamics-NAV.md)   
 [Configuring Microsoft SQL Server](Configuring-Microsoft-SQL-Server.md)   
 [How to: Deploy a Microsoft Dynamics NAV Database to Azure SQL Database](How-to--Deploy-a-Microsoft-Dynamics-NAV-Database-to-Azure-SQL-Database.md)
