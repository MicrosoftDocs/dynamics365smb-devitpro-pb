---
title: "Configuring Authentication Between the Microsoft Dynamics NAV Server and Database"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: cf4c6d28-051f-4fb7-892e-4a588e66624c
caps.latest.revision: 9
---
# Configuring Authentication Between the Microsoft Dynamics NAV Server and Database
For a [!INCLUDE[nav_server](includes/nav_server_md.md)] instance to connect to and access a [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server, the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance must be authenticated by the database. As in SQL Server, [!INCLUDE[navnow](includes/navnow_md.md)] supports two authentication modes: Windows Authentication and SQL Server Authentication. When you set up [!INCLUDE[navnow](includes/navnow_md.md)], you must ensure that database authentication is configured correctly on both the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and [!INCLUDE[navnow](includes/navnow_md.md)] database, otherwise the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance will not be able to connect to the [!INCLUDE[navnow](includes/navnow_md.md)] database in SQL Server. By default, Windows Authentication is configured on the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance and database.  
  
 For more information about SQL Server authentication, see [How to: Configure SQL Server Authentication in Microsoft Dynamics NAV](How-to--Configure-SQL-Server-Authentication-in-Microsoft-Dynamics-NAV.md).  
  
## See Also  
 [Configuring Authentication](Configuring-Authentication.md)
