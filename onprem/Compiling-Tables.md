---
title: "Compiling Tables"
ms.custom: na
ms.date: 10/01/2018
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 238f8e66-249f-479b-8e8a-f07454318308
caps.latest.revision: 4
---
# Compiling Tables
This topic describes requirements and restrictions for compiling a table object after you make changes to a table’s schema, such as adding or removing a table field.  
  
 When you compile a table, the validation of changes is performed by [!INCLUDE[nav_server](includes/nav_server_md.md)]. When you compile a table, you will also have to choose how to synchronize the table schema in the database. For more information about table schema synchronization, see [Synchronizing Table Schemas](Synchronizing-Table-Schemas.md).  
  
 If you try to compile a table object when your environment does not meet the conditions outlined in this topic, you will get the following error: **The specified \[service instance\] can’t be reached**, where *\[service instance\]* is the name of the [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
 If you cannot meet the conditions for compiling tables with validation, then you have the option to compile the table object without validation.  
  
> [!NOTE]  
>  The information in this topic does not apply to C/AL code changes made to a table object. With code changes, you can compile the table object like any other object.  
  
## Conditions for Compiling Tables with Validation  
 To compile a table after making schema changes, your environment must meet the following conditions:  
  
-   The [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] can connect to a running [!INCLUDE[nav_server](includes/nav_server_md.md)] instance.  
  
-   The [!INCLUDE[nav_server](includes/nav_server_md.md)] instance is not configured for multitenancy. If it is configured for multitenancy then only a single tenant can be mounted on the server instance.  
  
-   You can be authenticated by the [!INCLUDE[nav_server](includes/nav_server_md.md)] according to one of the following conditions:  
  
    -   You are set up as a [!INCLUDE[navnow](includes/navnow_md.md)] user on your Windows account in the [!INCLUDE[navnow](includes/navnow_md.md)]database. This is the recommended option. For more information about setting up a user, see [How to: Create Microsoft Dynamics NAV Users](How-to--Create-Microsoft-Dynamics-NAV-Users.md).  
  
    -   You are set up as an administrator on the computer that is running [!INCLUDE[nav_server](includes/nav_server_md.md)].  
  
         If the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] is installed on the same computer as [!INCLUDE[nav_server](includes/nav_server_md.md)], then you must also run the [!INCLUDE[nav_dev_short](includes/nav_dev_short_md.md)] as an administrator. To do this, right-click the [!INCLUDE[navnowlong](includes/navnowlong_md.md)] Development Environment link on your desktop, and then choose **Run as Administrator**.
