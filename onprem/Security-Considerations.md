---
title: "Security Considerations"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: a56bb086-8941-4dd8-8c53-57af45e15e86
caps.latest.revision: 9
manager: edupont
---
# Security Considerations
The following list contains some important things to consider when setting up your [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] security system.  
  
-   The [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] security system is initiated when you create the first login. Until you create the first login, any user can have full access to carry out any transaction in a [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] database. Therefore, the first login that you create must be a superuser \(that is, should be assigned the SUPER permission set\). The superuser must own and administer all access to the database from within [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)]. We recommend that the user who administers security in [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)] be a superuser.  
  
-   One of the first things that the superuser should do is create logins for the other users that will have access to the database and grant them the appropriate permissions.  
  
-   In [!INCLUDE[nav_current_short](includes/nav_current_short_md.md)], a table can contain a FlowField, which generates sums based on values that are stored in another table. When using a FlowField, a user must have permission to read both tables or they will not be allowed to read the first table.  
  
## See Also  
 [Security and Protection](Security-and-Protection.md)   
 [Security Overview](Security-Overview.md)