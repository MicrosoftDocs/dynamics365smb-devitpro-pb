---
title: "Security Considerations"
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Security Considerations

The following list contains some important things to consider when setting up your [!INCLUDE[prodshort](../developer/includes/prodshort.md)] security system.  
  
-   The [!INCLUDE[prodshort](../developer/includes/prodshort.md)] security system is initiated when you create the first login. Until you create the first login, any user can have full access to carry out any transaction in a [!INCLUDE[prodshort](../developer/includes/prodshort.md)] database. Therefore, the first login that you create must be a superuser \(that is, should be assigned the SUPER permission set\). The superuser must own and administer all access to the database from within [!INCLUDE[prodshort](../developer/includes/prodshort.md)]. We recommend that the user who administers security in [!INCLUDE[prodshort](../developer/includes/prodshort.md)] be a superuser.  
  
-   One of the first things that the superuser should do is create logins for the other users that will have access to the database and grant them the appropriate permissions.  
  
-   In [!INCLUDE[prodshort](../developer/includes/prodshort.md)], a table can contain a FlowField, which generates sums based on values that are stored in another table. When using a FlowField, a user must have permission to read both tables or they will not be allowed to read the first table.  
  
## See Also  
 [Security and Protection](Security-and-Protection.md)  