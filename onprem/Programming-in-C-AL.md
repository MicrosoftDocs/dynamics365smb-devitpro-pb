---
title: C/AL Programming
description: This article provides the guidelines and recommendations for programming in C/AL, and understand how to write and reuse the C/AL code.
ms.custom: na
ms.date: 10/19/2017
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 5ee737ae-3914-47e7-b61d-486309b7fa8f
caps.latest.revision: 19
manager: edupont
---
# Programming in C/AL 
This section describes where to write C/AL code and how to reuse code.  
  
 For more information about how to use system-defined variables, see [System-Defined Variables](System-Defined-Variables.md).  
  
 For more information about the most frequently used C/AL functions, see [Essential C/AL Functions](Essential-C-AL-Functions.md).  
  
## Where to Write C/AL Code  
 Almost every object in [!INCLUDE[navnow](includes/navnow_md.md)] contains triggers where you can add your C/AL code. Triggers exist for the following objects:  
  
-   Tables  
  
-   Table fields  
  
-   Pages, including request pages  
  
-   Reports  
  
-   Data items  
  
-   XMLports  
  
-   Queries  
  
 You can initiate the execution of your C/AL code from the following:  
  
-   Actions  
  
-   Menu items  
  
-   Any object that has an instantiation of the object that contains C/AL code. An example of an instantiation is a variable declaration.  
  
    > [!NOTE]  
    >  If the C/AL code is in a local function, then you cannot run it from another object.  
  
## Guidelines for Placing C/AL Code  
 We recommend the following guidelines for C/AL code:  
  
-   In general, put the code in codeunits instead of on the object on which it operates. This promotes a clean design and provides the ability to reuse code. It also helps enforce security. For example, typically users do not have direct access to tables that contain sensitive data, such as the **General Ledger Entry** table, nor do they have permission to modify objects. If you put the code that operates on the general ledger in a codeunit, give the codeunit access to the table, and give the user permission to execute the codeunit, then you will not compromise the security of the table and the user will be able to access the table.  
  
-   If you must put code on an object instead of in a codeunit, then put the code as close as possible to the object on which it operates. For example, put code that modifies records in the triggers of the table fields.  
  
## Reusing Code  
 Reusing code makes developing applications both faster and easier. More importantly, if you organize your C/AL code as suggested, your applications will be less prone to errors. By centralizing the code, you will not unintentionally create inconsistencies by performing the same calculation in many places, for example, in several triggers that have the same table field as their source expression. If you have to change the code, you could either forget about some of these triggers or make a mistake when you modify one of them.  
  
## See Also  
 [System-Defined Variables](System-Defined-Variables.md)   
 [Essential C/AL Functions](Essential-C-AL-Functions.md)
