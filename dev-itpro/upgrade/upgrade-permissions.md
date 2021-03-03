---
title: "Upgrading Permission Sets and Permissions"
description: Describes how to upgrade permissions and permission sets 
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: conceptual
ms.author: jswymer
author: jswymer
ms.service: "dynamics365-business-central"
---

# Upgrading Permissions Sets and Permissions

[!INCLUDE[prod_short](../developer/includes/prod_short.md)] 2021 release wave 1 (v18) introduces a new model for permissions. In previous versions, permission sets and permissions only defined in data, meaning that the information was stored in the tables in the application and tenant databases. Now, permission sets and permissions can be defined in AL code as part of extensions by using objects like the permissionset, permissionsetextension, and permissions. For an overview, see [Entitlements and Permissions](). This change has upgrade implications, which are discussed in this article.

AL permissions is now the default model. For example, you'll see it if you install a v18 demo database, and view the permissions-related tables in the database, like the **Permission Set** and **Permission** tables. You'll notice that tables are pretty much empty. You can still use the legacy data-based permissions model, however we recommend that you transition to the AL permissions.

## Uggrade

1. Export custom permission sets from v17 as XML.
2. Export new permission from v18 as XML.
3. Merge the two versions to see what Microsoft has changed


V18

1. Set UsePermissionSetFromExtensions to false
2. Import XML files
3. Import AL objects
4. Set flag to true



 







## See Also  

[Upgrading to Business Central](upgrading-to-business-central.md)  
[Upgrading Extensions](../developer/devenv-upgrading-extensions.md)  
