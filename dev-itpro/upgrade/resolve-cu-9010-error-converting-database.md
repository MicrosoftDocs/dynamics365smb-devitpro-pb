---
title: "Resolving Codeunit 9010 Compilation Error"
description: "Explains how to resolve the compilation error that you get for Codeunit 9010 when converting a database from Dynamics NAV 2018."
ms.custom: na
ms.date: 10/01/2019
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Codeunit 9010 Compilation Error 
This article explains how to resolve the compilation error that you get for codeunit **9010 Azure AD User Management** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prodshort.md)].

## Resolution

In `CreateNewUsersFromAzureAD` function, replace the following code: 

```
PagedUsers := Graph.GetUsersPage(50);

IsFirstPage := TRUE;
REPEAT
  IF NOT IsFirstPage THEN
    PagedUsers.GetNextPage
  ELSE
    IsFirstPage := FALSE;
  FOREACH GraphUser IN PagedUsers.CurrentPage DO
    IF GetUserFromAuthenticationObjectId(GraphUser.ObjectId,User) THEN BEGIN
      UpdateUserFromAzureGraph(User,GraphUser);
      UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
    END ELSE
      CreateNewUserFromGraphUser(GraphUser);
UNTIL (NOT PagedUsers.MorePagesAvailable);
```

With the following code:

```
FOREACH GraphUser IN Graph.GetUsers(50) DO
  IF GetUserFromAuthenticationObjectId(GraphUser.ObjectId,User) THEN BEGIN
    UpdateUserFromAzureGraph(User,GraphUser);
    UpdateUserPlansFromAzureGraph(User."User Security ID",GraphUser);
  END ELSE
    CreateNewUserFromGraphUser(GraphUser);
```


## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
