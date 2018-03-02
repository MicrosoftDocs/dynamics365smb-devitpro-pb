---
title: "Standard and User-Defined Functions"
ms.custom: na
ms.date: 06/05/2016
ms.reviewer: na
ms.suite: na
ms.tgt_pltfrm: na
ms.topic: article
ms.prod: "dynamics-nav-2018"
ms.assetid: 6e2a93c7-e6a0-429f-8118-54cd100ea342
caps.latest.revision: 17
manager: edupont
---
# Standard and User-Defined Functions
To create an application in [!INCLUDE[navnow](includes/navnow_md.md)], you must make database objects work together. You can use C/AL code to bind all the database objects together to form a unified whole.  

 When you design professional applications, you often need specialized functions. C/AL lets you create functions that extend the functionality of [!INCLUDE[navnow](includes/navnow_md.md)]. You can create special functions for use anywhere in the database.  

 C/AL enables you to do the following:  

-   Design your own functions.  

-   Use standard, built-in functions.  

-   Connect database objects.  

-   Read, write, and modify data.  

## Designing Your Own Functions  
 Although [!INCLUDE[navnow](includes/navnow_md.md)] has many built-in functions, you may want to create your own functions. For example, you will have to develop your own functions when the application that you develop repeatedly uses the same nontrivial processing.  

 We recommend the following guidelines when you want to create new functions and when you want to create parameters and local variables for a function:  

-   Do not move a block of code to a new function unless either the code is nontrivial and the new function is afterward called from more than one location, or the move is required to keep the code clear and manageable.  

-   Create only parameters that are required for the function to operate on different data, depending on where it is called from. If a function also changes a global variable, however, then we recommend that you transfer the global variable to the function to indicate that the function will change this variable.  

-   Use additional local variables just like you would use them in other development languages and environments.  

-   When you create a user-defined function, we recommend that you set the [Local Property](Local-Property.md) to **Yes** unless you want to access the function from outside the object. This makes the code easier to understand because it is clear that the function is not referenced from other objects.  

    > [!NOTE]  
    >  When you add a function, the Local property is set to **Yes** by default.  

> [!IMPORTANT]  
>  When you define your own functions, you can give two functions the same name. However, if one function is defined in a report or a page and the other is defined in a table that is referenced by the report or page, you cannot directly invoke the function defined in the report or page. By default, a call to the function invokes the function that is defined in the table. This behavior occurs when the function is called from a source expression or a trigger.  

## See Also  
 [Essential C/AL Functions](Essential-C-AL-Functions.md)   
 [C/AL Functions](C-AL-Functions.md)
