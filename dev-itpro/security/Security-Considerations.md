---
title: Security Considerations in Business Central
ms.custom: Learn about the some of the most important aspects to take into consideration when you configure security for your Business Central solution.
author: jswymer

ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.service: "dynamics365-business-central"
ms.author: jswymer
ms.date: 10/01/2020
---
# Security Considerations

The following list contains some important things to consider when setting up your [!INCLUDE[prod_short](../developer/includes/prod_short.md)] security system.  
  
- The [!INCLUDE[prod_short](../developer/includes/prod_short.md)] security system is initiated when you create the first login. Until you create the first login, any user can have full access to carry out any transaction in a [!INCLUDE[prod_short](../developer/includes/prod_short.md)] database. Therefore, the first login that you create must be a superuser \(that is, should be assigned the SUPER permission set\). The superuser must own and administer all access to the database from within [!INCLUDE[prod_short](../developer/includes/prod_short.md)]. We recommend that the user who administers security in [!INCLUDE[prod_short](../developer/includes/prod_short.md)] be a superuser.  
  
- One of the first things that the superuser should do is create logins for the other users that will have access to the database and grant them the appropriate permissions.  
  
- In [!INCLUDE[prod_short](../developer/includes/prod_short.md)], a table can contain a FlowField, which generates sums based on values that are stored in another table. When using a FlowField, a user must have permission to read both tables or they will not be allowed to read the first table.  
  
## See Also

[Security and Protection](Security-and-Protection.md)  
