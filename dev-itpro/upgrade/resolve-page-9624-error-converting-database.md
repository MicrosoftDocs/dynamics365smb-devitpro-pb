---
title: "Resolving Page 9624 Compilation Error on Technical Upgrade "
description: "Explains how to resolve the compilation error that you get for Page 9624 when converting a database from Dynamics NAV to Business Central."
ms.custom: na
ms.date: 10/01/2020
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.service: "dynamics365-business-central"
author: jswymer
---
# Resolving Page 9624 Compilation Error 
This article explains how to resolve the compilation error that you get for page **9624 Finish Design List Part** when converting a [!INCLUDE[nav2018_md](../developer/includes/nav2018_md.md)] database to  [!INCLUDE[prodhort](../developer/includes/prod_short.md)].

In Business Central, page 9624 is no longer used or referenced. It's source table re-purposed for other features, so we recommend that it not be used as a source table for other purposes.

## Resolution

To resolve the compilation errors, you replace page 9624 in the converted database with an empty page object as shown in the following code. 

```
OBJECT Page 9624 Finish Design List Part
{
  OBJECT-PROPERTIES
  {
    Date=;
    Time=;
    Version List=;
  }
  PROPERTIES
  {
  }
  CONTROLS
  {
  }
  CODE
  {

    BEGIN
    END.
  }
}
```

For example:

1. Copy the code to a text editor, and save it as a .txt file type.
2. Use the Microsoft Dynamics NAV Development Environment to import the file and compile the object, which replaces the existing page.

## See Also  
 [Converting a Database](Converting-a-Database.md)  
 [Resolving Compilation Errors When Converting a Dynamics NAV 2018 Database](Resolve-Compile-Errors-When-Converting-Dynamics-NAV-2018-Database.md)  
